//
//  ViewController.swift
//  W5_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/15/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var total_list: String = ""
   
    @IBOutlet var Text_fields: [UITextField]!
    @IBOutlet weak var List_Result: UILabel!
    @IBOutlet weak var Description_F: UITextField!
    @IBOutlet weak var Quantity_F: UITextField!
    
    @IBAction func TextFeild_exit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func Background_touch(_ sender: UIControl) {
        for TF in Text_fields{
            TF.resignFirstResponder()
        }
    }
    
    @IBAction func New_List(_ sender: UIButton) {
        total_list = "";
        List_Result.text = "No item"
    }
    
    @IBAction func New_item(_ sender: UIButton) {
        for tf in Text_fields{
            tf.text = ""
        }
    }
    
    @IBAction func Add(_ sender: UIButton) {
       
  
        if(Description_F.text != "" && Quantity_F.text != "" && Int(Quantity_F.text ?? "") != nil){
        total_list += Quantity_F.text!
        total_list += " x "
        total_list += Description_F.text!
        total_list += "\n"
        
        List_Result.text = total_list
        }else{
            Invalid_Alert()
        }
        
    }
    
    func Invalid_Alert(){
        let alertController = UIAlertController(title: "Invalid Input", message: "What are you doing?", preferredStyle: .alert)
                 
        let cancelAction = UIAlertAction(title: "Sorry, Let me check.", style: .cancel, handler: nil)
                 
        alertController.addAction(cancelAction)
        present(alertController,animated: true, completion:nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

