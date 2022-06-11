import Foundation

// MARK: - Welcome
struct RickAndMortyData: Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    
    var description: String {
        """
        Name: \(name)
        Status: \(status)
        Species: \(species)
        Gender: \(gender)
        Origin: \(origin.name)
        Location: \(location.name)
        """
    }
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
