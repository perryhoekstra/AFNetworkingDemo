//
//  ViewController.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Travel Labs. All rights reserved.
//

import UIKit
import RxSwift
import JGProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var dataView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    //Dispose bag
    private let disposeBag = DisposeBag()
    private var postsList: [Post] = []
    private let hud = JGProgressHUD(style: .dark)
    
    private func queryData() {
        hud.show(in: self.view)
        
        ApiClient.getPosts(userId: 1)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                postsList in
                self.postsList = postsList
                
                self.dataView.reloadData()
                
                self.hud.dismiss(afterDelay: 0.5)
            },
            onError: { error in
                self.hud.dismiss(afterDelay: 0.5)
                
                switch error {
                    case ApiError.conflict:
                        self.errorMessageLabel.text = "Conflict error"
                    case ApiError.forbidden:
                        self.errorMessageLabel.text = "Forbidden error"
                    case ApiError.notFound:
                        self.errorMessageLabel.text = "Not found error"
                    default:
                        self.errorMessageLabel.text = "Unknown error:"
                }
            })
        .disposed(by: disposeBag)
    }
    
    @IBAction func queryDataTap(_ sender: Any) {
        self.queryData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataView.register(cellType: PostCell.self)
        
        hud.textLabel.text = "Loading"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postCell = tableView.dequeueReusableCell(for: indexPath, cellType: PostCell.self) 
        
        postCell.configure(post: postsList[indexPath.row])
        
        return postCell
    }
    
}

