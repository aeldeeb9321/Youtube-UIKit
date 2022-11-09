//
//  MenuCell.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/8/22.
//

import UIKit

class MenuCell: UICollectionViewCell{
    //MARK: - Properties
    
    var cellImage: UIImage?{
        didSet{
            self.menuImageView.image = cellImage
        }
    }
    
    private let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "home")
        iv.setDimesions(height: 28, width: 28)
        return iv
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureCellComponents(){
        addSubview(menuImageView)
        menuImageView.centerX(inView: self)
        menuImageView.centerY(inView: self)
    }
}
