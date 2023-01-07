//
//  CheckButton.swift
//  ToDo
//
//  Created by Miguel Solans on 02/01/2023.
//

import Foundation
import UIKit

class CheckButton : UIButton {
    
    fileprivate let checkedImage = UIImage(systemName: "checkmark.circle.fill")!;
    fileprivate let uncheckedImage = UIImage(systemName: "circle")!;
    
    // Option is unchcked by default
    var isChecked : Bool = false {
        didSet {
            
            if(isChecked) {
                self.setImage(self.checkedImage, for: .normal);
            } else {
                self.setImage(self.uncheckedImage, for: .normal)
            }
            
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    func setColorForPriority(_ priority: Priority) {
        switch priority {
        case .high:
            self.tintColor = .systemRed
        case .medium:
            self.tintColor = .systemYellow
        case .low:
            self.tintColor = .systemGreen
        }
    }
    
    @objc func buttonClicked(sender: UIButton) {
        print("Tapped in UI Element")
        if(sender == self) {
            isChecked = !self.isChecked
        }
    }
    
}

