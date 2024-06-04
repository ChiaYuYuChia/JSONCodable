//
//  CodingKeyInfo.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/4.
//

import Foundation

// MARK: -

/** CodingKey 物件封裝 */
struct CodingKeyInfo: CodingKey {
    
    var stringValue: String
    
    init?(stringValue: String) {
        
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        
        self.init(stringValue: "\(intValue)")
        
        self.intValue = intValue
    }
}

// MARK: -
