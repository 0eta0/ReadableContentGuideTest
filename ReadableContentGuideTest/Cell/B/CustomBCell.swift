
//
//  CustomBCell.swift
//  ReadableContentGuideTest
//
//  Created by eita.yamaguchi on 2020/08/13.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

final class CustomBCell: UITableViewCell {
    
    private lazy var icon: UIImageView! = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var mainDesc: UILabel! = {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .bold)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var subDesc: UILabel! = {

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 12))
        label.font = .systemFont(ofSize: 10)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 82)
        ])

        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 50),
            // ここでreadableContentGuideを指定する
            icon.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            icon.trailingAnchor.constraint(equalTo: mainDesc.leadingAnchor, constant: -16),
            icon.trailingAnchor.constraint(equalTo: subDesc.leadingAnchor, constant: -16),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            // ここでreadableContentGuideを指定する
            mainDesc.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor),
            mainDesc.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainDesc.bottomAnchor.constraint(equalTo: subDesc.topAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            subDesc.heightAnchor.constraint(equalToConstant: 12),
            // ここでreadableContentGuideを指定する
            subDesc.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor),
            subDesc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    required convenience init?(coder: NSCoder) {
        self.init(style: .default, reuseIdentifier: "CustomACell")
    }

    func configure(
        iconName: String,
        main: String,
        sub: String
    ) {
        self.icon.image = UIImage(named: iconName)?.withTintColor(.gray)
        self.mainDesc.text = main
        
        self.subDesc.text = sub
    }
}
