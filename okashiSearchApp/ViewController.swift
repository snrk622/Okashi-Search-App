//
//  ViewController.swift
//  okashiSearchApp
//
//  Created by 篠原立樹 on 2018/11/12.
//  Copyright © 2018 Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //search Barのdelegate通知先を設定
        searchText.delegate = self
        
        //入力のヒントになる、プレースホルダを設定
        searchText.placeholder = "お菓子の名前を入力してください"
    }

    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //検索ボタンをタップ時に実行
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //キーボードを閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            //デバックエリアに出力
            print(searchWord)
            //入力されていたら、お菓子を検索
            searchOkashi(keyword: searchWord)
        }
    }
    
    //searchOkashiメソッド
    //第一引数：keyword 検索したいワード
    func searchOkashi(keyword: String) {
        //お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string: "http://www.sysbird.jp/toriko/api/?apikey=quest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}

