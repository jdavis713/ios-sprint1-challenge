//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, MoviesControllerProtocol, MovieTableViewCellDelegate {
	func isSeenButton(for cell: MovieTableViewCell) {
		guard let movie = cell.movie else { return }
		moviesController?.updateLike(movie: movie)
		tableView.reloadData()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		tableView.reloadData()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesController?.movies.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
		
		guard let movieCell = cell as? MovieTableViewCell else { return  cell }
		movieCell.delegate = self
		if let movie = moviesController?.movies[indexPath.row] {
			movieCell.movie = movie
		}
		
        return movieCell
    }
	
//	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//		if editingStyle == .delete {

//		} else if editingStyle == .none {
//			print("edit")
//		}
//	}
//

	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .destructive, title: "delete", handler: {
			action, index in
			print("Delete button")
			
			if let movie = self.moviesController?.movies[indexPath.row] {
				self.moviesController?.deleteMovie(movie: movie)
				self.tableView.reloadData()
			}
		})
		
		return [delete]
	}
	
	var moviesController: MoviesController?
}

