//
//  ViewControllerOak.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit

class ViewControllerOak: UIViewController {
    var questions = [
        //FALSE
        "Zelda es el personaje principal?",
        "El videojuego salio en 2000?",
        "La ave loftwing era color verde?",
        "La trifuerza es malvada?",
        "Hubo algun romance entre Zelda y Link?",
        "Link es un adulto en realidad?",
        "Cada 50 años nace un varon en el pueblo de Gerudo?",
        "El caballo Epona era de link?",
        "Podias aprender hasta 20 canciones en ocarina of time?",
        "Al final del juego de majora's Skull Kid muere?",
        //TRUE
        "Tatl y Tael son hermanos?",
        "Link llego a usar todas las mascaras en majora's?",
        "Tatl estuvo con link y Tael con Skull Kid durante todo el juego de majora's?",
        "Skull Kid era bueno en realidad?",
        "Los campeones fueron asesinados durante la guerra de hyrule warrios?",
        "La mascara majora's estaba maldita?",
        "Los Sheikahs eran la civilizacion mas avanzada y poderosa?",
        "Ganondorf es un villano?",
        "Sheik es zelda?",
        "La Diosa Hylia creo la master sword?"]
    
    var respuestas = [
    //FALSE
    "FALSE", // zelda principal
    "FALSE", // Salida del juego
    "FALSE", // Ave loftwing
    "FALSE", // trifuerza
    "FALSE", // romance
    "FALSE", // link adulto
    "FALSE", // Varon de gerudo
    "FALSE", // Caballo Epona
    "FALSE", // Canciones de ocarina
    "FALSE", // Skull Kid muerte
    //TRUE
    "TRUE", // Tatl Y Tael brothers
    "TRUE", // Masks
    "TRUE", // Tatl y Tael
    "TRUE", // Skull kid
    "TRUE", // Champions
    "TRUE", // mask majoras
    "TRUE", // Sheikhas
    "TRUE", // Ganondorf
    "TRUE", // Sheik
    "TRUE" // Diosa Hylia
    ]
    
    @IBOutlet weak var imgdado: UIImageView!
    @IBOutlet weak var numberOpView01: UILabel!
    @IBOutlet weak var numberOpView02: UILabel!
    
    @IBOutlet weak var btnDado: UIButton!
    @IBOutlet weak var questView: UILabel!
    @IBOutlet weak var operatorView: UILabel!
    @IBOutlet weak var turnPlayer1: UILabel!
    @IBOutlet weak var btn01: UIButton!
    @IBOutlet weak var btn02: UIButton!
    @IBOutlet weak var btn03: UIButton!
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var LifesViewPlayer01: UILabel!
    @IBOutlet weak var LifesViewPlayer02: UILabel!
    @IBOutlet weak var viewPosicion_P1: UILabel!
    @IBOutlet weak var viewPosicion_P2: UILabel!
    @IBOutlet weak var P2p1: UIImageView!
    @IBOutlet weak var P1p1: UIImageView!
    @IBOutlet weak var P2p2: UIImageView!
    @IBOutlet weak var P1p2: UIImageView!
    @IBOutlet weak var P2p3: UIImageView!
    @IBOutlet weak var P1p3: UIImageView!
    @IBOutlet weak var P2p4: UIImageView!
    @IBOutlet weak var P1p4: UIImageView!
    @IBOutlet weak var P2p5: UIImageView!
    @IBOutlet weak var P1p5: UIImageView!
    @IBOutlet weak var P2p6: UIImageView!
    @IBOutlet weak var P1p6: UIImageView!
    @IBOutlet weak var P2p7: UIImageView!
    @IBOutlet weak var P1p7: UIImageView!
    @IBOutlet weak var P2p8: UIImageView!
    @IBOutlet weak var P1p8: UIImageView!
    @IBOutlet weak var P2p9: UIImageView!
    @IBOutlet weak var P1p9: UIImageView!
    
    
    var casillaActual1: Int = 0
    var casillaActual2: Int = 0
    var jugadorActual: Int = Int.random(in: 1...2)
    var dado: Int = 0
    var respuesta: String = ""
    var signo = ["+", "-", "x", "/"]
    var numero1 = 0
    var numero2 = 0
    var respuesta1 = 0
    var respuesta2 = 0
    var respuestaCorrecta = 0
    var operacion = "+"
    var vidasJugador1 = 3
    var vidasJugador2 = 3
    
    var numdado = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnRestart.isHidden = true
        btnRestart.isEnabled = false
        [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9,P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
    }
    
    
    @IBAction func btnLanzarDados(_ sender: UIButton) {
        dado = Int.random(in: 1...6)
        imgdado.image = UIImage(named: "dado" + String(dado))
        DeterminarPregunta()
        btnRestart.isHidden = true
        btnRestart.isEnabled = false
        [btn02,btn01].forEach{$0?.isHidden = false}
        
    }
    
    func DeclaraVidas(){
        if(jugadorActual == 1){
            vidasJugador1 -= 1
            LifesViewPlayer01.text = "LIFES: \(vidasJugador1)"
            if(vidasJugador1 == 0){
                Perdiste()
            }
        }else{
            vidasJugador2 -= 1
            LifesViewPlayer02.text = "LIFES: \(vidasJugador2)"
            if(vidasJugador2 == 0){
                Perdiste()
            }
        }
    }
    
    @IBAction func btnCheckAnswers(_ sender: UIButton) {
        
        btn02.isEnabled = false
        btn03.isEnabled = false
        btn01.isEnabled = false
        btn02.isOpaque = true
        btn03.isOpaque = true
        btn01.isOpaque = true
        
        let aux: String = sender.currentTitle ?? ""
        if(aux == respuesta){
            DeterminarCasilla()
        }else{
            DeclaraVidas()
        }
    }
    
    
    
    @IBAction func changePlayer(_ sender: UIButton) {
        btn02.isEnabled = true
        btn03.isEnabled = true
        btn01.isEnabled = true
        btn02.isOpaque = false
        btn03.isOpaque = false
        btn01.isOpaque = false
        
        if(jugadorActual == 1){
            jugadorActual = 2
        }else{
            jugadorActual = 1
        }
        turnPlayer1.text = "JUGADOR: \(jugadorActual)"
    }
    
    func MoverFicha(){
        [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9,P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        switch casillaActual1{
        case 1:
            P1p1.isHidden = false
            [P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 2:
            P1p2.isHidden = false
            [P1p1,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 3:
            P1p3.isHidden = false
            [P1p1,P1p2,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 4:
            P1p4.isHidden = false
            [P1p1,P1p2,P1p3,P1p5,P1p6,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 5:
            P1p5.isHidden = false
            [P1p1,P1p2,P1p3,P1p4,P1p6,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 6:
            P1p6.isHidden = false
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p7,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 7:
            P1p7.isHidden = false
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p8,P1p9].forEach{$0?.isHidden = true}
        case 8:
            P1p8.isHidden = false
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p9].forEach{$0?.isHidden = true}
        case 9:
            P1p9.isHidden = false
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8].forEach{$0?.isHidden = true}
        default:
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9,P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        }
        
        switch casillaActual2{
        case 1:
            P2p1.isHidden = false
            [P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 2:
            P2p2.isHidden = false
            [P2p1,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 3:
            P2p3.isHidden = false
            [P2p1,P2p2,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 4:
            P2p4.isHidden = false
            [P2p1,P2p2,P2p3,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 5:
            P2p5.isHidden = false
            [P2p1,P2p2,P2p3,P2p4,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 6:
            P2p6.isHidden = false
            [P2p1,P2p2,P2p3,P2p4,P2p5,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 7:
            P2p7.isHidden = false
            [P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p8,P2p9].forEach{$0?.isHidden = true}
        case 8:
            P2p8.isHidden = false
            [P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p9].forEach{$0?.isHidden = true}
        case 9:
            P2p9.isHidden = false
            [P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8].forEach{$0?.isHidden = true}
        default:
            [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9,P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        }
    }
        
        func DeterminarPregunta(){
            
            if(dado%2 == 0){
                //Matematik
                btn03.isHidden = false
                btn03.isEnabled = true
                btn02.isOpaque = true
                btn03.isOpaque = true
                btn01.isOpaque = true
                
                numberOpView01.isHidden = false
                numberOpView02.isHidden = false
                operatorView.isHidden = false
                questView.isHidden=true
                
                LanzarMatematica()
            }else{
                //Preguntados
                btn03.isHidden = true
                btn03.isEnabled = false
                btn01.setTitle("TRUE", for: .normal)
                btn02.setTitle("FALSE", for: .normal)
                questView.isHidden=false
                
                numberOpView01.isHidden = true
                numberOpView02.isHidden = true
                operatorView.isHidden = true
                
                let random = Int.random(in: 0...questions.count-1)
                questView.text = questions[random]
                respuesta = respuestas[random]
                
                questions.remove(at: random)
                respuestas.remove(at: random)
                
            }
            
            if(questions.count == 1){
                restartArrays()
            }
        }
        
        func DeterminarCasilla(){
            if(jugadorActual == 1){
                casillaActual1 = casillaActual1 + dado
                if(casillaActual1 > 9){
                    let aux: Int = casillaActual1 - 9
                    casillaActual1 = casillaActual1 - aux
                }
                viewPosicion_P1.text = "POSICION: \(casillaActual1)"
            }else{
                casillaActual2 = casillaActual2 + dado
                if(casillaActual2 > 9){
                    let aux: Int = casillaActual2 - 9
                    casillaActual2 = casillaActual2 - aux
                }
                viewPosicion_P2.text = "POSICION: \(casillaActual2)"
            }
            
            if(casillaActual1 == 9 || casillaActual2 == 9){
                Victoria(jugadorActual: jugadorActual)
                btnRestart.isHidden = false
                btnRestart.isEnabled = true
            }
            
            MoverFicha()
        }
        
        func Victoria(jugadorActual: Int){
            btn03.isHidden = true
            btn02.isHidden = true
            btn01.isHidden = true
            btn03.isEnabled = false
            btn02.isEnabled = false
            btn01.isEnabled = false
            btnDado.isEnabled = false
            btnDado.isHidden = true
            
            if(casillaActual1 == 9){
                var dialogMessage = UIAlertController(title: "YOU WON PLAYER 1", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }else{
                var dialogMessage = UIAlertController(title: "YOU WON PLAYER 2", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }
    
    func restartArrays(){
         questions = [
            //FALSE
            "Zelda es el personaje principal?",
            "El videojuego salio en 2000?",
            "La ave loftwing era color verde?",
            "La trifuerza es malvada?",
            "Hubo algun romance entre Zelda y Link?",
            "Link es un adulto en realidad?",
            "Cada 50 años nace un varon en el pueblo de Gerudo?",
            "El caballo Epona era de link?",
            "Podias aprender hasta 20 canciones en ocarina of time?",
            "Al final del juego de majora's Skull Kid muere?",
            //TRUE
            "Tatl y Tael son hermanos?",
            "Link llego a usar todas las mascaras en majora's?",
            "Tatl estuvo con link y Tael con Skull Kid durante todo el juego de majora's?",
            "Skull Kid era bueno en realidad?",
            "Los campeones fueron asesinados durante la guerra de hyrule warrios?",
            "La mascara majora's estaba maldita?",
            "Los Sheikahs eran la civilizacion mas avanzada y poderosa?",
            "Ganondorf es un villano?",
            "Sheik es zelda?",
            "La Diosa Hylia creo la master sword?"]
        
        respuestas = [
        //FALSE
        "FALSE", // zelda principal
        "FALSE", // Salida del juego
        "FALSE", // Ave loftwing
        "FALSE", // trifuerza
        "FALSE", // romance
        "FALSE", // link adulto
        "FALSE", // Varon de gerudo
        "FALSE", // Caballo Epona
        "FALSE", // Canciones de ocarina
        "FALSE", // Skull Kid muerte
        //TRUE
        "TRUE", // Tatl Y Tael brothers
        "TRUE", // Masks
        "TRUE", // Tatl y Tael
        "TRUE", // Skull kid
        "TRUE", // Champions
        "TRUE", // mask majoras
        "TRUE", // Sheikhas
        "TRUE", // Ganondorf
        "TRUE", // Sheik
        "TRUE" // Diosa Hylia
        ]
        
    }
        
    @IBAction func btnRestart(_ sender: UIButton) {
        restartArrays()
        btn03.isHidden = true
        btn02.isHidden = false
        btn01.isHidden = false
        btn03.isEnabled = false
        btn02.isEnabled = true
        btn01.isEnabled = true
        btnDado.isEnabled = true
        btnDado.isHidden = false
        btnRestart.isHidden = true
        casillaActual2 = 0
        casillaActual1 = 0
        viewPosicion_P1.text = "POSICION:" +  String(casillaActual1)
        viewPosicion_P2.text = "POSICION:" + String(casillaActual2)
        dado = 0
        vidasJugador1 = 3
        vidasJugador2 = 3
        LifesViewPlayer01.text = "LIFES:" + String(vidasJugador1)
        LifesViewPlayer02.text = "LIFES:" + String(vidasJugador2)
        respuesta = ""
        jugadorActual = Int.random(in: 1...2)
        [P1p1,P1p2,P1p3,P1p4,P1p5,P1p6,P1p7,P1p8,P1p9,P2p1,P2p2,P2p3,P2p4,P2p5,P2p6,P2p7,P2p8,P2p9].forEach{$0?.isHidden = true}
        
    }
    
    func LanzarMatematica(){
        numero1 = Int.random(in: 1...100)
        numero2 = Int.random(in: 1...100)
        let operando = Int.random(in: 0...3)
        operacion = signo[operando]
        operatorView.text = String(operacion)
        numberOpView01.text = String(numero1)
        numberOpView02.text = String(numero2)
        respuestaCorrecta = calcularRespuesta(n1: (numero1), n2: (numero2), op: (operacion))
        respuesta = String(respuestaCorrecta)
        respuesta1 = Int.random(in: 0...200)
        respuesta2 = Int.random(in: 0...200)
        let botonCorrecto = Int.random(in: 1...3)
        if botonCorrecto == 1 {
            btn01.setTitle(String(respuestaCorrecta), for: .normal)
            btn02.setTitle(String(respuesta1), for: .normal)
            btn03.setTitle(String(respuesta2), for: .normal)
        } else if botonCorrecto == 2 {
            btn01.setTitle(String(respuesta1), for: .normal)
            btn02.setTitle(String(respuestaCorrecta), for: .normal)
            btn03.setTitle(String(respuesta2), for: .normal)
        } else {
            btn01.setTitle(String(respuesta1), for: .normal)
            btn02.setTitle(String(respuesta2), for: .normal)
            btn03.setTitle(String(respuestaCorrecta), for: .normal)
        }
        LifesViewPlayer01.text = "LIFES: \(vidasJugador1)"
        LifesViewPlayer02.text = "LIFES: \(vidasJugador2)"
        turnPlayer1.text = "JUGADOR: \(jugadorActual)"
        print(jugadorActual)
    }
    
    func calcularRespuesta(n1:Int, n2:Int, op:String) -> Int {
            var resultado = 0
            if op == "+" {
                resultado = n1 + n2
            } else if op == "-" {
                resultado = n1 - n2
            } else if op == "x" {
                resultado = n1 * n2
            } else {
                resultado = n1 / n2
            }
            return resultado
    }
    func Perdiste(){
        if(vidasJugador1 == 0){
            var dialogMessage = UIAlertController(title: "YOU LOSE PLAYER 1", message: "Try it Again", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }else{
            var dialogMessage = UIAlertController(title: "YOU LOSE PLAYER 2", message: "Try it Again", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    /*--------------------------------------------*/
}
    

