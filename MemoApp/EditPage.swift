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


    override func viewDidLoad() {
        super.viewDidLoad()

        // 1秒ごとに「displayClock」を実行する
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayClock), userInfo: nil, repeats: true)
        timer.fire() 


//        memoText.placeholder = "例：自宅トイレ２回目(撮影履歴に表示するテーマ)"
//        memoText.delegate = self

    }
    //表示するメモを一番上から
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        memoText.setContentOffset(CGPoint.zero, animated: false)
    }

    // 現在時刻を表示する処理
    @objc func displayClock() {
        // 現在時刻を「HH:MM:SS」形式で取得する
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        var displayTime = formatter.string(from: Date())    // Date()だけで現在時刻を表す

        // 0から始まる時刻の場合は「 H:MM:SS」形式にする
        if displayTime.hasPrefix("0") {
            // 最初に見つかった0だけ削除(スペース埋め)される
            if let range = displayTime.range(of: "0") {
                displayTime.replaceSubrange(range, with: " ")
            }
        }
        // ラベルに表示
        timeLabel.text = displayTime

    }
}
