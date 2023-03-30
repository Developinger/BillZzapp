//
//  TipCalculatorViewController.swift
//  BillZzapp
//
//  Created by 7g on 3/10/23.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    var value:Int = 0
    @IBOutlet weak var TopBox: UIView!
    @IBOutlet weak var BottomBox: UIView!
    @IBOutlet weak var Slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        TopBox.layer.cornerRadius = 23
        BottomBox.layer.cornerRadius = 23
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
