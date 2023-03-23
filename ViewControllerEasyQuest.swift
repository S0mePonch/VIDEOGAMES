//
//  ViewControllerEasyQuest.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit

class ViewControllerEasyQuest: UIViewController {

    @IBOutlet weak var lifesView: UILabel!
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var questView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    
    var lifes: Int = 3
    var score: Int = 0
    var posicion = 0
    /*Estas son los arreglos para las preguntas, respuestas e imagenes
     Tienen que ir en orden que vaya referenciado a la pregunta con su imagen y su respuesta
     
     */
    var respuesta = ""
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
        "La mascara majoras estaba maldita?",
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
    
    var images = [
                  //FALSE
                  "zelda",
                  "zeldaGame",
                  "loftwing",
                  "trifuerza",
                  "ZeldaAndLink",
                  "linkChild",
                  "towngerudo",
                  "Epona",
                  "LinkPlayOcarina",
                  "SkullKidNormal",
                  //TRUE
                  "TatlAndTaelBrothers",
                  "Masks",
                  "TatlAndTael",
                  "SkullKid",
                  "champions",
                  "maskMajoras",
                  "sheikah",
                  "ganondorf",
                  "sheik",
                  "diosa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Este es para que cuando se inicie la aplicacion el juego ya cargue los valores por automatico
        lifesView.text = "LIFES: " + String(lifes)
        scoreView.text = "SCORE: " + String(score)
        
        throwQuest()
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        if(score == 4 ){
            btnTrue.isEnabled = false
            btnFalse.isEnabled = false
            
            var dialogMessage = UIAlertController(title: "YOU WON", message: "Try it Again", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
        if(sender.titleLabel?.text == respuesta){
            score += 1
            scoreView.text = "SCORE: " + String(score)
        }else{
            scoreView.text = "SCORE: " + String(score)
            lifes -= 1
            lifesView.text = "LIFES: " + String(lifes)
            
            if (lifes == 0){
                btnTrue.isEnabled = false
                btnFalse.isEnabled = false
                
                var dialogMessage = UIAlertController(title: "GAME OVER", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
                
            }
        }
        
        throwQuest()
    }
    
    @IBAction func btnReturn(_ sender: UIButton) {
        score = 0
        lifes = 3
        
        scoreView.text = "SCORE: " + String(score)
        lifesView.text = "LIFES: " + String(lifes)
        
        btnTrue.isEnabled = true
        btnFalse.isEnabled = true
        
        throwQuest()
    }
    
    
    
    
    //Esta es la funcion que lanza las preguntas
    func throwQuest(){
        //Esta variable se neceita para guardar el valor da la posicion del arreglo
        posicion = Int.random(in: 0...questions.count-1)
        //Y aqui se asigna el arreglo junto con la variable que creamos para que se asignen la posicion que se guardo del arreglo
        questView.text = questions[posicion]
        respuesta = respuestas[posicion]
        imageView.image = UIImage(named: images[posicion])
        // Estos lo que hacen es quitar las preguntas e imagenes del arreglo par que no se vuelvan a repetir
        questions.remove(at: posicion)
        respuestas.remove(at: posicion)
        imageView.image = UIImage(named: images.remove(at: posicion))
    }
    
}
