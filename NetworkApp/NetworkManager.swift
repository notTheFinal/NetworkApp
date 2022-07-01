//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Александр on 09.06.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
    private init() {}
    
    func fetchRickAndMortiAPI(completion: @escaping(Swift.Result<[Result], NetworkError>) -> Void) {
        var rAndM: [Result] = []
        AF.request("https://rickandmortyapi.com/api/character/?page=\(Int.random(in: 1...42))")
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let result):
                    rAndM = Result.getResults(from: result)
                    DispatchQueue.main.async {
                        completion(.success(rAndM))
                    }
                case .failure(_):
                    completion(.failure(.decodingError))
                }
            }
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
