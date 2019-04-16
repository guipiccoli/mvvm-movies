//
//  MoviesView.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit
import Foundation

class MoviesView: UIViewController {

    var moviePopular: MoviePopular?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        APIService.getPopularMovies { (MoviePopular) in
            self.moviePopular = MoviePopular ?? nil
            DispatchQueue.main.async {
                print(self.moviePopular)
            }
            
        }
        
    }
}
