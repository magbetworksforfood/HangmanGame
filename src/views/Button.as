package views {
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class Button extends Sprite {

        public static const OVER:String = 'over';
        public static const PRESSED:String = 'pressed';
        public static const NORMAL:String = 'normal';

        public function Button() {
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            addEventListener(Event.REMOVED_FROM_STAGE, dispose);

            mouseChildren = false;

            addEventListener(MouseEvent.CLICK, onMouseClick);
            addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            addEventListener(MouseEvent.MOUSE_UP, onMouseUp);

            setState(Button.NORMAL);
        }

        private function onMouseOver(event:MouseEvent):void {
            setState(OVER)
        }

        private function onMouseOut(event:MouseEvent):void {
            setState(NORMAL);
        }

        private function onMouseDown(event:MouseEvent):void {
            setState(PRESSED);
        }

        private function onMouseUp(event:MouseEvent):void {
            setState(OVER);
        }

        private function onMouseClick(event:MouseEvent):void {
            doClick();
        }

        protected function setState(state:String):void {
        }

        private function dispose(event:Event):void {
            removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
            removeEventListener(MouseEvent.CLICK, onMouseClick);
            removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
        }

        protected function doClick():void {
        }
    }
}
