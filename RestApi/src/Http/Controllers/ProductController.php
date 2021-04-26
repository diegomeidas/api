<?php
    namespace Api\Http\Controllers;
    use Api\Http\Models\User;
    use Api\Http\Models\Product;

    $id_producer = isset($_GET['producerId']) ? $_GET['producerId'] : "";
    
    class ProductController {        

        public function getAll() 
        {
			
			if (AuthController::checkToken()) {
				
                return Product::selectAll($id_producer);

			}
			
			throw new \Exception('Não autenticado');
            
        }

        public function get($id = null) 
        {
			
			if (AuthController::checkToken()) {
				
				if ($id) {
					return Product::select($id);
				} else {
					return Product::selectAll();
				}
			}
			
			throw new \Exception('Não autenticado');
            
        }

        public function post() 
        {
            //return $_POST;
            $data = $_POST;

            return User::insert($data);
        }

    }
        