//
//  MoviePresenter.swift
//  Movie List
//
//  Created by Hayden Hastings on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol MoviePresenter: AnyObject {
    var movieController: MovieController? { set get }
}
