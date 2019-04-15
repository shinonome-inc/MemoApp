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
        self.dismiss(animated: true, completion: nil)
        memorizeText()
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
        let writtenText = memoText.text! as NSString
        userDefaults.set(writtenText, forKey: "memo")
        view.endEditing(true)
        postArray.append(memoText.text)
    }

    //キーボード閉じる
    //self.memotext.resignFirstResponder()
}
