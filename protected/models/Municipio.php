<?php

/**
 * This is the model class for table "municipio".
 *
 * The followings are the available columns in table 'municipio':
 * @property integer $id
 * @property integer $id_estado
 * @property string $nb_municipio
 *
 * The followings are the available model relations:
 * @property Estado $idEstado
 */
class Municipio extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Municipio the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'municipio';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_estado, nb_municipio', 'required'),
			array('id_estado', 'numerical', 'integerOnly'=>true),
			array('nb_municipio', 'length', 'max'=>80),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_estado, nb_municipio', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'Estado' => array(self::BELONGS_TO, 'Estado', 'id_estado'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_estado' => 'Id Estado',
			'nb_municipio' => 'Nb Municipio',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->with =array('Estado');
		$criteria->addSearchCondition('LOWER(Estado.nombre_estado)', strtolower($this->id_estado));
		$criteria->compare('nb_municipio',$this->nb_municipio,true);

		/*array(
			'header'=>'Estado',
			// Nombre de la columna en el CGridView
			'name'=>'id_estado',
			// Nombre del dato en el modelo
			'value' => '$data->estado->nombre_estado',
			// Valor a mostrar
			'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
			// Opciones HTML
			'filter' => CHtml::listData(TipoOrgG::model()->findAll(), 'id_estado',
			'nombre_estado'), // Colocamos un combo en el filtro
			),*/

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));

	}
}
