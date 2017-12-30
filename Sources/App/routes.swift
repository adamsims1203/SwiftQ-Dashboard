import Routing
import Vapor
import Leaf

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
final class Routes: RouteCollection {
    /// Use this to create any services you may
    /// need for your routes.
    let app: Application
    
    let controllers: [Routable.Type] = [
        LoginController.self,
        OverviewController.self
    ]

    /// Create a new Routes collection with
    /// the supplied application.
    init(app: Application) {
        self.app = app
    }

    /// See RouteCollection.boot
    func boot(router: Router) throws {
        controllers.forEach { controller in
            let map = controller.routeMap()
            map.forEach { router.get($0.path, use: $0.handler) }
        }
    }
}
