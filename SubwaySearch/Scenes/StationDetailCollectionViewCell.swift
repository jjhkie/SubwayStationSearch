
import SnapKit
import UIKit

final class StationDetailCollectionViewCell: UICollectionViewCell{
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private lazy var remainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    func setup(){
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        
        //그림자값을 설정할 때 배경값도 넣어줘야 한다.
        backgroundColor = .systemBackground
        
        [lineLabel, remainLabel].forEach{
            addSubview($0)
        }
        
        lineLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }
        
        remainLabel.snp.makeConstraints{
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        lineLabel.text = "역이름"
        remainLabel.text = "위치 값"
    }
}
