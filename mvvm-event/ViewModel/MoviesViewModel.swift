//
//  MoviesViewModel.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//
import Foundation
import UIKit

class MoviesViewModel {
    
    var moviesPopular: MoviePopular?
    var moviesTopRated: MovieTopRated?
    
    init() {
        fetchMoviesPopular()
    }
    
    func fetchMoviesPopular(){
        APIService.getPopularMovies { (MoviePopular) in
            self.moviesPopular = MoviePopular ?? nil
        }
    }
    func fetchTopRated(){
        APIService.getTopRatedMovies { (MovieTopRated) in
            self.moviesTopRated = MovieTopRated ?? nil
        }
    }
    
    func getMoviesNumber() -> Int {
        if let size = moviesPopular?.results.count{
            print(size)
            return size - 2
        }
        return 0
    }
    
    //    func getMoviePosterPath(index: IndexPath) -> UIImage {
    //
    //    }
    
}
