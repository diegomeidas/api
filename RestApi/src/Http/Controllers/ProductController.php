<?php
    namespace Api\Http\Controllers;
    use Api\Http\Models\User;
    use Api\Http\Models\Product;
    
    class ProductController {        

        public function getAll() 
        {
            $id_producer = isset($_GET['producerId']) ? $_GET['producerId'] : "";			
			if (AuthController::checkToken()) {				
                return Product::selectAll($id_producer);
			}			
			throw new \Exception('Não autenticado');            
        }

        public function getHighlights() 
        {
            $id_producer = isset($_GET['producerId']) ? $_GET['producerId'] : "";			
			if (AuthController::checkToken()) {				
                return Product::selectHighlights($id_producer);
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
        