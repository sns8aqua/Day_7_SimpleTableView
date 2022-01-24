//
//  DataModel.swift
//  SimpleTableView
//
//  Created by Santhosh on 17/01/22.
//

import Foundation

class DataModel {
    var text: String?
    var image: String?
    var type: DataModelType?
}

enum DataModelType {
   case plainText
   case image
}
