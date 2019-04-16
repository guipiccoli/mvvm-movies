//
//  MovieDetailView.swift
//  
//
//  Created by Fernando Locatelli Maioli on 16/04/19.
//

import UIKit

class MovieDetailView: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieAverageRate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var movie: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = self.movie?.getMovieTitle()
        movieReleaseDate.text = self.movie?.getMovieReleaseDate()
        movieAverageRate.text = self.movie?.getMovieRate()
        movieOverview.numberOfLines = 0
        movieOverview.text = self.movie?.getMovieOverview()
        
        
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + (movie?.getMovieBackdrop())!)!
        
        
        DispatchQueue.global(qos: .background).async {
            let data = try! Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
                
                let image = UIImage(data: data)
                self.movieImage.image = image
            }
        }
    }
}
