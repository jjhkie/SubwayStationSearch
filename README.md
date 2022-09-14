# SubwaySearch

## [ Skill ] 

  - [SnapKit](https://github.com/SnapKit/SnapKit)
  
  - [Alamofire](https://github.com/Alamofire/Alamofire)
  
  - [UISearchController](https://developer.apple.com/documentation/uikit/uisearchcontroller)
  
  - [UICollectionView](https://developer.apple.com/documentation/uikit/uicollectionview) + CustomCell
  
  - [UIRefreshControl](https://developer.apple.com/documentation/uikit/uirefreshcontrol)

## [ API ]
  
  - [서울시 지하처 정보 검색(역명)](https://data.seoul.go.kr/dataList/OA-121/S/1/datasetView.do)
  
  - [서울시 지하철 실시간 도착정보](https://data.seoul.go.kr/dataList/OA-12764/F/1/datasetView.do)
  
## [ Point ] 

  - ERROR
  
    - swift:1145: warning run: app transport security has blocked a cleartext http connection toopenapi.seoul.go.krsince it is insecure. use https instead or add this domain to exception domains in your info.plist.
    [( 해결 )](https://jjhkie.tistory.com/entry/HTTPERROR-Nabee) 
  
  - 자동완성 기능 구현 

        - Request Method 를 호출하는 적절한 타이밍 구현
      	- 가져온 데이터가 UITableView에 표시되도록 구현 

  
  - 글자 입력 시 자동 검색 결과 TableView를 사용하여 구현 
  
  - Refresh 기능 구현 
