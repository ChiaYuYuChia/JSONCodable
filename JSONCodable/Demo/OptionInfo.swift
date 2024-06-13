//
//  OptionInfo.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

import Foundation

/** 選項資訊 */
class OptionInfo: JSONCodable {
    
    @CodableInfoOptionalParse(key: "ID")
    var onlyIdentify: String? // 唯一識別
    
    @CodableInfoOptionalParse(key: "OptionType", defaultValue: .unknown)
    var optionType: OptionInfo.OptionType? // 選項類型, enum
    
    @CodableInfoOptionalParse(key: "Title")
    var title: String? // 選項名稱
    
    @CodableInfoOptionalParse(key: "Description")
    var description: String? // 描述
    
    @CodableInfoParse(key: "Sort", defaultValue: 0)
    var sortIndex: Int // 排序, not Optional
    
    @CodableInfosOptionalParse(key: "Subs")
    var subs: [OptionInfo]? // 子選項, array
}

// MARK: -

extension OptionInfo {
    
    /** 選項類型 */
    enum OptionType: String, Codable {
        
    case unknown = "Unknown" // 未知
    case option = "Option" // 選項
    case subOption = "SubOption" // 子選項
    }
}

// MARK: -
