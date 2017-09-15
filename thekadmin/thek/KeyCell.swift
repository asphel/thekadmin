//
//  KeyCell.swift
//  thek
//
//  Created by Leble, Loic on 11/09/2017.
//  Copyright © 2017 Leble, Loic. All rights reserved.
//

import UIKit

class KeyCell: UITableViewCell {

    var key: Key? {
        didSet{
            if let key = key  {
                title.text = key.keyId
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
