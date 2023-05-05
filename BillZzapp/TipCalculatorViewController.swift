//
//  TipCalculatorViewController.swift
//  BillZzapp
//
//  Created by 7g on 3/10/23.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    var value:Int = 0
    @IBOutlet weak var BillTotalBeforeTip: UITextField!

    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var SubTotalLabel: UILabel!
    @IBOutlet weak var CalculateButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var TipAmount: UILabel!
    @IBOutlet weak var TipSliderLabelChange: UILabel!
    @IBOutlet weak var TopBox: UIView!
    @IBOutlet weak var BottomBox: UIView!
    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TopBox.layer.cornerRadius = 23
        BottomBox.layer.cornerRadius = 23
        Slider.isHidden = true
        value = 15
        TipSliderLabelChange.text = "15"
        resetAllValues()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TipValueChanger(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 3 {
            Slider.isHidden = false
        } else {
            Slider.isHidden = true
        }
        if sender.selectedSegmentIndex == 0 {
            TipSliderLabelChange.text = "15"
            value = 15
        }
        else if sender.selectedSegmentIndex == 1 {
            TipSliderLabelChange.text = "18"
            value = 18
        }
        else if sender.selectedSegmentIndex == 2{
            TipSliderLabelChange.text = "20"
            value = 20
        }
        else if sender.selectedSegmentIndex == 3{
            
            Slider.value = Float(value)
           
        }
    }
    
    @IBAction func resetValuesButton(_ sender: UIButton) {
        resetAllValues()
    }
    
    func resetAllValues() {
        BillTotalBeforeTip.text = ""
        SubTotalLabel.text = "$0.00"
        TipAmount.text = "$0.00"
        TipSliderLabelChange.text = "15"
        Slider.isHidden = true
        Slider.value = 15.0
        value = 15
        tipSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func Calcuate(_ sender: Any) {
        if let subtotal = Double(BillTotalBeforeTip.text ?? ""), let tipPercent = Double(TipSliderLabelChange.text ?? "") {
                let tipAmount = subtotal * tipPercent / 100
                TipAmount.text = "$" + String(format: "%.2f", tipAmount)
                
            }
        
//        guard let BeforeTip = Double(BillTotalBeforeTip.text ?? ""),
//              let tipAmount = Double(TipAmount.text ?? "") else {
//            return
//        }
        let subTotalPt2 = Double(BillTotalBeforeTip.text ?? "")
        let tipPercentPt2 = Double(TipSliderLabelChange.text ?? "")
        
        let tipAmountPt2 = subTotalPt2! * tipPercentPt2! / 100
        let total =  tipAmountPt2 + subTotalPt2!
        
        SubTotalLabel.text = String(format: "$%.2f", total  )
      //  updateTotal()

        }

//        func updateTotal() {
//
//    }
    @IBAction func SliderValue(_ sender: UISlider) {
        TipSliderLabelChange.text = "\(Int(sender.value))"
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
