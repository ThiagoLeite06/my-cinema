//
//  MCMovieCollectionViewCell.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

class MCMovieCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "MCMovieCollectionViewCell"
       
       let imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
       
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.backgroundColor = .secondarySystemBackground
           contentView.addSubviews(imageView)
           addConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func addConstraints() {
           NSLayoutConstraint.activate([
               
           ])
       }
       
       override func prepareForReuse() {
           super.prepareForReuse()
           imageView.image = nil
       }
       
       public func configure(with viewModel: MCMovieCollectionViewCellViewModel) {
           viewModel.fetchImage(completion: { [weak self] result in
               switch result {
               case .success(let data):
                   DispatchQueue.main.async {
                       let image = UIImage(data: data)
                       self?.imageView.image = image
                   }
               case .failure(let error):
                   print(String(describing: error))
                   break
               }
           })
       }

}
