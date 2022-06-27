//MainCollectionViewCell.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLanel: UILabel!
    
    func configure(with character: Result?) {
        DispatchQueue.global().async {
            guard let stringUrl = character?.image else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
                self.descriptionLanel.text = character?.description
            }
        }
        
    }
}
