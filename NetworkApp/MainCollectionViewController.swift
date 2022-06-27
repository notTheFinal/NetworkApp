//
//  MainCollectionViewController.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {
    
    private var rickAndMorty: RickAndMortyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    private func fetchData() {
        NetworkManager.shared.fetchRickAndMortiAPI() { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.collectionView.reloadData()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rickAndMorty?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell

        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
    
        return cell
    }

}
