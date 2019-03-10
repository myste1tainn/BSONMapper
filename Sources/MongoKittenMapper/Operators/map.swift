//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

infix operator <-: AdditionPrecedence

public func <-<T: Primitive>(left: inout T, right: Map) {
  switch right.direction {
  case .document: left >>> right
  case .dictionary: left ->> right
  case .property: left --> right
  }
}

public func <-<T: Primitive>(left: inout T?, right: Map) {
  switch right.direction {
  case .document: left >>> right
  case .dictionary: left ->> right
  case .property: left --> right
  }
}

public func <-<T: Primitive>(left: inout [T], right: Map) {
  switch right.direction {
  case .document: left >>> right
  case .dictionary: left ->> right
  case .property: left --> right
  }
}

public func <-<T: Primitive>(left: inout [T]?, right: Map) {
  switch right.direction {
  case .document: left >>> right
  case .dictionary: left ->> right
  case .property: left --> right
  }
}

public func <-<T: DocumentMappable>(left: inout [T]?, right: Map) {
  switch right.direction {
  case .document: left >>> right
  case .dictionary: left ->> right
  case .property: left --> right
  }
}
