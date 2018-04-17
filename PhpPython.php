<?php






$dsn = 'mysql:dbname=test;host=192.168.2.106;port=3306';

//$dsn = 'mysql:dbname=test;host=127.0.0.1';
$user = 'linux';
$password = '123456';
echo time();
try {
    $dbh = new \PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}