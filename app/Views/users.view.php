<?php
    require_once(__DIR__ . "/partials/head.php");
?>
    <h1>Les utilisateurs du forum</h1>
    <h2>Les utilisateurs</h2>
<?php
    if(isset($users)){
        foreach($users as $user){
            ?>
            <a href="profile?id=<?= $user['id'] ?>"><?= $user['pseudo'] ?></a>
            <?php
        }
    }
?>
    <h2>Les admins</h2>
    <?php
    if(isset($admins)){
        foreach($admins as $admin){
            ?>
            <a href="profile?id=<?= $admin['id'] ?>"><?= $admin['pseudo'] ?></a>
            <?php
        }
    }
?>
    

<?php
    include_once(__DIR__ . "/partials/footer.php");
?>