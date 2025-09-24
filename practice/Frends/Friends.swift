//
//  Frends.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/22.
//

import Foundation
import SwiftData

@Model
class Friend{
    var name:String
    var favoriteMovie : Movie?
    
    init(name:String){
        self.name = name
    }
    
    static let sampleData=[
        Friend(name:"Sota"),
        Friend(name:"Mika"),
        Friend(name:"Kazusige"),
        Friend(name:"Yoich")
    ]
}
