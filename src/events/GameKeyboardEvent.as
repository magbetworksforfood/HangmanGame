package events {
    import flash.events.Event;

    public class GameKeyboardEvent extends Event {

        public static const KEY_PRESSED:String = 'keyPressed';

        public var charCode:uint;

        public function GameKeyboardEvent(type:String, charCode:uint) {
            super(type, false, false);

            this.charCode = charCode;
        }
    }
}
