//
//  ViewController.swift
//  Page_scroll_view
//
//  Created by william yao on 5/20/17.
//  Copyright © 2017 william yao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scroll_view: UIScrollView!
    
    var images = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        //add a gesture recognizer so user can swipe outside the box
        view.addGestureRecognizer(scroll_view.panGestureRecognizer)
        
        //initialize a float number for content width
        var cotent_width: CGFloat = 0.0
        //get the scroll view's width
        let scroll_width = scroll_view.frame.width
        
        //Show the icons
        //3 icons, from 0 to 1
        for x in 0...2{
            
            // Pick the image
            let image = UIImage(named: "icon\(x).png")
            //Display the contents --> UIImageView
            let image_view = UIImageView(image:image)
            images.append(image_view)
            
            //use new_x to help to set the position of next icon
            var new_x: CGFloat = 0.0
            
            new_x = scroll_width / 2 + scroll_width * CGFloat(x)
            
            cotent_width += new_x
            
            // add the image to scroll_view
            scroll_view.addSubview(image_view)
            
            //Set the frame position and size for image_view, as rectangle
            image_view.frame = CGRect(x: new_x - 75, y: (scroll_view.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        // Size of the content view
        scroll_view.contentSize = CGSize(width: cotent_width, height: view.frame.size.height)
        
        scroll_view.clipsToBounds = false

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

