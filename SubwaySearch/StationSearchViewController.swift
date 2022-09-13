
import SnapKit
import UIKit

class StationSearchViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.isHidden = true
        
        return tableView
    }()
    
    ///viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableViewLayout()
        
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
}

extension StationSearchViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        
        return cell
    }
}

///  searchBar Click Event
///   cursor가 SearchBar에 있을 경우 TableView 의 isHidden = false
///   cursor가 빠져나온 경우 isHidden = true 
extension StationSearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = true
    }
}
