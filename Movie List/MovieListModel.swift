//
//  MovieListModel.swift
//  Movie List
//
//  Created by Ruth on 4/30/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import Foundation

class MovieModel {
    
    var image : String
    var Title : String
    var Rate : Double
    var ReleaseDate: Int
    var Genre : [String]
    
    
    init ( image : String , Nametext : String , Rate : Double , ReleaseDate:Int , Genre: [String]) {
        
        self.image = image
        self.Title = Nametext
        self.Rate = Rate
        self.Genre = Genre
        self.ReleaseDate = ReleaseDate
    }

   
}
