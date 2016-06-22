//
//  ViewController.swift
//  ForceTouchSample
//
//  Created by tchiba on 2016/06/22.
//  Copyright © 2016年 tchiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: imageView)
        }
        
        
        
        
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("peek")
        let size = previewingContext.sourceView.frame.size
        let rect = CGRect(x: 0, y: 0, width:size.width, height: size.height)
        previewingContext.sourceRect = rect
//        RedImageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RedImageViewController"];
//        vc.preferredContentSize = CGSizeMake(0, 300);
        return nil
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        print("pop")
    }
    

}

