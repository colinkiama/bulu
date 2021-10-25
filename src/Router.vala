using Gee;

namespace Bulu {
	public class Router : Object {
		public Map<string, Bulu.Handler> route_handlers { get; construct; }

		public Router () {
			Object (route_handlers: route_handlers);
		}

		construct {
			route_handlers = new HashMap<string, Bulu.Handler> ();
		}
	}
}