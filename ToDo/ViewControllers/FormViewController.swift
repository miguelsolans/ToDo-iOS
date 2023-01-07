//
//  FormViewController.swift
//  ToDo
//
//  Created by Miguel Solans on 07/01/2023.
//

import UIKit

protocol FormViewControllerDelegate {
    
    func didClickSave(viewController : FormViewController);
    
}


class FormViewController : UIViewController {
    
    // MARK: Data
    var delegate : FormViewControllerDelegate?;
    var task = ItemModel(priority: .low, done: false, title: "");
    
    fileprivate let priorities: [ (priority: Priority, label: String) ] = [
        (Priority.high, "High"),
        (Priority.medium, "Medium"),
        (Priority.low, "Low")
    ]
    
    // MARK: Storyboard Outlets
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        self.taskTitleTextField.placeholder = "Task Title";
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = self.taskTitleTextField.text else { return }
        self.task.title = title;
        
        
        let priorityIndex = self.pickerView.selectedRow(inComponent: 0);
        self.task.priority = self.priorities[ priorityIndex ].priority
        
        
        self.delegate?.didClickSave(viewController: self);
        self.dismiss(animated: true);
        
    }
    
}


// MARK: - Delegate Methods
// MARK: Picker View Data Source
extension FormViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.priorities.count;
    }
}

// MARK: - Picker View Delegate
extension FormViewController : UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.priorities[ row ].label;
    }
    
}

