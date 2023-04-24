//
//  Utilities.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/24/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static var mercariPurple: Color {
        return Color(red: 0.326, green: 0.337, blue: 0.932)
    }
    
    static var mercariGray: Color {
        return Color(red: 0.925, green: 0.929, blue: 0.947)
        
    }
    
    static var goodBlack: Color {
        return Color(red: 0.15, green: 0.15, blue: 0.15)
    }
    
    
}

final class Utilities {
    
    static let shared = Utilities()
    
    private init() { }
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
}



//MARK: - Extension to enable swipe back even with custom navigation back button
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
