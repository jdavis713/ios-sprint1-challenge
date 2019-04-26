//
//  AddMoviesViewController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddMoviesViewController: UIViewController, MoviesControllerProtocol {
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func AddmovieButtonAction(_ sender: Any) {
		guard let movieText = movieTextField.text else { return }
		if !movieText.isEmpty {
			moviesController?.createMovie(movie: movieText)
		}
		movieTextField?.text = nil
	}
	
	@IBOutlet var movieTextField: UITextField!
	var moviesController: MoviesController?
	
}
