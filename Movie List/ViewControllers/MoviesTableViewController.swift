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
		
		guard let movie = moviesController?.movies[indexPath.row] else { return cell}
		cell.textLabel?.text = movie.movie
		cell.detailTextLabel?.text = movie.isSeen ? "Seen" : "Not Seen"

        return cell
    }
	

	

}
