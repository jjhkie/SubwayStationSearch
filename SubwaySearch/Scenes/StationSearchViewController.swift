
import SnapKit
import Alamofire
import UIKit

class StationSearchViewController: UIViewController {

    var numberOfCell : Int = 0
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        return tableView
    }()
    
    ///viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableViewLayout()
        
        requestStationName()
        
    }
    
    /// Navigation Layout Setting
    private func setNavigationItems(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
        searchController.obscuresBackgroundDuringPresentation = false
        ///searchBar 선택 시 하단 부분 background 불투명한 부분을 추가할 것인가
        /// true일 경우 하단 부분이 불투명해진다.
        
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
    }
    
    /// TableViewLayout Setting
    private func setTableViewLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    private func requestStationName(){
        let urlString = "http://openAPI.seoul.go.kr:8088/sample/json/SearchInfoBySubwayNameService/1/5/종로3가"
        
        ///url 에 한글이 포함되어 있다면 인코딩하면서 특수문자로 변환된다.
        ///그런 문제점을 보안하기 위해 아래와 같은 addingPercentEncoding으로 감싸주어 실행해준다.
        AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
            .responseDecodable(of: StationResponseModel.self){ response in
                guard case .success(let data) = response.result else { return }
                
                print(data.stations)
            }
            .resume()
    }
}

extension StationSearchViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        
        return cell
    }
}

extension StationSearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

///  searchBar Click Event
///   cursor가 SearchBar에 있을 경우 TableView 의 isHidden = false
///   cursor가 빠져나온 경우 isHidden = true
extension StationSearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        numberOfCell = 10
        tableView.reloadData()
        tableView.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        numberOfCell = 0
        tableView.reloadData()
        tableView.isHidden = true
    }
}
