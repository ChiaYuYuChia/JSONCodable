//
//  CodableInfosParse.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/4.
//

import Foundation

/** Codable 陣列 解析器 */
@propertyWrapper
class CodableInfosParse<T: Codable>: ParseProtocol {
    
    private var key: String // json key
    
    var wrappedValue: [T] // 包裝值
        
    init(key: String, defaultValue: [T] = []) {
        
        self.key = key
        self.wrappedValue = defaultValue
    }
    
    /** 解析/編碼  */
    func onParse(parse: JSONCodable.Parse) {
        
        switch parse {
            
        case .from(let decoder): // 解析
            
            let container = try? decoder.container(keyedBy: CodingKeyInfo.self)
            
            wrappedValue = container?.parse(key: .init(stringValue: key)) ?? wrappedValue
            
        case .to(let encoder): // 編碼
            
            var container = encoder.container(keyedBy: CodingKeyInfo.self)
            
            container.parse(value: wrappedValue, key: .init(stringValue: key))
        }
    }
}
