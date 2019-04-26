//
//  MovieController.swift
//  Movie List
//
//  Created by Hayden Hastings on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    var movies: [Movie] = []
    
    func createMovie(with nameOfMovie: String) {
        let movie = Movie(nameOfMovie: nameOfMovie)
        
        movies.append(movie)
    }
}
