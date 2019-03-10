//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

infix operator -->: AdditionPrecedence

extension Map {
  public static func --><T: Primitive>(left: inout T?, right: Map) {
    left = right.currentValue as? T
  }
  
  public static func --><T: Primitive>(left: inout T, right: Map) {
    left = right.currentValue as! T
  }
  
  public static func --><T: Primitive>(left: inout [T], right: Map) {
    left.map(with: right)
  }
  
  public static func --><T: Primitive>(left: inout [T]?, right: Map) {
    left?.map(with: right)
  }
  
  public static func --><T: DocumentMappable>(left: inout [T], right: Map) {
    left.map(with: right)
  }
}

