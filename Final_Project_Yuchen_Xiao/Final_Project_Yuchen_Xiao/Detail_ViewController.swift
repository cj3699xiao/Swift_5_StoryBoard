//
//  Detail_ViewController.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/16/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Detail_ViewController: UIViewController {

    
    @IBOutlet weak var Top_title: UILabel!
       
       @IBOutlet weak var Content_S: UILabel!
       @IBOutlet weak var Content_L: UILabel!

    
       var cur_workout : Workout_type?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
       
       override func viewWillAppear(_ animated: Bool) {
           if let s = cur_workout{
               Top_title.text = s.name
               Content_S.text = s.shortDescription
               Content_L.text = s.longDescription
           }
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
