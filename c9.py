$ip =  getenv("REMOTE_ADDR");
$port = "3306";
$user = "YorUsername";
$DB = "c9";

$conn = mysql_connect('$ip', '$user', '', '$db', '$port')or die(mysql_error());
mysql_select_db('$db','$conn')or die(mysql_error());