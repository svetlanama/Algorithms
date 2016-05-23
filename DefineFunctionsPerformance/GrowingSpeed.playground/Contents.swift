import UIKit
import Foundation

//Define the growing of function logarithm
func logWithBase(base: Double, n: Double) -> Double {
  let result = log(n)/log(base)
  
  return result
}

func getSqrt(from: Double) -> Double {
  let result = sqrt(from)
  return result
}

let base: Double  = 2 //let's take base = 2
let n: Double = 2 //let's take   n = 2
let n2: Double = 800 // increase n in 400 times


let logN = logWithBase(base, n: n) // 1
let logN2 = logWithBase(base, n: n2) // 9.643856189774725

let sqrtN = getSqrt(n) // 1.414213562373095
let sqrtN2 = getSqrt(n2) // 28.2842712474619

// You will see that the logarithm grows ON
// You will see that the sqrt grows IN


//Draw graph
let size = CGSize(width: 300, height: 180)
let sizeCoord = CGSize(width: 250, height: 150)
let sizeLbel = CGSize(width: 40, height: 15)

// UIView
let view:UIView = UIView(frame: CGRect(origin: CGPointZero, size: size))
view.backgroundColor = UIColor(white: 0.8, alpha: 1.0)

// Coordinate view
let coordView:UIView = UIView(frame: CGRect(origin: CGPointMake(10, 15), size: sizeCoord))
coordView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
view.addSubview(coordView)

// Coordinate's labels
let labelFuncCoord = UILabel(frame: CGRect(origin: CGPointMake(coordView.frame.origin.x - 5, coordView.frame.origin.y - 15), size: sizeLbel))
labelFuncCoord.backgroundColor = UIColor.clearColor()
labelFuncCoord.text = "func(n)"
labelFuncCoord.textAlignment = NSTextAlignment.Left
labelFuncCoord.font = UIFont.italicSystemFontOfSize(8)
labelFuncCoord.textColor = UIColor.redColor()
view.addSubview(labelFuncCoord)

let labelNCoord = UILabel(frame: CGRect(origin: CGPointMake(coordView.frame.size.width, coordView.frame.size.height + 8), size: sizeLbel))
labelNCoord.backgroundColor = UIColor.clearColor()
labelNCoord.text = "n"
labelNCoord.textAlignment = NSTextAlignment.Center
labelNCoord.font = UIFont.italicSystemFontOfSize(8)
labelNCoord.textColor = UIColor.redColor()
view.addSubview(labelNCoord)


// Lines labels
let labelSqrtLine = UILabel(frame: CGRect(origin: CGPointMake(coordView.frame.width - 50, 10), size: sizeLbel))
labelSqrtLine.backgroundColor = UIColor.clearColor()
labelSqrtLine.text = "⇡ sqrt(n)"
labelSqrtLine.textAlignment = NSTextAlignment.Left
labelSqrtLine.font = UIFont.italicSystemFontOfSize(8)
labelSqrtLine.textColor = UIColor.redColor()
coordView.addSubview(labelSqrtLine)

let labelLogNLine = UILabel(frame: CGRect(origin: CGPointMake(coordView.frame.width - 50, 0), size: sizeLbel))
labelLogNLine.backgroundColor = UIColor.clearColor()
labelLogNLine.text = "⇡ log(n)"
labelLogNLine.textAlignment = NSTextAlignment.Left
labelLogNLine.font = UIFont.italicSystemFontOfSize(8)
labelLogNLine.textColor = UIColor.blueColor()
coordView.addSubview(labelLogNLine)

// CoreGraphics
UIGraphicsBeginImageContextWithOptions(size, false, 0)


let coordX = UIBezierPath()
coordX.moveToPoint(CGPointMake(0, size.height))
coordX.addLineToPoint(CGPointMake(size.width, size.height))
UIColor.darkGrayColor().setStroke()
coordX.stroke()

let coordY = UIBezierPath()
coordY.moveToPoint(CGPointMake(0, 0))
coordY.addLineToPoint(CGPointMake(0, size.height))
UIColor.darkGrayColor().setStroke()
coordY.stroke()

// Log(n) growing function graph
let lognInCoordinateSystem = size.height - CGFloat(logN)
let logn2InCoordinateSystem = size.height - CGFloat(logN2)


let pointLogN = CGPointMake(CGFloat(n), CGFloat(lognInCoordinateSystem))
let pointLogN2 = CGPointMake(CGFloat(n2), CGFloat(logn2InCoordinateSystem))
let path = UIBezierPath()

path.moveToPoint(pointLogN)
path.addLineToPoint(pointLogN2)
UIColor.blueColor().setStroke()
path.stroke()


// Sqrt(n) growing function graph
let sqrtInCoordinateSystem = size.height - CGFloat(sqrtN)
let sqrt2InCoordinateSystem = size.height - CGFloat(sqrtN2)

let pointSqrtN = CGPointMake(CGFloat(n), CGFloat(sqrtInCoordinateSystem))
let pointSqrtN2 = CGPointMake(CGFloat(n2), CGFloat(sqrt2InCoordinateSystem))
let path2 = UIBezierPath()
path2.moveToPoint(pointSqrtN)
path2.addLineToPoint(pointSqrtN2)
UIColor.redColor().setStroke()
path2.stroke()


// Paths description
let pathLogN = UIBezierPath()
pathLogN.moveToPoint(CGPointMake(coordView.frame.size.width - 50, 10))
pathLogN.addLineToPoint(CGPointMake(coordView.frame.size.width - 20, 10))
UIColor.blueColor().setStroke()
pathLogN.stroke()

let pathSqrt = UIBezierPath()
pathSqrt.moveToPoint(CGPointMake(coordView.frame.size.width - 50, 20))
pathSqrt.addLineToPoint(CGPointMake(coordView.frame.size.width - 20, 20))
UIColor.redColor().setStroke()
pathSqrt.stroke()


coordView.layer.contents = UIGraphicsGetImageFromCurrentImageContext().CGImage
UIGraphicsEndImageContext()

// Playground Timeline
let preview = view































