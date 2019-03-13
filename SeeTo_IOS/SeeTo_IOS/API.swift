//  This file was automatically generated and should not be edited.

import Apollo

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