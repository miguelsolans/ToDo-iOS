//
//  ViewController.swift
//  ToDo
//
//  Created by Miguel Solans on 02/01/2023.
//

import UIKit

class ViewController: UIViewController {
    // Data
    var items: [ItemModel] = [
        ItemModel(priority: .high, done: true, title: "Feed the pets"),
        ItemModel(priority: .medium, done: false, title: "Have lunch"),
        ItemModel(priority: .low, done: false, title: "Take a nap")
    ];

    // Storyboard Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // ViewController Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ToDo";
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        
        self.tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        self.tableView.rowHeight = 50;
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTask))
        self.navigationItem.rightBarButtonItem = addButton;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }
    
    
}

// MARK: Actions
extension ViewController {
    @objc func addTask() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let formViewController = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController;
        
        formViewController.delegate = self;
        
        self.present(formViewController, animated: true);
    }
}


// MARK: - Delegate Extensions

// MARK: - TableView DataSource
extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count;
    }
}

// MARK: TableView Delegate and DataSource Methods
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell {
            
            cell.setTaskItem(self.items[ indexPath.row ]);
            
            return cell;
        }
        
        return UITableViewCell();
    }
}

// MARK: - FormViewController Delegate
extension ViewController : FormViewControllerDelegate {
    func didClickSave(viewController: FormViewController) {
        self.items.append(viewController.task);
        self.tableView.reloadData();
    }
}
