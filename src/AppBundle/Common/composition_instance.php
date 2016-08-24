<?php
/**
 * Created by PhpStorm.
 * User: HarryTheOgre
 * Date: 26.04.2016
 * Time: 19:33
 */

namespace AppBundle\Common;


class composition_instance
{
    public $path;
    public $composition_name;
    public $composition_id;
    public $files; // 2-dim array with keys 'filename' and 'page'
    public $pages_count;
    public $description;
    public $authors; // 2-dim array with keys 'name' and 'id'
    public $authors_id;
    public $published;
    public $created;
    public $tags;

}