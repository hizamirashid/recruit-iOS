//
//  Coordinator.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
