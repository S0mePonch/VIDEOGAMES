//
//  ViewControllerMath.swift
//  Nintendo Retro
//
//  Created by Luis Alberto Izquierdo on 23/03/23.
//

import UIKit

class ViewControllerMath: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnEasy(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerEasyMath") as! ViewControllerEasyMath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnNormal(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerNormalMath") as! ViewControllerNormalMath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnHard(_ sender: UIButton) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerHardMath") as! ViewControllerHardMath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
