//
//  MovieController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MoviesController {
	
	func createMovie (movie: String){
		let movie = Movie(movie: movie)
		movies.append(movie)
	}
	
	func deleteMovie(movie: Movie) {
		if let i = getMovieIndex(movie) {
			movies.remove(at: i)
		}
	}
	
	func updateLike(movie: Movie) {
		if let i = getMovieIndex(movie) {
			movies[i].isSeen?.toggle()
		}
	}
	
	func updateMoveName(movie: Movie, name: String) {
		if let i = getMovieIndex(movie) {
			movies[i].movie = name
		}
	}
	
	private func getMovieIndex(_ movie: Movie) -> Int? {
		guard let i = movies.firstIndex(of: movie) else { return nil}
		return i
	}
	
	init() {
		createMovie(movie: "The Matrix")
		createMovie(movie: "The Lord of the Rings")
	}
	
	var movies: [Movie] = []
}
