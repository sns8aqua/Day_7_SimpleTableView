//
//  MyTableViewCell.swift
//  SimpleTableView
//
//  Created by Santhosh on 17/01/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var displayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: DataModel?) {
        guard let data = data else { return }
        self.displayLabel.text = data.text
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
