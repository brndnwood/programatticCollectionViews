//
//  HomeVC.swift
//  CollectionViewLayout
//
//  Created by Brandon Wood on 9/4/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit



class HomeVC: UIViewController {
    
    var stackView = UIStackView()

    var hCollectionView : UICollectionView?
    var vCollectionView : UICollectionView?

    var selectedCellIndexPath : IndexPath?
    var previousSelectedCellIndexPath : IndexPath = [-1,-1]

    let hCardHeight = 150

    let cellID = "cellID"
    
    var screenSize = UIScreen.main.bounds
    

    let gray = UIColor(hexString: "#ecf0f1")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gray
        self.view.addSubview(stackView)

        setupStackView()
        

        setupHorizontalCollection()
        setupVerticalCollection()
        


    }
    

    fileprivate func setupStackView() {
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    fileprivate func setupHorizontalCollection() {

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // add margins to left and right of collection
        layout.sectionInset = .init(top: 0, left: 8, bottom: 0, right: 8)
        
        hCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        stackView.addArrangedSubview(hCollectionView!)
        
        
        hCollectionView!.backgroundColor = .clear
        hCollectionView!.dataSource = self
        hCollectionView!.delegate = self
        hCollectionView!.register(PosterDataCell.self, forCellWithReuseIdentifier: cellID)
        
        // enable auto-layout
        hCollectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        hCollectionView!.heightAnchor.constraint(equalToConstant: CGFloat(hCardHeight+8)).isActive = true
        hCollectionView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        hCollectionView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    
    
    
    fileprivate func setupVerticalCollection() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        vCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        stackView.addArrangedSubview(vCollectionView!)

        vCollectionView?.backgroundColor = .clear
        vCollectionView?.delegate = self
        vCollectionView?.dataSource = self
        vCollectionView!.register(DataCell.self, forCellWithReuseIdentifier: cellID)

        
        // enable auto-layout
        vCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        vCollectionView!.heightAnchor.constraint(equalToConstant: CGFloat(500)).isActive = true
        vCollectionView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        vCollectionView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
}







extension HomeVC : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == self.hCollectionView) {
            return 8
        } else {
            return 10
        }
    }
    
    
}
    
    

    
    
    

    
    
    
extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let cell = collectionView.cellForItem(at: indexPath) as! DataCell
        
        
        selectedCellIndexPath = indexPath
        
        
        
        // reload data in batch updates makes the size change animated
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        })
        
//        UIView.animate(withDuration: 0.2) {
//            cell.backgroundColor = .white
//        }
 
    }



}





extension HomeVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fullScreenWidth = view.frame.width
        
        var size : CGSize?
        
        if (collectionView == self.hCollectionView) {
            size = CGSize(width: 125 , height: hCardHeight)
            
            // if the cell is selected, make it bigger
            if (indexPath == selectedCellIndexPath) {
                size = CGSize(width: 125, height: hCardHeight)
            }
        } else {
            size = CGSize(width: fullScreenWidth , height: 100)

        }
        
        return size!
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    

    
}
