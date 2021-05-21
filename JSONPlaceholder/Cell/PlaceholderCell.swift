//
//  PlaceholderCell.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/21.
//

import UIKit
import SDWebImage
import SnapKit

class PlaceholderCell: UITableViewCell {

    var placeholderImageView = UIImageView()
    var placeholderTitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    private func setupUI() {
        self.selectionStyle = .none
        
        placeholderTitle.numberOfLines = 0
        placeholderTitle.textAlignment = .center
        self.addSubview(placeholderImageView)
        self.addSubview(placeholderTitle)

        placeholderImageView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(150)
            $0.width.equalTo(150)
            $0.centerX.equalToSuperview()
        })

        placeholderTitle.snp.makeConstraints({
            $0.top.equalTo(placeholderImageView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-20)
        })
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateCellWith(object: JSONPlaceholderDetail) {
        placeholderImageView.sd_setImage(with: URL(string: object.url))
        placeholderTitle.text = object.title
    }

}
