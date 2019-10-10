//
//  PostCell.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Norsemen Solutions. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class PostCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
