# JSONCodable

輕量化 Json Codable 解析

前置作業：繼承 JSONCodable 後，覆寫 override func onParse(parse: OptionInfo.Parse) 解析與編碼 方法

ex. 

case .from(let decoder): // 解析
            
let container = container(coder: decoder, type: CodingKeys.self)
            
title = container?.parse(key: .title)


case .to(let encoder): // 編碼
            
var container = container(coder: encoder, type: CodingKeys.self)
            
container.parse(value: title, key: .title)



使用：

ex.

let optionInfo: OptionInfo? = .toJsonInfo(jsonString: "json value ... ") // 單一物件解析

let optionInfos: [OptionInfo]? = .toJsonInfos(jsonString: "json value ... ") // 陣列物件解析
