//
//  ViewControllerQuest.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit

class ViewControllerQuest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func brnEasy(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerEasyQuest") as! ViewControllerEasyQuest
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnNormal(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerNormalQuest") as! ViewControllerNormalQuest
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnHard(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerHardQuest") as! ViewControllerHardQuest
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
