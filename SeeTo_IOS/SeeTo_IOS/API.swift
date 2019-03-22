//  This file was automatically generated and should not be edited.

import Apollo

/// An enumeration.
public enum Type: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case infinity
  case standard
  case hard
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "INFINITY": self = .infinity
      case "STANDARD": self = .standard
      case "HARD": self = .hard
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .infinity: return "INFINITY"
      case .standard: return "STANDARD"
      case .hard: return "HARD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Type, rhs: Type) -> Bool {
    switch (lhs, rhs) {
      case (.infinity, .infinity): return true
      case (.standard, .standard): return true
      case (.hard, .hard): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class TodoMainQuery: GraphQLQuery {
  public let operationDefinition =
    "query TodoMain($token: String, $orderBy: String) {\n  todo(token: $token, orderBy: $orderBy) {\n    __typename\n    ... on ToDoField {\n      title\n      type\n      createdAt\n      id\n      milestones {\n        __typename\n        id\n        name\n        isCompleted\n      }\n      expiration\n      isCompleted\n    }\n  }\n}"

  public var token: String?
  public var orderBy: String?

  public init(token: String? = nil, orderBy: String? = nil) {
    self.token = token
    self.orderBy = orderBy
  }

  public var variables: GraphQLMap? {
    return ["token": token, "orderBy": orderBy]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("todo", arguments: ["token": GraphQLVariable("token"), "orderBy": GraphQLVariable("orderBy")], type: .list(.object(Todo.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(todo: [Todo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "todo": todo.flatMap { (value: [Todo?]) -> [ResultMap?] in value.map { (value: Todo?) -> ResultMap? in value.flatMap { (value: Todo) -> ResultMap in value.resultMap } } }])
    }

    public var todo: [Todo?]? {
      get {
        return (resultMap["todo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Todo?] in value.map { (value: ResultMap?) -> Todo? in value.flatMap { (value: ResultMap) -> Todo in Todo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Todo?]) -> [ResultMap?] in value.map { (value: Todo?) -> ResultMap? in value.flatMap { (value: Todo) -> ResultMap in value.resultMap } } }, forKey: "todo")
      }
    }

    public struct Todo: GraphQLSelectionSet {
      public static let possibleTypes = ["ResponseMessageField", "AuthInfoField", "ToDoField"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["ToDoField": AsToDoField.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeResponseMessageField() -> Todo {
        return Todo(unsafeResultMap: ["__typename": "ResponseMessageField"])
      }

      public static func makeAuthInfoField() -> Todo {
        return Todo(unsafeResultMap: ["__typename": "AuthInfoField"])
      }

      public static func makeToDoField(title: String? = nil, type: String? = nil, createdAt: String? = nil, id: String? = nil, milestones: [AsToDoField.Milestone?]? = nil, expiration: String? = nil, isCompleted: Bool? = nil) -> Todo {
        return Todo(unsafeResultMap: ["__typename": "ToDoField", "title": title, "type": type, "createdAt": createdAt, "id": id, "milestones": milestones.flatMap { (value: [AsToDoField.Milestone?]) -> [ResultMap?] in value.map { (value: AsToDoField.Milestone?) -> ResultMap? in value.flatMap { (value: AsToDoField.Milestone) -> ResultMap in value.resultMap } } }, "expiration": expiration, "isCompleted": isCompleted])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asToDoField: AsToDoField? {
        get {
          if !AsToDoField.possibleTypes.contains(__typename) { return nil }
          return AsToDoField(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsToDoField: GraphQLSelectionSet {
        public static let possibleTypes = ["ToDoField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("milestones", type: .list(.object(Milestone.selections))),
          GraphQLField("expiration", type: .scalar(String.self)),
          GraphQLField("isCompleted", type: .scalar(Bool.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, type: String? = nil, createdAt: String? = nil, id: String? = nil, milestones: [Milestone?]? = nil, expiration: String? = nil, isCompleted: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "ToDoField", "title": title, "type": type, "createdAt": createdAt, "id": id, "milestones": milestones.flatMap { (value: [Milestone?]) -> [ResultMap?] in value.map { (value: Milestone?) -> ResultMap? in value.flatMap { (value: Milestone) -> ResultMap in value.resultMap } } }, "expiration": expiration, "isCompleted": isCompleted])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var milestones: [Milestone?]? {
          get {
            return (resultMap["milestones"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Milestone?] in value.map { (value: ResultMap?) -> Milestone? in value.flatMap { (value: ResultMap) -> Milestone in Milestone(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Milestone?]) -> [ResultMap?] in value.map { (value: Milestone?) -> ResultMap? in value.flatMap { (value: Milestone) -> ResultMap in value.resultMap } } }, forKey: "milestones")
          }
        }

        public var expiration: String? {
          get {
            return resultMap["expiration"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expiration")
          }
        }

        public var isCompleted: Bool? {
          get {
            return resultMap["isCompleted"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCompleted")
          }
        }

        public struct Milestone: GraphQLSelectionSet {
          public static let possibleTypes = ["MilestoneField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("isCompleted", type: .scalar(Bool.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, isCompleted: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "MilestoneField", "id": id, "name": name, "isCompleted": isCompleted])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var isCompleted: Bool? {
            get {
              return resultMap["isCompleted"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isCompleted")
            }
          }
        }
      }
    }
  }
}

public final class NewTodoMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation NewTodo($title: String, $token: String, $milestones: [String], $type: Type, $expiration: Date) {\n  newTodo(title: $title, token: $token, milestones: $milestones, type: $type, expiration: $expiration) {\n    __typename\n    result {\n      __typename\n      ... on ResponseMessageField {\n        isSuccess\n        message\n      }\n    }\n  }\n}"

  public var title: String?
  public var token: String?
  public var milestones: [String?]?
  public var type: Type?
  public var expiration: String?

  public init(title: String? = nil, token: String? = nil, milestones: [String?]? = nil, type: Type? = nil, expiration: String? = nil) {
    self.title = title
    self.token = token
    self.milestones = milestones
    self.type = type
    self.expiration = expiration
  }

  public var variables: GraphQLMap? {
    return ["title": title, "token": token, "milestones": milestones, "type": type, "expiration": expiration]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("newTodo", arguments: ["title": GraphQLVariable("title"), "token": GraphQLVariable("token"), "milestones": GraphQLVariable("milestones"), "type": GraphQLVariable("type"), "expiration": GraphQLVariable("expiration")], type: .object(NewTodo.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newTodo: NewTodo? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "newTodo": newTodo.flatMap { (value: NewTodo) -> ResultMap in value.resultMap }])
    }

    public var newTodo: NewTodo? {
      get {
        return (resultMap["newTodo"] as? ResultMap).flatMap { NewTodo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "newTodo")
      }
    }

    public struct NewTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["NewToDoMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("result", type: .object(Result.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "NewToDoMutation", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes = ["ResponseMessageField", "AuthInfoField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["ResponseMessageField": AsResponseMessageField.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeAuthInfoField() -> Result {
          return Result(unsafeResultMap: ["__typename": "AuthInfoField"])
        }

        public static func makeResponseMessageField(isSuccess: Bool? = nil, message: String? = nil) -> Result {
          return Result(unsafeResultMap: ["__typename": "ResponseMessageField", "isSuccess": isSuccess, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asResponseMessageField: AsResponseMessageField? {
          get {
            if !AsResponseMessageField.possibleTypes.contains(__typename) { return nil }
            return AsResponseMessageField(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsResponseMessageField: GraphQLSelectionSet {
          public static let possibleTypes = ["ResponseMessageField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isSuccess", type: .scalar(Bool.self)),
            GraphQLField("message", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(isSuccess: Bool? = nil, message: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ResponseMessageField", "isSuccess": isSuccess, "message": message])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var isSuccess: Bool? {
            get {
              return resultMap["isSuccess"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isSuccess")
            }
          }

          public var message: String? {
            get {
              return resultMap["message"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }
        }
      }
    }
  }
}

public final class AuthMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Auth($password: String, $email: String) {\n  auth(password: $password, email: $email) {\n    __typename\n    ... on AuthMutation {\n      result {\n        __typename\n        ... on AuthField {\n          accessToken\n          refreshToken\n          message\n        }\n      }\n    }\n  }\n}"

  public var password: String?
  public var email: String?

  public init(password: String? = nil, email: String? = nil) {
    self.password = password
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["password": password, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("auth", arguments: ["password": GraphQLVariable("password"), "email": GraphQLVariable("email")], type: .object(Auth.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(auth: Auth? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "auth": auth.flatMap { (value: Auth) -> ResultMap in value.resultMap }])
    }

    public var auth: Auth? {
      get {
        return (resultMap["auth"] as? ResultMap).flatMap { Auth(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "auth")
      }
    }

    public struct Auth: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("result", type: .object(Result.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthMutation", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes = ["AuthField", "ResponseMessageField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["AuthField": AsAuthField.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeResponseMessageField() -> Result {
          return Result(unsafeResultMap: ["__typename": "ResponseMessageField"])
        }

        public static func makeAuthField(accessToken: String? = nil, refreshToken: String? = nil, message: String? = nil) -> Result {
          return Result(unsafeResultMap: ["__typename": "AuthField", "accessToken": accessToken, "refreshToken": refreshToken, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asAuthField: AsAuthField? {
          get {
            if !AsAuthField.possibleTypes.contains(__typename) { return nil }
            return AsAuthField(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsAuthField: GraphQLSelectionSet {
          public static let possibleTypes = ["AuthField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .scalar(String.self)),
            GraphQLField("refreshToken", type: .scalar(String.self)),
            GraphQLField("message", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(accessToken: String? = nil, refreshToken: String? = nil, message: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "AuthField", "accessToken": accessToken, "refreshToken": refreshToken, "message": message])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var accessToken: String? {
            get {
              return resultMap["accessToken"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "accessToken")
            }
          }

          public var refreshToken: String? {
            get {
              return resultMap["refreshToken"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "refreshToken")
            }
          }

          public var message: String? {
            get {
              return resultMap["message"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }
        }
      }
    }
  }
}

public final class RegisterMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Register($email: String, $username: String, $password: String) {\n  register(email: $email, username: $username, password: $password) {\n    __typename\n    isSuccess\n    message\n  }\n}"

  public var email: String?
  public var username: String?
  public var password: String?

  public init(email: String? = nil, username: String? = nil, password: String? = nil) {
    self.email = email
    self.username = username
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "username": username, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("register", arguments: ["email": GraphQLVariable("email"), "username": GraphQLVariable("username"), "password": GraphQLVariable("password")], type: .object(Register.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(register: Register? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "register": register.flatMap { (value: Register) -> ResultMap in value.resultMap }])
    }

    public var register: Register? {
      get {
        return (resultMap["register"] as? ResultMap).flatMap { Register(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "register")
      }
    }

    public struct Register: GraphQLSelectionSet {
      public static let possibleTypes = ["RegisterMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("isSuccess", type: .scalar(Bool.self)),
        GraphQLField("message", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(isSuccess: Bool? = nil, message: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "RegisterMutation", "isSuccess": isSuccess, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var isSuccess: Bool? {
        get {
          return resultMap["isSuccess"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isSuccess")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }
    }
  }
}

public final class NewIdeaMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation NewIdea($category: String, $token: String, $body: String, $title: String) {\n  newIdea(category: $category, token: $token, body: $body, title: $title) {\n    __typename\n    ... on NewIdeaMutation {\n      result {\n        __typename\n        ... on ResponseMessageField {\n          isSuccess\n          message\n        }\n      }\n    }\n  }\n}"

  public var category: String?
  public var token: String?
  public var body: String?
  public var title: String?

  public init(category: String? = nil, token: String? = nil, body: String? = nil, title: String? = nil) {
    self.category = category
    self.token = token
    self.body = body
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["category": category, "token": token, "body": body, "title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("newIdea", arguments: ["category": GraphQLVariable("category"), "token": GraphQLVariable("token"), "body": GraphQLVariable("body"), "title": GraphQLVariable("title")], type: .object(NewIdea.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newIdea: NewIdea? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "newIdea": newIdea.flatMap { (value: NewIdea) -> ResultMap in value.resultMap }])
    }

    public var newIdea: NewIdea? {
      get {
        return (resultMap["newIdea"] as? ResultMap).flatMap { NewIdea(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "newIdea")
      }
    }

    public struct NewIdea: GraphQLSelectionSet {
      public static let possibleTypes = ["NewIdeaMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("result", type: .object(Result.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "NewIdeaMutation", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes = ["ResponseMessageField", "AuthInfoField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["ResponseMessageField": AsResponseMessageField.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeAuthInfoField() -> Result {
          return Result(unsafeResultMap: ["__typename": "AuthInfoField"])
        }

        public static func makeResponseMessageField(isSuccess: Bool? = nil, message: String? = nil) -> Result {
          return Result(unsafeResultMap: ["__typename": "ResponseMessageField", "isSuccess": isSuccess, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asResponseMessageField: AsResponseMessageField? {
          get {
            if !AsResponseMessageField.possibleTypes.contains(__typename) { return nil }
            return AsResponseMessageField(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsResponseMessageField: GraphQLSelectionSet {
          public static let possibleTypes = ["ResponseMessageField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isSuccess", type: .scalar(Bool.self)),
            GraphQLField("message", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(isSuccess: Bool? = nil, message: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ResponseMessageField", "isSuccess": isSuccess, "message": message])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var isSuccess: Bool? {
            get {
              return resultMap["isSuccess"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isSuccess")
            }
          }

          public var message: String? {
            get {
              return resultMap["message"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }
        }
      }
    }
  }
}

public final class TimelineMainQuery: GraphQLQuery {
  public let operationDefinition =
    "query timelineMain($token: String, $date: Date) {\n  timeline(token: $token, date: $date) {\n    __typename\n    ... on TimeLineField {\n      todo {\n        __typename\n        ... on ToDoReviewField {\n          newCreate\n          todoComplete\n          totalPoint\n          milestoneComplete\n        }\n      }\n      ideas {\n        __typename\n        ... on IdeasReviewField {\n          newVote\n          newComment\n          newCreate\n          totalPoint\n        }\n      }\n      date\n      totalPoint\n    }\n  }\n}"

  public var token: String?
  public var date: String?

  public init(token: String? = nil, date: String? = nil) {
    self.token = token
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["token": token, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("timeline", arguments: ["token": GraphQLVariable("token"), "date": GraphQLVariable("date")], type: .object(Timeline.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(timeline: Timeline? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "timeline": timeline.flatMap { (value: Timeline) -> ResultMap in value.resultMap }])
    }

    public var timeline: Timeline? {
      get {
        return (resultMap["timeline"] as? ResultMap).flatMap { Timeline(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "timeline")
      }
    }

    public struct Timeline: GraphQLSelectionSet {
      public static let possibleTypes = ["ResponseMessageField", "AuthInfoField", "TimeLineField"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["TimeLineField": AsTimeLineField.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeResponseMessageField() -> Timeline {
        return Timeline(unsafeResultMap: ["__typename": "ResponseMessageField"])
      }

      public static func makeAuthInfoField() -> Timeline {
        return Timeline(unsafeResultMap: ["__typename": "AuthInfoField"])
      }

      public static func makeTimeLineField(todo: AsTimeLineField.Todo? = nil, ideas: AsTimeLineField.Idea? = nil, date: String? = nil, totalPoint: Int? = nil) -> Timeline {
        return Timeline(unsafeResultMap: ["__typename": "TimeLineField", "todo": todo.flatMap { (value: AsTimeLineField.Todo) -> ResultMap in value.resultMap }, "ideas": ideas.flatMap { (value: AsTimeLineField.Idea) -> ResultMap in value.resultMap }, "date": date, "totalPoint": totalPoint])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asTimeLineField: AsTimeLineField? {
        get {
          if !AsTimeLineField.possibleTypes.contains(__typename) { return nil }
          return AsTimeLineField(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsTimeLineField: GraphQLSelectionSet {
        public static let possibleTypes = ["TimeLineField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("todo", type: .object(Todo.selections)),
          GraphQLField("ideas", type: .object(Idea.selections)),
          GraphQLField("date", type: .scalar(String.self)),
          GraphQLField("totalPoint", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(todo: Todo? = nil, ideas: Idea? = nil, date: String? = nil, totalPoint: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeLineField", "todo": todo.flatMap { (value: Todo) -> ResultMap in value.resultMap }, "ideas": ideas.flatMap { (value: Idea) -> ResultMap in value.resultMap }, "date": date, "totalPoint": totalPoint])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var todo: Todo? {
          get {
            return (resultMap["todo"] as? ResultMap).flatMap { Todo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "todo")
          }
        }

        public var ideas: Idea? {
          get {
            return (resultMap["ideas"] as? ResultMap).flatMap { Idea(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ideas")
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

        public var totalPoint: Int? {
          get {
            return resultMap["totalPoint"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPoint")
          }
        }

        public struct Todo: GraphQLSelectionSet {
          public static let possibleTypes = ["ToDoReviewField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("newCreate", type: .scalar(Int.self)),
            GraphQLField("todoComplete", type: .scalar(Int.self)),
            GraphQLField("totalPoint", type: .scalar(Int.self)),
            GraphQLField("milestoneComplete", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(newCreate: Int? = nil, todoComplete: Int? = nil, totalPoint: Int? = nil, milestoneComplete: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "ToDoReviewField", "newCreate": newCreate, "todoComplete": todoComplete, "totalPoint": totalPoint, "milestoneComplete": milestoneComplete])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var newCreate: Int? {
            get {
              return resultMap["newCreate"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "newCreate")
            }
          }

          public var todoComplete: Int? {
            get {
              return resultMap["todoComplete"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "todoComplete")
            }
          }

          public var totalPoint: Int? {
            get {
              return resultMap["totalPoint"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalPoint")
            }
          }

          public var milestoneComplete: Int? {
            get {
              return resultMap["milestoneComplete"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "milestoneComplete")
            }
          }
        }

        public struct Idea: GraphQLSelectionSet {
          public static let possibleTypes = ["IdeasReviewField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("newVote", type: .scalar(Int.self)),
            GraphQLField("newComment", type: .scalar(Int.self)),
            GraphQLField("newCreate", type: .scalar(Int.self)),
            GraphQLField("totalPoint", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(newVote: Int? = nil, newComment: Int? = nil, newCreate: Int? = nil, totalPoint: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "IdeasReviewField", "newVote": newVote, "newComment": newComment, "newCreate": newCreate, "totalPoint": totalPoint])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var newVote: Int? {
            get {
              return resultMap["newVote"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "newVote")
            }
          }

          public var newComment: Int? {
            get {
              return resultMap["newComment"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "newComment")
            }
          }

          public var newCreate: Int? {
            get {
              return resultMap["newCreate"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "newCreate")
            }
          }

          public var totalPoint: Int? {
            get {
              return resultMap["totalPoint"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalPoint")
            }
          }
        }
      }
    }
  }
}

public final class SimpleProfileQuery: GraphQLQuery {
  public let operationDefinition =
    "query simpleProfile($token: String) {\n  profile(token: $token) {\n    __typename\n    ... on ProfileField {\n      imgPath\n      email\n      username\n      rank\n      point\n      registerOn\n    }\n  }\n}"

  public var token: String?

  public init(token: String? = nil) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("profile", arguments: ["token": GraphQLVariable("token")], type: .object(Profile.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profile: Profile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "profile": profile.flatMap { (value: Profile) -> ResultMap in value.resultMap }])
    }

    public var profile: Profile? {
      get {
        return (resultMap["profile"] as? ResultMap).flatMap { Profile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profile")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes = ["ResponseMessageField", "AuthInfoField", "ProfileField"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["ProfileField": AsProfileField.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeResponseMessageField() -> Profile {
        return Profile(unsafeResultMap: ["__typename": "ResponseMessageField"])
      }

      public static func makeAuthInfoField() -> Profile {
        return Profile(unsafeResultMap: ["__typename": "AuthInfoField"])
      }

      public static func makeProfileField(imgPath: String? = nil, email: String? = nil, username: String? = nil, rank: Int? = nil, point: Int? = nil, registerOn: String? = nil) -> Profile {
        return Profile(unsafeResultMap: ["__typename": "ProfileField", "imgPath": imgPath, "email": email, "username": username, "rank": rank, "point": point, "registerOn": registerOn])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asProfileField: AsProfileField? {
        get {
          if !AsProfileField.possibleTypes.contains(__typename) { return nil }
          return AsProfileField(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsProfileField: GraphQLSelectionSet {
        public static let possibleTypes = ["ProfileField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("imgPath", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("username", type: .scalar(String.self)),
          GraphQLField("rank", type: .scalar(Int.self)),
          GraphQLField("point", type: .scalar(Int.self)),
          GraphQLField("registerOn", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(imgPath: String? = nil, email: String? = nil, username: String? = nil, rank: Int? = nil, point: Int? = nil, registerOn: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProfileField", "imgPath": imgPath, "email": email, "username": username, "rank": rank, "point": point, "registerOn": registerOn])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var imgPath: String? {
          get {
            return resultMap["imgPath"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "imgPath")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var username: String? {
          get {
            return resultMap["username"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var rank: Int? {
          get {
            return resultMap["rank"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rank")
          }
        }

        public var point: Int? {
          get {
            return resultMap["point"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "point")
          }
        }

        public var registerOn: String? {
          get {
            return resultMap["registerOn"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "registerOn")
          }
        }
      }
    }
  }
}

public final class RefreshMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Refresh($token: String) {\n  refresh(refreshToken: $token) {\n    __typename\n    ... on RefreshMutation {\n      result {\n        __typename\n        ... on RefreshField {\n          accessToken\n          message\n        }\n      }\n    }\n  }\n}"

  public var token: String?

  public init(token: String? = nil) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("refresh", arguments: ["refreshToken": GraphQLVariable("token")], type: .object(Refresh.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(refresh: Refresh? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "refresh": refresh.flatMap { (value: Refresh) -> ResultMap in value.resultMap }])
    }

    public var refresh: Refresh? {
      get {
        return (resultMap["refresh"] as? ResultMap).flatMap { Refresh(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "refresh")
      }
    }

    public struct Refresh: GraphQLSelectionSet {
      public static let possibleTypes = ["RefreshMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("result", type: .object(Result.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: Result? = nil) {
        self.init(unsafeResultMap: ["__typename": "RefreshMutation", "result": result.flatMap { (value: Result) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: Result? {
        get {
          return (resultMap["result"] as? ResultMap).flatMap { Result(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "result")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes = ["RefreshField", "AuthInfoField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["RefreshField": AsRefreshField.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeAuthInfoField() -> Result {
          return Result(unsafeResultMap: ["__typename": "AuthInfoField"])
        }

        public static func makeRefreshField(accessToken: String? = nil, message: String? = nil) -> Result {
          return Result(unsafeResultMap: ["__typename": "RefreshField", "accessToken": accessToken, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asRefreshField: AsRefreshField? {
          get {
            if !AsRefreshField.possibleTypes.contains(__typename) { return nil }
            return AsRefreshField(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRefreshField: GraphQLSelectionSet {
          public static let possibleTypes = ["RefreshField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .scalar(String.self)),
            GraphQLField("message", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(accessToken: String? = nil, message: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "RefreshField", "accessToken": accessToken, "message": message])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var accessToken: String? {
            get {
              return resultMap["accessToken"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "accessToken")
            }
          }

          public var message: String? {
            get {
              return resultMap["message"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }
        }
      }
    }
  }
}

public final class IdeasMainQuery: GraphQLQuery {
  public let operationDefinition =
    "query ideasMain($token: String, $page: Int) {\n  ideas(token: $token, startRank: $page) {\n    __typename\n    ... on IdeasField {\n      id\n      author\n      title\n      body\n      createdAt\n      category\n      voteChecked\n      comments {\n        __typename\n        commentCount\n        comments {\n          __typename\n          author\n          body\n        }\n      }\n      upvoter\n    }\n  }\n}"

  public var token: String?
  public var page: Int?

  public init(token: String? = nil, page: Int? = nil) {
    self.token = token
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["token": token, "page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("ideas", arguments: ["token": GraphQLVariable("token"), "startRank": GraphQLVariable("page")], type: .list(.object(Idea.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(ideas: [Idea?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "ideas": ideas.flatMap { (value: [Idea?]) -> [ResultMap?] in value.map { (value: Idea?) -> ResultMap? in value.flatMap { (value: Idea) -> ResultMap in value.resultMap } } }])
    }

    public var ideas: [Idea?]? {
      get {
        return (resultMap["ideas"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Idea?] in value.map { (value: ResultMap?) -> Idea? in value.flatMap { (value: ResultMap) -> Idea in Idea(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Idea?]) -> [ResultMap?] in value.map { (value: Idea?) -> ResultMap? in value.flatMap { (value: Idea) -> ResultMap in value.resultMap } } }, forKey: "ideas")
      }
    }

    public struct Idea: GraphQLSelectionSet {
      public static let possibleTypes = ["ResponseMessageField", "AuthInfoField", "IdeasField"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["IdeasField": AsIdeasField.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeResponseMessageField() -> Idea {
        return Idea(unsafeResultMap: ["__typename": "ResponseMessageField"])
      }

      public static func makeAuthInfoField() -> Idea {
        return Idea(unsafeResultMap: ["__typename": "AuthInfoField"])
      }

      public static func makeIdeasField(id: String? = nil, author: String? = nil, title: String? = nil, body: String? = nil, createdAt: String? = nil, category: String? = nil, voteChecked: Bool? = nil, comments: AsIdeasField.Comment? = nil, upvoter: Int? = nil) -> Idea {
        return Idea(unsafeResultMap: ["__typename": "IdeasField", "id": id, "author": author, "title": title, "body": body, "createdAt": createdAt, "category": category, "voteChecked": voteChecked, "comments": comments.flatMap { (value: AsIdeasField.Comment) -> ResultMap in value.resultMap }, "upvoter": upvoter])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asIdeasField: AsIdeasField? {
        get {
          if !AsIdeasField.possibleTypes.contains(__typename) { return nil }
          return AsIdeasField(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsIdeasField: GraphQLSelectionSet {
        public static let possibleTypes = ["IdeasField"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("author", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("body", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("category", type: .scalar(String.self)),
          GraphQLField("voteChecked", type: .scalar(Bool.self)),
          GraphQLField("comments", type: .object(Comment.selections)),
          GraphQLField("upvoter", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, author: String? = nil, title: String? = nil, body: String? = nil, createdAt: String? = nil, category: String? = nil, voteChecked: Bool? = nil, comments: Comment? = nil, upvoter: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "IdeasField", "id": id, "author": author, "title": title, "body": body, "createdAt": createdAt, "category": category, "voteChecked": voteChecked, "comments": comments.flatMap { (value: Comment) -> ResultMap in value.resultMap }, "upvoter": upvoter])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var author: String? {
          get {
            return resultMap["author"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "author")
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

        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var category: String? {
          get {
            return resultMap["category"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "category")
          }
        }

        public var voteChecked: Bool? {
          get {
            return resultMap["voteChecked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "voteChecked")
          }
        }

        public var comments: Comment? {
          get {
            return (resultMap["comments"] as? ResultMap).flatMap { Comment(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "comments")
          }
        }

        public var upvoter: Int? {
          get {
            return resultMap["upvoter"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "upvoter")
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["CommentResultField"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("commentCount", type: .scalar(Int.self)),
            GraphQLField("comments", type: .list(.object(Comment.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(commentCount: Int? = nil, comments: [Comment?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "CommentResultField", "commentCount": commentCount, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var commentCount: Int? {
            get {
              return resultMap["commentCount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "commentCount")
            }
          }

          public var comments: [Comment?]? {
            get {
              return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
            }
          }

          public struct Comment: GraphQLSelectionSet {
            public static let possibleTypes = ["CommentField"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("author", type: .scalar(String.self)),
              GraphQLField("body", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(author: String? = nil, body: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "CommentField", "author": author, "body": body])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var author: String? {
              get {
                return resultMap["author"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "author")
              }
            }

            public var body: String? {
              get {
                return resultMap["body"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "body")
              }
            }
          }
        }
      }
    }
  }
}