//
//  MovieListTabBarController.swift
//  Movie List
//
//  Created by Hector Steven on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieListTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		for childViewController in children {
			if let childVC = childViewController as? MoviesControllerProtocol {
				childVC.moviesController = moviesController
			}
		}
    }
	
	
    let moviesController = MoviesController()

}
