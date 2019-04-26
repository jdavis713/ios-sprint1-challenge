//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

extension MoviesTableViewController: MovieTableViewCellDelegate {
	func isSeenButton(for cell: MovieTableViewCell) {
		guard let movie = cell.movie else { return }
		moviesController?.updateLike(movie: movie)
		tableView.reloadData()
	}
}

class MoviesTableViewController: UITableViewController, MoviesControllerProtocol {
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

	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .destructive, title: "delete", handler: { action, index in
			
			if let movie = self.moviesController?.movies[indexPath.row] {
				self.moviesController?.deleteMovie(movie: movie)
				self.tableView.reloadData()
			}
			
		})
	
		let edit = UITableViewRowAction(style: .normal, title: "edit", handler: { action, index in
			
			let ac = UIAlertController(title: "Edit Movie", message: nil, preferredStyle: .alert)
			ac.addTextField()
			
			let editAciton = UIAlertAction(title: "ok", style: .default) { [weak self] _ in
			
				if let textFields = ac.textFields {
					if let str = textFields[0].text,
						let movie = self!.moviesController?.movies[indexPath.row] {
						self?.moviesController?.updateMoveName(movie: movie, name: str)
					}
				}
				self?.tableView.reloadData()
			}
			
			ac.addAction(editAciton)
			self.present(ac, animated: true)
		})
		
		return [delete, edit]
	}
	
	var moviesController: MoviesController?
}

