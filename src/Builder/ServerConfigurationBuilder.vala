namespace Bulu.Builder {
	public class ServerConfigurationBuilder {
		const uint16 DEFAULT_PORT = 6038;

		public uint16 port { get; private set; }
		public InetAddress address { get; private set; }
		public Router router {get; private set; }

		public Bulu.Builder.ServerConfigurationBuilder pick_port (uint16 port) {
			this.port = port;
			return this;
		}

		public Bulu.Builder.ServerConfigurationBuilder pick_address (InetAddress address) {
			this.address = address;
			return this;
		}

		public Bulu.Builder.ServerConfigurationBuilder pick_router (Router router) {
			this.router = router;
			return this;
		}

		internal Bulu.ServerConfiguration build () {
			return new Bulu.ServerConfiguration (
				address,
				port,
				router
			);
		}
	}
}