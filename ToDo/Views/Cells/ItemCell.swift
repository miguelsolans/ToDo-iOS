//
//  ItemCell.swift
//  ToDo
//
//  Created by Miguel Solans on 02/01/2023.
//

import Foundation
import UIKit


class ItemCell : UITableViewCell {
    
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskStatusButton: CheckButton!
    
    override class func awakeFromNib() {
        super.awakeFromNib();
    }
    
    func setTaskItem(_ item: ItemModel) {
        self.taskStatusButton.isChecked = item.done;
        self.taskDescriptionLabel.text = item.title;
        
        self.taskStatusButton.setColorForPriority(item.priority)
        
        self.taskStatusButton.addTarget(self, action: #selector(changeStatusButtonTapped), for: .touchDown);
    }
    
    
    @objc func changeStatusButtonTapped() {
        print("Tapped in ViewCell")
    }
    
}
