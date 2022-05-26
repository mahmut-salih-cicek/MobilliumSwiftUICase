//
//  Movie.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 26.05.2022.
//

import Foundation


// basit bir model ile movieList olusturdum.
struct MovieModel : Identifiable{
    var id =  UUID()
    var movieName : String
}


var movieList =  [
    MovieModel(movieName: "Spiderman"),
    MovieModel(movieName: "Don't Breathe 2"),
    MovieModel(movieName: "Wrath of Man"),
    MovieModel(movieName: "The Power of Dog"),
    MovieModel(movieName: "Red Notice"),
    MovieModel(movieName: "Jungle Cruise"),
    MovieModel(movieName: "Stowaway"),
    MovieModel(movieName: "Paper Lives"),
    MovieModel(movieName: "Nobody"),
    MovieModel(movieName: "Zack Snyder's Justice League"),
]
