//
//  MovieDetailView.swift
//  
//
//  Created by Fernando Locatelli Maioli on 16/04/19.
//

import UIKit

class MovieDetailView: UIViewController {
    
    var resultPopular: ResultPopular? = nil
    var resultTopRated: ResultTopRated? = nil
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieAverageRate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let moviePopular = resultPopular else {return}
        movieTitle.text = moviePopular.originalTitle
        movieReleaseDate.text = moviePopular.releaseDate
        movieAverageRate.text = "\(moviePopular.voteAverage)"
        movieOverview.numberOfLines = 0
        movieOverview.text = moviePopular.overview
    }
}
