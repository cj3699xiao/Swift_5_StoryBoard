//
//  ViewController.swift
//  W4_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/9/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

var FChannel_num: [String] = ["1","2","3","4"]
var FChannel_name: [String] = ["ABC","NBC","CBS","FOX"]

class ViewController: UIViewController {
    
//    func updateView(){
//        label.text = massage
//    }
//
    
    @IBOutlet weak var Mytv_Power: UILabel!
    @IBOutlet weak var Channel_result: UILabel!
    
    @IBOutlet weak var Volume: UILabel!
    
    @IBOutlet weak var Favorite_channel: UISegmentedControl!
    @IBOutlet weak var Volume_Slider: UISlider!
    @IBOutlet weak var Favorite_B: UISegmentedControl!
    
    @IBOutlet weak var Top_V: UIView!
    
    @IBOutlet var Bs: [UIButton]!
    
    var cur_channel: Int = 0;
    var channel_enter: Bool = false;
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0...3{
        Favorite_B.setTitle(FChannel_name[i], forSegmentAt: i)
        }
    }
    
    
    @IBAction func Channel_Num(_ sender: UIButton) {
        if let input = sender.currentTitle{
            cur_channel = cur_channel*10 + Int(input)!
            if(channel_enter == true){
                if(cur_channel==0){
                    cur_channel = 1 //if 0 convert to 1
                }
                Channel_result.text = "\(cur_channel)"
                channel_enter = false
                cur_channel = 0
            }else{
                channel_enter = true;
            }
        }
    }
    @IBAction func Channel_P_M(_ sender: UIButton) {
        if let input = sender.currentTitle{
            if(input == "Ch+"){
                cur_channel = Int(Channel_result.text!)!
                cur_channel = (cur_channel>=99) ? cur_channel:cur_channel+1
                Channel_result.text = "\(cur_channel)"
                cur_channel = 0;
            }else{
                cur_channel = Int(Channel_result.text!)!
                cur_channel = (cur_channel<=1) ? cur_channel:cur_channel-1
                Channel_result.text = "\(cur_channel)"
                cur_channel = 0;
            }
        }
    }
    @IBAction func Power(_ sender: UISwitch) {
        Favorite_channel.isEnabled = sender.isOn
        Volume_Slider.isEnabled = sender.isOn
        Favorite_B.isEnabled = sender.isOn
        for a in Bs{
            a.isEnabled = sender.isOn
        }
        Top_V.backgroundColor = (sender.isOn) ? UIColor.green : UIColor.gray
        Mytv_Power.text = (sender.isOn) ? "On" : "Off"
    }
    
    @IBAction func Volume_Slider(_ sender: UISlider) {
        Volume.text = "\(Int(sender.value))"
    }
    
    @IBAction func Favorite_C(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            Channel_result.text = "\(FChannel_num[0])"
        }else if sender.selectedSegmentIndex == 1{
            Channel_result.text = "\(FChannel_num[1])"
        }else if sender.selectedSegmentIndex == 2{
            Channel_result.text = "\(FChannel_num[2])"
        }else{
            Channel_result.text = "\(FChannel_num[3])"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let target = segue.destination as? Second_ViewController{
//            target.massage = "From MY_TV"
//        }
//    }

}

