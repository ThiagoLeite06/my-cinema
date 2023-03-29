//
//  MCMovieCollectionViewCellViewModel.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import Foundation

final class MCMovieCollectionViewCellViewModel {
    
    let title: String
    let movieImageUrl: String?
    
    init(title: String, movieImageUrl: String?){
        self.title = title
        self.movieImageUrl = movieImageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
      
        guard let url = movieImageUrl else {
           completion(.failure(URLError(.badURL)))
           return
        }
        
        var preparedUrl: String {
            return "https://www.themoviedb.org/t/p/w440_and_h660_face\(url)"
        }
        
        guard let request = URL(string: preparedUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()

        
    }
}
