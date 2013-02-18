package events {
    import flash.events.Event;

    public class ModelEvent extends Event {
        public static const STATE_CHANGE:String = 'stateChange';

        public var state:String;

        public function ModelEvent(type:String, state:String):void {
            this.state = state;

            super(type, false, false);
        }
    }
}
