package models {
    import events.ModelEvent;

    import flash.events.EventDispatcher;

    public class MainModel extends EventDispatcher {

        private var _state:String;
        public var won:uint;
        public var lost:uint;
        public var word:String;
        public var openedLetters:uint;
        public var wrongTurnCount:uint;
        public var words:Vector.<String> = new <String>[];

        public static const MAX_WRONG_TURNS:uint = 6;

        public function MainModel() {
        }

        public function get state():String {
            return _state;
        }

        public function set state(value:String):void {
            if (_state != value) {
                _state = value;

                dispatchEvent(new ModelEvent(ModelEvent.STATE_CHANGE, _state));
            }


        }
    }
}
