<?php
/**
 * Created by PhpStorm.
 * User: HarryTheOgre
 * Date: 15.04.2016
 * Time: 14:22
 */

namespace AppBundle\Common;

class utility
{

    public static $SEPARATOR = ';;';

    public static $ALPHABET = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0-9');

    /**
     * @param string $str
     * @param string $separator
     * @param bool|true $trim
     * @param string $case
     * @return array|string
     */
    public static function handle_string($str, $separator = ',', $trim = true, $case = '')
    {
        if (!is_string($str)) return false;
        $result = $str;
        if ($trim) $result = trim($str);
        if ($case == 'Upper') $result = strtoupper($result); elseif ($case == 'Lower') $result = strtolower($result);
        if ($separator !== '') {
            $result = explode($separator, $result);
            foreach ($result as &$res) {
                $res = trim($res);
            }
            unset($res);
        }
        return $result;
    }

    /**
     * @param $array
     * @return array|mixed|string
     */
    public static function array_to_string($array, $separator = ', ')
    {
        if (is_array($array)) {
            if (count($array) == 1) return $array[0];
            $result = array_shift($array);
            foreach ($array as $k => $value) {
                $result = $result . $separator . $value;
            }
            return $result;
        } else {
            return $array;
        }
    }

    /**
     * @param $request
     * @param $table
     * @return string
     */
    public static function get_fulltext_search_query_by_request($request, $table)
    {
        $query = "SELECT *, MATCH(`name`) AGAINST('$request' IN BOOLEAN MODE) AS score
                  FROM `compositions` WHERE MATCH(`name`) AGAINST('$request' IN BOOLEAN MODE) ORDER BY score DESC";
        return $query;
    }

    /**
     * @param $path
     * @return string
     */
    public static function makeZipFile($path)
    {

        $zip = new \ZipArchive();

        $fileName = $path . date("_dmY_His") . ".zip";
        $srcDir = $_SERVER['DOCUMENT_ROOT'] . "/" . config::$scoresDir . $path . "/";
        $saveDir = config::getTmpDirServerPath();
        if (file_exists($saveDir . $fileName)) return $fileName;

        if ($zip->open($saveDir . $fileName, \ZIPARCHIVE::CREATE) !== TRUE) {
            die ("Could not open archive");
        }
        $srcFiles = scandir($srcDir);
        foreach ($srcFiles as $file) {
            // ToDo: разобраться с тем, какие расширения пропускать а какие нет.
            if (fnmatch("*.png", $file) or fnmatch("*.jpg", $file)) {
                $zip->addFile($srcDir . $file, $file);
            }
        }
        $zip->close();
        return $fileName;
    }

    /**
     * @param $src_string
     * @return mixed
     */
    public static function delete_multiple_whitespaces($src_string)
    {
        return preg_replace('/\s+/', ' ', $src_string);
    }

    /**
     * @param $src_string
     * @return string
     */
    public static function add_pluses_before_words($src_string)
    {
        $result = self::remove_special_symbols($src_string);
        $result = self::delete_multiple_whitespaces($result);
        $result = self::handle_string($result, ' ', true);
        $q = "";
        foreach ($result as $str) {
            $q .= " +" . $str;
        }
        $q = trim($q);
        return $q;
    }

    /**
     * @param $string
     * @return mixed
     */
    public static function remove_special_symbols($string)
    {
        return preg_replace("/[^a-zA-ZА-Яа-я0-9\s]/", "", $string);
    }

    /**
     * @param $path
     * @return string
     */
    public static function makePdfFile($path)
    {
        $p = new \PDFlib();

        $fileName = $path . date("_dmY_His") . ".pdf";
        $srcDir = $_SERVER['DOCUMENT_ROOT'] . "/" . config::$scoresDir . "$path/";
        $saveDir = config::getTmpDirServerPath();
        if (file_exists($saveDir . $fileName)) return $fileName;


        if (PDF_begin_document($p, $saveDir) == 0) {
            die("Error: " . PDF_get_errmsg($p));
        }


        return $fileName;
    }


    public static function generateRandomString($maxWords)
    {

        $random_words = array("mountainous", "parallel", "upbeat", "imported", "wry", "stage", "defiant", "adamant", "expensive", "way", "robust", "physical", "knit", "volatile", "narrow", "summer", "grandiose", "ablaze", "happen", "brief", "practise", "range", "year", "plan", "rhyme", "belief", "brake", "veil", "exercise", "ripe", "acoustic", "annoy", "madly", "ugly", "steadfast", "development", "cherry", "flowery", "miss", "hug", "spotted", "quilt", "selective", "accessible", "scandalous", "distribution", "guide", "ill-fated", "delay", "erratic", "busy", "drop", "chop", "lock", "price", "clap", "voiceless", "functional", "front", "vengeful", "tug", "force", "foamy", "erect", "strip", "envious", "spare", "lean", "guess", "juvenile", "clam", "save", "purring", "decisive", "owe", "half", "kittens", "income", "troubled", "top", "rotten", "meaty", "alleged", "simple", "shocking", "ants", "careless", "uncovered", "unused", "odd", "tooth", "suspend", "foregoing", "elated", "route", "hop", "defective", "scatter", "addicted", "gigantic", "bake", "move", "unwieldy", "rush", "panoramic", "special", "permissible", "fragile", "hover", "elastic", "float", "frail", "monkey", "lie", "loud", "space", "likeable", "toe", "pest", "abject", "match", "letters", "fretful", "whispering", "end", "matter", "far", "double", "bomb", "boiling", "tail", "flowers", "unsightly", "absent", "womanly", "leather", "time", "easy", "snake", "test", "competition", "amusement", "wink", "acceptable", "crawl", "mask", "sniff", "rub", "books", "middle", "box", "squirrel", "walk", "please", "opposite", "shivering", "humor", "godly", "tasteless", "chin", "questionable", "encouraging", "drum", "extra-large", "grieving", "wax", "afternoon", "superficial", "amuck", "male", "mate", "cool", "roll", "cushion", "twig", "stone", "untidy", "horn", "steel", "teeth", "scary", "calendar", "hole", "scream", "fresh", "attractive", "greedy", "trade", "puny", "eye", "excellent", "cars", "stereotyped", "spot", "imaginary", "care", "drain", "scale", "knee", "present", "moaning", "grouchy", "jar", "racial", "team", "transport", "ray", "new", "eyes", "leg", "yawn", "brother", "puzzling", "rot", "economic", "adjustment", "exclusive", "current", "border", "whip", "glossy", "dazzling", "attract", "market", "compete", "mundane", "rifle", "mailbox", "terrify", "onerous", "tiresome", "fire", "trust", "pump", "crate", "late", "channel", "misty", "aromatic", "volleyball", "saw", "material", "smell", "astonishing", "zealous", "fly", "near", "legal", "property", "multiply", "sincere", "wish", "zany", "coach", "shoes", "quizzical", "open", "rhythm", "preserve", "bashful", "brass", "hungry", "wriggle", "knife", "invincible", "swing", "shallow", "snow", "respect", "omniscient", "excited", "real", "windy", "neck", "fill", "tasty", "blade", "ready", "detailed", "existence", "merciful", "pickle", "blind", "smile", "promise", "rustic", "bulb", "sick", "pipe", "rigid", "deafening", "coherent", "gentle", "aggressive", "different", "giddy", "fortunate", "minor", "truculent", "sack", "cheese", "defeated", "unaccountable", "thirsty", "crown", "synonymous", "sigh", "reading", "curl", "brash", "bawdy", "mixed", "blushing", "pig", "vagabond", "delicious", "recognise", "remind", "ice", "heat", "profit", "milk", "inexpensive", "bead", "interrupt", "slope", "eatable", "brake", "mess", "up", "permit", "unadvised", "anxious", "obnoxious", "injure", "force", "stranger", "command", "long", "tacky", "canvas");
        $begin = array("Mountainous", "Parallel", "Upbeat", "Imported", "Wry", "Stage", "Defiant", "Adamant", "Expensive", "Way", "Robust", "Physical", "Knit", "Volatile", "Narrow", "Summer", "Grandiose", "Ablaze", "Happen", "Brief", "Practise", "Range", "Year", "Plan", "Rhyme", "Belief", "Brake", "Veil", "Exercise", "Ripe", "Acoustic", "Annoy", "Madly", "Ugly", "Steadfast", "Development", "Cherry", "Flowery", "Miss", "Hug", "Spotted", "Quilt", "Selective", "Accessible", "Scandalous", "Distribution", "Guide", "Ill-Fated", "Delay", "Erratic", "Busy", "Drop", "Chop", "Lock", "Price", "Clap", "Voiceless", "Functional", "Front", "Vengeful", "Tug", "Force", "Foamy", "Erect", "Strip", "Envious", "Spare", "Lean", "Guess", "Juvenile", "Clam", "Save", "Purring", "Decisive", "Owe", "Half", "Kittens", "Income", "Troubled", "Top", "Rotten", "Meaty", "Alleged", "Simple", "Shocking", "Ants", "Careless", "Uncovered", "Unused", "Odd", "Tooth", "Suspend", "Foregoing", "Elated", "Route", "Hop", "Defective", "Scatter", "Addicted", "Gigantic", "Bake", "Move", "Unwieldy", "Rush", "Panoramic", "Special", "Permissible", "Fragile", "Hover", "Elastic", "Float", "Frail", "Monkey", "Lie", "Loud", "Space", "Likeable", "Toe", "Pest", "Abject", "Match", "Letters", "Fretful", "Whispering", "End", "Matter", "Far", "Double", "Bomb", "Boiling", "Tail", "Flowers", "Unsightly", "Absent", "Womanly", "Leather", "Time", "Easy", "Snake", "Test", "Competition", "Amusement", "Wink", "Acceptable", "Crawl", "Mask", "Sniff", "Rub", "Books", "Middle", "Box", "Squirrel", "Walk", "Please", "Opposite", "Shivering", "Humor", "Godly", "Tasteless", "Chin", "Questionable", "Encouraging", "Drum", "Extra-Large", "Grieving", "Wax", "Afternoon", "Superficial", "Amuck", "Male", "Mate", "Cool", "Roll", "Cushion", "Twig", "Stone", "Untidy", "Horn", "Steel", "Teeth", "Scary", "Calendar", "Hole", "Scream", "Fresh", "Attractive", "Greedy", "Trade", "Puny", "Eye", "Excellent", "Cars", "Stereotyped", "Spot", "Imaginary", "Care", "Drain", "Scale", "Knee", "Present", "Moaning", "Grouchy", "Jar", "Racial", "Team", "Transport", "Ray", "New", "Eyes", "Leg", "Yawn", "Brother", "Puzzling", "Rot", "Economic", "Adjustment", "Exclusive", "Current", "Border", "Whip", "Glossy", "Dazzling", "Attract", "Market", "Compete", "Mundane", "Rifle", "Mailbox", "Terrify", "Onerous", "Tiresome", "Fire", "Trust", "Pump", "Crate", "Late", "Channel", "Misty", "Aromatic", "Volleyball", "Saw", "Material", "Smell", "Astonishing", "Zealous", "Fly", "Near", "Legal", "Property", "Multiply", "Sincere", "Wish", "Zany", "Coach", "Shoes", "Quizzical", "Open", "Rhythm", "Preserve", "Bashful", "Brass", "Hungry", "Wriggle", "Knife", "Invincible", "Swing", "Shallow", "Snow", "Respect", "Omniscient", "Excited", "Real", "Windy", "Neck", "Fill", "Tasty", "Blade", "Ready", "Detailed", "Existence", "Merciful", "Pickle", "Blind", "Smile", "Promise", "Rustic", "Bulb", "Sick", "Pipe", "Rigid", "Deafening", "Coherent", "Gentle", "Aggressive", "Different", "Giddy", "Fortunate", "Minor", "Truculent", "Sack", "Cheese", "Defeated", "Unaccountable", "Thirsty", "Crown", "Synonymous", "Sigh", "Reading", "Curl", "Brash", "Bawdy", "Mixed", "Blushing", "Pig", "Vagabond", "Delicious", "Recognise", "Remind", "Ice", "Heat", "Profit", "Milk", "Inexpensive", "Bead", "Interrupt", "Slope", "Eatable", "Brake", "Mess", "Up", "Permit", "Unadvised", "Anxious", "Obnoxious", "Injure", "Force", "Stranger", "Command", "Long", "Tacky", "Canvas");
        $length = count($random_words);
        $count = rand(0, $maxWords);

        //$characters = '0 123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        //$charactersLength = strlen($characters);
        if (rand(0, 100) > 50) {
            $randomString = $begin[rand(0, $length - 1)];
        } else {
            $randomString = $random_words[rand(0, $length - 1)];
        }
        for ($i = 0; $i < $count; $i++) {
            $randomString .= ' ' . $random_words[rand(0, $length - 1)];
        }
        return $randomString;
    }

    public static function generateRandomStringsSeparated($count, $maxWords)
    {
        $randomString = self::generateRandomString($maxWords);
        for ($i = 1; $i <= $count - 1; $i++) {
            $randomString .= self::$SEPARATOR . self::generateRandomString($maxWords);
        }
        return $randomString;
    }


    public static function fill_bd_with_random_stuff()
    {
        $db = new db_uploader();
        $db->setLogin('winston');
        $db->setPassword('cherchil');

        $count_compositions_different_authors = 5;


        $paths = array('1ertriopourpianogouv', '1ertriopourpianogouv_0', '1ertriopourpianogouv_1', '1grossestriocmolraff', '1grossestriocmolraff_0', '2etriosimineurpo00lalo', 'balladesforpiano00chop', 'triofurpianofortschu_0');

        for ($j = 1; $j <= $count_compositions_different_authors; $j++) {
            $count_compositions_same_authors = rand(100, 300);

            $count_authors = rand(1, 15);
            $authors_names = self::generateRandomStringsSeparated($count_authors, 5);
            for ($i = 1; $i <= $count_compositions_same_authors; $i++) {
                $random_path = $paths[rand(0, count($paths) - 1)];
                $srcDir = $_SERVER['DOCUMENT_ROOT'] . "/" . config::$scoresDir . $random_path . "/";
                $files = scandir($srcDir);
                array_shift($files);
                array_shift($files);
                $files = self::array_to_string($files, self::$SEPARATOR);

                $db->setCompositionsInstrument(self::generateRandomString(15));

                $db->setAuthorsNames($authors_names);
                $db->setCompositionsInstrument(self::generateRandomString(15));
                $db->setCompositionsGenre(self::generateRandomString(15));
                $db->setCompositionsName(self::generateRandomString(50));

                $db->setCompositionsPath($random_path);
                $db->setCompositionsDescription(self::generateRandomString(200));
                $db->setCompositionsPublished(self::generateRandomString(3));
                $db->setCompositionsCreated(self::generateRandomString(3));
                $db->setCompositionsTags(self::generateRandomString(30));
                $db->setImagesCleanerVersion(self::generateRandomString(3));
                $db->setImagesFilename($files);
                $db->upload();
            }

        }
    }
    /*
        function generateRandomString($length = 10) {
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i < $length; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            return $randomString;
        }
    */

}