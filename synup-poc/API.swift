//  This file was automatically generated and should not be edited.

import Apollo

public enum Photo: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case logo
  case cover
  case additional
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "LOGO": self = .logo
      case "COVER": self = .cover
      case "ADDITIONAL": self = .additional
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .logo: return "LOGO"
      case .cover: return "COVER"
      case .additional: return "ADDITIONAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Photo, rhs: Photo) -> Bool {
    switch (lhs, rhs) {
      case (.logo, .logo): return true
      case (.cover, .cover): return true
      case (.additional, .additional): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class SearchLocationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query searchLocations($query: String!) {\n  searchLocations(query: $query) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        id\n        name\n        yearOfIncorporation\n        subCategoryName\n        street\n        phone\n        bizUrl\n        ownerName\n        ownerEmail\n        yearOfIncorporation\n        locationPhotos {\n          __typename\n          url\n          type\n        }\n      }\n    }\n  }\n}"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("searchLocations", arguments: ["query": GraphQLVariable("query")], type: .object(SearchLocation.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchLocations: SearchLocation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchLocations": searchLocations.flatMap { (value: SearchLocation) -> ResultMap in value.resultMap }])
    }

    /// Search for locations
    public var searchLocations: SearchLocation? {
      get {
        return (resultMap["searchLocations"] as? ResultMap).flatMap { SearchLocation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "searchLocations")
      }
    }

    public struct SearchLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["LocationSummaryConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "LocationSummaryConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["LocationSummaryEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "LocationSummaryEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["LocationSummary"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("yearOfIncorporation", type: .scalar(Int.self)),
            GraphQLField("subCategoryName", type: .nonNull(.scalar(String.self))),
            GraphQLField("street", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .nonNull(.scalar(String.self))),
            GraphQLField("bizUrl", type: .scalar(String.self)),
            GraphQLField("ownerName", type: .scalar(String.self)),
            GraphQLField("ownerEmail", type: .scalar(String.self)),
            GraphQLField("yearOfIncorporation", type: .scalar(Int.self)),
            GraphQLField("locationPhotos", type: .list(.object(LocationPhoto.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, yearOfIncorporation: Int? = nil, subCategoryName: String, street: String, phone: String, bizUrl: String? = nil, ownerName: String? = nil, ownerEmail: String? = nil, locationPhotos: [LocationPhoto?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LocationSummary", "id": id, "name": name, "yearOfIncorporation": yearOfIncorporation, "subCategoryName": subCategoryName, "street": street, "phone": phone, "bizUrl": bizUrl, "ownerName": ownerName, "ownerEmail": ownerEmail, "locationPhotos": locationPhotos.flatMap { (value: [LocationPhoto?]) -> [ResultMap?] in value.map { (value: LocationPhoto?) -> ResultMap? in value.flatMap { (value: LocationPhoto) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// Name of the location
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// Year of the location's incorporation
          public var yearOfIncorporation: Int? {
            get {
              return resultMap["yearOfIncorporation"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "yearOfIncorporation")
            }
          }

          /// Name of the primary sub category
          public var subCategoryName: String {
            get {
              return resultMap["subCategoryName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subCategoryName")
            }
          }

          /// Street address of the location
          public var street: String {
            get {
              return resultMap["street"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "street")
            }
          }

          /// Phone number of the location
          public var phone: String {
            get {
              return resultMap["phone"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "phone")
            }
          }

          /// Business Url of the location
          public var bizUrl: String? {
            get {
              return resultMap["bizUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "bizUrl")
            }
          }

          /// Name of the location's owner
          public var ownerName: String? {
            get {
              return resultMap["ownerName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "ownerName")
            }
          }

          /// Email ID of the owner of the business
          public var ownerEmail: String? {
            get {
              return resultMap["ownerEmail"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "ownerEmail")
            }
          }

          /// All photos of the location
          public var locationPhotos: [LocationPhoto?]? {
            get {
              return (resultMap["locationPhotos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LocationPhoto?] in value.map { (value: ResultMap?) -> LocationPhoto? in value.flatMap { (value: ResultMap) -> LocationPhoto in LocationPhoto(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [LocationPhoto?]) -> [ResultMap?] in value.map { (value: LocationPhoto?) -> ResultMap? in value.flatMap { (value: LocationPhoto) -> ResultMap in value.resultMap } } }, forKey: "locationPhotos")
            }
          }

          public struct LocationPhoto: GraphQLSelectionSet {
            public static let possibleTypes = ["LocationPhoto"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("type", type: .nonNull(.scalar(Photo.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String? = nil, type: Photo) {
              self.init(unsafeResultMap: ["__typename": "LocationPhoto", "url": url, "type": type])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The url for photo in 250x250 resolution
            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// The type of the photo
            public var type: Photo {
              get {
                return resultMap["type"]! as! Photo
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetInteractionsQuery: GraphQLQuery {
  public let operationDefinition =
    "query getInteractions($locationId: ID!) {\n  interactions(locationId: $locationId) {\n    __typename\n    totalCount\n    edges {\n      __typename\n      node {\n        __typename\n        id\n        title\n        content\n        source\n        authorName\n        authorAvatar\n        rating\n        date\n        photoUrl\n        photoThumbnailUrl\n      }\n    }\n  }\n}"

  public var locationId: GraphQLID

  public init(locationId: GraphQLID) {
    self.locationId = locationId
  }

  public var variables: GraphQLMap? {
    return ["locationId": locationId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("interactions", arguments: ["locationId": GraphQLVariable("locationId")], type: .object(Interaction.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(interactions: Interaction? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "interactions": interactions.flatMap { (value: Interaction) -> ResultMap in value.resultMap }])
    }

    public var interactions: Interaction? {
      get {
        return (resultMap["interactions"] as? ResultMap).flatMap { Interaction(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "interactions")
      }
    }

    public struct Interaction: GraphQLSelectionSet {
      public static let possibleTypes = ["InteractionConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .scalar(Int.self)),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int? = nil, edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "InteractionConnection", "totalCount": totalCount, "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int? {
        get {
          return resultMap["totalCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["InteractionEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "InteractionEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Interaction"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("source", type: .scalar(String.self)),
            GraphQLField("authorName", type: .scalar(String.self)),
            GraphQLField("authorAvatar", type: .scalar(String.self)),
            GraphQLField("rating", type: .scalar(Int.self)),
            GraphQLField("date", type: .scalar(String.self)),
            GraphQLField("photoUrl", type: .scalar(String.self)),
            GraphQLField("photoThumbnailUrl", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, title: String? = nil, content: String? = nil, source: String? = nil, authorName: String? = nil, authorAvatar: String? = nil, rating: Int? = nil, date: String? = nil, photoUrl: String? = nil, photoThumbnailUrl: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Interaction", "id": id, "title": title, "content": content, "source": source, "authorName": authorName, "authorAvatar": authorAvatar, "rating": rating, "date": date, "photoUrl": photoUrl, "photoThumbnailUrl": photoThumbnailUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var source: String? {
            get {
              return resultMap["source"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "source")
            }
          }

          public var authorName: String? {
            get {
              return resultMap["authorName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "authorName")
            }
          }

          public var authorAvatar: String? {
            get {
              return resultMap["authorAvatar"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "authorAvatar")
            }
          }

          public var rating: Int? {
            get {
              return resultMap["rating"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "rating")
            }
          }

          public var date: String? {
            get {
              return resultMap["date"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "date")
            }
          }

          public var photoUrl: String? {
            get {
              return resultMap["photoUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photoUrl")
            }
          }

          public var photoThumbnailUrl: String? {
            get {
              return resultMap["photoThumbnailUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "photoThumbnailUrl")
            }
          }
        }
      }
    }
  }
}