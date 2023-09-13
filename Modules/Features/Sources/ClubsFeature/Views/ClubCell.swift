import Assets
import SwiftUI
import Models

struct ClubCell: View {

    var club: Club
    
    private var clubLogo: some View {
        ClubImage(url: club.image)
    }
    
    private var clubName: some View {
        Text(club.name)
            .font(.headline)
    }
    
    private var clubCountry: some View {
        Text(club.country)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    private var value: some View {
        Text(club.value.description)
            .font(.caption)
            .foregroundColor(.secondary)
        +
        Text(Strings.clubMillionEuro)
            .font(.caption)
            .foregroundColor(.secondary)
    }
    
    var body: some View {
        HStack {
            clubLogo
            VStack(alignment: .leading) {
                clubName
                clubCountry
                value
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
    
}
