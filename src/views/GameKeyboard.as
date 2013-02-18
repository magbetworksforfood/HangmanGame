package views {
    import events.GameKeyboardEvent;

    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class GameKeyboard extends Sprite {

        private var alphabet:Vector.<String> = new <String>[
            'а',
            'б',
            'в',
            'г',
            'д',
            'е',
            'ж',
            'з',
            'и',
            'й',
            'к',
            'л',
            'м',
            'н',
            'о',
            'п',
            'р',
            'с',
            'т',
            'у',
            'ф',
            'х',
            'ц',
            'ч',
            'ш',
            'щ',
            'ъ',
            'ы',
            'ь',
            'э',
            'ю',
            'я'
        ];

        private static const H_GAP:Number = 5;
        private static const V_GAP:Number = 5;

        private static const MAX_COLS:uint = 8;

        public function GameKeyboard() {
            init();
        }

        private function init():void {
            createChildren();
        }

        private function createChildren():void {
            var length:uint = alphabet.length;
            for (var i:int = 0; i < length; i++) {
                var button:KeyboardButton = new KeyboardButton(alphabet[i].charCodeAt());
                button.x = (KeyboardButton.WIDTH + H_GAP) * (i % MAX_COLS);
                button.y = (KeyboardButton.HEIGHT + V_GAP) * Math.floor(i / MAX_COLS);
                button.addEventListener(MouseEvent.CLICK, onClick);
                addChild(button);
            }
        }

        private function onClick(event:MouseEvent):void {
            var button:KeyboardButton = KeyboardButton(event.currentTarget);
            dispatchEvent(new GameKeyboardEvent(GameKeyboardEvent.KEY_PRESSED, button.charCode));
        }

        public function dispose():void {
            for (var i:int = 0; i < numChildren; i++) {
                var button:KeyboardButton = KeyboardButton(getChildAt(i));
                if (button.hasEventListener(MouseEvent.CLICK)) {
                    button.removeEventListener(MouseEvent.CLICK, onClick);
                }
            }
        }
    }
}
