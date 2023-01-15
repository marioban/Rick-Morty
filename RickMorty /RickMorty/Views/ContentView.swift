
import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showStarButton = false
    @ObservedObject var rickMortyApi = RickMortyApi()
    @State private var searchText = ""
    
    var filterCharacters: [Character]{
        if searchText == "" {return rickMortyApi.character}
        return rickMortyApi.character.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filterCharacters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)){
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text(character.name.capitalized)
                                        .font(.title)
                                    
                                }
                                Spacer()
                                KFImage(URL(string: character.image))
                                    .interpolation(.none)
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                }
                            }
                        }
                }
                .onAppear{
                RickMortyApi().getData { characters in
                    self.rickMortyApi.character = characters
                }
            }
            .navigationTitle("Characters")
            .searchable(text: $searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

