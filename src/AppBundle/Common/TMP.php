<?php
/**
 * Created by PhpStorm.
 * User: HarryTheOgre
 * Date: 26.04.2016
 * Time: 19:27
 */

/*
 * Конструктор запроса
 */
function construct_query($query, $table = 'compositions', $db = NULL)
{
    $cfg = new config();
    $db_name = $cfg->db;
    if (!isset($db)) $db = new db_general();
    $db->db_connect();
    $resource = mysql_list_fields($db_name, $table);

    for ($i = 0; $i < mysql_num_fields($resource); $i++) {
        $columns[] = mysql_field_name($resource, $i);
    };

    //foreach ($column in $columns)

    echo print_r($columns);

    $query = strtoupper($query);
    $query = strip_tags($query);
    $query = trim($query);
    $arq = explode(" ", $query, 200);
    foreach ($arq as $value) {
        $result_q = "(CONVERT( `name` USING utf8 ) LIKE '%$value%' OR CONVERT( `description` USING utf8 ) LIKE '%$value%') AND ";
    }
    $result_q = substr($result_q, 0, -5);
    return $result_q;
    //return $query;
}

// New
function get_search_result($query, $handle_search_query = FALSE, $table = 'compositions')
{
    $cfg = new config();
    $db_name = $cfg->db;
    if ($handle_search_query) {
        $result_q = "SELECT * FROM `$db_name`.`$table` WHERE ";
        $query = strtoupper($query);
        $query = strip_tags($query);
        $query = trim($query);
        $arq = explode(" ", $query, 200);
        foreach ($arq as $value) {
            $result_q = $result_q . "(CONVERT( `name` USING utf8 ) LIKE '%$value%' OR CONVERT( `description` USING utf8 ) LIKE '%$value%') AND ";
        }
        $result_q = substr($result_q, 0, -5);
        return $result_q;
    }
    return $query;
}

/*
 * Возвращает автора по id композиции
 */
function get_author_by_composition_id($id)
{
    $query = "SELECT `author_id` FROM `compositions` WHERE `id` = $id LIMIT 0 , 30";
    $result = mysql_fetch_array(mysql_query($query));
    $author_id = $result['author_id'];
    $query = "SELECT `name` FROM `composers` WHERE `id` = $author_id LIMIT 0 , 30";
    $result = mysql_fetch_array(mysql_query($query));
    return $result['name'];
}

function get_images_by_composition_id($id, &$page_id, &$filename, &$page)
{
    $page_id = array();
    $filename = array();
    $page = array();
    $query = "SELECT `id`, `filename`, `page` FROM `images` WHERE `composition_id` = $id ORDER BY `page`";
    $handled_query = mysql_query($query);
    while ($result = mysql_fetch_array($handled_query)) {
        $page_id[] = $result['id'];
        $filename[] = $result['filename'];
        $page[] = $result['page'];
    }
}

function get_composition_name_by_id($id)
{
    $query = "SELECT `name` FROM `compositions` WHERE `id` =$id LIMIT 0 , 30";
    $result = mysql_fetch_array(mysql_query($query));
    return $result['name'];
}

function get_composition_description_by_id($id)
{
    $query = "SELECT `description` FROM `compositions` WHERE `id` =$id LIMIT 0 , 30";
    $result = mysql_fetch_array(mysql_query($query));
    return $result['description'];
}



{{ form_start(upload_form) }}
<div class="container">
                    <div class="row">
                        {{ form_label(upload_form.add_global) }}
                        {{ form_widget(upload_form.add_global) }}
                    </div>
                </div>
                <div class="container">
                    <div class="row form-horizontal">
                        {{ form_label(upload_form.override) }}
                        {{ form_widget(upload_form.override) }}

                        {{ form_label(upload_form.add_composition) }}
                        {{ form_widget(upload_form.add_composition) }}
                        {{ form_label(upload_form.add_authors) }}
                        {{ form_widget(upload_form.add_authors) }}
                        {{ form_label(upload_form.add_image) }}
                        {{ form_widget(upload_form.add_image) }}
                    </div>

                </div>
                {{ form_widget(upload_form) }}
                {{ form_end(upload_form) }}

                /pictures/{{ composition_instance.path }}/{{ composition_instance.path }}.zip