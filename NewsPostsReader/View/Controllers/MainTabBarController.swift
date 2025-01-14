//
//  MainTabBarViewController.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 13/01/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
        tabBar.tintColor = .gray
        tabBar.unselectedItemTintColor = .black
        
        let allPageViewController = NewsPageViewController(pageTitle: "All")
        let allPageNavController = UINavigationController(rootViewController: allPageViewController)
        allPageNavController.navigationBar.prefersLargeTitles = true
        allPageNavController.tabBarItem = UITabBarItem(title: "All",
                                                         image: UIImage(systemName: "newspaper"),
                                                         tag: 0)
        let worldPageViewController = NewsPageViewController(pageTitle: "Mundo")
        let worldPageNavController = UINavigationController(rootViewController: worldPageViewController)
        worldPageNavController.navigationBar.prefersLargeTitles = true
        worldPageNavController.tabBarItem = UITabBarItem(title: "Mundo",
                                                         image: UIImage(systemName: "globe.americas"),
                                                         tag: 1)
        let politicsPageViewController = NewsPageViewController(pageTitle: "Política")
        let politicsPageNavController = UINavigationController(rootViewController: politicsPageViewController)
        politicsPageNavController.navigationBar.prefersLargeTitles = true
        politicsPageNavController.tabBarItem = UITabBarItem(title: "Politica",
                                                         image: UIImage(systemName: "pencil"),
                                                         tag: 2)
        let techPageViewController = NewsPageViewController(pageTitle: "Tecnologia")
        let techPageNavController = UINavigationController(rootViewController: techPageViewController)
        techPageNavController.navigationBar.prefersLargeTitles = true
        techPageNavController.tabBarItem = UITabBarItem(title: "Tecnologia",
                                                         image: UIImage(systemName: "newspaper"),
                                                         tag: 3)
        let financesPageViewController = NewsPageViewController(pageTitle: "Finanças")
        let financesPageNavController = UINavigationController(rootViewController: financesPageViewController)
        financesPageNavController.navigationBar.prefersLargeTitles = true
        financesPageNavController.tabBarItem = UITabBarItem(title: "Finanças",
                                                         image: UIImage(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90"),
                                                         tag: 4)
        
        self.viewControllers = [allPageNavController,
                                worldPageNavController,
                                politicsPageNavController,
                                techPageNavController,
                                financesPageNavController]
    }
}
