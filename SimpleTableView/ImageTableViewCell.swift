//
//  ImageTableViewCell.swift
//  SimpleTableView
//
//  Created by Santhosh on 17/01/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet private weak var displayLabel: UILabel!
    @IBOutlet private weak var displayImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: DataModel?) {
        guard let data = data else { return }
        self.displayLabel.text = data.text
        self.displayImage.image = UIImage(named: data.image ?? "")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
