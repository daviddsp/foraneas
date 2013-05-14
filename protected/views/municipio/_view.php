<?php
/* @var $this MunicipioController */
/* @var $data Municipio */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Nombre Estado')); ?>:
	<?php echo CHtml::encode($data->Estado->nombre_estado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre del municipio')); ?>:</b>
	<?php echo CHtml::encode($data->nb_municipio); ?>
	<br />


</div>
