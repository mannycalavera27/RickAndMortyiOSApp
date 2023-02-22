//
//  RMTabBarController.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 22/02/23.
//

import UIKit

/// Controller to house tabs and root tab controllers
final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setUpTabs()
    }

    private func setUpTabs() {
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
            
        let charactersNC = UINavigationController(rootViewController: charactersVC)
        let locationsNC = UINavigationController(rootViewController: locationsVC)
        let episodesNC = UINavigationController(rootViewController: episodesVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        charactersNC.tabBarItem = UITabBarItem(
            title: "Characters",
            image: UIImage(systemName: "person"),
            tag: 1
        )
        locationsNC.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "globe"),
            tag: 2
        )
        episodesNC.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "tv"),
            tag: 3
        )
        settingsNC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 4
        )
        
        
        for nav in [charactersNC, locationsNC, episodesNC, settingsNC] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [charactersNC, locationsNC, episodesNC, settingsNC],
            animated: true
        )
    }
}
