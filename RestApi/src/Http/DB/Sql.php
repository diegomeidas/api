<?php 


class Sql {

	/* const HOSTNAME = "localhost";
	const USERNAME = "u765433036_ftj";
	const PASSWORD = "Di@120012";
	const DBNAME = "u765433036_db_festeje"; */

	const HOSTNAME = "127.0.0.1";
	const USERNAME = "root";
	const PASSWORD = "";
	const DBNAME = "db_festeje";

	private $conn;

	public function __construct()
	{
		$this->conn = new \PDO(
			"mysql:dbname=".Sql::DBNAME.";host=".Sql::HOSTNAME.";charset=UTF8",
			Sql::USERNAME,
			Sql::PASSWORD
		);	
	}

	private function setParams($statement, $parameters = array())
	{
		foreach ($parameters as $key => $value) {						
			$this->bindParam($statement, $key, $value);
		}
	}

	private function bindParam($statement, $key, $value)
	{
		$statement->bindParam($key, $value);
	}

	public function query($rawQuery, $params = array())
	{
		$stmt = $this->conn->prepare($rawQuery);
		$this->setParams($stmt, $params);
		$stmt->execute();
	}

	public function queryLastId($rawQuery, $params = array())
	{

		$stmt = $this->conn->prepare($rawQuery);
		$this->setParams($stmt, $params);
		$stmt->execute();
		return $this->conn->lastInsertId();

	}

	public function select($rawQuery, $params = array()):array
	{
		$stmt = $this->conn->prepare($rawQuery);
		$this->setParams($stmt, $params);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);

		
			
		/* }else{
			$results['msg'] = 'erro';
			$results['erro'] = $this->conn->errorInfo();
			//var_dump($results['msg'] , 	$results['erro'], $rawQuery, $stmt->fetchAll(\PDO::FETCH_ASSOC), $this->conn->errorCode());exit;				
			$this->gravaErro($rawQuery);

			return $stmt->fetchAll(\PDO::FETCH_ASSOC);
		} */
	}


}

 ?>