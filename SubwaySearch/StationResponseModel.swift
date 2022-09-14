
import Foundation


struct StationResponseModel: Decodable {
    ///호출할 때 StationResponseModel().searchInfo.row를 입력하여 호출하는데
    ///해당 문구를 호출하는 함수를 생성해준다.
    var stations: [Station] { searchInfo.row }
    
    private let searchInfo: SearchInfoBySubwayNameServiceModel
    
    enum CodingKeys: String, CodingKey{
        case searchInfo = "SearchInfoBySubwayNameService"
    }
    
    struct SearchInfoBySubwayNameServiceModel: Decodable {
        var row: [Station] = []
    }
}

struct Station: Decodable{
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey{
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
