//
//  ViewControllerMath.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit
import AVFoundation
class ViewControllerMath: UIViewController {
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnEasy(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerEasyMath") as! ViewControllerEasyMath
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "Mario Pipe Warping Sound", ofType:"wav") else {
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
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerNormalMath") as! ViewControllerNormalMath
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "Mario Pipe Warping Sound", ofType:"wav") else {
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
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerHardMath") as! ViewControllerHardMath
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "Mario Pipe Warping Sound", ofType:"wav") else {
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
