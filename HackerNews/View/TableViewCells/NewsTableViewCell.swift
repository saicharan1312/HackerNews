//
//  NewsTableViewCell.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(data: Hit) {
        authorLabel.text = data.author
        titleLabel.text = data.title
    }
}
