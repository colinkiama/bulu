using Gee;

namespace Bulu {
	public struct ServerConfiguration {
	    InetAddress address;
	    uint16 port;
	    Map<string, Bulu.Handler> route_handlers;
	}
}