//
//  ThirdViewController.swift
//  Week7_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/1/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var Label_name: UITextField!
    @IBOutlet weak var Label_num: UISegmentedControl!
    @IBOutlet weak var Channel_number: UILabel!
    
    @IBAction func change_channel(_ sender: UIStepper) {
        Channel_number.text = String(Int(sender.value))
        
    }
    
    @IBAction func Done_Edit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func Background_touch(_ sender: UIControl) {
        Label_name.resignFirstResponder()
    }
    @IBAction func Save_action(_ sender: UIButton) {
        if((Label_name.text?.count)! > 4 || (Label_name.text?.count)! == 0){
            invalid_text()
        }else{
            FChannel_num[Label_num.selectedSegmentIndex] = Channel_number.text!
            
            FChannel_name[Label_num.selectedSegmentIndex] =
            Label_name.text!
        }
    }
// * optional  change it directly on firstviewcontroller
//        let firstab = self.tabBarController?.viewControllers?[0] as!
//        ViewController
//
//        firstab.Channel_result.text = self.Channel_number.text
//
//        firstab.Favorite_B.setTitle("aaa", forSegmentAt: 0)
//
//        firstab.FChannel_num[0] = Channel_number.text!
   
    
    @IBAction func Cancel_action(_ sender: UIButton) {
        Label_name.text = "";
        Channel_number.text = "1";
        Label_num.selectedSegmentIndex = 0;
    }
    
    func invalid_text(){
        let alertController = UIAlertController(title: "Invalid Text Input", message: "Please enter Label name within 4 characters.", preferredStyle: .alert)
                 
        let cancelAction = UIAlertAction(title: "Yes,Sir!", style: .cancel, handler: nil)
                
        Label_name.text = "";
        alertController.addAction(cancelAction)
       
        present(alertController,animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
