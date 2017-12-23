//
//  ViewController.swift
//  CoreML
//
//  Created by Shravan K on 12/22/17.
//  Copyright © 2017 GoDimensions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var genderPrediction: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func features(_ string:String) -> [String:Double] {
        guard !string.isEmpty else {
            return [:]
        }
        let string = string.lowercased()
        var keys = [String]()
        
        keys.append("firstLetter1=\(string.prefix(1))")
        keys.append("firstLetter2=\(string.prefix(2))")
        keys.append("firstLetter3=\(string.prefix(3))")
        keys.append("lastLetter1=\(string.suffix(1))")
        keys.append("lastLetter2=\(string.suffix(2))")
        keys.append("lastLetter3=\(string.suffix(3))")
        
        return keys.reduce([String: Double]()) { (result, key) -> [String: Double] in
            var result = result
            result[key] = 1.0
            return result
        }
       
    }
    
    func predictGender(_ name:String) -> String? {
        return "hi"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //If any memory warning was recieved.
    }

}

