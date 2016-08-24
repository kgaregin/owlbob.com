<?php
/**
 * Created by PhpStorm.
 * User: Гарегин
 * Date: 25.03.2016
 * Time: 12:48
 */
namespace AppBundle\Common;

use AppBundle\Common\config;

class db_general
{


    protected $connected; //db connection status
    protected $db_link;


    /**
     * @return mixed
     */
    public function getDbLink()
    {
        if (isset($this->db_link)) {
            return $this->db_link;
        } else {
            $this->db_connect();
            return $this->db_link;
        }

    }

    /**
     *
     */
    public function __construct()
    {
        $this->db_connect();
    }

    /**
     * @param bool $is_new_connection
     * @return resource|void
     */
    public function db_connect($is_new_connection = false)
    {
        if (isset($this->db_link) and !$is_new_connection) return;
        $this->db_link = mysqli_connect(config::$SERVER_NAME, config::$DB_USER, config::$DB_PASSWORD) or die(mysqli_connect_error());
        $this->connected = mysqli_select_db($this->db_link, config::$DB_NAME) or die(mysqli_error($this->db_link));
    }

    public function composition_id_already_exist($id)
    {
        $id = mysqli_query($this->getDbLink(), "SELECT * FROM `compositions` WHERE `id` = '$id'");
        $id = mysqli_fetch_row($id);
        if ($id == false) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @param $id
     * @return bool
     */
    public function author_id_already_exist($id)
    {
        $id = mysqli_query($this->getDbLink(), "SELECT * FROM `authors` WHERE `id` = '$id'");
        $id = mysqli_fetch_row($id);
        if ($id == false) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @return array|bool
     */
    public function get_sorted_authors_id_list()
    {
        $ids = mysqli_query($this->getDbLink(), "SELECT `id` FROM `authors` ORDER BY `name` ASC");
        $result = array();
        while ($id = mysqli_fetch_object($ids)) {
            $result[] = $id->id;
        }
        if (empty($result)) {
            return false;
        } else {
            return $result;
        }
    }

}