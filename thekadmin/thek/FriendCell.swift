//
//  FriendCell.swift
//  thek
//
//  Created by Leble, Loic on 12/09/2017.
//  Copyright © 2017 Leble, Loic. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    var friend: Friend? {
        didSet{
            if let friend = friend  {
                title.text = friend.name
            }
        }
    }
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
