<html>
<head>
<title>Trees Please</title>
</head>
<body>

<?PHP
// Initialise variables
$trees = array(); 
$trees_per_page = 10; 
$maxpages = 0; 
$search_string = FALSE;
$resultstart = 0;
$resultend = 0;

// Get total number of trees in database
$totalRecords = getTreesCount();

// Calculate maximum page index
$maxpages = intval($totalRecords / $trees_per_page);
if($totalRecords % $trees_per_page != 0){
	$maxpages++;
}

// Check if search string is set
if(isset($_GET['q'])){
	$search_string = $_GET['q'];
}

// Get page index
if(isset($_GET['p']) && is_numeric($_GET['p'])){
	$pageindex = intval($_GET['p']);
	if($pageindex < 0){
		$pageindex = 0;
	}
	if($pageindex > $maxpages)
		$pageindex = $maxpages;
		
	// Calculate result range
	$resultstart = $pageindex * $trees_per_page;
	$resultend = $resultstart + $trees_per_page - 1;
}

// Get trees from database
if($search_string){
	$trees = searchTrees($search_string);
}
else {
	$trees = getTrees($resultstart, $resultend);
}

// Create pagination list
$pagelist = '';
for($i = 0; $i < $maxpages; $i++){
	$pagelist .= '<a href="index.php?p=' . $i . '">' . ($i + 1) . '</a>';
	if($i != $maxpages - 1)
		$pagelist .= ' | ';
}
?>

<!-- Title -->
<h1>Trees Please</h1>

<!-- Search Box -->
<form method="get" action="index.php">
	Search: <input type="text" name="q" />
	<input type="submit" value="Search" />
</form>

<!-- Results -->
<?php
if($trees){
	foreach($trees as $tree){
		echo '<h2>' . $tree->name . '</h2>';
		echo '<p>Height: ' . $tree->height . '</p>';
		echo '<p>Leaf Color: ' . $tree->color . '</p>';
		echo '<hr />';
	}
}
else {
	echo '<h2>No results found!</h2>';
}
?>

<!-- Pagination -->
<div>
	<p>Page: <?php echo $pagelist; ?></p>
</div>

</body>
</html>

<?php
// Functions
function getTreesCount(){
	// Connect to database
	$db = new mysqli('localhost', 'user', 'pass', 'trees');

	// Create query
	$countQuery = 'SELECT COUNT(*) AS count FROM trees';

	// Execute query
	$result = $db->query($countQuery);
	if($result){
		// Extract count
		$row = $result->fetch_object();
		$count = $row->count;

		// Cleanup
		$result->close();
		$db->close();

		return $count;
	}

	// Error
	return FALSE;
}

function searchTrees($queryString){
	// Connect to database
	$db = new mysqli('localhost', 'user', 'pass', 'trees');

	// Create query
	$searchQuery = 'SELECT * FROM trees WHERE name LIKE "%' . mysqli_escape_string($db, $queryString) . '%"';

	// Execute query
	$result = $db->query($searchQuery);
	if($result){
		// Extract trees
		$trees = array();
		while($row = $result->fetch_object()){
			$trees[] = $row;
		}

		// Cleanup
		$result->close();
		$db->close();

		return $trees;
	}

	// Error
	return FALSE;
}

function getTrees($startNum, $endNum){
	// Connect to database
	$db = new mysqli('localhost', 'user', 'pass', 'trees');

	// Create query
	$searchQuery = 'SELECT * FROM trees ORDER BY id LIMIT ' . $startNum . ', ' . $endNum;

	// Execute query
	$result = $db->query($searchQuery);
	if($result){
		// Extract trees
		$trees = array();
		while($row = $result->fetch_object()){
			$trees[] = $row;
		}

		// Cleanup
		$result->close();
		$db->close();

		return $trees;
	}

	// Error
	return FALSE;
}
?>