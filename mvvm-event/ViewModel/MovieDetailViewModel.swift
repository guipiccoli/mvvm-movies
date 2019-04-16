//
//  MovieDetailViewModel.swift
//  
//
//  Created by Fernando Locatelli Maioli on 16/04/19.
//

import UIKit
import Foundation

class MovieDetailViewModel {

    private let selectedMovie: ResultPopular?
    
    init(movie: ResultPopular) {
        selectedMovie = movie
    }
    
    func getMovieTitle () -> String {
        guard let selectedMovie = selectedMovie else { return "" }
        return selectedMovie.title
    }
    
    func getMovieReleaseDate() -> String {
        guard let selectedMovie = selectedMovie else { return "" }
        return selectedMovie.releaseDate
    }
    
    func getMovieRate() -> String {
        guard let selectedMovie = selectedMovie else { return "" }
        return "\(selectedMovie.voteAverage)"
    }
    
    func getMovieOverview() -> String {
        guard let selectedMovie = selectedMovie else { return "" }
        return selectedMovie.overview
    }
    
    func getMovieBackdrop() -> String {
        guard let selectedMovie = selectedMovie else { return "" }
        return selectedMovie.backdropPath
    }

}
