import Assets
import Networking
import Models
import SwiftUI
import Toolbox
import UIKit

public class ClubsCoordinator: NavigationCoordinator {

    // MARK: Init

    public init(title: String, navigationController: UINavigationController = UINavigationController()) {
        super.init(navigationController: navigationController)

        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: "star")
        navigationController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        navigationController.navigationBar.prefersLargeTitles = true
    }

    // MARK: Start

    override public func start() {
        var clubsScreen = ClubsScreen()
        clubsScreen.clubSelected = { [weak self] club in
            self?.showClub(club)
        }
        let viewController = UIHostingController(rootView: clubsScreen)
        viewController.navigationItem.title = Strings.clubsTitle
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logout))
        viewController.navigationItem.largeTitleDisplayMode = .always

        push(viewController, animated: false)
    }
    
    // MARK: Show club screen
    
    public func showClub(_ club: Club) {
        let clubScreen = ClubScreen(club: club)
        let viewController = UIHostingController(rootView: clubScreen)
        
        push(viewController, animated: true)
    }

    @objc private func logout() {
        CredentialsController.shared.currentCredentials = nil
    }
}
