package views {
    import flash.display.Sprite;

    public class WordToGuess extends Sprite {

        private var _word:String = '';
        private static const H_GAP:Number = 3;

        public function WordToGuess(word:String = '') {
            init(word);
        }

        private function init(word:String):void {
            this.word = word;
        }


        public function get word():String {
            return _word;
        }

        public function set word(value:String):void {
            _word = value;

            updateChildren();
        }

        private function updateChildren():void {
            if (numChildren) {
                removeChildren(0, numChildren - 1);
            }

            if (_word && _word.length) {
                for (var i:int = 0; i < _word.length; i++) {
                    var letterBox:LetterBox = new LetterBox(_word.charCodeAt(i));
                    letterBox.x = i * (LetterBox.WIDTH + H_GAP);
                    addChild(letterBox);
                }
            }
        }

        /**
         * @return true if already opened
         */
        public function openChar(index:uint):Boolean {
            var result:Boolean;
            if (numChildren && index < numChildren) {
                var letterBox:LetterBox = LetterBox(getChildAt(index));
                result = letterBox.opened
                letterBox.opened = true;
            }

            return result;
        }
    }
}
