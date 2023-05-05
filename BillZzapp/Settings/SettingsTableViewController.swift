//
//  SettingsTableViewController.swift
//  BillZzapp
//
//  Created by 7g on 5/1/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(BudgetTableViewCell.self, forCellReuseIdentifier: "BudgetCell")
        tableView.register(LinkAccountsTableViewCell.self, forCellReuseIdentifier: "LinkAccountsCell")
        tableView.register(NotificationsAndAlertsTableViewCell.self, forCellReuseIdentifier: "NotificationsAndAlertsCell")
        tableView.register(HelpAndPrivacyTableViewCell.self, forCellReuseIdentifier: "HelpAndPrivacyCell")
        tableView.register(AboutOwnersTableViewCell.self, forCellReuseIdentifier: "AboutOwnerCell")
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            // Configure the cell...
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell", for: indexPath) as! BudgetTableViewCell
            // Configure the cell...
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LinkAccountsCell", for: indexPath) as! LinkAccountsTableViewCell
            // Configure the cell...
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsAndAlertsCell", for: indexPath) as! NotificationsAndAlertsTableViewCell
            // Configure the cell...
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HelpAndPrivacyCell", for: indexPath) as! HelpAndPrivacyTableViewCell
            // Configure the cell...
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutOwnerCell", for: indexPath) as! AboutOwnersTableViewCell
            // Configure the cell...
            return cell
        default:
            fatalError("Unknown section")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            let profileDetailsVC = ProfileDetailsViewController()
            navigationController?.pushViewController(profileDetailsVC, animated: true)
        case 1:
            let budgetDetailsVC = BudgetDetailsViewController()
            navigationController?.pushViewController(budgetDetailsVC, animated: true)
        case 2:
            let linkAccountsDetailsVC = LinkAccountsDetailsViewController()
            navigationController?.pushViewController(linkAccountsDetailsVC, animated: true)
        case 3:
            let notificationsAndAlertsDetailsVC = NotificationsAndAlertsDetailsViewController()
            navigationController?.pushViewController(notificationsAndAlertsDetailsVC, animated: true)
        case 4:
            let helpAndPrivacyDetailsVC = HelpAndPrivacyDetailsViewController()
            navigationController?.pushViewController(helpAndPrivacyDetailsVC, animated: true)
        case 5:
            let aboutOwnerDetailsVC = AboutOwnerDetailsViewController()
            navigationController?.pushViewController(aboutOwnerDetailsVC, animated: true)
        default:
            fatalError("Unknown section")
        }
    }
}
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

