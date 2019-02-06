//
//  ViewController.swift
//  Random Color
//
//  Created by student14 on 1/26/19.
//  Copyright © 2019 student14. All rights reserved.
//
//  This is random color generator app that randomly changes the background color when device is shaken.
//  This also displays the RBG value when screen is touched

import UIKit

//This is an extention of UIColor to initialize the object with integer parameters, then cast them as CGFloat
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255

        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    //variables
    var red = 255
    var green = 255
    var blue = 255
    
    @IBOutlet weak var colorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set background color to white
        view.backgroundColor = UIColor(red: red, green: green, blue: blue)
    }
    
    //displays the RBG values when display screen is pressed
    @IBAction func colorButtonClicked(_ sender: UIButton) {
        let hexValue = String(format:"%02X", Int(red)) + String(format:"%02X", Int(green)) + String(format:"%02X", Int(blue))
        colorButton.setTitle("RGB (\(red),\(green),\(blue))\nHEX #\(hexValue)", for: .normal)
        colorButton.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    //creates random RGB numbers and use them to set a new background color when device is shaken
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //enable detection of shake motion
        if motion == .motionShake {
            //create random RGB numbers
            red = Int(arc4random_uniform(256))
            green = Int(arc4random_uniform(256))
            blue = Int(arc4random_uniform(256))
            //set background color with UIColor object
            view.backgroundColor = UIColor(red: red, green: green, blue: blue)
            //clears colorButton text
            colorButton.setTitle("", for: .normal)
        }
    }
}



