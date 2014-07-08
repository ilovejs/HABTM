<?php
App::uses('AppController', 'Controller');

class PostsController extends AppController {

	public function index() {
		$this->Post->recursive = 0;
		$this->set('posts', $this->paginate());
	}

	public function view($id = null) {
		$this->Post->id = $id;
		if (!$this->Post->exists()) {
			throw new NotFoundException(__('Invalid post'));
		}
		/*
		 * Read has API: ($model, $queryData, $recursive)
		   http://api.cakephp.org/1.3/class-DboSource.html#_read	
		 */
		$this->set('post', $this->Post->read(null, $id));
	}

	public function add() {
		if ($this->request->is('post')) {
			$this->Post->create();
			//validation is removed
			$this->Post->validator()->remove('Tag');
			if ($this->Post->save($this->request->data)) {
				$this->Session->setFlash(__('The post has been saved'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The post could not be saved. Please, try again.'));
			}
		}
		//when GET
		$tags = $this->Post->Tag->find('list');
		//set to this view
		$this->set(compact('tags'));
	}
	
	public function add_with_validation() {
		if ($this->request->is('post')) {
			$this->Post->create();
			if ($this->Post->save($this->request->data)) {
				$this->Session->setFlash(__('The post has been saved'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The post could not be saved. Please, try again.'));
			}
			
		}
		$tags = $this->Post->Tag->find('list');
		$this->set(compact('tags'));
	}

	public function edit($id = null) {
		//set id first
		$this->Post->id = $id;
		//fall early
		if (!$this->Post->exists()) {
			throw new NotFoundException(__('Invalid post'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Post->save($this->request->data)) {
				$this->Session->setFlash(__('The post has been saved'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The post could not be saved. Please, try again.'));
			}
		} else {
			//Inject model into view
			//TODO: test different query in here
			$this->request->data = $this->Post->read(null, $id);
			//pr($this->request->data);
		}
		$tags = $this->Post->Tag->find('list');
		$this->set(compact('tags'));
	}

	public function delete($id = null) {
		//filter out !POST
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->Post->id = $id;
		if (!$this->Post->exists()) {
			throw new NotFoundException(__('Invalid post'));
		}
		if ($this->Post->delete()) {
			$this->Session->setFlash(__('Post deleted'));
			return $this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Post was not deleted'));
		return $this->redirect(array('action' => 'index'));
	}
}