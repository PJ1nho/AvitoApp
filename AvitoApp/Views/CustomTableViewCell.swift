//
//  CustomTableViewCell.swift
//  AvitoApp
//
//  Created by Тихтей  Павел on 06.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabelView: UILabel!
    @IBOutlet weak var numberLabelView: UILabel!
    @IBOutlet weak var skillsLabelView: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
