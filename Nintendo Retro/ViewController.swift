//
//  ViewController.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnViewMath(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerMath") as! ViewControllerMath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnViewOak(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOak") as! ViewControllerOak
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func btnViewQuest(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerQuest") as! ViewControllerQuest
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

