//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
	func isSeenButton(for cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {
	@IBAction func IsSeenButtonAction(_ sender: Any) {
		delegate?.isSeenButton(for: self)
	}
	
	private func setupCell() {
		guard let movie = movie else { return }
		movieNameLabel?.text = movie.movie
		let buttonTitle = movie.isSeen! ? "Seen" : "Not Seen"
		IsSeenButtonTitle.setTitle(buttonTitle, for: .normal)
	}
	
	@IBOutlet var movieNameLabel: UILabel!
	@IBOutlet var IsSeenButtonTitle: UIButton!
	
	weak var delegate: MovieTableViewCellDelegate?
	
	var movie: Movie? {
		didSet {
			setupCell()
		}
	}
}
