//
//  ViewController.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

private let reuseIdentifier = "cvId"

class HomeController: UICollectionViewController {
    //MARK: - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        configureUI()
    }

    //MARK: - Helpers
    private func configureUI(){
        navigationController?.navigationBar.backgroundColor = UIColor.systemRed
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "YouTube"
    }
    
}

extension HomeController{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
        cell.backgroundColor = .blue
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
}

