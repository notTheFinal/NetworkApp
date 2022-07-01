import Foundation

// MARK: - Welcome
struct RickAndMortyData: Decodable {
    let results: [Result]
    let info: Info
}

struct Info: Decodable {
    let prev: String?
    let pages: Int?
    let count: Int?
    let next: String?
}

// MARK: - Result
struct Result: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    
    var description: String {
        """
        Name: \(name ?? "No name")
        Status: \(status ?? "No status")
        Species: \(species ?? "No species")
        Gender: \(gender ?? "No gender")
        Origin: \(origin?.name ?? "No origin")
        Location: \(location?.name ?? "No location")
        """
    }
    
    init(resultData: [String: Any]) {
        id = resultData["id"] as? Int
        name = resultData["name"] as? String
        status = resultData["status"] as? String
        species = resultData["species"] as? String
        gender = resultData["gender"] as? String
        origin = resultData["origin"] as? Location
        location = resultData["location"] as? Location
        image = resultData["image"] as? String
        episode = resultData["episode"] as? [String]
        url = resultData["url"] as? String
    }
    
    static func getResults(from value: Any) -> [Result] {
        guard let jsonResult = value as? [String: Any] else { return [] }
        guard let results = jsonResult["results"] as? Array<[String: Any]> else { return [] }
        return results.compactMap { Result(resultData: $0) }
    }
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
