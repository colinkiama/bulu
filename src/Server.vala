namespace Bulu {
    public class Server: Soup.Server {
        Bulu.ServerConfiguration server_configuration { get; private set; }

        /*
        * It's Server time
        *
        *
        *
        */
        public Server (Bulu.Builder.ServerConfigurationBuilder server_config_builder) {
            this.server_configuration = server_config_builder.build ();
        }


    }
}
