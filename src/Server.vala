namespace Bulu {
	public class Server: Soup.Server {
		public Bulu.ServerConfiguration server_configuration { get; construct; }

		/*
		* It's Server time
		* 
		*
		*
		*/
		public Server (ServerConfiguration server_config) {
			Object(server_configuration: server_config);
		}

		construct {
			print ("Constucted Bulu Server!");
		}
	}
}