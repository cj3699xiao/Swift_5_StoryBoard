//
//  ViewController.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/28/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
//        if(my_BMI == -1){
//            Cur_BMI.text = "N/A"
//        }else{
//            Cur_BMI.text = "\(my_BMI)"
//        }
//        if(target_BMI == -1){
//            Tar_BMI.text = "N/A"
//        }else{
//            Tar_BMI.text = "\(target_BMI)"
//        }
    }
    
    
    @IBOutlet weak var Cur_BMI: UILabel!
    @IBOutlet weak var Tar_BMI: UILabel!
    @IBOutlet weak var D_Calorie: UILabel!
    @IBOutlet weak var Work_h: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }


}

