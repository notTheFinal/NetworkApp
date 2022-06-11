//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRickAndMortiAPI(completionHandler: @escaping (RickAndMortyData) -> Void) {
        let randomPage = Int.random(in: 1...42)
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(randomPage)") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let rickAndMortyChars = self.parseJSON(withData: data) {
                    completionHandler(rickAndMortyChars)
                }
            }
        }
        task.resume()
    }

//    func parseJSON(withData data: Data) -> RickAndMorty? {
//        let decoder = JSONDecoder()
//
//        do {
//            let rickAndMortyData = try decoder.decode(RickAndMortyData.self, from: data)
//            guard let character = rickAndMortyData.results.first else { return nil }
//            guard let rickAndMorty = RickAndMorty(rickAndMortyData: character)
//            else { return nil }
//            print(rickAndMorty.description)
//            return rickAndMorty
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
    func parseJSON(withData data: Data) -> RickAndMortyData? {
        let decoder = JSONDecoder()
        
        do {
            let rickAndMortyData = try decoder.decode(RickAndMortyData.self, from: data)
            return rickAndMortyData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
