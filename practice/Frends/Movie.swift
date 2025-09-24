//
//  Movie.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/22.
//

import Foundation
import SwiftData

@Model
class Movie{
    var title:String
    var releaseDate:Date
    
    init(title:String,releaseDate:Date){
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title:"Amusing Space",releaseDate:Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title:"Amusing Space",releaseDate:Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title:"Amusing Space",releaseDate:Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title:"Amusing Space",releaseDate:Date(timeIntervalSinceReferenceDate: -402_000_000)),
    ]
}
