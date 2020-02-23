import Crypto
import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // public routes
    let userController = UserController()
//    router.post("users", use: userController.create)

    // basic / password auth protected routes
    let basic = router.grouped(User.basicAuthMiddleware(using: BCryptDigest()))
    basic.post("login", use: userController.login)

    // bearer / token auth protected routes
    let bearer = router.grouped(User.tokenAuthMiddleware())
//    bearer.get("users", User.ID.parameter, "bookshelves", use: userController.bookshelves)
//    bearer.get("bookshelves", Bookshelf.ID.parameter, use: bookshelfController.bookshelf)
//    bearer.get("bookshelves", Bookshelf.ID.parameter, "books", use: bookshelfController.books)
//    bearer.post("bookshelves", use: bookshelfController.create)
//    bearer.post("bookshelves", Bookshelf.ID.parameter, "books", use: bookshelfController.add)
}
