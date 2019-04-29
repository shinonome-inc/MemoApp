//
//  EditPage.swift
//  MemoApp
//
//  Created by 飯野敦博 on 2019/04/12.
//  Copyright © 2019 mycompany. All rights reserved.
//

import Foundation
import UIKit

class EditPageViewContoroller: UIViewController {


    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var memoText: UITextView!

    private var toolbar: UIToolbar!

    //配列
    var postArray: [String] = []
    //時刻変数
    let time = DateFormatter()
    //保存変数
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        //キーボード表示
        self.memoText.becomeFirstResponder()
        //時刻表示
        timeGet()
    }

    //表示するメモを一番上から
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        memoText.setContentOffset(CGPoint.zero, animated: false)
    }

    //戻る（保存する）ボタン
    @IBAction func backButton(_ sender: Any) {
        alert()
    }

    //保存ボタン
    @IBAction func saveButton(_ sender: Any) {
        memorizeText()
    }

    //時刻表示関数
    func timeGet()  {
        time.timeStyle = .short
        time.dateStyle = .full
        time.locale = Locale(identifier: "ja_JP")
        let now = Date()
        timeLabel.text = time.string(from: now)
    }

    //保存処理
    func memorizeText() {
        guard memoText.text == "" else {
            let database = UserDefaults.standard
            if let Array = database.array (forKey: "memo") {
                self.postArray = Array as! [String]
            }
            postArray.append(memoText.text)
            userDefaults.set(postArray, forKey: "memo")
            view.endEditing(true)
            return
        }
    }

    func alert() {
        guard memoText.text == ""  else {
            // ① UIAlertControllerクラスのインスタンスを生成
            let alert: UIAlertController = UIAlertController(title: "保存しますか", message: "保存しないと書いた内容が削除されます。", preferredStyle: UIAlertController.Style.alert)
            // ② Actionの設定
            // OKボタン
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                (action: UIAlertAction!)  in
                self.memorizeText()
                self.dismiss(animated: true, completion: nil)
            })
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                (action: UIAlertAction!)  in
                self.dismiss(animated: true, completion: nil)
            })
            // ③ UIAlertControllerにActionを追加
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
}
