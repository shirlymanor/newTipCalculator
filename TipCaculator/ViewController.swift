//
//  ViewController.swift
//  TipCaculator
//
//  Created by Shirly Manor on 1/10/16.
//  Copyright © 2016 Shirly Manor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 @IBOutlet weak var billField: UITextField!
 @IBOutlet weak var tipLabel: UILabel!
 @IBOutlet weak var totalLabel: UILabel!
 @IBOutlet weak var tipAmountLabel: UILabel!
 @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // tipLabel.text   = "0.00$"
        totalLabel.text = "0.00$"
        print("$\(tipSegment.titleForSegmentAtIndex(tipSegment.selectedSegmentIndex))")
        
       
    }
    @IBAction func changeTip(sender: AnyObject) {
        billChange(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func billChange(sender: AnyObject) {
        let billAmount = billField.text?.floatValue
        let tip        = (tipSegment.titleForSegmentAtIndex(tipSegment.selectedSegmentIndex)?.floatValue)
        let tipTotal:Float = tip!/100 * billAmount!
        let totAmount:Float = billAmount! + tipTotal
        
        tipLabel.text = "\(String(tip!.string(0)))" + "%"
        totalLabel.text = "$\(String(totAmount.string((2))))"
        tipAmountLabel.text = "$\(tipTotal.string(2))"
    }
    @IBAction func onClick(sender: AnyObject) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("setting") as! ViewController
        self.presentViewController(next, animated: true, completion: nil)

    }

}//end view
//create an extension to make float number
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }

}
// create an extension to make decimal with x numbers
extension Float {
    func string(fractionDigits:Int) -> String {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.stringFromNumber(self) ?? "\(self)"
    }
}
