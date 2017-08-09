//
//  TeamCell.swift
//  FetchController
//
//  Created by Fomin Mykola on 8/9/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!

    //MARK: - View Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        teamLabel.text = nil
        scoreLabel.text = nil
        flagImageView.image = nil
    }

}
