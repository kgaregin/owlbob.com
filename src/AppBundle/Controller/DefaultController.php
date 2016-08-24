<?php

//ToDo: !!!!! Change on app.php $kernel = new AppKernel('prod', true); -------> $kernel = new AppKernel('prod', false);

namespace AppBundle\Controller;

use AppBundle\Common\config;
use AppBundle\Common\db_search;
use AppBundle\Common\db_uploader;
use AppBundle\Common\utility;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\SearchType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $db = new db_search();
        $db->db_connect();

        $search_form = $this->createFormBuilder($db, array('method' => 'GET', 'action' => 'search', 'attr' => array('id' => 'search_form')))
            ->add('search_request', SearchType::class, array('method' => 'GET', 'attr' => array('id' => 'search_input')))
            ->getForm();

        $search_form->handleRequest($request);

        $search_results = NULL;
        //echo print_r(mysqli_fetch_row(mysqli_query($db->getDbLink(),"SELECT `author_id` FROM `AuthorsCompositions` WHERE `composition_id` = 1")));


        return $this->render(':pages:index.html.twig', array(
            'search_form' => $search_form->createView(),
            'search_compositions_results' => $search_results,
            'config' => config::getConfigArray()
        ));
    }


    /**
     * @Route("/fill_db", name="fill_db")
     */
    public function generateDBAction()
    {
        utility::fill_bd_with_random_stuff();
        return new Response("New entries generated. Watch logs for more information.");
    }

    /**
     * @Route("/loadCompositions/{author_id}", name="loadCompositions")
     */
    public function loadCompositionsAction($author_id)
    {
        $db = new db_search();
        $db->db_connect();

        $author_instance = $db->get_author_instance_by_author_id($author_id);

        return $this->render(":elements:compositions_list.html.twig", array(
            'author_instance' => $author_instance
        ));
    }


    /**
     * @Route("/search", name="search")
     */
    public function searchAction(Request $request, $search_from = 0, $search_amount = 'default')
    {

        $db = new db_search();
        $db->db_connect();

        session_start();
        $_SESSION['search_compositions_from'] = 0;
        $_SESSION['search_authors_from'] = 0;

        $search_form = $this->createFormBuilder($db, array('method' => 'GET', 'attr' => array('id' => 'search_form')))
            ->add('search_request', SearchType::class, array('attr' => array('id' => 'search_input')))
            ->getForm();
        $search_form->handleRequest($request);

        if ($search_amount == 'default') $search_amount = config::$SEARCH_AMOUNT;
        $search_compositions_results = $db->getSearchCompositionsResult($_SESSION['search_compositions_from'], $search_amount);
        $search_authors_results = $db->getSearchAuthorsResult($_SESSION['search_authors_from'], $search_amount, false);

        return $this->render(':pages:search.html.twig', array(
            'search_form' => $search_form->createView(),
            'search_compositions_results' => $search_compositions_results,
            'search_authors_results' => $search_authors_results,
            'config' => config::getConfigArray(),
            'search_request' => $db->getSearchRequest(),
            'search_compositions_from' => $_SESSION['search_compositions_from'],
            'search_authors_from' => $_SESSION['search_authors_from']
        ));
    }

    /**
     * @Route("/searchMoreCompositions/{search_request}", name="searchMoreCompositions")
     */
    public function searchMoreCompositionsAction(Request $request, $search_request, $search_amount = 'default')
    {
        session_start();
        if (!isset($_SESSION['search_compositions_from'])) {
            $_SESSION['search_compositions_from'] = 0;
        } else {
            $_SESSION['search_compositions_from'] += config::$SEARCH_AMOUNT;
        }

        if ($search_amount == 'default') $search_amount = config::$SEARCH_AMOUNT;

        $db = new db_search();
        $db->db_connect();
        $db->setSearchRequest($search_request);
        $search_compositions_results = $db->getSearchCompositionsResult($_SESSION['search_compositions_from'], $search_amount);

        return $this->render(':elements:compositions_search_result.html.twig', array(
            'search_compositions_results' => $search_compositions_results,
            'config' => config::getConfigArray(),
            'search_request' => $db->getSearchRequest(),
            'search_compositions_from' => $_SESSION['search_compositions_from'],
        ));

    }

    /**
     * @Route("/searchMoreAuthors/{search_request}", name="searchMoreAuthors")
     */
    public function searchMoreAuthorsAction(Request $request, $search_request, $search_amount = 'default')
    {
        session_start();
        if (!isset($_SESSION['search_authors_from'])) {
            $_SESSION['search_authors_from'] = 0;
        } else {
            $_SESSION['search_authors_from'] += config::$SEARCH_AMOUNT;
        }

        if ($search_amount == 'default') $search_amount = config::$SEARCH_AMOUNT;

        $db = new db_search();
        $db->db_connect();
        $db->setSearchRequest($search_request);
        $search_authors_results = $db->getSearchAuthorsResult($_SESSION['search_authors_from'], $search_amount);

        return $this->render(':elements:authors_search_result.html.twig', array(
            'search_authors_results' => $search_authors_results,
            'config' => config::getConfigArray(),
            'search_request' => $db->getSearchRequest(),
            'search_authors_from' => $_SESSION['search_authors_from']
        ));

    }


    /**
     * @Route("/db_upload", name="db_upload")
     */
    public function db_uploadAction(Request $request)
    {
        $uploader = new db_uploader();
        $uploader->db_connect();
//        $_POST['XML'] = <<<XML
//<MetaData>
//<Login>winston</Login>
//<Password>cherchil</Password>
//<AuthorsNames>Raff, Joachim, 1822-1882</AuthorsNames>
//<CompositionsName>[3eme grand trio pour piano, violon et violoncelle, op. 155]</CompositionsName>
//<CompositionsDescription></CompositionsDescription>
//<CompositionsPath>img/3emegrandtriopouraff/</CompositionsPath>
//<CompositionsPublished></CompositionsPublished>
//<CompositionsCreated></CompositionsCreated>
//<CompositionsTags>Piano trios</CompositionsTags>
//<ImagesFilename>0001.png;;0002.png;;0003.png;;0004.png;;0005.png;;0006.png;;0007.png;;0008.png;;0009.png;;0010.png;;0011.png;;0012.png;;0013.png;;0014.png;;0016.png;;0017.png;;0018.png</ImagesFilename>
//</MetaData>
//XML;

        if (isset($_POST['XML'])) {

            $uploader->parseXML($_POST['XML']);
            $uploader->upload(true);
            return new Response($uploader->getResponse(true));
//            return $this->render(':pages:plane_text.html.twig', array(
//                'output' => $uploader->getResponse(true)
//            ));
        } else {
            $upload_form = $this->createFormBuilder($uploader)
                ->add('override', CheckboxType::class, array('label' => 'Override mode', 'required' => false))
                ->add('add_global', CheckboxType::class, array('label' => 'Metadata mode', 'required' => false))
                ->add('add_composition', CheckboxType::class, array('label' => 'Composition_edit', 'required' => false))
                ->add('add_authors', CheckboxType::class, array('label' => 'Authors_edit', 'required' => false))
                ->add('add_image', CheckboxType::class, array('label' => 'Image_edit', 'required' => false))
                ->add('login', TextType::class, array('label' => 'Login', 'required' => false))
                ->add('password', TextType::class, array('label' => 'Password', 'required' => false))
                ->add('authors_id', TextType::class, array('label' => 'authors_id', 'required' => false))
                ->add('authors_names', TextType::class, array('label' => 'authors_name', 'required' => false))
                ->add('compositions_id', TextType::class, array('label' => 'compositions_id', 'required' => false))
                ->add('compositions_name', TextType::class, array('label' => 'compositions_name', 'required' => false))
                ->add('compositions_description', TextType::class, array('label' => 'compositions_description', 'required' => false))
                ->add('compositions_path', TextType::class, array('label' => 'compositions_path', 'required' => false))
                ->add('compositions_published', TextType::class, array('label' => 'compositions_published', 'required' => false))
                ->add('compositions_created', TextType::class, array('label' => 'compositions_created', 'required' => false))
                ->add('compositions_tags', TextType::class, array('label' => 'compositions_tags', 'required' => false))
                ->add('compositions_genre', TextType::class, array('label' => 'compositions_genre', 'required' => false))
                ->add('compositions_instrument', TextType::class, array('label' => 'compositions_instrument', 'required' => false))
                ->add('images_id', TextType::class, array('label' => 'images_id', 'required' => false))
                ->add('images_filename', TextType::class, array('label' => 'images_filename', 'required' => false))
                ->add('images_page', TextType::class, array('label' => 'images_page', 'required' => false))
                ->add('images_composition_id', TextType::class, array('label' => 'images_composition_id', 'required' => false))
                ->add('images_cleaner_version', TextType::class, array('label' => 'images_cleaner_version', 'block_name' => 'images_cleaner_version', 'required' => false))
                ->add('submit', SubmitType::class, array('attr' => array('class' => 'btn btn-primary')))
                ->getForm();

            $upload_form->handleRequest($request);
            if ($upload_form->isSubmitted()) $uploader->upload();

            return $this->render('pages/db_upload.html.twig', array(
                'output' => $uploader->getResponse(),
                'upload_form' => $upload_form->createView(),
                'config' => config::getConfigArray()
            ));
        }
        //if (isset($_GET['help'])) { $uploader->response = '0 - all ok; 1 - wrong';} //handy help when calling ?help in address line

    }

    /**
     * @Route("/getZip/{path}", name="getZip")
     */
    public function downloadZipAction($path)
    {
        $fileName = utility::makeZipFile($path);

        if (file_exists(config::getTmpDirServerPath() . $fileName)) {
            $fileUrl = config::getSiteDomain() . config::$TmpDir . $fileName;
            header('Content-Type: application/zip');
            header('Content-Transfer-Encoding: Binary');
            header('Content-disposition: attachment; filename="' . $fileName . '"');
            readfile($fileUrl);
            exit;
        }
    }

    /**
     * @Route("/getPDF/{path}", name="getPDF")
     */
    public function downloadPDFAction($path)
    {
        $fileName = utility::makePdfFile($path);
        if (file_exists(config::getTmpDirServerPath() . $fileName)) {
            $fileUrl = config::getSiteDomain() . config::$TmpDir . $fileName;
            header('Content-Type: application/zip');
            header('Content-Transfer-Encoding: Binary');
            header('Content-disposition: attachment; filename="' . $fileName . '"');
            readfile($fileUrl);
            exit;
        }
    }


    /**
     * @Route("/about", name="about")
     */
    public function aboutAction()
    {

        return $this->render('pages/about.html.twig', array(
            'config' => config::getConfigArray()
        ));
    }

    /**
     * @Route("/composition/{id}", name="composition")
     */
    public function compositionAction($id)
    {
        $db_search = new db_search();
        $composition_instance = $db_search->get_composition_instance_by_composition_id($id);
        return $this->render(':pages:composition.html.twig', array(
            'composition_instance' => $composition_instance,
            'config' => config::getConfigArray()
        ));
    }

    /**
     * @Route("/author/{id}", name="author")
     */
    public function authorAction($id)
    {
        $db_search = new db_search();
        $author_instance = $db_search->get_author_instance_by_author_id($id);
        return $this->render(':pages:author.html.twig', array(
            'author_instance' => $author_instance,
            'config' => config::getConfigArray()
        ));
    }


    /**
     * @Route("/authors", name="authors")
     */
    public function authorsAction()
    {
        $db_search = new db_search();

        $id_list = $db_search->get_sorted_authors_id_list();
        foreach ($id_list as $id) {
            $author_instances[] = $db_search->get_author_instance_by_author_id($id, false);
        }

        return $this->render(':pages:authors.html.twig', array(
            'author_instances' => $author_instances,
            'alphabet' => utility::$ALPHABET,
            'config' => config::getConfigArray()
        ));
    }

    /**
     * @Route("/phpinfo", name="phpinfo")
     */
    public function phpinfoAction()
    {
        phpinfo();
        return $this->render(':pages:plane_text.html.twig');
    }


}
