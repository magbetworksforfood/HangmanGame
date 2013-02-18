package utils {
    import flash.media.Sound;

    public class SoundManager {

        public static const CLICK_SOUND:String = 'clickSound';
        public static const WON_SOUND:String = 'winSound';
        public static const LOST_SOUND:String = 'lostSound';

        public static function playSound(soundType:String):void {
            var sound:Sound;
            switch (soundType) {
                case CLICK_SOUND:
                    sound = new Assets.clickSound();
                    break;
                case WON_SOUND:
                    sound = new Assets.winSound();
                    break;
                case LOST_SOUND:
                    sound = new Assets.loseSound();
                    break;
            }

            if (sound) {
                sound.play();
            }
        }
    }
}