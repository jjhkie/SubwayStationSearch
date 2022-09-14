

import Foundation

struct StationArriveDataResponseModel: Decodable{
    var realtimeArrivalList: [RealTimeArrival] = []
    
    struct RealTimeArrival: Decodable{
        let line: String // 무슨행인가
        let remainTime: String // 도착까지 남은 시간
        let currentStation: String // 현재위치
        
        enum CodingKeys: String, CodingKey {
            case line = "trainLineNm"
            case remainTime = "arvlMsg2"
            case currentStation = "arvlMsg3"
        }
    }
}

