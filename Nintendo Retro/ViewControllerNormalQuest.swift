//
//  ViewControllerNormalQuest.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit
import AVFoundation
class ViewControllerNormalQuest: UIViewController {
    var player: AVAudioPlayer?
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var questView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var imgLife01: UIImageView!
    @IBOutlet weak var imgLife02: UIImageView!
    
    
    
    
    var lifes: Int = 2
    var score: Int = 0
    var posicion = 0
    var respuesta = ""
    /*Estas son los arreglos para las preguntas, respuestas e imagenes
     Tienen que ir en orden que vaya referenciado a la pregunta con su imagen y su respuesta
     */
    
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
        
        scoreView.text = "SCORE: " + String(score)
        
        throwQuest()
    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        if(sender.titleLabel?.text == respuesta){
            score += 1
            scoreView.text = "SCORE: " + String(score)
            
            guard let path = Bundle.main.path(forResource: "link correctQuest", ofType:"wav") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
        }
            
            if(score == 7 ){
                btnTrue.isEnabled = false
                btnFalse.isEnabled = false
                
                var dialogMessage = UIAlertController(title: "YOU WON", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }else{
            scoreView.text = "SCORE: " + String(score)
            lifes -= 1
            
            guard let path = Bundle.main.path(forResource: "link damage", ofType:"wav") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
        }
            
            if (lifes == 0){
                btnTrue.isEnabled = false
                btnFalse.isEnabled = false
                
                var dialogMessage = UIAlertController(title: "GAME OVER", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
                guard let path = Bundle.main.path(forResource: "Link gameOver", ofType:"wav") else {
                    return }
                let url = URL(fileURLWithPath: path)

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                    
                } catch let error {
                    print(error.localizedDescription)
            }
                
                imgLife01.isHidden = true
            }else if(lifes == 1){
                imgLife02.isHidden = true
            }
        }
        
        throwQuest()
    }
    
    
    @IBAction func btnReturn(_ sender: UIButton) {
        score = 0
        lifes = 2
        
        imgLife01.isHidden = false
        imgLife02.isHidden = false
        
        scoreView.text = "SCORE: " + String(score)
        btnTrue.isEnabled = true
        btnFalse.isEnabled = true
        
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
           "La mascara majoras estaba maldita?",
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
       
        images = [
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
