//
//  MainTableViewCell.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/21/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCellWithAnimal(animal: Animal) {
        
        typeLabel.text = animal.name
        
    }
}
