<?php
// src/Strixos/CatalogBundle/Document/Product.php
namespace Strixos\CatalogBundle\Document;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

/**
* @MongoDB\Document
*/
class Product
{
    /**
     * @MongoDB\Id
     */
    protected $id;

    /**
     * @MongoDB\String
     */
    protected $sku;

    /**
    * @MongoDB\String
    */
    protected $attributeSetCode;

    /**
    * @MongoDB\Raw
    */
    private $values = array();

    /**
     * Get id
     *
     * @return id $id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set sku
     *
     * @param string $sku
     * @return Product
     */
    public function setSku($sku)
    {
        $this->sku = $sku;
        return $this;
    }

    /**
     * Get sku
     *
     * @return string $sku
     */
    public function getSku()
    {
        return $this->sku;
    }

    /**
     * Add value
     *
     * @param string $attributeCode
     * @param mixed $value
    */
    public function addValue($attributeCode, $value)
    {
        $this->values[$attributeCode]= $value;
    }

    /**
     * Set values
     *
     * @param collection $values
     * @return Product
     */
    public function setValues($values)
    {
        $this->values = $values;
        return $this;
    }

    /**
     * Get values
     *
     * @return collection $values
     */
    public function getValues()
    {
        return $this->values;
    }

    /**
     * Set attributeSetCode
     *
     * @param string $attributeSetCode
     * @return Product
     */
    public function setAttributeSetCode($attributeSetCode)
    {
        $this->attributeSetCode = $attributeSetCode;
        return $this;
    }

    /**
     * Get attributeSetCode
     *
     * @return string $attributeSetCode
     */
    public function getAttributeSetCode()
    {
        return $this->attributeSetCode;
    }
}
