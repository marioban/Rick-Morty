
import SwiftUI
import Kingfisher

struct CharacterImage : View {
    var image: KFImage
    
    var body: some View{
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
    }
}

struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View{
        CharacterImage(image: KFImage(URL(string: RickMortyApi().MOCK_CHARACTER.image)))
    }
}
