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
        //cellの更新
        table.reloadData()
    }
    
    //UserDefaultsからデータを取得
    func readData() {
        let database = UserDefaults.standard
        if let Array = database.array (forKey: "memo") {
            self.postArray = Array as! [String]
        }
    }

    //削除アクション
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            postArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            let count = indexPath.row
            //データ取得
            readData()
            //データ削除
            postArray.remove(at: count)
            //データ保存
            UserDefaults.standard.set(postArray, forKey: "memo")
        }
        tableView.reloadData()
        }
}


