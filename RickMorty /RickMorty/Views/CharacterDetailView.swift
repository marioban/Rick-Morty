
import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    var character: Character
    @State private var scale: CGFloat = 0
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack{
                    
                    CharacterImage(image: KFImage(URL(string: character.image)))
                        .padding()
                        .zIndex(1)
                    
                    ZStack{
                        VStack{
                            Text(character.name.capitalized)
                                .font(.largeTitle)
                            Text(character.gender.replacingOccurrences(of:"\n", with: ""))
                                .foregroundColor(.white)
                                .padding()
                            
                            Text(character.species.capitalized)
                                .italic()
                                .foregroundColor(.white)
                                .padding()
                            
                            Text(character.url.capitalized)
                                .italic()
                                .foregroundColor(.white)
                                .padding()
                            
                            Text(character.created.capitalized)
                                .italic()
                                .foregroundColor(.white)
                                .padding()
                            
                            Text(character.episode.description)
                                .italic()
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: RickMortyApi().MOCK_CHARACTER)
    }
}
