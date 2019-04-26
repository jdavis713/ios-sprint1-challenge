//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, MoviesControllerProtocol {
	var moviesController: MoviesController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesController?.movies.count ?? 0
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
		
		guard let movieCell = cell as? MovieTableViewCell else { return  cell }
		
		if let movie = moviesController?.movies[indexPath.row] {
			movieCell.movie = movie
		}
		
        return movieCell
    }
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			guard let movie = moviesController?.movies[indexPath.row] else { return }
			moviesController?.deleteMovie(movie: movie)
		} else if editingStyle == .insert {
			
		}
		tableView.reloadData()
	}
	

}
