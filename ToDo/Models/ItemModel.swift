//
//  ItemModel.swift
//  ToDo
//
//  Created by Miguel Solans on 02/01/2023.
//

import Foundation

enum Priority {
    case high
    case medium
    case low
}

struct ItemModel {
    let id = UUID()
    var priority: Priority
    var done: Bool
    var title: String
}
