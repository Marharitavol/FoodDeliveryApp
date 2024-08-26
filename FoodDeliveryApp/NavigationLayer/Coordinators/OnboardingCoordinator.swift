//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Rita on 26.08.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

