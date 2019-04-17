//
//  MovieCell.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit

protocol Movie {
    var title: String { get }
    var releaseDate: String { get }
    var voteAverage: Double { get }
    var posterPath: String { get }
    var overview: String { get }
    var backdropPath: String { get }
}

//extension ResultTopRated: Movie {}

//extension ResultPopular: Movie {}

class MovieCell: UITableViewCell {

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieName: UILabel!
    @IBOutlet var movieReleaseDate: UILabel!
    @IBOutlet var movieVoteAverage: UILabel!

}
