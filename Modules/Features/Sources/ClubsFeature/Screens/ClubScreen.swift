import Assets
import Models
import SwiftUI

struct ClubScreen: View {
    
    var club: Club
    
    private var clubImage: some View {
        ClubImage(url: club.image)
    }
    
    private var text: some View {
        Text(Strings.clubIntro)
            .font(.body)
        +
        Text(club.name)
            .font(.body)
            .bold()
        +
        Text(Strings.clubOutro + club.country + Strings.clubValue + "\(club.value)" + Strings.clubMillionEuro)
            .font(.body)
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                clubImage
                Spacer()
            }
            text
            Spacer()
        }
        .padding()
        .navigationTitle(club.name)
    }
}
