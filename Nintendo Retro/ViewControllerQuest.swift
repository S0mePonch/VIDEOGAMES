//
//  ViewControllerQuest.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit
import AVFoundation
class ViewControllerQuest: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func brnEasy(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerEasyQuest") as! ViewControllerEasyQuest
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "ZeldaObtain Rupee", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
    }
    
    @IBAction func btnNormal(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerNormalQuest") as! ViewControllerNormalQuest
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "ZeldaObtain Rupee", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
    }
    
    @IBAction func btnHard(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerHardQuest") as! ViewControllerHardQuest
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "ZeldaObtain Rupee", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
    }
    

}
