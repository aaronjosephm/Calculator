//
//  ViewController.swift
//  Calculator
//
//  Created by Aaron Mednick on 5/20/18.
//  Copyright © 2018 Aaron Mednick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number:Double = 0;
    
    var previousNumber:Double = 0;
    
    var performingMath = false
    
    var operation = 0;
    
    @IBOutlet var screen: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            screen.text = String(sender.tag - 1)
            number = Double(screen.text!)!
            performingMath = false
        }
        else {
            screen.text = screen.text! + String(sender.tag-1)
            number = Double(screen.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if screen.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(screen.text!)!
            
            if sender.tag == 12 {
                screen.text = "/";
            }
            else if sender.tag == 13 {
                screen.text = "*";
            }
            else if sender.tag == 14 {
                screen.text = "-";
            }
            else if sender.tag == 15 {
                screen.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16 {
            if operation == 12 {
                screen.text = String(previousNumber / number)
            }
            else if operation == 13 {
                screen.text = String(previousNumber * number)
            }
            else if operation == 14 {
                screen.text = String(previousNumber - number)
            }
            else if operation == 15 {
                screen.text = String(previousNumber + number)
            }
        
        }
        else if sender.tag == 11 {
            screen.text = ""
            previousNumber = 0
            number = 0
            operation = 0
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

