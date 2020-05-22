//
//  Second_ViewController.swift
//  W6_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/23/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Second_ViewController: UIViewController {
//    var massage: String = ""
//    var masssage_b :String = "From My DVR"
//
//    @IBOutlet weak var Label: UILabel!
    
    var all_states:[String:String] = ["Play":"Playing","Stop":"Stopped","Pause":"Paused","Fast Forward":"Fast forwarding","Fast Rewind":"Fast rewinding","Record":"Recording"]
    
    var Cur_state : String = "Stop"
    var Next_state : String = "Stop"
    
    @IBOutlet weak var Power_Status: UILabel!
    @IBOutlet weak var State_Status: UILabel!
    @IBOutlet var All_Bottons: [UIButton]!
    @IBOutlet weak var Top_V_DVR: UIView!
    
    @IBAction func Power_Switch(_ sender: UISwitch) {
        Cur_state = "Stop"
        State_Status.text = all_states[Cur_state]
        
        Power_Status.text = (sender.isOn) ? "On": "Off"
        Top_V_DVR.backgroundColor = (sender.isOn) ? UIColor.orange : UIColor.gray
        for a in All_Bottons {
            a.isEnabled = sender.isOn
        }
    }

    
    @IBAction func Button_Pressed(_ sender: UIButton) {
            if let Next_state = sender.currentTitle{
                if(Cur_state == Next_state){
                    //do nothing
                }else if (Cur_state != "Play" && (Next_state == "Pause" || Next_state == "Fast Forward" || Next_state == "Fast Rewind")){
                    
                    Report(Next_state)
                    
                }else if(Cur_state != "Stop" && Next_state == "Record" || Cur_state == "Record" && Next_state == "Play"){
                    // since Forward, rewind & pause already define early
                    Report(Next_state)
                }else{
                      Cur_state = Next_state
                      State_Status.text = all_states[Next_state]
                }
                    
                }
    }
    
    func Report(_ r_op: String){
        let alertController = UIAlertController(title: "Invalid Operation", message: "Are you forcing to make this \(r_op) operation?", preferredStyle: .alert)
                 
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let forceAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.force2do(r_op)})
                 
        alertController.addAction(cancelAction)
        alertController.addAction(forceAction)
        present(alertController,animated: true, completion:nil)
        
    }
    
    func force2do(_ op:String){
        let alertController = UIAlertController(title: "Confirm", message: "Current operation has been stopped and the requested operation proceeds", preferredStyle: .alert)
                 
        let cancelAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController,animated: true, completion: nil)
        
        Cur_state = op
        State_Status.text = all_states[Cur_state]
        
    }
    
   
//    @IBAction func switchBack(_ sender: UIBarButtonItem) {
//        if let from = presentingViewController as? ViewController{
//            from.massage = self.masssage_b
//            from.updateView()
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     // this will load after prepare from first controller
//    override func viewWillAppear(_ animated: Bool) {
//        Label.text = massage
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
