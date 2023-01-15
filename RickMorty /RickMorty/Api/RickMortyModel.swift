
import SwiftUI

struct Response: Codable {
    let results: [Character]
}


// MARK: - Result
struct Character: Codable,Identifiable {
    let id: Int
    let name: String
    let type: String
    let gender: String
    let image: String
    let species:String
    let episode: [String]
    let url: String
    let created: String
}



class RickMortyApi: ObservableObject{
    @Published var character = [Character]()
    
    func getData(completion: @escaping ([Character])->()){
        guard let url = URL(string: "https://raw.githubusercontent.com/Laboratoria/BOG001-data-lovers/master/src/data/rickandmorty/rickandmorty.json") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            let charactersList = try! JSONDecoder().decode(Response.self, from: data)
            DispatchQueue.main.async {
                completion(charactersList.results)
            }
        }.resume()
    }
    
    let MOCK_CHARACTER = Character(id: 0, name: "Mario", type: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human", episode: ["https://rickandmortyapi.com/api/episode/1",
                                                                                                                                                                                      "https://rickandmortyapi.com/api/episode/2"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
}
