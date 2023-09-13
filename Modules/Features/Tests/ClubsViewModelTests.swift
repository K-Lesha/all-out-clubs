@testable import YourModuleName
import XCTest
import Combine

class MockAPI {
    static let shared = MockAPI()
    
    func mockClubsList() -> AnyPublisher<[Club], Error> {
        let mockClub1 = Club(id: "1", name: "Club1", country: "Country1", value: 100, image: URL(string: "https://example.com/club1.png")!, european_titles: 1, stadium: Stadium(size: 50000, name: "Stadium1"), location: Location(lat: 50.0, lng: 10.0))
        let mockClub2 = Club(id: "2", name: "Club2", country: "Country2", value: 200, image: URL(string: "https://example.com/club2.png")!, european_titles: 2, stadium: Stadium(size: 60000, name: "Stadium2"), location: Location(lat: 51.0, lng: 11.0))
        
        return Just([mockClub1, mockClub2])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class ClubsViewModelTests: XCTestCase {
    var viewModel: ClubsViewModel!
    var api: MockAPI = MockAPI.shared
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = ClubsViewModel()
        cancellables = []
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.viewState, .idle)
    }

    func testFetchClubs() {
        let expectation = XCTestExpectation(description: "Fetching clubs")

        viewModel.$viewState
            .sink { state in
                switch state {
                case .loading:
                    break
                case .content(let clubs, _):
                    XCTAssertEqual(clubs.count, 2)
                    expectation.fulfill()
                default:
                    XCTFail("Unexpected state: \(state)")
                }
            }
            .store(in: &cancellables)

        viewModel.fetch()
        wait(for: [expectation], timeout: 5.0)
    }

}
