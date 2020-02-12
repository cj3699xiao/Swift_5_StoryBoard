//
//  ViewController.swift
//  W4_Yuchen_Xiao
//
//  Created by yuchen xiao on 2/9/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
            Channel_result.text = "\(15)"
        }else if sender.selectedSegmentIndex == 1{
            Channel_result.text = "\(35)"
        }else if sender.selectedSegmentIndex == 2{
            Channel_result.text = "\(55)"
        }else{
            Channel_result.text = "\(88)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

