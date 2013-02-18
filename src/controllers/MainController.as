package controllers {
    import enums.GameStates;
    import enums.ScaffoldStates;
    import events.GameKeyboardEvent;
    import events.ModelEvent;
    import flash.events.MouseEvent;
    import models.MainModel;
    import utils.SoundManager;
    import utils.WordsDictionary;
    import views.MainView;

    public class MainController {

        private var model:MainModel;
        private var view:MainView;

        public function MainController(view:MainView, model:MainModel) {
            init(view, model);
        }

        private function init(view:MainView, model:MainModel):void {
            this.view = view;
            this.model = model;


            addListeners();

            this.model.state = GameStates.LAUNCH;
        }

        private function addListeners():void {
            view.startButton.addEventListener(MouseEvent.CLICK, onStart);
            view.keyboard.addEventListener(GameKeyboardEvent.KEY_PRESSED, onKeyboardPress);
            model.addEventListener(ModelEvent.STATE_CHANGE, onGameStateChange);
        }

        private function onGameStateChange(event:ModelEvent):void {
            setAllInvisible();

            switch (event.state) {
                case GameStates.LAUNCH:
                    view.tutorial.visible = true;
                    view.startButton.visible = true;
                    break;
                case GameStates.GAME_LOOP:
                    view.wordToGuess.visible = true;
                    view.keyboard.visible = true;
                    view.scaffold.visible = true;
                    view.scaffold.state = ScaffoldStates.NONE;
                    break;
                case GameStates.GAME_LOST:
                    view.scaffold.visible = true;
                    view.scaffold.state = ScaffoldStates.LOST;
                    view.startButton.visible = true;
                    view.updateScore(model.won, model.lost);
                    break;
                case GameStates.GAME_WON:
                    view.gameWon.visible = true;
                    view.startButton.visible = true;
                    view.updateScore(model.won, model.lost);
                    break;
            }
        }

        private function onStart(event:MouseEvent):void {
            model.state = GameStates.GAME_LOOP;
            reset();
            pickWord();
        }

        private function pickWord():void {
            if (!model.words.length) {
                model.words = WordsDictionary.words.concat();
            }

            if (!model.words.length) {
                throw new Error('Dictionary must not be empty');
            }

            var index:uint = Math.round(Math.random() * (model.words.length - 1));
            var word:String = model.words[index];
            model.words.splice(index, 1);
            model.word = word;
            view.wordToGuess.word = word;
        }

        private function setAllInvisible():void {
            if (view && view.guiElements.length) {
                for (var i:uint = 0; i < view.guiElements.length; i++) {
                    view.guiElements[i].visible = false;
                }
            }
        }

        private function removeListeners():void {
            view.startButton.removeEventListener(MouseEvent.CLICK, onStart);
            view.keyboard.removeEventListener(GameKeyboardEvent.KEY_PRESSED, onKeyboardPress)
            model.removeEventListener(ModelEvent.STATE_CHANGE, onGameStateChange);
        }

        private function onKeyboardPress(event:GameKeyboardEvent):void {
            var char:String = String.fromCharCode(event.charCode);
            var word:String = model.word;
            if (word.indexOf(char) != -1) {
                var i:int = -1;
                var end:Boolean;
                while (!end && word.indexOf(char, i + 1) != -1) {
                    i = word.indexOf(char, i + 1);
                    if (i == word.length - 1) {
                        end = true;
                    }
                    if (!view.wordToGuess.openChar(i)) {
                        model.openedLetters++;
                    }
                }
                if (model.openedLetters == word.length) {
                    //WON
                    view.updateScore(++model.won, model.lost);
                    view.scaffold.state = ScaffoldStates.NONE;
                    model.state = GameStates.GAME_WON;
                    SoundManager.playSound(SoundManager.WON_SOUND);
                }
            } else {
                if (model.wrongTurnCount == MainModel.MAX_WRONG_TURNS) {
                    //LOST
                    view.updateScore(model.won, ++model.lost);
                    view.scaffold.state = ScaffoldStates.LOST;
                    model.state = GameStates.GAME_LOST;
                    SoundManager.playSound(SoundManager.LOST_SOUND);
                } else {
                    view.scaffold.setStateAsInt(++model.wrongTurnCount);
                }
            }


        }

        private function reset():void {
            model.wrongTurnCount = 0;
            view.scaffold.state = ScaffoldStates.NONE;
            model.openedLetters = 0;
        }

        public function dispose():void {
            removeListeners();
        }
    }
}
