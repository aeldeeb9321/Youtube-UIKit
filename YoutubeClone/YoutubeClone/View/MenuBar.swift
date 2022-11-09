//
//  MenuBar.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

private let reuseIdentifier = "menuBarId"

class MenuBar: UIView{
    //MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.setRGB(red: 230, green: 32, blue: 31)
        //to have some cells to populate the collectionView we will set the datasource and delegate
        cv.dataSource = self
        cv.delegate = self
        cv.register(MenuCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return cv
    }()
    
    let imageNames = ["home", "trending", "subscriptions", "account"]
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViewComponents(){
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

extension MenuBar: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
        let imageString = imageNames[indexPath.row]
        cell.cellImage = UIImage(named: imageString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
}

extension MenuBar: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //spacing between each cell will be reduced to 0
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //switch between different view controllers based on item selected
    }
}
