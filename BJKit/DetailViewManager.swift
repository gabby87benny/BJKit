//
//  DetailViewManager.swift
//  BJKit
//
//  Created by Joseph Peter, Gabriel Benny Francis on 3/30/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class DetailViewManager: NSObject, UISplitViewControllerDelegate {

    var splitVC: UISplitViewController? = nil {
        didSet {
            splitVC?.delegate = self
            splitVC?.preferredDisplayMode = .allVisible
        }
    }
    
    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewController.DisplayMode {
        .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}
