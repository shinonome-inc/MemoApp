//
//  ViewController.swift
//  MemoApp
//
//  Created by 飯野敦博 on 2019/04/12.
//  Copyright © 2019 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var postArray: [String] = []

    @IBOutlet weak var table: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") as! MemoCell
        
        cell.memoLabel.text = postArray[indexPath.row]
        //cell.timeLabel.text = postArray[indexPath.row]cc
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.frame = view.frame //テーブルを画面全体に表示
        table.delegate = self //デリゲート指定
        table.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        readData()//viewが表示される直前に呼ばれる
        print(self.postArray)
    }
    
    //UserDefaultsからデータを取得
    func readData() {
        let database = UserDefaults.standard
        if let postArray = database.array (forKey: "memo") {
            self.postArray = postArray as! [String]
            print(self.postArray)
            //cellの更新
            table.reloadData()
        }
    }
}

