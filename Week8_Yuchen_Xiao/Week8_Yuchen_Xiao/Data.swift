//
//  Data.swift
//  Week8_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/9/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import Foundation



let Shop_list = [

    Shop(name: "Spacca Napoli",
          type: .pizza,
          shortDescription: "1769 W Sunnyside Ave, Chicago, IL 60640-5312",
          longDescription: "(+1 773-878-2420) /r/n Spaccanapoli is the old quarter & heart of naples, Italy. Naples is famed as the birthplace of pizza."),

    Shop(name: "Roka Akor",
            type: .asian,
            shortDescription: "456 N Clark St, Chicago, IL 60654-4517  ",
            longDescription: "(+1 312-477-7652) /r/n Roka Akor is the second location a highly regarded Scottsdale, Ariz.-based Japanese steakhouse and sushi bar, ranked among Bon Appetit magazine's top 10 sushi restaurants in the country in 2009. Meats, fish and vegetables are grilled over oak charcoal on a robata-style grill. Sit at the sushi bar to chat with the chefs as the slice and assemble sashimi platters and maki with fish that's flown in daily. Besides sizzling steaks and contemporary sushi served the dining room, a bar area features shochu and sake cocktails."),
    
    Shop(name: "Momotaro",
    type: .asian,
    shortDescription: "820 W Lake St, Chicago, IL 60607-1728 ",
    longDescription: "(+1 312-733-4818) \r\n Much like the Japanese delicacy it is named for, Momotaro takes root in the vibrant Fulton Market District. Momotaro continues the philosophy of chef driven concepts focusing on tightly executed cuisine and highly personal service. Designed by world-renowned restaurant and experience designers, AvroKO, the main floor features distinct stations for Sushi and a dedicated Robata."),
    
    Shop(name: "Bongiorno's Italian Deli and Pizzeria",
    type: .pizza,
    shortDescription: "405 N Wabash Ave, Chicago, IL 60611-3591 ",
    longDescription: "(+1 312-755-1255) /r/n Come in for a bite. We're just steps off Michigan Avenue between The Wrigley Building and Trump Tower. When the weather is nice, dine outside along the River Walk. Of course, if you can't make it to our place we're happy to meet you at yours. Call and we'll deliver hot to your doorstep or office building."),

]




class Shop{
    enum `Type`: String {
        case pizza = "pizza"
        case asian = "asian"
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
