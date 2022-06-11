import Foundation

// MARK: - Welcome
struct RickAndMorty: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin, location: Location
    
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
    
    init?(rickAndMortyData: Result) {
        name = rickAndMortyData.name
        status = rickAndMortyData.status
        species = rickAndMortyData.species
        gender = rickAndMortyData.gender
        origin = rickAndMortyData.origin
        location = rickAndMortyData.location
    }
}
