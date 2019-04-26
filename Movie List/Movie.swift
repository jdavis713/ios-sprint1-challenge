//
//  Movie.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct Movie: Equatable {
	init(movie: String, isSeen: Bool? = false) {
		self.movie = movie
		self.isSeen = isSeen
	}
	
	var movie: String
	var isSeen: Bool?
}
