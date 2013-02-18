package utils {
    public class Assets {

        [Embed(source="../../assets/images/bg.jpg")]
        public static const background:Class;

        //scaffold states
        [Embed(source="../../assets/images/part1.png")]
        public static const scaffold_1:Class;
        [Embed(source="../../assets/images/part2.png")]
        public static const scaffold_2:Class;
        [Embed(source="../../assets/images/part3.png")]
        public static const scaffold_3:Class;
        [Embed(source="../../assets/images/part4.png")]
        public static const scaffold_4:Class;
        [Embed(source="../../assets/images/part5.png")]
        public static const scaffold_5:Class;
        [Embed(source="../../assets/images/part6.png")]
        public static const scaffold_6:Class;
        [Embed(source="../../assets/images/part7.png")]
        public static const scaffold_7:Class;
        [Embed(source="../../assets/images/hangman.png")]
        public static const hangman:Class;

        //startButton
        [Embed(source="../../assets/images/button.png")]
        public static const buttonNormal:Class;
        [Embed(source="../../assets/images/buttonOn.png")]
        public static const buttonOver:Class;
        [Embed(source="../../assets/images/buttonPressed.png")]
        public static const buttonPressed:Class;

        //sounds
        [Embed(source="../../assets/sounds/click.mp3")]
        public static const clickSound:Class;
        [Embed(source="../../assets/sounds/lose.mp3")]
        public static const loseSound:Class;
        [Embed(source="../../assets/sounds/win.mp3")]
        public static const winSound:Class;

        //fonts
        [Embed(source="../../assets/fonts/MyriadPro-Bold.otf", fontName="MyriadPro", fontStyle="normal", fontWeight="bold", embedAsCFF="false")]
        private static var MyriadPro:Class;
    }
}
