<?php
    namespace Api\Http\Controllers;
    use Api\Http\Models\User;
    
    class BarberController {

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
        