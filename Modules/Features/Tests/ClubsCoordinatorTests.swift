@testable import YourModuleName
import XCTest

class ClubsCoordinatorTests: XCTestCase {
    var coordinator: ClubsCoordinator!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = ClubsCoordinator(title: "Test", navigationController: navigationController)
    }

    func testStart() {
        coordinator.start()
        XCTAssertNotNil(navigationController.viewControllers.first as? UIHostingController<ClubsScreen>)
    }

    func testShowClub() {
        let club = Club(id: "test", name: "Test Club", country: "Test Country", value: 100, image: "https://test.url")
        coordinator.showClub(club)
        XCTAssertNotNil(navigationController.viewControllers.last as? UIHostingController<ClubScreen>)
    }
}
