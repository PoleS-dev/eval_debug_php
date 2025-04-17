<?php
require_once (__DIR__ . '/../Utils/checkForm.php');

$arrayError = [];

if(isset($_POST['mail'])){
    check('mail', $_POST['mail']);
    check('password', $_POST['password']);

    if(empty($arrayError)){
        $mail = htmlspecialchars($_POST['mail']);
        $password = htmlspecialchars($_POST['password']);

        $userQuery = "SELECT `mail`, `password` FROM `user` WHERE mail = :mail";
        $userStatement = $mysqlClient->prepare($userQuery);
        $userStatement->bindParam(':mail', $mail);
        $userStatement->execute();

      

        $user = $userStatement->fetch();

        if(!$user){
            redirectToRoute('register');
        } else {
            //Pour vérifier le mot de passe haché, on utilise password_verif
            //Dans la variable $verif on auras TRUE/FALSE 
            $verif = password_verify($password, $user['password']);
            if(!$verif){
                // redirectToRoute('/connection');
            }else{

                $userQuery = "SELECT `user`.`id`, `user`.`pseudo`, `user`.`mail`,`user`.`register_date`, `user`.`id_role`, `role`.`name` 
                FROM `user`
                INNER JOIN `role` ON `user`.`id_role` = `role`.`id` 
                WHERE mail = :mail";
                $userStatement = $mysqlClient->prepare($userQuery);
                $userStatement->bindParam(':mail', $mail);
                $userStatement->execute();

                $user = $userStatement->fetch(PDO::FETCH_ASSOC);
                echo "<pre>";
                print_r($user);
                echo "</pre>";

                $_SESSION['user'] = [
                    'id' => uniqid(),
                    'mail' => $user['mail'],
                    'role' => $user['name'],
                    'register_date' => $user['register_date'],
                    'idUser' => $user['id'],
                    'id_role' => $user['id_role'],
                    'pseudo' => $user['pseudo']
                ];

                redirectToRoute('home');
            }
        }

    }
}

require_once (__DIR__ . '/../Views/security/connection.view.php');