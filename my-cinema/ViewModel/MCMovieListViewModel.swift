//
//  MCMovieListViewModel.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

final class MCMovieListViewModel: NSObject {
    
    func fetchMovies() {
        MCService.shared.execute(.listMoviesRequests, expecting: MCMovieResponse.self) { result in
            switch result {
            case .success(let model):
                print(model.results.count)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension MCMovieListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MCMovieCollectionViewCell.cellIdentifier,
            for: indexPath) as? MCMovieCollectionViewCell else {
                fatalError("unsupported cell")
        }
        
        let viewModel = MCMovieCollectionViewCellViewModel(title: "Teste", movieImage: URL(string: "https://image.tmdb.org/t/p/w500/2Eewgp7o5AU1xCataDmiIL2nYxd.jpg"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
}
