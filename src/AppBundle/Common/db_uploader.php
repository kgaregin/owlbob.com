<?php
/**
 * Created by PhpStorm.
 * User: HarryTheOgre
 * Date: 28.03.2016
 * Time: 14:39
 * ToDo: проверять запросы к БД на выполнение и формировать окончательный response исходя из этого
 * ToDo: проверять наличие идентичной записи в БД и не добавлять новую в случае полного совпадения основных данных
 * ToDo: дополнить таблицу метаданными окончательно
 * ToDo: пересмотреть логику upload'a относительно политики записи
 * ToDo: добавить поле extension в таблицу images.
 * ToDo: привести set/getAuthorsCompositions к числовому типу
 */

namespace AppBundle\Common;

class db_uploader extends db_general
{
    //DB Tables
    protected $authors_id;
    protected $authors_names;

    protected $authorsCompositions_author_id;
    protected $authorsCompositions_composition_id;

    protected $compositions_id;
    protected $compositions_name;
    protected $compositions_description;
    protected $compositions_path;
    protected $compositions_published;
    protected $compositions_created;
    protected $compositions_tags;
    protected $compositions_genre;
    protected $compositions_instrument;

    protected $images_id;
    protected $images_filename;
    protected $images_page;
    protected $images_composition_id;
    protected $images_cleaner_version;

    // Uploader configuration:
    protected $login;
    protected $password;

    protected $override;
    protected $add_global;
    protected $add_composition;
    protected $add_authors;
    protected $add_image;
    protected $response;

    // DB configuration:
    protected $db_error_log;


//  ------------------------Setters------------------------
    /**
     * @param string $login
     */
    public function setLogin($login = '')
    {
        $this->login = $login;
    }

    /**
     * @param string $password
     */
    public function setPassword($password = '')
    {
        $this->password = $password;
    }

    /**
     * @param boolean $override
     */
    public function setOverride($override = false)
    {
        is_bool($override) ?
            $this->override = $override :
            $this->override = false;
    }

    /**
     * @param boolean $add_global
     */
    public function setAddGlobal($add_global = true)
    {
        is_bool($add_global) ?
            $this->add_global = $add_global :
            $this->add_global = true;
    }

    /**
     * @param boolean $add_composition
     */
    public function setAddComposition($add_composition = false)
    {
        is_bool($add_composition) ?
            $this->add_composition = $add_composition :
            $this->add_composition = false;
    }

    /**
     * @param boolean $add_authors
     */
    public function setAddAuthors($add_authors = false)
    {
        is_bool($add_authors) ?
            $this->add_authors = $add_authors :
            $this->add_authors = false;
    }

    /**
     * @param boolean $add_image
     */
    public function setAddImage($add_image = false)
    {
        is_bool($add_image) ?
            $this->add_image = $add_image :
            $this->add_image = false;
    }

    /**
     * @param string $response
     * -2 ~~ Failed to get response (Unexpected error occurred. Response given not a string.)
     * -1 ~~ Failed to login
     * 0 ~~ No response
     * 1 ~~ All done (OK)
     * 2 ~~ No task given (nothing 2 do here)
     * 3 ~~ DB internal error. Check logs for more information.
     * 4 ~~ Number of authors doesn't match with given id's amount
     */
    public function setResponse($response = '0')
    {
        if ($response == '3') $this->setDbErrorLog('DB error: ' . mysqli_error($this->getDbLink()));
        if ($response == '4') $this->setDbErrorLog("Number of authors doesn't match with given id's amount");
        if ($this->response == '3') return;
        if (is_numeric($response)) {
            $this->response = $response;
        } else {
            $this->response = '-2';
        }
    }

    /**
     * @param mixed $db_error_log
     */
    public function setDbErrorLog($db_error_log)
    {
        $this->db_error_log = $this->db_error_log . $db_error_log . '<|s|>';
    }

    /**
     * @param string $authors_names
     */
    public function setAuthorsNames($authors_names = 'Unknown')
    {
        $util = new utility();
        $this->authors_names = $util::handle_string($authors_names, utility::$SEPARATOR);
    }

    /**
     * @param array|string $authors_id
     */
    public function setAuthorsId($authors_id = array('NULL'))
    {
        $util = new utility();

        if (is_array($authors_id)) {
            $this->authors_id = $authors_id;
        } else {
            $this->authors_id = array('NULL');
        }
        if (is_string($authors_id)) $this->authors_id = $util::handle_string($authors_id, utility::$SEPARATOR);
    }

    /**
     * @param string $compositions_tags
     */
    public function setCompositionsTags($compositions_tags = 'Unknown')
    {
        is_string($compositions_tags) ?
            $this->compositions_tags = $compositions_tags :
            $this->compositions_tags = 'Unknown';
    }

    /**
     * @param string $compositions_created
     */
    public function setCompositionsCreated($compositions_created = 'NULL')
    {
        is_string($compositions_created) ?
            $this->compositions_created = $compositions_created :
            $this->compositions_created = 'NULL';
    }

    /**
     * @param bool|int|string $compositions_published
     */
    public function setCompositionsPublished($compositions_published = 0)
    {
        is_string($compositions_published) ?
            $this->compositions_published = $compositions_published :
            $this->compositions_published = date('Y-m-d');
    }

    /**
     * @param string $compositions_path
     */
    public function setCompositionsPath($compositions_path = 'Unknown')
    {
        is_string($compositions_path) ?
            $this->compositions_path = $compositions_path :
            $this->compositions_path = 'Unknown';
    }

    /**
     * @param string $compositions_description
     */
    public function setCompositionsDescription($compositions_description = 'Unknown')
    {
        is_string($compositions_description) ?
            $this->compositions_description = $compositions_description :
            $this->compositions_description = 'Unknown';
    }

    /**
     * @param mixed $compositions_name
     */
    public function setCompositionsName($compositions_name = 'Unknown')
    {
        is_string($compositions_name) ?
            $this->compositions_name = $compositions_name :
            $this->compositions_name = 'Unknown';
    }

    /**
     * @param string $compositions_id
     */
    public function setCompositionsId($compositions_id = 'NULL')
    {
        is_numeric($compositions_id) ?
            $this->compositions_id = $compositions_id :
            $this->compositions_id = 'NULL';
    }

    /**
     * @param string $images_composition_id
     */
    public function setImagesCompositionId($images_composition_id = 'Unknown')
    {
        is_numeric($images_composition_id) ?
            $this->images_composition_id = $images_composition_id :
            $this->images_composition_id = 'Unknown';
    }

    /**
     * @param mixed $compositions_genre
     */
    public function setCompositionsGenre($compositions_genre = 'Unknown')
    {
        $this->compositions_genre = $compositions_genre;
    }

    /**
     * @param mixed $compositions_instrument
     */
    public function setCompositionsInstrument($compositions_instrument = 'Unknown')
    {
        $this->compositions_instrument = $compositions_instrument;
    }


    /**
     * @param string $images_page
     */
    public function setImagesPage($images_page = 'Unknown')
    {
        if ($images_page !== '' and is_numeric($images_page)) {
            $this->images_page = $images_page;
        } else {
            $this->images_page = 'Unknown';
        }
    }

    /**
     * @param string $images_cleaner_version
     */
    public function setImagesCleanerVersion($images_cleaner_version = 'Unknown')
    {
        is_string($images_cleaner_version) ?
            $this->images_cleaner_version = $images_cleaner_version :
            $this->images_cleaner_version = 'Unknown';
    }

    /**
     * @param string $images_filename
     */
    public function setImagesFilename($images_filename = 'Unknown')
    {
        if ($images_filename !== '' and is_string($images_filename)) {
            $this->images_filename = $images_filename;
        } else {
            $this->images_filename = 'Unknown';
        };
    }

    /**
     * @param string $images_id
     */
    public function setImagesId($images_id = 'NULL')
    {
        is_numeric($images_id) ?
            $this->images_id = $images_id :
            $this->images_id = 'NULL';
    }

    /**
     * @param mixed $authorsCompositions_author_id
     */
    public function setAuthorsCompositionsAuthorId($authorsCompositions_author_id = 0)
    {
        $util = new utility();
        $this->authors_names = $util::handle_string($authorsCompositions_author_id, ',');
    }

    /**
     * @param mixed $authorsCompositions_composition_id
     */
    public function setAuthorsCompositionsCompositionId($authorsCompositions_composition_id = 0)
    {
        $this->authorsCompositions_composition_id = $authorsCompositions_composition_id;
    }


//  ------------------------Getters------------------------
    /**
     * @return mixed
     */
    public function getLogin()
    {
        return $this->login;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @return bool
     */
    public function isOverride()
    {
        return $this->override;
    }

    /**
     * @return mixed
     */
    public function isAddGlobal()
    {
        return $this->add_global;
    }

    /**
     * @return mixed
     */
    public function isAddComposition()
    {
        return $this->add_composition;
    }

    /**
     * @return mixed
     */
    public function isAddAuthors()
    {
        return $this->add_authors;
    }

    /**
     * @return mixed
     */
    public function isAddImage()
    {
        return $this->add_image;
    }


    /**
     * @param bool|false $isMachine
     * @return string
     */
    public function getResponse($isMachine = false)
    {
        if ($isMachine) return $this->response;
        if ($this->response == '-1') {
            return 'Failed to login';
        } elseif ($this->response == '0') {
            return 'No response';
        } elseif ($this->response == '1') {
            return 'All done (OK)';
        } elseif ($this->response == '2') {
            return 'No task given (nothing 2 do here)';
        } elseif ($this->response == '3') {
            return $this->db_error_log;
        } elseif ($this->response == '4') {
            return "Number of authors doesn't match with given id's amount ";
        } else {
            return 'Failed to get response (Unexpected error occurred. Response given not numeric.)';
        }
    }

    /**
     * @return mixed
     */
    private function get_response_for_db_log()
    {
        $response = $this->getResponse();
        $response = explode('<|s|>', $response);
        if (count($response) > 1) {
            return $response[count($response) - 2];
        } else {
            return $response[0];
        }
    }

    /**
     * @return string
     */
    public function getCompositionsId()
    {
        return $this->compositions_id;
    }

    /**
     * @return string
     */
    public function getCompositionsName()
    {
        return $this->compositions_name;
    }

    /**
     * @return string
     */
    public function getCompositionsDescription()
    {
        return $this->compositions_description;
    }

    /**
     * @return string
     */
    public function getCompositionsPath()
    {
        return $this->compositions_path;
    }

    /**
     * @return bool|string
     */
    public function getCompositionsPublished()
    {
        return $this->compositions_published;
    }

    /**
     * @return string
     */
    public function getCompositionsCreated()
    {
        return $this->compositions_created;
    }

    /**
     * @return string
     */
    public function getCompositionsTags()
    {
        return $this->compositions_tags;
    }

    /**
     * @return mixed
     */
    public function getCompositionsGenre()
    {
        return $this->compositions_genre;
    }

    /**
     * @return mixed
     */
    public function getCompositionsInstrument()
    {
        return $this->compositions_instrument;
    }

    /**
     * @return string
     */
    public function getAuthorsId()
    {
        $util = new utility();
        return $util::array_to_string($this->authors_id);
    }

    /**
     * @return string
     */
    public function getAuthorsNames()
    {
        $util = new utility();
        return $util::array_to_string($this->authors_names);
    }

    /**
     * @return string
     */
    public function getImagesId()
    {
        return $this->images_id;
    }

    /**
     * @return string
     */
    public function getImagesCompositionId()
    {
        return $this->images_composition_id;
    }

    /**
     * @return string
     */
    public function getImagesFilename()
    {
        return $this->images_filename;
    }

    /**
     * @return string
     */
    public function getImagesPage()
    {
        return $this->images_page;
    }

    /**
     * @return string
     */
    public function getImagesCleanerVersion()
    {
        return $this->images_cleaner_version;
    }

    /**
     * @return mixed
     */
    public function getAuthorsCompositionsAuthorId()
    {
        $util = new utility();
        return $util::array_to_string($this->authorsCompositions_author_id);
    }

    /**
     * @return mixed
     */
    public function getAuthorsCompositionsCompositionId()
    {
        return $this->authorsCompositions_composition_id;
    }

//  ------------------------Uploader Methods------------------------


    /**
     *
     */
    function __construct()
    {
        parent::__construct();
        // Setting configuration
        $this->setLogin();
        $this->setPassword();
        $this->setOverride();
        $this->setAddGlobal();
        $this->setAddAuthors();
        $this->setAddComposition();
        $this->setAddImage();
        $this->setResponse();

        // Setting default values:
        $this->setAuthorsId();
        $this->setAuthorsNames();
        $this->setCompositionsId();
        $this->getAuthorsCompositionsAuthorId();
        $this->getAuthorsCompositionsCompositionId();
        $this->setCompositionsName();
        $this->setCompositionsDescription();
        $this->setCompositionsPath();
        $this->setCompositionsPublished();
        $this->setCompositionsCreated();
        $this->setCompositionsTags();
        $this->setCompositionsGenre();
        $this->setCompositionsInstrument();
        $this->setImagesId();
        $this->setImagesFilename();
        $this->setImagesPage();
        $this->setImagesCompositionId();
        $this->setImagesCleanerVersion();
        return;
    }


    /**
     * @param bool|false $isMachine
     * Загрузчик новых записей. Just for Anatoly.
     */
    public function upload($isMachine = false)
    {
        $this->db_connect();

        if (!$this->check_user_password()) return;
        if (!$this->check_task()) return;
        if (!$this->isOverride() and $this->isAddGlobal()) {
            $util = new utility();
            $images_names = $util::handle_string($this->images_filename, utility::$SEPARATOR);
            foreach ($images_names as $image_name) {
                $this->setImagesFilename($image_name);
                $this->upload_by_metadata();
            }
        } elseif ($this->override) {
            if ($this->add_authors) {
                if (count($this->authors_names) == count($this->authors_id)) {
                    foreach ($this->authors_names as $k => $name) {
                        $this->authors_add_new_record($this->authors_id[$k], $name);
                    }
                } else {
                    $this->setResponse('4');
                }
            }
            if ($this->add_composition) $this->compositions_add_new_record();
            if ($this->add_image) $this->images_add_new_record();
        }
        return;
    }

    /**
     *  Gosu upload procedure
     */
    private function upload_by_metadata()
    {
        $this->identify_authors_id_by_name();
        $this->identify_compositions_id_by_name_path();
        $this->authorsComposition_link($this->compositions_id);
        if (!$this->images_record_exist($this->images_filename, $this->compositions_id)) {
            $this->images_page = $this->get_images_page_number();
            $this->images_add_new_record();
        }
        return;
    }


    /**
     * @param $name
     * @return bool
     */
    private function authors_name_already_exist($name)
    {
        $name_screened = addslashes($name);
        $res = mysqli_query($this->getDbLink(), "SELECT * FROM `authors` WHERE LOWER(`name`) = LOWER('$name_screened')");
        $res = mysqli_fetch_row($res);
        if ($res == false) {
            return false;
        } else {
            return trim($res[1]) == trim($name);
        }
    }


    /**
     *
     */
    private function identify_authors_id_by_name()
    {
        foreach ($this->authors_names as $k => $author_name) {
            $all_ok = true;
            if (!$this->authors_name_already_exist($author_name)) {
                $this->authors_id[$k] = 'NULL';
                $ok = $this->authors_add_new_record($this->authors_id[$k], $author_name);
                if (!$ok) $all_ok = false;
            }
            if (!$all_ok) $this->setResponse('3');
            $author_name_screened = addslashes($author_name);
            $this->authors_id[$k] = mysqli_fetch_row(mysqli_query($this->getDbLink(), "SELECT * FROM `authors` WHERE
                                                          LOWER(`name`) = LOWER('$author_name_screened')"))[0];
            $this->authorsCompositions_author_id[$k] = $this->authors_id[$k];

        }
        return;
    }

    /**
     * @return int
     */
    private function get_images_page_number()
    {
        $pNum = $this->images_filename;
        $pNum = str_replace($this->compositions_path, '', $pNum);
        if (is_numeric($pNum)) {
            if (!$this->page_already_exist($pNum)) {
                return $pNum;
            }
        }
        if ($this->images_page == 'Unknown' or $this->page_already_exist($this->images_page)) {
            $composition_id_screened = addslashes($this->images_composition_id);
            $number = mysqli_fetch_row(mysqli_query($this->getDbLink(), "SELECT MAX(`page`) FROM  `images` WHERE  `composition_id` = '$composition_id_screened'
                                               LIMIT 0 , 50"))[0];
            if ($number == false) {
                $number = 1;
            } else {
                $number += 1;
            }
            return $number;
        }
        return $this->images_page;
    }

    /**
     * @param $page
     * @return bool
     */
    private function page_already_exist($page)
    {
        $composition_id_screened = addslashes($this->images_composition_id);
        $page_screened = addslashes($page);
        $result = mysqli_query($this->getDbLink(), "SELECT `page` FROM  `images` WHERE  `composition_id` = '$composition_id_screened' AND `page` = '$page_screened'");
        if (mysqli_fetch_row($result) == false) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @return void
     */
    private function identify_compositions_id_by_name_path()
    {
        if (!$this->compositions_name_already_exist()) {
            $this->compositions_id = 'NULL';
            $this->compositions_add_new_record();
        }
        $compositions_path_screened = addslashes($this->compositions_path);
        $compositions_name_screened = addslashes($this->compositions_name);
        $name = mysqli_query($this->getDbLink(), "SELECT * FROM `compositions` WHERE `path` = '$compositions_path_screened' AND
                            LOWER(`name`) = LOWER('$compositions_name_screened')");
        $this->compositions_id = mysqli_fetch_row($name)[0];
        $this->images_composition_id = $this->compositions_id;
        return;
    }

    /**
     * @return bool
     */
    private function compositions_name_already_exist()
    {
        $compositions_path_screened = addslashes($this->compositions_path);
        $compositions_name_screened = addslashes($this->compositions_name);
        $name = mysqli_query($this->getDbLink(), "SELECT * FROM `compositions` WHERE `path` = '$compositions_path_screened' AND
                                                                      LOWER(`name`) = LOWER('$compositions_name_screened')");
        $name = mysqli_fetch_row($name);
        if ($name == false) {
            return false;
        } else {
            return trim($name[1]) == trim($this->compositions_name);
        }
    }

    /**
     * @param $table
     * @param $query
     * @param $response
     * @return resource
     */
    private function logs_add_new_record($table, $query, $response)
    {
        //$query = preg_replace('/\s+/', ' ', $query);
        $query_screened = addslashes($query);
        $response_screened = addslashes($response);
        return mysqli_query($this->getDbLink(), "INSERT INTO  `png32649`.`logs`
                                          (`id`, `table_name`, `query`, `response`)
                                   VALUES (NULL ,  '$table', '$query_screened', '$response_screened');
                            ");
    }

    /**
     * @param $id
     * @param $name
     * @return bool
     */
    private function authors_add_new_record($id, $name)
    {
        $name_screened = addslashes($name);
        $id_screened = addslashes($id);
        $query = "INSERT INTO  `png32649`.`authors`
                                          (`id` ,`name`)
                                   VALUES ($id_screened ,  '$name_screened');
                            ";
        $result = mysqli_query($this->getDbLink(), $query);
        if ($result) {
            $this->setResponse('1');
        } else {
            $this->setResponse('3');
        }
        $this->logs_add_new_record('authors', $query, $this->get_response_for_db_log());
        return $result;
    }

    /**
     * @return bool
     */
    private function compositions_add_new_record()
    {
        $compositions_id_screened = addslashes($this->compositions_id);
        $compositions_name_screened = addslashes($this->compositions_name);
        $compositions_description_screened = addslashes($this->compositions_description);
        $compositions_path_screened = addslashes($this->compositions_path);
        $compositions_published_screened = addslashes($this->compositions_published);
        $compositions_genre_screened = addslashes($this->compositions_genre);
        $compositions_instrument_screened = addslashes($this->compositions_instrument);
        if ($this->compositions_created == 'NULL') {
            $compositions_created_screened = $this->compositions_created;
        } else {
            $compositions_created_screened = "'" . addslashes($this->compositions_created) . "'";
        }
        $compositions_tags_screened = addslashes($this->compositions_tags);
        $query = "INSERT INTO  `png32649`.`compositions`
                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)
                                  VALUES ($compositions_id_screened, '$compositions_name_screened',
                                          '$compositions_description_screened', '$compositions_path_screened', '$compositions_published_screened',
                                          $compositions_created_screened, '$compositions_tags_screened', '$compositions_genre_screened', '$compositions_instrument_screened');
                            ";
        $result = mysqli_query($this->getDbLink(), $query);
        if ($result == true) {
            $this->setResponse('1');
        } else {
            $this->setResponse('3');
        }
        $this->logs_add_new_record('compositions', $query, $this->get_response_for_db_log());
        return $result;
    }

    /**
     * @return bool
     */
    private function images_add_new_record()
    {
        $images_id_screened = addslashes($this->images_id);
        $images_filename_screened = addslashes($this->images_filename);
        $images_page_screened = addslashes($this->images_page);
        $images_composition_id_screened = addslashes($this->images_composition_id);
        $images_cleaner_version_screened = addslashes($this->images_cleaner_version);
        $query = "INSERT INTO  `png32649`.`images`
                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)
                                   VALUES ($images_id_screened, '$images_filename_screened', '$images_page_screened',
                                           $images_composition_id_screened, '$images_cleaner_version_screened');
                            ";
        $result = mysqli_query($this->getDbLink(), $query);
        if ($result) {
            $this->setResponse('1');
        } else {
            $this->setResponse('3');
        }
        $this->logs_add_new_record('images', $query, $this->get_response_for_db_log());
        return $result;
    }


    /**
     * @param $image_filename
     * @param $composition_id
     * @return bool
     */
    private function images_record_exist($image_filename, $composition_id)
    {
        $image_filename_screened = addslashes($image_filename);
        $composition_id_screened = addslashes($composition_id);
        $result = mysqli_query($this->getDbLink(), "SELECT * FROM `png32649`.`images` WHERE
                    `filename` = '$image_filename_screened' AND `composition_id` = '$composition_id_screened'
                            ");
        $result = mysqli_fetch_row($result);
        if ($result == false) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @param $composition_id
     * @return bool
     */
    private function authorsComposition_link($composition_id)
    {
        $all_ok = true;
        foreach ($this->authors_id as $k => $author_id) {
            if (!$this->authorsComposition_record_exist($author_id, $composition_id)) {
                $query = "INSERT INTO  `png32649`.`AuthorsCompositions`
                                          (`author_id` ,`composition_id`)
                                   VALUES ($author_id, $composition_id);
                            ";
                $ok = mysqli_query($this->getDbLink(), $query);
                if ($ok) {
                    $this->setResponse('1');
                } else {
                    $this->setResponse('3');
                    $all_ok = false;
                }
                $this->logs_add_new_record('AuthorsCompositions', $query, $this->get_response_for_db_log());
            }
        }
        if ($all_ok) {
            $this->setResponse('1');
        } else {
            $this->setResponse('3');
        }
        return $all_ok;
    }

    /**
     * @param $author_id
     * @param $composition_id
     * @return bool
     */
    private function authorsComposition_record_exist($author_id, $composition_id)
    {
        $result = mysqli_query($this->getDbLink(), "SELECT * FROM `png32649`.`AuthorsCompositions` WHERE
                    `author_id` = '$author_id' AND `composition_id` = '$composition_id'
                            ");
        if (mysqli_fetch_row($result) == false) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @return bool
     */
    private function check_user_password()
    {
        if ($this->login == 'winston' and $this->password == 'cherchil') {
            return true;
        } else {
            $this->setResponse('-1');
            $this->logs_add_new_record('', '', $this->get_response_for_db_log());
            return false;
        }
    }

    /**
     * @return bool
     */
    private function check_task()
    {
        if ($this->add_authors == false and $this->add_composition == false
            and $this->add_image == false and $this->add_global == false
        ) {
            $this->setResponse('2');
            $this->logs_add_new_record('', '', $this->get_response_for_db_log());
            return false;
        } else {
            return true;
        }
    }

    /**
     * @param $XMLString
     */
    public function parseXML($XMLString)
    {
        $metaData = new \SimpleXMLElement($XMLString);
        // Setting config
        if (isset($metaData->Login) and !empty(trim($metaData->Login))) $this->setLogin(trim($metaData->Login));
        if (isset($metaData->Password) and !empty(trim($metaData->Password))) $this->setPassword(trim($metaData->Password));
        if (isset($metaData->Override) and !empty(trim($metaData->Override))) $this->setOverride(trim($metaData->Override));
        if (isset($metaData->AddGlobal) and !empty(trim($metaData->AddGlobal))) $this->setAddGlobal(trim($metaData->AddGlobal));
        if (isset($metaData->AddAuthors) and !empty(trim($metaData->AddAuthors))) $this->setAddAuthors(trim($metaData->AddAuthors));
        if (isset($metaData->AddComposition) and !empty(trim($metaData->AddComposition))) $this->setAddComposition(trim($metaData->AddComposition));
        if (isset($metaData->AddImage) and !empty(trim($metaData->AddImage))) $this->setAddImage(trim($metaData->AddImage));

        // Setting values:
        if (isset($metaData->AuthorsId) and !empty(trim($metaData->AuthorsId))) $this->setAuthorsId(trim($metaData->AuthorsId));
        if (isset($metaData->AuthorsNames) and !empty(trim($metaData->AuthorsNames))) $this->setAuthorsNames(trim($metaData->AuthorsNames));
        if (isset($metaData->CompositionsId) and !empty(trim($metaData->CompositionsId))) $this->setCompositionsId(trim($metaData->CompositionsId));
        if (isset($metaData->CompositionsName) and !empty(trim($metaData->CompositionsName))) $this->setCompositionsName(trim($metaData->CompositionsName));
        if (isset($metaData->CompositionsDescription) and !empty(trim($metaData->CompositionsDescription))) $this->setCompositionsDescription(trim($metaData->CompositionsDescription));
        if (isset($metaData->CompositionsPath) and !empty(trim($metaData->CompositionsPath))) $this->setCompositionsPath(trim($metaData->CompositionsPath));
        if (isset($metaData->CompositionsPublished) and !empty(trim($metaData->CompositionsPublished))) $this->setCompositionsPublished(trim($metaData->CompositionsPublished));
        if (isset($metaData->CompositionsCreated) and !empty(trim($metaData->CompositionsCreated))) $this->setCompositionsCreated(trim($metaData->CompositionsCreated));
        if (isset($metaData->CompositionsTags) and !empty(trim($metaData->CompositionsTags))) $this->setCompositionsTags(trim($metaData->CompositionsTags));
        if (isset($metaData->CompositionsGenre) and !empty(trim($metaData->CompositionsGenre))) $this->setCompositionsGenre(trim($metaData->CompositionsGenre));
        if (isset($metaData->CompositionsInstrument) and !empty(trim($metaData->CompositionsInstrument))) $this->setCompositionsInstrument(trim($metaData->CompositionsInstrument));
        if (isset($metaData->ImagesId) and !empty(trim($metaData->ImagesId))) $this->setImagesId(trim($metaData->ImagesId));
        if (isset($metaData->ImagesFilename) and !empty(trim($metaData->ImagesFilename))) $this->setImagesFilename(trim($metaData->ImagesFilename));
        if (isset($metaData->ImagesPage) and !empty(trim($metaData->ImagesPage))) $this->setImagesPage(trim($metaData->ImagesPage));
        if (isset($metaData->ImagesCompositionId) and !empty(trim($metaData->ImagesCompositionId))) $this->setImagesCompositionId(trim($metaData->ImagesCompositionId));
        if (isset($metaData->ImagesCleanerVersion) and !empty(trim($metaData->ImagesCleanerVersion))) $this->setImagesCleanerVersion(trim($metaData->ImagesCleanerVersion));
        if (isset($metaData->AuthorsCompositionsAuthorId) and !empty(trim($metaData->AuthorsCompositionsAuthorId))) $this->setAuthorsCompositionsAuthorId(trim($metaData->AuthorsCompositionsAuthorId));
        if (isset($metaData->AuthorsCompositionsCompositionId) and !empty(trim($metaData->AuthorsCompositionsCompositionId))) $this->setAuthorsCompositionsCompositionId(trim($metaData->AuthorsCompositionsCompositionId));
    }

}