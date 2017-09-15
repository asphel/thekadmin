//
//  FriendListViewController.swift
//  thek
//
//  Created by Leble, Loic on 11/09/2017.
//  Copyright © 2017 Leble, Loic. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import SwiftyJSON



class FriendListTableViewController: UITableViewController {
    
    var key : Key?
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var friendList = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters = ["fields": "email, name"]
        
        FBSDKGraphRequest(graphPath: "me/friends", parameters: parameters).start {(connection, result, error) -> Void in
            
            if error != nil {
                NSLog(error.debugDescription)
                return
            }
            
            let jsonResult = JSON(result as Any)
            let jsonFriends = jsonResult["data"]
            
            for item in jsonFriends {
                
                let friend = Friend(facebookId: item.1["id"].intValue, name: item.1["name"].stringValue)
                self.friendList.append(friend)
            }
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendCell
        cell.backgroundColor = .green
        cell.friend = friendList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Exchange Key", message: "Sure to exchange with \(friendList[indexPath.row].name)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in
            User.getUserIdFromFacebookId(self.friendList[indexPath.row].facebookId) { (result) in
                if let key = self.key {
                    key.moveKeyToAnotherUser(result)
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel) {
            UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    


}
