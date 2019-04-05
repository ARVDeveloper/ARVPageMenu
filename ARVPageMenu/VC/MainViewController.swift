//
//  ViewController.swift
//  ARVPlayer
//
//  Created by user1 on 01/04/19.
//  Copyright © 2019 samosys. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var views = [UIView]()
    var titles = ["Chats","Groups","Settings"]
    var selectedIndex = 0
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customization()
    }
    
    func customization()  {
       
        //CollectionView Setup
        self.collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        self.collectionView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: (self.view.bounds.height))
       
        //ViewController init
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
        let OtherVC = self.storyboard?.instantiateViewController(withIdentifier: "OtherVC")
         let SettingVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC")
        let viewControllers = [homeVC, OtherVC,SettingVC]
        for vc in viewControllers {
            self.addChild(vc!)
            vc!.didMove(toParent: self)
            vc!.view.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: (self.view.bounds.height - 44))
            self.views.append(vc!.view)
        }
        self.collectionView.reloadData()
     }
}
extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return views.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            cell.lblTitle.text = titles[indexPath.item]
            
            if selectedIndex == indexPath.item {
                cell.imgLine.isHidden = false
            }else{
                cell.imgLine.isHidden = true
            }
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.contentView.addSubview(self.views[indexPath.row])
           
            return cell
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == headerCollectionView{
           self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
           self.selectedIndex = indexPath.item
           headerCollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == headerCollectionView{
            return CGSize(width: self.headerCollectionView.frame.size.width/3, height: self.headerCollectionView.frame.size.height)
        }else{
           return CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = scrollView.contentOffset.x / self.view.bounds.width
        self.selectedIndex = Int(scrollIndex)
        headerCollectionView.reloadData()
    }
}
