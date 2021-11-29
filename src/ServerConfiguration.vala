namespace Bulu {
    class ServerConfiguration {
        InetAddress address { get; private set; }
        uint16 port { get; private set; }
        Bulu.Router router { get; private set; }

        internal ServerConfiguration (InetAddress address, uint16 port, Bulu.Router router) {
            this.address = address;
            this.port = port;
            this.router = router;
        }
    }
}
