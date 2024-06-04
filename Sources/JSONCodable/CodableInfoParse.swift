//
//  CodableInfoParse.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/4.
//

import Foundation

/** Codable 物件 解析器 */
@propertyWrapper
class CodableInfoParse<T>: ParseProtocol {
    
    private var key: String // json key
    
    var wrappedValue: T // 包裝值
        
    init(key: String, defaultValue: T) {
        
        self.key = key
        self.wrappedValue = defaultValue
    }
    
    /** 解析/編碼  */
    func onParse(parse: JSONCodable.Parse) {
        
    }
}
