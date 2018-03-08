/*
 
view.addSubview(orangeView)
view.addSubview(purpleView)
view.addSubview(blueView)
 
 let views: [String: AnyObject] = [
 "orangeView": orangeView,
 "purpleView": purpleView,
 "blueView": blueView,
 "topLayoutGuide" self.topLayoutGuide
 ]
 
 let metrics: [String: AnyObject] = [
 "orangeViewWidth": 200,
 "orangeViewHeight": 57,
 "standardOffset": 8,
 "bottomSpaceOffset": 50
 ]
 
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H: [orangeView(orangeViewWidth)]", options: [], metrics: metrics, views: views))
orangeView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
 
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V: [topLayoutGuide]-standardOffset-[purpleView]-standardOffset-[orangeView(orangeViewHeight)]-bottomSpaceOffset-|", options: [], metrics: metrics, views: views))
 
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H: |-standardOffset-[purpleView(==blueView)]-standardOffset-[blueView]-standardOffset-|", options: [], metrics: metrics, views: views))
 
 */
