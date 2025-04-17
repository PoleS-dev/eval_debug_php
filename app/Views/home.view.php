<?php
    require_once(__DIR__ . "/partials/head.php");
    if(isset($_SESSION['user'])){
     
        ?>
            <h1>Bienvenue <?= $_SESSION['user']['pseudo'] ?></h1>
            <div class="col-8 mx-auto d-block mt-5">
        <?php
        if(isset($subjects)){
            foreach($subjects as $subject){
            ?>
            <div class="card mt-3 mb-3">
                <div class="card-header colorPink">
                    <h2><?= $subject['title'] ?></h2>
                    <p class="fst-italic"><?= $subject['creation_date'] ?></p>
                </div>
           
                <div class="card-body">
                    <p class="card-text"><?= $subject['description'] ?></p>
                    <a href="articles?id=<?= $subject['id'] ?>" class="btn colorPink">Aller voir le sujet</a>
                </div>
            </div>
            <?php
            }
            ?>
            </div>
        <?php
        }
        }else {
?>
    <h1>Bienvenue à toi !</h1>
    
<?php
}
    include_once(__DIR__ . "/partials/footer.php");
?>