<?php 

$treesList = array();

//Function to add new trees to the list 

function addTreeToList($name, $type, $height, $colors) {
	global $treesList;
	$newTree = array(
		'name' => $name,
		'type' => $type,
		'height' => $height,
		'colors' => $colors
	);
	array_push($treesList, $newTree);
}

//Function to search list for a tree

function searchTreeList($searchTerm) {
	global $treesList;
	$searchResults = array();
	foreach ($treesList as $tree) {
		if (strpos($tree['name'],$searchTerm) !== false ||
			strpos($tree['type'],$searchTerm) !== false) {
			array_push($searchResults, $tree);
		}
	}
	return $searchResults;
}

//Function to print the list of trees

function printTreeList() {
   global $treesList;
   echo '<ul>';
   foreach ($treesList as $tree) {
      echo '<li>' . $tree['name'] . ' is a ' . $tree['type'] . ' ' .
           'that is ' . $tree['height'] . ' feet tall and has ' . 
           'foliage colors of ' . $tree['colors'] . '</li>';
   }
   echo '</ul>';
}

//Add some trees to the list
addTreeToList('Oak', 'Deciduous', 80, 'green');
addTreeToList('Maple', 'Deciduous', 50, 'red');
addTreeToList('Pine', 'Coniferous', 70, 'green');
addTreeToList('Palm', 'Palm', 40, 'green');

//Search for trees with 'green'
$searchResults = searchTreeList('green');

//Print the search results
echo '<h2>Search Results:</h2>';
printTreeList($searchResults);

//Print entire list
echo '<h2>All Trees:</h2>';
printTreeList($treesList);

?>