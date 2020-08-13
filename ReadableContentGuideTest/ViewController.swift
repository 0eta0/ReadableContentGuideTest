//
//  ViewController.swift
//  ReadableContentGuideTest
//
//  Created by eita.yamaguchi on 2020/08/13.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let model = ["バナナ", "ニンジン", "キュウリ", "パイナップル", "マンゴー", "オレンジ"]
    
    @IBOutlet weak var table: UITableView! {
        didSet {
            table.register(UINib(nibName: "CustomACell", bundle: nil), forCellReuseIdentifier: "CustomACell")
            table.register(CustomBCell.self, forCellReuseIdentifier: "CustomBCell")
            table.rowHeight = UITableView.automaticDimension
            table.dataSource = self
            table.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count * 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < model.count {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = model[indexPath.row]
            return cell
        } else if indexPath.row < model.count * 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomACell", for: indexPath) as? CustomACell
            cell?.configure(iconName: "tomato", main: "おいしい\(model[indexPath.row - model.count])", sub: "おいしいです")
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomBCell", for: indexPath) as? CustomBCell
            cell?.configure(iconName: "tomato", main: "おいしい\(model[indexPath.row - model.count * 2])", sub: "おいしいです")
            return cell ?? UITableViewCell()
        }
        
    }
}
