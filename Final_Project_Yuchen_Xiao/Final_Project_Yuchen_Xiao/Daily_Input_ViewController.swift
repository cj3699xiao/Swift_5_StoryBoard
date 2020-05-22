//
//  Daily_Input_ViewController.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/28/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Daily_Input_ViewController: UIViewController {
    
    var health : [String] = ["Underweight","Normal weight","Overeight","Obesity"]
    
    @IBOutlet weak var BMI_Result: UILabel!
    @IBOutlet weak var Health_Rate: UILabel!
    
    @IBOutlet weak var input_weight: UITextField!
    @IBOutlet weak var input_height: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Comfirm_B(_ sender: UIButton) {
        
        if(input_weight.text == ""||input_height.text == ""){
            invalid_report(0)
        }else if(Int(input_weight.text!)! > 300 || Int(input_weight.text!)! < 30){
            invalid_report(1)
        }else if(Int(input_height.text!)! < 100 || Int(input_height.text!)! > 230){
            invalid_report(2)
        }else{
            let result = bmi( Double(input_weight.text!)! , Double(input_height.text!)!)
            
            BMI_Result.text =
            String(format: "%.2f",result)
            
            Health_Rate.text = bmi_health_cato()
        }
        
    }
    
    @IBAction func Backgroud_touch(_ sender: UIControl) {
    input_weight.resignFirstResponder()
    input_height.resignFirstResponder()
    }
    
    func invalid_report(_ report_n: Int){
        var mas: String;
        if report_n == 0{
            mas = "Please enter weight & height. "
        }else if report_n == 1{
            mas = "Please check the weight input."
        }else{
            mas = "Please check the height input."
        }
        let alertController = UIAlertController(title: "Invalid Text Input", message: mas, preferredStyle: .alert)
                  
         let cancelAction = UIAlertAction(title: "Okay.", style: .cancel, handler: nil)
         alertController.addAction(cancelAction)
        
        present(alertController,animated: true, completion:nil)
    }
    
    @IBAction func Switch_back(_ sender: UIButton) {
        if let from = presentingViewController as? ViewController
        {
                    if(my_BMI == -1){
                        from.Cur_BMI.text = "N/A"
                    }else{
                        from.Cur_BMI.text =
                        String(format: "%.2f",my_BMI)
                    }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        ViewController().viewWillAppear(true)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
