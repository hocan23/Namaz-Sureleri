//
//  SureTableViewCell.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 23.08.2022.
//

import UIKit

class SureTableViewCell: UITableViewCell {

    @IBOutlet weak var sureNameLbl: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
