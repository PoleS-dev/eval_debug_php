<?php
require_once (__DIR__ . "/function.php");
require_once (__DIR__ . "/db.php");

// Récupération de l'URI actuelle de la requête utilisateur
// Cette partie extrait uniquement le chemin de l'URL (sans les paramètres GET ou les fragments)
$uri = parse_url($_SERVER['REQUEST_URI'])['path'];
echo $uri . "<br>";

// changer les données misent dans str_replace selon ce que vous trouvez dans le premier echo de $uri
$uri = str_replace('/EvalPhp', '', $uri);
echo $uri . "<br>";

if($uri == '/'){
    $uri = '/home';
}

// Définition des routes
// Ce tableau associe des chemins d'URI à des fichiers de contrôleurs spécifiques
// Le chemin dans l'URL (comme '/') est relié au contrôleur correspondant (comme 'HomeController.php')
$routes = [
    //La page d'accueil
    '/home' => 'HomeController.php',
    //Connexion déconnexion inscription
    '/register' => 'RegisterController.php',
    '/connection' => 'ConnectionController.php',
    '/logout' => 'LogoutController.php',
    //Les utilisateurs
    '/users' => 'UsersController.php',
    '/profile' => 'UserProfileController.php',
    //Les sujets
    '/subject' => 'SubjectController.php',
    //Les articles
    '/articles' => 'AllArticlesController.php',
    '/article' => 'ArticleController.php',
    '/addArticle' => 'AddArticleController.php',
    '/editArticle' => 'EditArticleController.php',
];



// Vérification de l'existence de la route dans le tableau des routes
// Si l'URI demandée existe dans le tableau, le contrôleur associé est inclus
if (array_key_exists($uri, $routes)) {
    // Inclusion dynamique du fichier contrôleur correspondant à l'URI
    require_once(__DIR__ . "/../app/Controllers/" . $routes[$uri]);
} else {
    // Si l'URI n'existe pas dans le tableau des routes, renvoie une erreur 404
    // http_response_code(404) indique que la page n'a pas été trouvée
    http_response_code(404);
    // Inclusion du fichier 404.php pour gérer l'affichage d'une page d'erreur personnalisée
    require_once(__DIR__ . '/../app/Controllers/404Controller.php');
}