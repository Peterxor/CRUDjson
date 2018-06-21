import Vapor


final class UserController{
    func list(req: Request) throws ->Future<[User]>{
        return User.query(on: req).all()
    }
    
    func createUser(req: Request) throws -> Future<User>{
        return try req.content.decode(User.self).flatMap({ user in
            return user.save(on: req)
        })
    }
    
    func update(req: Request) throws -> Future<User>{
        return try req.parameters.next(User.self).flatMap({ user in
            return try req.content.decode(UserForm.self).flatMap({ userform in
                user.username = userform.username
                return user.save(on: req)
            })
        })
    }
}

struct UserForm: Content{
    var username: String
}
