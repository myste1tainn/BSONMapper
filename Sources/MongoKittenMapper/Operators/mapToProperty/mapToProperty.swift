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
  
  public static func --><T: DocumentMappable>(left: inout T?, right: Map) {
    let map = Map(to: right.direction, document: right.currentValue as! Document)
    left = T(map: map)
    left?.mapping(map: map)
  }
  
  public static func --><T: DocumentMappable>(left: inout T, right: Map) {
    let map = Map(to: right.direction, document: right.currentValue as! Document)
    guard let model = T(map: map) else { return }
    left = model
    left.mapping(map: map)
  }
  
  public static func --><T: DocumentMappable>(left: inout [T], right: Map) {
    left = T.array(map: right)
  }
  
  public static func --><T: DocumentMappable>(left: inout [T]?, right: Map) {
    left = T.array(map: right)
  }
}

