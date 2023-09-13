import Assets
import ClubsFeature
import Toolbox
import UIKit

public class MainCoordinator: TabBarCoordinator {

    // MARK: - Properties

    private lazy var clubsCoordinator = ClubsCoordinator(title: Strings.mainTabSecond)

    // MARK: - Coordinator Start

    override public func start() {
        addChild(clubsCoordinator)

        clubsCoordinator.start()

        tabBarController.viewControllers = [ clubsCoordinator.rootViewController ]
        
        tabBarController.tabBar.isHidden = true
    }

    public func reset(animated: Bool) {
        childCoordinators.forEach { 
            ($0 as? NavigationCoordinator)?.popToRoot(animated: animated)
        }
     }
    
}
