package views {
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.filters.DropShadowFilter;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    import utils.Assets;

    public class MainView extends Sprite {

        public var background:Bitmap;
        public var startButton:Button;
        public var scaffold:ScaffoldView;
        public var wordToGuess:WordToGuess;
        public var title:TextField = new TextField();
        public var keyboard:GameKeyboard;
        public var score:TextField;
        public var tutorial:Tutorial;
        public var gameWon:TextField;

        public var guiElements:Vector.<DisplayObject> = new <DisplayObject>[];

        public function MainView() {
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event):void {
            createChildren();
        }


        private function createChildren():void {
            background = new Assets.background;
            addChild(background);

            scaffold = new ScaffoldView();
            addChild(scaffold);
            guiElements.push(scaffold);

            startButton = new StartButton();
            startButton.x = 100;
            startButton.y = 310;
            //startButton.addEventListener(MouseEvent.CLICK, onStart);
            addChild(startButton);
            guiElements.push(startButton);

            keyboard = new GameKeyboard();
            keyboard.x = 100;
            keyboard.y = 310;
            addChild(keyboard);
            guiElements.push(keyboard);

            wordToGuess = new WordToGuess();
            wordToGuess.x = 10;
            wordToGuess.y = 30;
            addChild(wordToGuess);
            guiElements.push(wordToGuess);

            title = createTextField(22);
            title.text = 'Игра ВИСЕЛИЦА'
            title.width = title.textWidth;
            title.x = 10;
            title.y = 0;
            addChild(title);

            score = createTextField(12);
            updateScore(0, 0);
            addChild(score);

            tutorial = new Tutorial();
            tutorial.x = 15;
            tutorial.y = 50;
            addChild(tutorial);
            guiElements.push(tutorial);

            gameWon = createTextField(22);
            gameWon.text = 'Вы отгадали слово! \n Поздравляем!';
            gameWon.width = gameWon.textWidth;
            gameWon.height = 100;
            gameWon.x = stage.stageWidth - gameWon.width >> 1;
            gameWon.y = 180;
            gameWon.filters = [new DropShadowFilter(2, 30, 0x000000, .75)];
            addChild(gameWon);
            guiElements.push(gameWon);

            var hangman:Bitmap = new Assets.hangman;
            addChild(hangman);
        }

        private function createTextField(size:uint):TextField {
            var textField:TextField = new TextField();
            var textFormat:TextFormat = new TextFormat();
            textFormat.font = 'Arial';
            textFormat.size = size;
            textFormat.color = 0xFFFFFF;
            textFormat.bold = true;
            textFormat.align = TextFormatAlign.CENTER;
            textField.autoSize = TextFieldAutoSize.LEFT;
            textField.selectable = false;
            textField.defaultTextFormat = textFormat;

            return textField;
        }

        public function updateScore(won:uint,  lost:uint):void {
            score.text = 'Выиграно: ' + won +  ' Проиграно: ' + lost;
            score.width = score.textWidth;
            score.x = stage.stageWidth - score.width >> 1;
            score.y = stage.stageHeight - 30;
        }
    }
}
