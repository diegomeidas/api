<?php
	namespace Api\Http;

	class Rest{
		private $request;

		private $class;
		private $method;
		private $params = array();

		public function __construct($req) {
			$this->request = $req;
			$this->load();
		}

		public function load()
		{
			//var_dump($this->request['url']);exit;
			$newUrl = explode('/', $this->request['url']);
			array_shift($newUrl);
			//var_dump($newUrl);exit;

			if (isset($newUrl[0])) {
				$this->class = ucfirst($newUrl[0]).'Controller';
				array_shift($newUrl);

				if (isset($newUrl[0])) {
					$this->method = $newUrl[0];
					array_shift($newUrl);

					if (isset($newUrl[0])) {
						$this->params = $newUrl;
					}
				}
			}
		}

		public function run()
		{
			//var_dump($this->class);exit;
			if (class_exists('\Api\Http\Controllers\\'.$this->class) && method_exists('\Api\Http\Controllers\\'.$this->class, $this->method)) {

				try {
					$controll = "\Api\Http\Controllers\\".$this->class;
					//var_dump($controll);exit;
					$response = call_user_func_array(array(new $controll, $this->method), $this->params);
					return json_encode(array('data' => $response, 'status' => 'sucess'));
				} catch (\Exception $e) {
					return json_encode(array('data' => $e->getMessage(), 'status' => 'error'));
				}
				
			} else {

				return json_encode(array('data' => 'Operação Inválida', 'status' => 'error'));

			}
		}
	}