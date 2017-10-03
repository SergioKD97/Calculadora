//
//  ViewController.swift
//  Calculadora
//
//  Created by CETYS on 26/09/17.
//  Copyrigh © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pantalla: UILabel!

    
    @IBOutlet weak var miniPantalla: UILabel!
    
    
    var elUsuarioEstaEnMedioDeLaEscriturDeUnNumero : Bool = false
    
    
    var operando1 : Double = 0
    var operando2 : Double = 0
    var operacion : String = ""
    var digito : String = ""
    
    
    
    
    @IBAction func punto() {
        let numero : NSString = pantalla.text! as NSString
        
        
        
        //for para no repetir puntos
        for i in 0...numero.length{
            let rango = NSMakeRange(i, i+1)
            
            if(numero.length > 2 && numero.substring(with: rango) == "."){
            print("s")
            }
            
            }
        
            pantalla.text = pantalla.text! + "."
            
    }
    
    @IBAction func borrar() {
        let numero : NSString = pantalla.text! as NSString
        pantalla.text = numero.substring(to: numero.length-1)
        
    }
    
    
    
    //Boton reiniciar
    @IBAction func Reset() {
        pantalla.text = "0"
        miniPantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscriturDeUnNumero = false
    }
    
    
    @IBAction func enterPulsado() {
        var numero : NSString = pantalla.text! as NSString
            //los numeros de la pantalla sin el operador del principio
        numero = numero.substring(from: 1) as NSString
        operando2 = numero.doubleValue
        
        let numero1 : NSString = miniPantalla.text! as NSString
        operando1 = numero1.doubleValue
        
        let resultado = realizaOperacion()
        pantalla.text = pantalla.text! + "="
        pantalla.text = String(format: "%g", resultado)
        
            //pongo un 0 para poder seguir operando y un =  a la izquierda
        miniPantalla.text = "0"
        
        
        
        print(operando2)
    }
    
    
    
    @IBAction func porcentaje() {
        let numeroPantalla : NSString = pantalla.text! as NSString
        
        //hace una unica operacion de porcentaje
        if(miniPantalla.text == "0"){
        operacion = "%"
        operando1 = numeroPantalla.doubleValue
        let resultado = realizaOperacion()
        pantalla.text = String(resultado)
        //hace el porcentaje del resultado de la operacion realizada
        }else{
            enterPulsado()
            porcentaje()
        }
        
        
    }
    
    @IBAction func operacionPulsada(_ sender: UIButton) {
        let guardaOperacion = sender.currentTitle
        let numeroPantalla : NSString = pantalla.text! as NSString
        let numeroMiniPantalla : NSString = miniPantalla.text! as NSString
        operando1 = numeroPantalla.doubleValue
        
       
            //si sigues presionando operadores sigues operando
        if(numeroPantalla.substring(to: 1) == operacion && numeroPantalla.length > 1 ){
            operando1 = numeroMiniPantalla.doubleValue
            enterPulsado()
            miniPantalla.text = pantalla.text
            pantalla.text = operacion
            
        }
        
        
            //si pulso otro operador se guarda el pulsado
        if(numeroPantalla.substring(to: 1) == operacion && numeroPantalla.substring(to: 1) != sender.currentTitle){
            pantalla.text = ""
            operacion = guardaOperacion!
        }
        
        
            //guardo la operacion pulsada y subo el operando1 a Minipantalla
        if(pantalla.text != "0" && miniPantalla.text == "0"){
            
        operacion = sender.currentTitle!
        miniPantalla.text = pantalla.text
            pantalla.text = ""

        }
        
            //printo en Pantalla la operacion
        if(numeroPantalla.substring(to: 1) != operacion){
            pantalla.text = pantalla.text! + operacion
        }
        
        

        
        print(operacion)
    }
    
    func cambiaIcono(digito : String){
        
        if(digito == "7️⃣"){
            digito = "7"
        }
        if(digito == "8️⃣"){
            digito = "8"
        }
        if(digito == "9️⃣"){
            digito = "9"
        }
        if(digito == "4️⃣"){
            digito = "4"
        }
        if(digito == "5️⃣"){
            digito = "5"
        }
        if(digito == "6️⃣"){
            digito = "6"
        }
        if(digito == "1️⃣"){
            digito = "1"
        }
        if(digito == "2️⃣"){
            digito = "2"
        }
        if(digito == "3️⃣"){
            digito = "3"
        }
        if(digito == "0️⃣"){
            digito = "0"
        }
        
    }
    
    @IBAction func numeroPulsado(_ sender: UIButton) {
        var digito : String! = sender.currentTitle
        
        
        cambiaIcono(digito: <#T##String#>)
        
        
        if elUsuarioEstaEnMedioDeLaEscriturDeUnNumero{
            pantalla.text = pantalla.text! + digito

        }
        else{
            pantalla.text = digito
            elUsuarioEstaEnMedioDeLaEscriturDeUnNumero = true
        }
        
        print(digito)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func realizaOperacion() -> Double{
        var resultado : Double = 0
        
        if operacion == "+"{
            resultado = operando1 + operando2
        }
        
        if operacion == "-"{
            resultado = operando1 - operando2

        }
        
        
        if operacion == "*"{
            resultado = operando1 * operando2

        }
        
        if operacion == "/"{
            resultado = operando1 / operando2

        }
        
        if operacion == "%"{
            resultado = operando1 / 100
        }
        
        return resultado
     
     
     
    }
    
    

    
    
    
    
    
    
}

