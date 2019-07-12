//  This file was automatically generated and should not be edited.

import Apollo

public final class SearchLocationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query searchLocations($query: String!) {\n  searchLocations(query: $query) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        name\n        yearOfIncorporation\n        subCategoryName\n        street\n        phone\n        bizUrl\n        ownerName\n        ownerEmail\n        yearOfIncorporation\n        locationPhotos {\n          __typename\n          url\n        }\n      }\n    }\n  }\n}"

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

          public init(name: String, yearOfIncorporation: Int? = nil, subCategoryName: String, street: String, phone: String, bizUrl: String? = nil, ownerName: String? = nil, ownerEmail: String? = nil, locationPhotos: [LocationPhoto?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LocationSummary", "name": name, "yearOfIncorporation": yearOfIncorporation, "subCategoryName": subCategoryName, "street": street, "phone": phone, "bizUrl": bizUrl, "ownerName": ownerName, "ownerEmail": ownerEmail, "locationPhotos": locationPhotos.flatMap { (value: [LocationPhoto?]) -> [ResultMap?] in value.map { (value: LocationPhoto?) -> ResultMap? in value.flatMap { (value: LocationPhoto) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "LocationPhoto", "url": url])
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
          }
        }
      }
    }
  }
}