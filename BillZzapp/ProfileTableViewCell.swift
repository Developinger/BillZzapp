//
//  ProfileTableViewCell.swift
//  BillZzapp
//
//  Created by 7g on 5/1/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let button:UIButton = {
        let button = UIButton(type: .system)
               button.translatesAutoresizingMaskIntoConstraints = false
               button.setTitle("Profile", for: .normal)
               button.setTitleColor(.black, for: .normal)
               button.backgroundColor = .clear
               button.layer.cornerRadius = 10
        button.addTarget(ProfileTableViewCell.self, action: #selector(buttonTapped), for: .touchUpInside)
               return button
        
    }()
    @objc func buttonTapped() {
    
        let destinationVC = ProfileDetailsViewController()
     UIStoryboardSegue(identifier: <#T##String?#>, source: <#T##UIViewController#>, destination: <#T##UIViewController#>)
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        //addSubview(titleLabel)
        addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
