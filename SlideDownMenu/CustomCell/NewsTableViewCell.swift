//
//  NewsTableViewCell.swift
//  SlideDownMenu
//
//  Created by Adnann Muratovic on 31.08.21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImageVIew: UIImageView! {
        didSet {
            postImageVIew.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
