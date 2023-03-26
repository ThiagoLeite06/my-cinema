//
//  MCMovieCollectionViewCellViewModel.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import Foundation

final class MCMovieCollectionViewCellViewModel {
    
    let title: String
    let movieImage: URL?
    
    init(title: String, movieImage: URL?){
        self.movieImage = movieImage
        self.title = title
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = movieImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        
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
