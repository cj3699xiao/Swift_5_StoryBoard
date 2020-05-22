//
//  Plan_Setting_ViewController.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/5/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Plan_Setting_ViewController: UIViewController {
    
    @IBOutlet weak var Cur_BMI: UILabel!
    
    @IBOutlet weak var Cur_State: UILabel!
    
    @IBOutlet weak var Tar_BMI: UILabel!
    
    @IBOutlet weak var Target_selection: UISegmentedControl!
    
    @IBOutlet weak var Date_Picker: UIDatePicker!
    var targetchoose: Bool = false
    var confirmed : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(my_BMI == -1){
            Cur_BMI.text = "N/A"
        }else{
            Cur_BMI.text = String(format: "%.2f",my_BMI)
        }
        
        Cur_State.text = bmi_health_cato()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Target_Choose(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1{
            //            target_BMI = 20.0
            Tar_BMI.text = "\(20.0)"
        }else{
            if(my_BMI > 25){
                //                target_BMI = 25.0
                Tar_BMI.text = "\(25.0)"
            }else if(my_BMI<18.5){
                //                target_BMI = 18.5
                Tar_BMI.text = "\(18.5)"
            }else{
                //                target_BMI = 20.0
                Tar_BMI.text = "\(20.0)"
            }
            
        }
        targetchoose = true;
    }
    
    @IBAction func Comfirm_B(_ sender: UIButton) {
        if targetchoose == false{
            report_target()
        }else{
            let today = Date()
            if(today >= Date_Picker.date){
                report_time()
            }else{
                if Tar_BMI.text == "N/A"{
                    
                }else{
                    target_BMI = Double(Tar_BMI.text!)!
                }
                date_p = Int((Date_Picker.date.timeIntervalSince(Date())/86400).rounded(.awayFromZero))
                
            }
            
            if(get_calory() == -1){
                report_impossible()
            }
            confirmed = true
        }
        
        
        
    }
    
    func report_time(){
        let alertController = UIAlertController(title: "Invalid Time Input", message: "Please don't take past date or today", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Okay.", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true, completion:nil)
        
    }
    
    func report_target(){
        let alertController = UIAlertController(title: "Target Didn't Choose", message: "Please select target.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Okay.", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true, completion:nil)
        
    }
    
    func report_impossible(){
        let alertController = UIAlertController(title: "Impossible mission", message: "Please give more time to reach your goal", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Okay.", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true, completion:nil)
    }
    
    func report_confirm(){
        let alertController = UIAlertController(title: "Didn't Confirm Plan", message: "Please Confirm your plan before return", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Okay.", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true, completion:nil)
    }
    
    @IBAction func Switch_back(_ sender: UIButton) {
        if confirmed == false{
            report_confirm()
        }
        
        if let from = presentingViewController as? ViewController
        {
            if(target_BMI == -1){
                from.Tar_BMI.text = "N/A"
            }else{
                from.Tar_BMI.text = "\(target_BMI)"
            }
            if(get_calory() != -1){
                from.D_Calorie.text = "\(get_calory())"
                from.Work_h.text = "\(day_workout)"
            }else{
                from.D_Calorie.text = "Impossible"
            }
            
        }
        
        dismiss(animated: true, completion: nil)
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
