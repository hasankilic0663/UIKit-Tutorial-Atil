//
//  NewsCell.swift
//  HaberProjesi
//
//  Created by Hasan Hüseyin Kılıç on 28.10.2024.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
