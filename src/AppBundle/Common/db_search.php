<?php
/**
 * Created by PhpStorm.
 * User: HarryTheOgre
 * Date: 26.04.2016
 * Time: 18:46
 */

namespace AppBundle\Common;


class db_search extends db_general
{

    protected $search_request;
    protected $search_compositions_result;
    protected $search_authors_result;

    /**
     * @return mixed
     */
    public function getSearchCompositionsResult($search_from = 0, $search_amount = 1000)
    {
        $identifiers = $this->search_compositions_id_by_request($this->search_request,$search_from,$search_amount);
        if ($identifiers !== false)
            foreach ($identifiers as $id) {
                $this->search_compositions_result[] = $this->get_composition_instance_by_composition_id($id);
            }
        return $this->search_compositions_result;
    }

    /**
     * @return mixed
     */
    public function getSearchAuthorsResult($search_from = 0, $search_amount = 1000, $isSearchCompositions = true)
    {
        $identifiers = $this->search_authors_id_by_request($this->search_request, $search_from, $search_amount);
        if ($identifiers !== false)
            foreach ($identifiers as $id) {
                $this->search_authors_result[] = $this->get_author_instance_by_author_id($id, $isSearchCompositions);
            }
        return $this->search_authors_result;
    }


    /**
     * @return mixed
     */
    public function getSearchRequest()
    {
        return $this->search_request;
    }

    /**
     * @param mixed $search_request
     */
    public function setSearchRequest($search_request)
    {
        $this->search_request = $search_request;
    }

    /**
     *
     */
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @param $id
     * @return composition_instance|bool
     */
    public function get_composition_instance_by_composition_id($id)
    {
        $instance = new composition_instance();
        $this->db_connect();

        if (!$this->composition_id_already_exist($id)) {
            return false;
        }

        $instance->composition_id = $id;

        $authors = mysqli_query($this->getDbLink(), "SELECT `author_id` FROM `AuthorsCompositions` WHERE `composition_id` = $id");
        $i = 0;
        while ($author_id = mysqli_fetch_row($authors)) {
            $author = mysqli_fetch_row(mysqli_query($this->getDbLink(), "SELECT `name` FROM `authors` WHERE `id` = $author_id[0]"))[0];
            $instance->authors[$i]['name'] = $author;
            $instance->authors[$i]['id'] = $author_id[0];
            $i += 1;
        }

        $compositions = mysqli_query($this->getDbLink(), "SELECT * FROM `compositions` WHERE `id` = $id");
        while ($composition = mysqli_fetch_object($compositions)) {
            $instance->composition_name = $composition->name;
            $instance->description = $composition->description;
            $instance->path = $composition->path;
            $instance->created = $composition->created;
            $instance->published = $composition->published;
            $instance->tags = $composition->tags;
        }

        $images = mysqli_query($this->getDbLink(), "SELECT * FROM `images` WHERE `composition_id` = $id ORDER BY page ASC");
        $i = 0;
        while ($image = mysqli_fetch_object($images)) {
            $instance->files[$i]['filename'] = $image->filename;
            $instance->files[$i]['page'] = $image->page;
            $i += 1;
        }

        $instance->pages_count = $i;

        return $instance;
    }

    /**
     * @param $id
     * @return bool
     */
    public function get_author_instance_by_author_id($id, $isSearchCompositions = true)
    {
        $instance = new author_instance();
        $this->db_connect();

        if (!$this->author_id_already_exist($id)) {
            return false;
        }

        $instance->author_id = $id;
        $instance->author_name = mysqli_fetch_object(mysqli_query($this->getDbLink(), "SELECT * FROM `authors` WHERE `id` = $id"))->name;

        if ($isSearchCompositions == true) {
            $compositions = mysqli_query($this->getDbLink(), "SELECT `composition_id` FROM `AuthorsCompositions` WHERE `author_id` = $id");
            while ($composition_id = mysqli_fetch_row($compositions)) {
                if ($this->composition_id_already_exist($composition_id[0])) {
                    $identifiers[] = $composition_id[0];
                }
            }
            if (!empty($identifiers)) {
                $identifiers_string = utility::array_to_string($identifiers);
                $i=0;
                $mysqli_result = mysqli_query($this->getDbLink(), "SELECT * FROM `compositions` WHERE `id` IN($identifiers_string) ORDER BY name ASC");
                while ($composition = mysqli_fetch_object($mysqli_result)){
                    $instance->compositions[$i]['id'] = $composition->id;
                    $instance->compositions[$i]['name'] = $composition->name;
                    $i+=1;
                }

                $instance->compositions_count = count($identifiers);

            }

        }
        return $instance;
    }


    /**
     * @param $search_request
     * @return array|bool
     */
    protected function search_compositions_id_by_request($search_request, $search_from = 0, $find_amount = 1000)
    {
        $search_request = utility::delete_multiple_whitespaces($search_request);
        $search_request = utility::add_pluses_before_words($search_request);

        // Search by compositions:
        $query_compositions = "SELECT *, MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) AS score
                  FROM `compositions` WHERE MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) ORDER BY score DESC LIMIT $search_from,$find_amount";
        $result_compositions = mysqli_query($this->getDbLink(), $query_compositions);
        $identifiers_compositions = array();
        while ($res = mysqli_fetch_row($result_compositions)) {
            $identifiers_compositions[] = $res[0];
        }
        if (count($identifiers_compositions)>= $find_amount) return $identifiers_compositions;
        // Search by authors:
        $query_authors = "SELECT *, MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) AS score
                  FROM `authors` WHERE MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) ORDER BY score DESC LIMIT $search_from,$find_amount";
        $result_authors = mysqli_query($this->getDbLink(), $query_authors);
        while ($res = mysqli_fetch_row($result_authors)) {
            $query_authorsCompositions = "SELECT * FROM `authorsCompositions` WHERE `author_id` = '$res[0]'";
            $result_authorsCompositions = mysqli_query($this->getDbLink(), $query_authorsCompositions);
            while ($authorsCompositions = mysqli_fetch_object($result_authorsCompositions)) {
                if ($this->composition_id_already_exist($authorsCompositions->composition_id)) {
                    $identifiers_compositions[] = $authorsCompositions->composition_id;
                }
            }
        }

        $identifiers_compositions = array_unique($identifiers_compositions);

        if (empty($identifiers_compositions)) {
            return false;
        } else {
            return $identifiers_compositions;
        }
    }

    /**
     * @param $search_request
     * @return array|bool
     */
    protected function search_authors_id_by_request($search_request, $search_from = 0, $find_amount = 1000)
    {
        $search_request = utility::add_pluses_before_words($search_request);
        $query = "SELECT *, MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) AS score
                  FROM `authors` WHERE MATCH(`name`) AGAINST('$search_request' IN BOOLEAN MODE) ORDER BY score DESC LIMIT $search_from,$find_amount";
        $result = mysqli_query($this->getDbLink(), $query);
        $identifiers = array();
        while ($res = mysqli_fetch_row($result)) {
            $identifiers[] = $res[0];
        }
        if (empty($identifiers)) {
            return false;
        } else {
            return $identifiers;
        }
    }
}