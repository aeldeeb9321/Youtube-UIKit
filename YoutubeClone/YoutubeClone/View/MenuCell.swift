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
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.setDimesions(height: 28, width: 28)
        iv.tintColor = UIColor.setRGB(red: 91, green: 14, blue: 13)
        return iv
    }()
    
    //This is how we turn the menuOption white if its selected
    override var isSelected: Bool{
        didSet{
            menuImageView.tintColor = isSelected ? .white: UIColor.setRGB(red: 91, green: 14, blue: 13)
        }
    }
    
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
