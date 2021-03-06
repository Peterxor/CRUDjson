import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get("users", use: UserController().list)
    router.post("users", use: UserController().createUser)
    router.patch("users", User.parameter, use: UserController().update)
    router.delete("users", User.parameter, use: UserController().delete)
}
