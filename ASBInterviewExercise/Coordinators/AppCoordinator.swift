//
//  AppCoordinator.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        // TO-DO
    }
}
