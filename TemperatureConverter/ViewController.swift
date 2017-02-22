//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Dragos Neagu on 20/02/2017.
//  Copyright © 2017 Dragos Neagu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureEntry: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conversionsCounter: UILabel!
    
    var conversions = 0

    @IBAction func convertCelsiusClicked(_ sender: Any) {
        convert(scale: "Celsius")
    }
    
    @IBAction func convertFahrenheitClicked(_ sender: Any) {
        convert(scale: "Fahrenheit")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    
    func convert(scale: String){
        if let result = temperatureEntry.text {
            
            if (result != "") {
                if let num = Double(result){
                    let output = calcGrades(type: scale, value: num)
                    resultLabel.text = String(output)
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

