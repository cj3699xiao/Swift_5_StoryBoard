//
//  ViewController.swift
//  Yuchen_Xiao_W3
//
//  Created by yuchen xiao on 2/2/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Operation: Int = 0;// no op 0,+ 1,- 2.
    var pre_op: Int = 0;
    var result: Int = 0;
    var input_number: Int = 0;
    var first_num: DarwinBoolean = true;

    @IBAction func number_press(_ sender: UIButton) {
        if let input = sender.currentTitle{
            input_number = input_number * 10 + Int(input)!
            Result.text = "\(input_number)"
        }
    }
    
    @IBOutlet weak var Result: UILabel!
    
    @IBAction func Plus(_ sender: UIButton) {
        if first_num == true{
            first_num = false
            result = input_number
            input_number = 0
        }
        pre_op = Operation
        Operation = 1
        if pre_op == 1{
            result = result + input_number
        }else if pre_op == 2{
            result = result - input_number
        }else{
            
        }
        Result.text = "\(result)"
        input_number = 0
    }
    
    @IBAction func Minus(_ sender: UIButton) {
        if first_num == true{
            first_num = false
            result = input_number
            input_number = 0
        }
        pre_op = Operation
        Operation = 2
        if pre_op == 1{
            result = result + input_number
        }else if pre_op == 2{
            result = result - input_number
        }else{
                  
        }
        Result.text = "\(result)"
        input_number = 0
        
        
    }
    @IBAction func Equal(_ sender: UIButton) {
        if Operation == 0{
            
        }else{
            if Operation == 1{
        result = result + input_number
            }else{
        result = result - input_number
            }
            
        Result.text = "\(result)"
        input_number = 0
        Operation = 0
        pre_op = 0
            
        }
    }
    @IBAction func Reset(_ sender: UIButton) {
        Operation = 0;
        pre_op = 0;
        result = 0;
        input_number = 0;
        first_num = true;
        Result.text = "Result"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

