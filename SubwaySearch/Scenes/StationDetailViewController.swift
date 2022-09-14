

import SnapKit
import UIKit
import Alamofire

class StationDetailViewController: UIViewController{
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let inset = 16.0
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32.0, height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectionViewCell")
        
        collectionView.dataSource = self
        
        collectionView.refreshControl = refreshControl
        
        return collectionView
    }()
    
    ///Refresh Control
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        return refreshControl
    }()
    
    /// Refresh Control이 실행되었을 때
    @objc private func fetchData(){
        
        print("실행할 기능")
        //endRefreshing() 결국 서버에서 정보호추링 끝났을 때 실행되야 한다.
        refreshControl.endRefreshing()
        
        ///해당 API에서 서울을 입력받으면 정상적으로 작동하지만
        ///서울역처럼 뒤에 역이 들어간다면 작동에 오류가 발생한다
        ///그 문제점을 해결하기 위해  아래와 같은 코드를 사용
        
        let stationName = "서울역"
        
        let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName.replacingOccurrences(of: "역", with: ""))"
        
        AF
            .request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
            .responseDecodable(of: StationArriveDataResponseModel.self){ [weak self] response in
                self?.refreshControl.endRefreshing()
                guard case .success(let data) = response.result else {return}
                
                print(data.realtimeArrivalList)
                
            }
            .resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "선택된 역"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        fetchData()
    }
}

extension StationDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectionViewCell", for: indexPath) as? StationDetailCollectionViewCell
        
        cell?.setup()
        
    
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
