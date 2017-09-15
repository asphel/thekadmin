//
//  DetailsKeyViewController.swift
//  thek
//
//  Created by Leble, Loic on 11/09/2017.
//  Copyright © 2017 Leble, Loic. All rights reserved.
//

import UIKit
import Firebase

class DetailsKeyViewController: UIViewController {
    
    @IBAction func sendKey(_ sender: UIButton) {
        User.getUserIdFromFacebookId(1424531927622952) { (result) in
            if let key = self.key {
                key.moveKeyToAnotherUser(result)
            }
            
        }
    }
    
    @IBOutlet weak var qrCode: UIImageView!
    
    
    var key: Key? {
        didSet{
            if let key = key  {
                print(key)
            }
        }
    }
    
    var event: Event? {
        didSet{
            if let event = event  {
                print(event)
            }
        }
    }

    func generateQRCode(from string:String) -> UIImage? {
        let data = string.data(using: .isoLatin1)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 100, y: 100)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
            
        }
        
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let keyId = key?.keyId {
            let image = generateQRCode(from: keyId)
            qrCode.image = image
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "friendList") {
            let nc = segue.destination as! UINavigationController
            let vc = nc.viewControllers[0] as! FriendListTableViewController
            
            vc.key = self.key
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
