//
//  ViewController.swift
//  gameBackground
//
//  Created by PHN MAC 1 on 27/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var leftArrow: UIImageView!
    @IBOutlet weak var rightArrow: UIImageView!
    var index:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftAndRightImageConfiguration()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let y = 900 - self.scrollView.frame.height
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
        })
    }
   
    func leftAndRightImageConfiguration(){
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tap1))
        leftArrow.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tap2))
        rightArrow.addGestureRecognizer(tap2)
    }
    @objc func tap1(){leftAndRightImageTapped()}
    @objc func tap2(){leftAndRightImageTapped()}
    func leftAndRightImageTapped(){
        startAnimation()
    }
    
    func startAnimation(){
        rightArrow.removeAllConstraints()
        leftArrow.removeAllConstraints()
        if index == 1{
            UIView.animate(withDuration: 1, delay: 0.1, animations: {
                self.rightArrow.center = self.view1.center
                self.leftArrow.center = self.view2.center
                self.rightArrow.image = UIImage(systemName: "arrowshape.right.fill")
                self.leftArrow.image = UIImage(systemName: "arrowshape.left.fill")
            })
            self.index += 1
        }
        else if index == 2{
            UIView.animate(withDuration: 1, delay: 0.1, animations: {
                self.rightArrow.center = self.view3.center
                self.leftArrow.center = self.view4.center
                self.rightArrow.image = UIImage(systemName: "arrowshape.left.fill")
                self.leftArrow.image = UIImage(systemName: "arrowshape.right.fill")
                self.scrollView.setContentOffset(CGPoint(x: 0, y: -2), animated: true)
            })
            self.index += 1
        }
        else if index == 3{
            UIView.animate(withDuration: 1, delay: 0.1, animations: {
                self.rightArrow.center = self.view5.center
                self.leftArrow.center = self.view6.center
                self.scrollView.setContentOffset(CGPoint(x: 0, y: -2), animated: true)
            })
            self.index += 1
        }
        else if index == 4{
            let y = 900 - self.scrollView.frame.height
            self.scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
            self.index = 1
            startAnimation()
        }
    }
    

}

extension UIView {
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
}
