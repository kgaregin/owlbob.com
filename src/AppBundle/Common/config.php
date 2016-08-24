<?php
/**
 * Created by PhpStorm.
 * User: Гарегин
 * Date: 23.03.2016
 * Time: 12:21
 */

namespace AppBundle\Common;

class config
{
    static public $TmpDir = 'TMP/';
    static public $scoresDir = 'pictures/scores/';
    static public $SEARCH_AMOUNT = 10;
    static public $SERVER_NAME = '127.0.0.1';
    static public $DB_USER = 'root';
    static public $DB_PASSWORD = 'ghbdtn';
    static public $DB_NAME = 'png32649';

    static public function getTmpDirServerPath()
    {
        return $_SERVER['DOCUMENT_ROOT'] . "/" . self::$TmpDir;
    }

    static public function getSiteDomain()
    {
        return 'http://' . $_SERVER["HTTP_HOST"] . '/';
    }

    static public function getConfigArray()
    {
        return array(
            'domain' => self::getSiteDomain(),
            'scores_dir' => self::$scoresDir,
            'tmp_dir' => self::$TmpDir,
            'search_amount' => self::$SEARCH_AMOUNT
        );
    }
}