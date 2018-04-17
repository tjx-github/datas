<?php

//$data= `pt-query-digest --user=root --password=12345678 --history h=127.0.0.1,D=pt_query_digest,t=query_review_history  /var/lib/mysql/localhost-slow.log `;
// $data =preg_replace("/#{5,99}/","",$data);
$arr=explode("\n\n", preg_replace("/#{5,99}/","",`pt-query-digest --user=root --password=12345678 --history h=127.0.0.1,D=pt_query_digest,t=query_review_history  /var/lib/mysql/localhost-slow.log `));

echo count($arr);
foreach ($arr as $val){
    print_r(explode("#",$val));
}