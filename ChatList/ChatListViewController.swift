//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 김세준 on 2022/09/15.
//

import UIKit

class ChatListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatlist: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        chatlist = chatlist.sorted(by: {chat1,chat2 in
            return chat1.date > chat2.date
            })
        

    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatlist[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
