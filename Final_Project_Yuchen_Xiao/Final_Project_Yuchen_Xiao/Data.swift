//
//  Data.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/5/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import Foundation

var my_BMI : Double = -1;
var target_BMI : Double = -1;

var my_height : Double = 0
var my_weight : Double = 0
//var gender : Int = -1 ; // 1 male ; 2 female
var date_p : Int = 1;
var day_workout: Int = 0;

let BMI_type : [String] = ["Deadly Underweight","Severely Underweight","Underweight","Healthy Weight!","Overweight","Moderately Obese","Severely obese","Very severely obese"]

func bmi(_ weight: Double, _ height: Double) -> Double{
    my_height = height/100
    my_weight = weight
    my_BMI = my_weight / (my_height * my_height)
    return my_BMI
}

func bmi_health_cato() -> String{
    if(my_BMI == -1){
        return "N/A"
    }
    
    if my_BMI < 15{
        return BMI_type[0]
    }else if my_BMI >= 15 && my_BMI <= 16{
        return BMI_type[1]
    }else if my_BMI > 16 && my_BMI <= 18.5{
        return BMI_type[2]
    }else if my_BMI > 18.5 && my_BMI <= 25{
        return BMI_type[3]
    }else if my_BMI > 25 && my_BMI <= 30{
        return BMI_type[4]
    }else if my_BMI > 30 && my_BMI <= 35{
        return BMI_type[5]
    }else if my_BMI > 35 && my_BMI <= 40{
        return BMI_type[6]
    }else{
        return BMI_type[7]
    }
}

func get_calory()-> Int{
    
    let target_w = target_BMI * my_height * my_height
    var target_d_calory: Int
    if(my_weight > target_w){
        target_d_calory = 2000 - Int((my_weight - target_w)*7000) / date_p
    }else{
        target_d_calory = 2000 + Int((target_w - my_weight)*7000) / date_p
    }
    if(target_d_calory<1000){
        var work_h = 0;
        while(target_d_calory + work_h * 300 < 1000){
            work_h = work_h + 1
            if(work_h >= 3){
                break
            }
        }
        day_workout = work_h
        
    }
    
    if(target_d_calory < 1000){
        return -1
    }else{
        return target_d_calory
    }
}


// for table



let Workout_list = [

    Workout_type(name: "ALTERNATING DUMBBELL BENCH PRESS",
          type: .chest,
          
          shortDescription: "3 sets, 12-15 reps, 30 sec rest.",
          longDescription: "1.Lie back on a flat bench holding dumbbells. Press them both over your chest and then lower one of them to your side. 2.Press it up and then lower the other hand. That's one rep."),

    Workout_type(name: "Bulgarian Split Squat",
            type: .quads,
            shortDescription: "4 sets, 12-20 reps, 60 sec rest.",
            longDescription: "Stand about a foot in front of a bench (lunge-length). Hold a dumbbell in each hand and rest the top of one foot on the bench behind you. “Keep your chest up, shoulders back, and your weight in your heels,” Bangkuai says. Lunge down. “Focus on pausing at the bottom and exploding out of ‘the hole’—the bottom of the motion—maintaining constant tension in your legs,” he adds. Also, lean slightly forward to engage your quads more than your glutes. Lower your body until your rear knee nearly touches the floor, and your front thigh is parallel. “Be careful not to go too heavy, as your grip could be a limiting factor,” Bangkuai advises."),
    
    Workout_type(name: "Deadlifts",
    type: .lats,
    shortDescription: "3 sets, 12-15 reps, 45 sec rest.",
    longDescription: "Load a barbell with weight on the ground and stand close to it, so it nearly touches your shins. Grasp it with an overhand, slightly-wider-than-shoulder-width grip. With feet shoulder-width apart and arms just outside of the legs, push the hips back as far as possible then bend the knee far enough to reach the bar. From the bottom position with a tall spine, pull the bar from the ground by standing tall and pulling the hips back to your standing position. Throughout the movement, it's important to maintain a strong posture. Descend down controlling the bar back down to the ground."),
    
  
]




class Workout_type{
    enum `Type`: String {
        case chest = "Chest_T"
        case quads = "Quads_T"
        case lats = "Lats_T"
    }
    
    var name: String
    var type: Type
    var shortDescription: String
    var longDescription: String
    
    init(name: String, type: Type, shortDescription: String, longDescription: String) {
        self.name = name
        self.type = type
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}
