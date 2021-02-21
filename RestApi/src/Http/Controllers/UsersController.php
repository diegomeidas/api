<?php
	namespace Api\Http\Controllers;

	use Api\Http\Models\User;

	class UsersController {

		
		/* public function getall()
		{
			if (AuthController::checkAuth()) {
				return array(1 => 'Rafael', 2 => 'Bruna', 3 => 'Marcelo');
			}
			
			throw new \Exception('Não autenticado');
		} */

		public function get($id = null) 
        {
			
			if (AuthController::checkToken()) {
				
				if ($id) {
					return User::select($id);
				} else {
					return User::selectAll();
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

        public function update() 
        {
            
        }

        public function delete() 
        {
            
        }
	}