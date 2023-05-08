//
//  ViewController.swift
//  Calc
//
//  Created by Hannah Saud Abdalla Mohamed Abdalla on 6/28/18.
//  Copyright © 2018 Hannah Saud Abdalla Mohamed Abdalla. All rights reserved.
//

import UIKit

enum modes{
    case notSet
    case addition
    case subtraction
    case multiplication
}



class CalcViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var labelString: String = "0"
    var currentMode: modes = .notSet
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressPlus(_ sender: Any) {
        changeModes(newMode: .addition)
    }
    
    
    @IBAction func didPressSubtract(_ sender: Any) {
        changeModes(newMode: .subtraction)
    }
    
    
    @IBAction func didPressMultiply(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard let labelInt: Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .notSet || lastButtonWasMode){
            return
        }
        
        if (currentMode == .addition){
            savedNum += labelInt
        } else if (currentMode == .addition){
            savedNum += labelInt
        } else if (currentMode == .subtraction){
            savedNum -= labelInt
        } else if (currentMode == .multiplication){
            savedNum *= labelInt
        }
        
        currentMode = .notSet
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
    }
    
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .notSet
        savedNum = 0
        lastButtonWasMode = false
        updateText()  //or label.text= "0"
        
    }
    
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue: String? = sender.titleLabel?.text
        
        if (lastButtonWasMode) {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    
    
    func updateText() {
        guard let labelInt: Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .notSet) {
            savedNum = labelInt
        }
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num: NSNumber = NSNumber(value: labelInt)
        
        label.text = formatter.string(from: num)
    }
    
    
    func changeModes(newMode: modes) {
        if (savedNum == 0) {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
    }


}

