/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    The view controller that demonstrates how to use UIAlertController.
*/

import UIKit

class AlertControllerViewController : UITableViewController {
    
    private enum SectionsStyle: Int {
        case SectionsStyleAlert = 0
        case SectionsStyleActionSheet
    }
    
    private enum AlertStyle: Int {
        case AlertStyleSimple = 0
        case AlertStyleOkayCancel
        case AlertStyleOther
        case AlertStyleTextEntry
        case AlertStyleSecureTextEntry
    }
    
    private enum ActionSheetStyle: Int {
        case ActionSheetStyleOkCancel = 0
        case ActionSheetStyleOther
    }
    
    func showSimpleAlert() {
        let alertController = UIAlertController(title: "Simple Title", message: "Simple message to display", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showOkayCancelAlert() {
        let alertController = UIAlertController(title: "Simple Title", message: "Simple message to display", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel action chosed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showOtherStyleAlert() {
        let title = NSLocalizedString("A Short Title is Best", comment: "")
        let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let otherButtonTitleOne = NSLocalizedString("Choice One", comment: "")
        let otherButtonTitleTwo = NSLocalizedString("Choice Two", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            print("The \"Other\" alert's cancel action occurred.")
        }
        
        let otherButtonOneAction = UIAlertAction(title: otherButtonTitleOne, style: .default) { _ in
            print("The \"Other\" alert's other button one action occurred.")
        }
        
        let otherButtonTwoAction = UIAlertAction(title: otherButtonTitleTwo, style: .default) { _ in
            print("The \"Other\" alert's other button two action occurred.")
        }
        
        // Add the actions.
        alertController.addAction(cancelAction)
        alertController.addAction(otherButtonOneAction)
        alertController.addAction(otherButtonTwoAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showTextEntryAlert() {
        let title = NSLocalizedString("A Short Title is Best", comment: "")
        let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let otherButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            
        }
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            print("The \"Text Entry\" alert's cancel action occurred.")
        }
        
        let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { _ in
            print("The \"Text Entry\" alert's other action occurred.")
        }
        
        // Add the actions.
        alertController.addAction(cancelAction)
        alertController.addAction(otherAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showSecureTextEntryAlert() {
        let title = NSLocalizedString("A Short Title is Best", comment: "")
        let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let otherButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            print("The \"Text Entry\" alert's cancel action occurred.")
        }
        
        let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { _ in
            print("The \"Text Entry\" alert's other action occurred.")
        }
        
        // Add the actions.
        alertController.addAction(cancelAction)
        alertController.addAction(otherAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showOkayCancelActionSheet() {
        let alertController = UIAlertController(title: "Simple title", message: "Simple message", preferredStyle: .actionSheet)
        let alertActionOK = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertActionOK)
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func showOtherStyleActionSheet() {
        
    }
    
}

extension AlertControllerViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            case SectionsStyle.SectionsStyleAlert.rawValue:
                switch indexPath.row {
                    case AlertStyle.AlertStyleSimple.rawValue:
                        showSimpleAlert()
                        
                    case AlertStyle.AlertStyleOkayCancel.rawValue:
                        showOkayCancelAlert()
                        
                    case AlertStyle.AlertStyleOther.rawValue:
                        showOtherStyleAlert()
                        
                    case AlertStyle.AlertStyleTextEntry.rawValue:
                        showTextEntryAlert()
                        
                    case AlertStyle.AlertStyleSecureTextEntry.rawValue:
                        showSecureTextEntryAlert()
                    
                    default: break
                }
                
            case SectionsStyle.SectionsStyleActionSheet.rawValue:
                switch indexPath.row {
                    case ActionSheetStyle.ActionSheetStyleOkCancel.rawValue:
                        showOkayCancelActionSheet()
                        
                    case ActionSheetStyle.ActionSheetStyleOther.rawValue:
                        showOtherStyleActionSheet()
                        
                    default: break
                }
                
            default: break
        }
    }
}
