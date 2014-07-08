<?php
App::uses('AppModel', 'Model');

class Post extends AppModel {

	public $displayField = 'name';

	public $validate = array(
		'name' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
		'Tag' => array(
			'multiple' => array(
				'rule' => array('multiple', array('min' => 1)),
				'message' => 'You need to select at least one tag',
				'required' => true,
			),
		),
	);

	public $hasAndBelongsToMany = array(
		'Tag' => array(
			'className' => 'Tag',
			'joinTable' => 'posts_tags',
			'foreignKey' => 'post_id',
			'associationForeignKey' => 'tag_id',
			'unique' => 'keepExisting',
		)
	);
	
	/**
	 * Transforms the data array to save the HABTM relation
	 */
	public function beforeSave($options = array()){
		/* $this->hasAndBelongsToMany looks like: 
		 * 
		 * array(
			'Tag' => array(
				'className' => 'Tag',
				'joinTable' => 'posts_tags',
				'foreignKey' => 'post_id',
				'associationForeignKey' => 'tag_id',
				'unique' => 'keepExisting',
				'with' => 'PostsTag',
				'dynamicWith' => true,
				'conditions' => '',
				'fields' => '',
				'order' => '',
				'limit' => '',
				'offset' => '',
				'finderQuery' => '',
				'deleteQuery' => '',
				'insertQuery' => ''
			)
		)
		* */
		
		//TODO:before save callback
		foreach (array_keys($this->hasAndBelongsToMany) as $model){
			/*
			 * $this->name is not from in the view 
			   $this->name = 'Post'
			 * 
			 * $this->data['Post'] = array(
					'Post' => array(
						'id' => '6',
						'name' => 'post 6',
						'Tag' => array(
							(int) 0 => '4'
						),
						'modified' => '2014-07-08 16:41:27'
					)
				)
			 * 
			 * $model = 'Tag' 
			*/
			
			//like trunct a tree
			if(isset($this->data[$this->name][$model])){
				//TODO: magic here	
				/*Basically to save a HABTM relation you need the data to be structured like this:
				 * Array
					(
						[Post] => Array
								(
									[name] => my test post
								)
						[Tag] => Array
								(
									[Tag] => Array
										(
											[0] => 1
											[1] => 3
										)
								)
					)
				 * */
				$this->data[$model][$model] = $this->data[$this->name][$model];
				
				unset($this->data[$this->name][$model]);
			}
		}
		return true;
	}
}