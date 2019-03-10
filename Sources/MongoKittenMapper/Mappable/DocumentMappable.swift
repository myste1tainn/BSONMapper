//
// Created by Arnon Keereena on 6/12/2017 AD.
//

import MongoKitten

public protocol DocumentMappable {
  init?(map: Map)
  mutating func mapping(map: Map)
}


