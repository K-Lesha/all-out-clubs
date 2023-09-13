import Combine
import CommonUI
import Foundation
import Models
import Networking
import Utilities

@MainActor
class ClubsViewModel: ObservableObject {

    @Published var viewState: ViewState<[Club]> = .idle

    var cancellable: AnyCancellable?

    func fetch() async {
        viewState.startLoading()

        do {
            let clubs = try await API.Clubs.list().requestAsync().model
            viewState.endLoading(clubs)
        } catch {
            viewState.endLoadingWithError(error)
        }
    }
}
