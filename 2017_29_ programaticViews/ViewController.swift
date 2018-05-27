//
//  ViewController.swift
//  2017_29_ programaticViews
//
//  Created by C4Q on 12/29/17.
//  Copyright © 2017 Quark. All rights reserved.
// a project done by https://www.youtube.com/watch?v=gCoAUIYTbfE

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        setUI()
        // Do any additional setup after loading the view, typically from a nib.
        configureNavBar()
    }
    func configureNavBar() {
        let barButton = UIBarButtonItem(title: "test", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func setUI(){
        // notice that the zero point is at the top left corner of the superView
        //- frame The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
        //- CGRect: A structure that contains the location and dimensions of a rectangle.
        let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height * 0.4))
//        imageView.image = #imageLiteral(resourceName: "Store Front")
        // notice that the content mode will give you the options for all the fits and fills and orientation of the image
        // this is to add a shadow
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.25
        view.addSubview(imageView)
            // for independent sections you need to make classes that represents these section which you can call them views that can have label, images or anything else but remember it hase to be sublclass of a UIView
        let descriptionView = DescriptionView(frame: CGRect(x: 10, y: (view.frame.height * 0.4 + 30), width: view.frame.width - 20, height: view.frame.height * 0.25) , logo: #imageLiteral(resourceName: "restaurant logo"), name: "Rosetto Taliano" , content: "It is a new Quick Service Restaurant, serving quality Italian comfort food. Our menu consists of made-to-order Italian classics, cooked with only the finest ingredients. Passionately prepared and packaged.")
        descriptionView.contentMode = .scaleAspectFill
        descriptionView.layer.shadowColor = UIColor.black.cgColor
        descriptionView.layer.shadowOpacity = 0.25
        view.addSubview(descriptionView)
        let mealImage = DishesImageView(frame: CGRect(x: 10, y: (view.frame.height * 0.65 + 40), width: view.frame.width - 20, height: view.frame.height * 0.25) , image1: #imageLiteral(resourceName: "salad dish"), image2: #imageLiteral(resourceName: "salmon dish"), image3: #imageLiteral(resourceName: "burger Image"))
        mealImage.contentMode = .scaleAspectFill
        mealImage.layer.shadowColor = UIColor.black.cgColor
        mealImage.layer.shadowOpacity = 0.25
        view.addSubview(mealImage )
    }
}

class DescriptionView: UIView {
    // notice that it has to be type force unwrapped to avoid the error of super.init
    var logo: UIImage!
    var name: String!
    var content: String!
    init(frame: CGRect, logo: UIImage, name: String, content: String){
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.logo = logo
        self.name  = name
        self.content = content
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        let logoView = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        logoView.image = logo
        addSubview(logoView)
        // it has x of 60 as the log has a 10 before it and it's width is 40 and we want to add 10 after it so the total is 60 as well as the we want the label centered to the logo so the logo have 10 on the top and the label size is 30 so you want the y to be 15
        let nameLabel = UILabel(frame: CGRect(x: 60, y: 15, width: 200, height: 30))
        nameLabel.text = name
        addSubview(nameLabel)
        // notice that to get the right numbers for the width and the height for the content you need to be aware of the previous views so a sketch of the hole thing will be great idea
        let contentLabel = UILabel(frame: CGRect(x: 10, y: 60 , width: frame.width - 20, height: frame.height - 70))
        contentLabel.text = content
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byTruncatingTail /// at the very of the string it will break to a new line
        contentLabel.sizeToFit() // this will make it fit in the space with respect to the constraints that we have mentioned
        addSubview(contentLabel)
        
    }
}

class DishesImageView: UIView {
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    init(frame: CGRect, image1: UIImage, image2: UIImage, image3: UIImage) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        setLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setLayouts(){
        var currentXPosition: CGFloat = 20
        for i in 0..<3{
            let imageView = UIImageView(frame: CGRect(x: currentXPosition, y: 20, width: (frame.width - 80)/3, height: (frame.width - 80)/3))
            imageView.image = i == 0 ? image1 : i == 1 ? image2 : image3
            addSubview(imageView)
            currentXPosition += ((frame.width - 80)/3) + 20
        }
    }
}











