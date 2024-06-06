//
//  CodableInfosOptionalParse.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/4.
//

import Foundation

/** Codable 陣列 解析器（可選） */
@propertyWrapper
class CodableInfosOptionalParse<T: Codable>: ParseProtocol {
    
    private var key: String // json key
    private var defaultValue: [T]? // 預設值
    private var actualValue: [T]? // 實際值
    
    var wrappedValue: [T]? { // 包裝值
        
        get {
            
            return actualValue ?? defaultValue
        }
        
        set(value) {
            
            actualValue = value
        }
    }
        
    init(key: String, defaultValue: [T]? = nil) {
        
        self.key = key
        self.defaultValue = defaultValue
    }
    
    /** 解析/編碼  */
    func onParse(parse: JSONCodable.Parse) {
        
        switch parse {
            
        case .from(let decoder): // 解析
            
            let container = try? decoder.container(keyedBy: CodingKeyInfo.self)
            
            actualValue = container?.parse(key: .init(stringValue: key))
            
        case .to(let encoder): // 編碼
            
            var container = encoder.container(keyedBy: CodingKeyInfo.self)
            
            container.parse(value: wrappedValue, key: .init(stringValue: key))
        }
    }
}
