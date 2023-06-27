<?php

// Define a tree class
class Tree {
  public $type;
  public $height;
  public $age;

  public function __construct($type, $height, $age) {
    $this->type = $type;
    $this->height = $height;
    $this->age = $age;
  }

  public function getHeight() {
    return $this->height;
  }

  public function getAge() {
    return $this->age;
  }

  public function setHeight($height) {
    $this->height = $height;
    return $this;
  }

  public function setAge($age) {
    $this->age = $age;
    return $this;
  }

  public static function createTree($type, $height, $age) {
    return new Tree($type, $height, $age);
  }
}

// Define an oak tree class
class Oak extends Tree {
  public function __construct($height, $age) {
    parent::__construct('oak', $height, $age);
  }
}

// Define a maple tree class
class Maple extends Tree {
  public function __construct($height, $age) {
    parent::__construct('maple', $height, $age);
  }
}

// Create some trees
$oak1 = Oak::createTree(12, 8);
$oak2 = Oak::createTree(3, 5);
$maple1 = Maple::createTree(7, 10);

// Store each tree in an array
$trees = [$oak1, $oak2, $maple1];

// Loop through the array and print each tree's properties
foreach($trees as $tree) {
  echo "The {$tree->type} tree is {$tree->height} feet tall and is {$tree->age} years old." . "\n";
}

// Get the height of the first tree
$height = $trees[0]->getHeight();
echo "The first tree is $height feet tall." . "\n";

// Set the age of the second tree
$trees[1]->setAge(15);
echo "The second tree is now 15 years old." . "\n";