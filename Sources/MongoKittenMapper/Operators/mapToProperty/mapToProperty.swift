//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

infix operator -->: AdditionPrecedence

extension DocumentMap {
  public static func --><T: Primitive>(left: inout T?, right: DocumentMap) {
    left?.map(with: right)
  }
  
  public static func --><T: Primitive>(left: inout T, right: DocumentMap) {
    left.map(with: right)
  }
  
  public static func --><T: Primitive>(left: inout [T], right: DocumentMap) {
    left.map(with: right)
  }
  
  public static func --><T: Primitive>(left: inout [T]?, right: DocumentMap) {
    left?.map(with: right)
  }
  
  public static func --><T: DocumentMappable>(left: inout [T], right: DocumentMap) {
    left.map(with: right)
  }
}

