//
//  ViewControllerEasyMath.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit
import AVFoundation
import AudioToolbox
class ViewControllerEasyMath: UIViewController {
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var numberOpView01: UILabel!
    @IBOutlet weak var operatorView: UILabel!
    @IBOutlet weak var numberOpView02: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnOutlet01: UIButton!
    @IBOutlet weak var btnOutlet02: UIButton!
    @IBOutlet weak var btnOutlet03: UIButton!
    
    let operators: [String] = ["+","-","*","/"]
    var lifesGame: Int = 3
    var scoreGame: Int = 0
    var resultado = 0

    
    @IBOutlet weak var imgLife01: UIImageView!
    @IBOutlet weak var imgLife02: UIImageView!
    @IBOutlet weak var imgLife03: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        principal()
        scoreView.text = "SCORE: " +  String(scoreGame)
        
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        lifesGame = 3
        scoreGame = 0
        
        guard let path = Bundle.main.path(forResource: "POW", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
        // Mandar vibracion
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        imgLife01.isHidden = false
        imgLife02.isHidden = false
        imgLife03.isHidden = false
        
        scoreView.text = "SCORE: " +  String(scoreGame)
        btnOutlet01.isEnabled = true
        btnOutlet02.isEnabled = true
        btnOutlet03.isEnabled =  true
        principal()
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        var respuesta = sender.currentTitle ?? ""
        
        if (scoreGame == 4){
            btnOutlet01.isEnabled = false
            btnOutlet02.isEnabled = false
            btnOutlet03.isEnabled = false
            
            var dialogMessage = UIAlertController(title: "YOU WON", message: "Congratulations", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in})
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
        if String(respuesta) == String(resultado){
            imageView.image = UIImage(named: "marioCheck")
            scoreGame = scoreGame + 1
            scoreView.text = "SCORE: " + String(scoreGame)
            principal()
            
            guard let path = Bundle.main.path(forResource: "mario grow Sound Effect", ofType:"wav") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
        }
        }else{
            imageView.image = UIImage(named: "marioError")
            lifesGame = lifesGame - 1
            principal()
            
            guard let path = Bundle.main.path(forResource: "Mario Damage Sound", ofType:"wav") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
        }
            
            if (lifesGame == 0){
                
                btnOutlet01.isEnabled = false
                btnOutlet02.isEnabled = false
                btnOutlet03.isEnabled = false
                
                var dialogMessage = UIAlertController(title: "GAME OVER", message: "Try it Again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
                guard let path = Bundle.main.path(forResource: "Mario bros game over", ofType:"wav") else {
                    return }
                let url = URL(fileURLWithPath: path)

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                    
                } catch let error {
                    print(error.localizedDescription)
            }
                
                imgLife01.isHidden = true
            }else if(lifesGame == 1){
                imgLife02.isHidden = true
            }else if(lifesGame == 2){
                imgLife03.isHidden = true
            }
            
            
        }
    }
    
    func principal(){
        let random1 = String(Int.random(in: 1...100))
        let random2 = String(Int.random(in: 1...100))
        let random3 = String(Int.random(in: 1...100))
        let random4 = String(Int.random(in: 1...100))
        numberOpView01.text = random1
        numberOpView02.text = random2
        let operador = operators[Int.random(in: 0...3)]
        operatorView.text = String(operador)
        
        resultado = operacion(Int(random1)!, Int(random2)!, operador)
        var tres = [random3,random4,String(resultado)].shuffled()
        btnOutlet01.setTitle(tres[0] as? String, for: .normal)
        btnOutlet02.setTitle(tres[1] as? String, for: .normal)
        btnOutlet03.setTitle(tres[2] as? String, for: .normal)    }
    
    func operacion(_ x:Int, _ y:Int, _ operador:String) -> Int{
        var resultado: Int = 0
        if (operador == "-"){
            resultado = x - y
        }else if(operador == "+"){
            resultado = x + y
        }else if(operador == "/"){
            resultado = x / y
        }else if (operador == "*"){
            resultado = x * y
        }
        return resultado
    }
    

    
}
