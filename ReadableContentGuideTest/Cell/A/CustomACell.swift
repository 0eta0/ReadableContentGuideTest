//
//  CustomACell.swift
//  ReadableContentGuideTest
//
//  Created by eita.yamaguchi on 2020/08/13.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

final class CustomACell: UITableViewCell {
    
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var mainDesc: UILabel!
    @IBOutlet private weak var subDesc: UILabel!
    
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
