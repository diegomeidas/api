<?php
    namespace Api\Http\Controllers;
    use Api\Http\Models\User;
    use Api\Http\Models\Producer;
    
    class ProducerController {

        public function getAll() 
        {
			
			//if (AuthController::checkToken()) {
				
                return Producer::selectAll();

			//}
			
			throw new \Exception('Não autenticado');
            
        }

        public function get($id = null) 
        {
			
			if (AuthController::checkToken()) {
				
				if ($id) {
					return Barber::select($id);
				} else {
					return Barber::selectAll();
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
        