namespace Bulu {
    public class Handler {
        public Bulu.Method method { get; private set; }
        public Bulu.HandlerAction action {get; private set;}

        public Handler (Bulu.Method method, Bulu.HandlerAction handler_action) {
            this.method = method;
            this.action = handler_action;
        }
    }
}
