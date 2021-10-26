using Gee;

namespace Bulu {
	public class Router {
		private Map<string, Gee.List<Bulu.Handler>> route_handlers;

		public Router () {
			this.route_handlers = new HashMap<string, Gee.List<Bulu.Handler>> ();
		}

		public Router add_route (string path, Bulu.Handler handler) {
			if (!route_handlers.has_key (path)) {
				route_handlers.set (path, new ArrayList<Bulu.Handler> ());
			}
			
			var handler_list = route_handlers.get(path);

			if (handler_list.any_match ((e => e.method == handler.method))) {
				{
					error ("Already defined method: %s in path".printf (
							Bulu.Helpers.MethodHelpers.as_string (handler.method)
						)
					);
				}
			}

			handler_list.add (handler);

			return this;
		}

		
	}
}