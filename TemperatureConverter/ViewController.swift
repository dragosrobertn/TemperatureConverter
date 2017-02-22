//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Dragos Neagu on 20/02/2017.
//  Copyright © 2017 Dragos Neagu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Linked outlets from the Storyboard.
    @IBOutlet weak var temperatureEntry: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conversionsCounter: UILabel!
    
    // Initalise the conversions variable to be incremented.
    var conversions = 0
    
    // Each of these actions call the same functions, passing on the 
    // scale they want the conversion made into.
    @IBAction func convertCelsiusClicked(_ sender: Any) {
        convert(scale: "Celsius")
    }
    
    @IBAction func convertFahrenheitClicked(_ sender: Any) {
        convert(scale: "Fahrenheit")
    }
    
    // We're not doing much here. Auto-generated code.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Hiding the status bar for a neater look.
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Receives the scale and the value to be converted. Return a Double.
    // Default returned value is not really appropriate, but optionals are
    // part of a future project.
    func calcGrades (type: String, value: Double) -> Double {
        switch type {
        case "Fahrenheit":
            return value * (9/5) + 32
        case "Celsius":
            return (value - 32) / (9/5)
        default:
            return 0.0
        }
    }
    
    // Receives the scale as a param. Does string checks and manipulation
    // Every time a conversion is made, it increments the value of conversions
    // and displays it.
    func convert(scale: String){
        if let result = temperatureEntry.text {
            if (result != "") {
                if let num = Double(result){
                    let output = calcGrades(type: scale, value: num)
                    // Not the prettiest of concatenations, but needed to 
                    // make it clearer what scale are we showing the value in.
                    resultLabel.text = String(output) + " " + scale
                    conversions += 1
                    conversionsCounter.text = "Conversions: " + String(conversions)
                }
            }
            else {
                return
            }
        }
    }
}

