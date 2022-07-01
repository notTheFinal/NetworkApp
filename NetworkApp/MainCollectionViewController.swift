//
//  MainCollectionViewController.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {
    
    private var rickAndMorty: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchRickAndMortiAPI { result in
            switch result {
            case .success(let value):
                self.rickAndMorty = value
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rickAndMorty?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell

        let character = rickAndMorty?[indexPath.row]
        cell.configure(with: character)
    
        return cell
    }

}
