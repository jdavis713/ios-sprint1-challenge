//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


protocol seenButtonProtocol {
	func seenButton(for cell: MovieTableViewCell)
}
class MovieTableViewCell: UITableViewCell {
	
	@IBAction func IsSeenButtonAction(_ sender: Any) {
		
//		guard let m = movie else { return }
//		movieController?.updateLike(movie: m)
//		setupCell()
//		print(m.isSeen)
	}
	
	private func setupCell() {
		guard let movie = movie else { return }
		movieNameLabel?.text = movie.movie
		let buttonTitle = movie.isSeen! ? "Seen" : "Not Seen"
		IsSeenButtonTitle.setTitle(buttonTitle, for: .normal)
	}
	
	@IBOutlet var movieNameLabel: UILabel!
	@IBOutlet var IsSeenButtonTitle: UIButton!
	
	weak var delegate: seenButtonProtocol?
	
	var movieController: MoviesController?
	var movie: Movie? {
		didSet {
			setupCell()
		}
	}
	
}
