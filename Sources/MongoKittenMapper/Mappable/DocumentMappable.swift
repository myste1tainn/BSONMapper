//
// Created by Arnon Keereena on 6/12/2017 AD.
//

import MongoKitten

public protocol DocumentMappable {
  var document: Document { get set }
  init(map: Map)
  func mapping(map: Map)
  func idMapping(document: inout Document)
}


