//
//  DecimalUtils.swift
//  Bankey
//
//  Created by User 2 on 10/11/22.
//

import UIKit

extension Decimal{
    var doubleValue: Double{
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
