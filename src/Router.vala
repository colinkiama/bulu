using Gee;

namespace Bulu {
	public class Router : Object {
		private Map<string, Gee.List<Bulu.Handler>> route_handlers;

		public Router () {
			this.route_handlers = new HashMap<string, Gee.List<Bulu.Handler>> ();
		}

		
	}
}