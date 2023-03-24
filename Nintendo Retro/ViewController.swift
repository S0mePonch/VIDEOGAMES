//
//  ViewController.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnViewMath(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerMath") as! ViewControllerMath
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "Super Mario 64 OST", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
    }
    
    @IBAction func btnViewOak(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOak") as! ViewControllerOak
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: "pokemon", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
    }
    }
    
    @IBAction func btnViewQuest(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerQuest") as! ViewControllerQuest
        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let path = Bundle.main.path(forResource: " Zelda Sound Secret", ofType:"wav") else {
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

