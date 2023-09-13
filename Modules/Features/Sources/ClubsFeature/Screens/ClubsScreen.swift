import Assets
import Models
import SwiftUI

struct ClubsScreen: View {
    @StateObject private var viewModel = ClubsViewModel()
    var clubSelected: ((Club) -> Void)?
    
    @State var isSortingByName: Bool = true
    
    private var sortingButton: some View {
        Button(action: toggleSortOrder) {
            Text(Strings.sortierenButton)
                .foregroundColor(.brandPrimary)
        }
    }

    init() {
        _viewModel = StateObject(wrappedValue: ClubsViewModel())
    }

    public var body: some View {
        Group {
            switch viewModel.viewState {
            case let .content(clubs, _):
                clubList(for: clubs)
            case .empty:
                Text("No data")
            case .failed:
                Text("Error")
            case .loading:
                ProgressView()
            case .idle:
                EmptyView()
            }
        }
        .onAppear(perform: fetchClubs)
        .navigationBarItems(trailing: sortingButton)
    }
    
    func fetchClubs() {
        guard viewModel.viewState.isIdle else { return }

        Task {
            await viewModel.fetch()
        }
    }
    
    func clubList(for clubs: [Club]) -> some View {
        let sortedClubs = isSortingByName ? clubs.sorted(by: { $0.name < $1.name }) : clubs.sorted(by: {$0.value < $1.value})
        
        return List {
            ForEach(sortedClubs, id: \.self) { club in
                Button(action: {
                    clubSelected?(club)
                }) {
                    ClubCell(club: club)
                }
            }
        }
        .foregroundColor(.brandPrimary)
    }
    
    func toggleSortOrder() {
        isSortingByName.toggle()
    }
}
