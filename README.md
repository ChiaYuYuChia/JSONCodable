# JSONCodable

Swift Json Codable Parse

JsonInfo inheritance JSONCodable class

String Parse ex. 

            @CodableInfoOptionalParse(key: "JsonKey", defaultValue: "Default Value")
            var onlyIdentify: String? 

Enum Parse ex. 

            @CodableInfoOptionalParse(key: "JsonKey", defaultValue: .defaultType)
            var optionType: OptionInfo.OptionType? 

Not Optional Parse ex.

            @CodableInfoParse(key: "JsonKey", defaultValue: 0)
            var sortIndex: Int 

Array Optional Parse ex.

            @CodableInfosOptionalParse(key: "Subs")
            var subs: [JsonInfo]? 

String To Json Info ex. 

            let info: JsonInfo? = .toJsonInfo(jsonString: "Json Value")

String To Json Array ex. 

            let infos: [JsonInfo]? = .toJsonInfos(jsonString: "Json Value")

Json Info To String ex. 

            info.toJSONString(outputFormatting: .prettyPrinted)

Json Info To Dictionary ex. 

            info.toJSON()
