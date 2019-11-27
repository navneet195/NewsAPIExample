//
//  ShimmerManager.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import Shimmer

class ShimmerManager {
    
    static func feedShimmer(instanceOf: UIView,containerView : UIView, visibility : Bool) {
        containerView.isHidden = false
        containerView.layer.zPosition = 1;
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            var mView = UIView()
            if instanceOf is NewsShimmer {
                mView =  NewsShimmer(frame: containerView.frame )
            }

            let mshimmer = FBShimmeringView(frame: containerView.frame)
            if visibility {
                containerView.superview?.bringSubviewToFront(containerView)
                mshimmer.contentView = mView
                mshimmer.frame = CGRect(x:0,y:0,width:containerView.frame.width,height:containerView.frame.height)
                mshimmer.isShimmering = true

                mshimmer.backgroundColor = UIColor.white
                mshimmer.shimmeringAnimationOpacity = 0.4
                containerView.addSubview(mshimmer)
               
            } else {
                containerView.isHidden = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                    for view in containerView.subviews {
                        if view is FBShimmeringView {
                            view.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
}
