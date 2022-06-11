//
//  MainCollectionViewCell.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with character: Result?) {
        guard let stringUrl = character?.image else { return }
        guard let imageUrl = URL(string: stringUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
        imageView.image = UIImage(data: imageData)
            
        
    }
}
