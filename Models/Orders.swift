//
//  Orders.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import Foundation


struct Orders   {
    var orderDate: String
    var orderNumber: String
    var orderStatus: OrderSraus
    var orderPrice: String
}

enum OrderSraus: String {
    case pending = "Pending"
    case processing = "Processing"
    case shipped = "Shipped"
    case cancelled = "Cancelled"
}
