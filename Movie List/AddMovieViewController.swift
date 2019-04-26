//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Hayden Hastings on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    var movieController: MovieController?
    
    @IBOutlet weak var addMovieTextField: UITextField!
    @IBAction func addMovieButtonPressed(_ sender: Any) {
        guard let movie = addMovieTextField.text else { return }
        
        movieController?.createMovie(with: movie)
        
        addMovieTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}