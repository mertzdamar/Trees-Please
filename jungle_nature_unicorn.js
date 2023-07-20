// Trees Please

// FILE 1 - main.js

// GLOBAL VARIABLES & CONSTANTS
const MAX_TREES = 2000; // Maximum amount of trees

// CLASSES
class Tree {
    constructor(name, height, age, type, healthStatus) {
        this.name = name;
        this.height = height;
        this.age = age;
        this.type = type;
        this.healthStatus = healthStatus; 
    }

    grow() {
        if (this.healthStatus === 'healthy') {
            this.height += 10;
        }
    }
}

// FUNCTIONS
// addTree() - adds a tree to the list
function addTree(name, height, age, type) {
    const tree = new Tree(name, height, age, type, 'healthy');
    trees.push(tree);
}

// healTree() - heals a tree by changing its health status
function healTree(name) {
    for (const tree of trees) {
        if (tree.name === name) {
            tree.healthStatus = 'healthy';
        }
    }
}

// removeTree() - removes a tree from the list
function removeTree(name) {
    for (let i = 0; i < trees.length; i++) {
        if (trees[i].name === name) {
            trees.splice(i, 1);
        }
    }
}

// countTrees() - counts number of trees in the list
function countTrees() {
    return trees.length;
}

// increaseHeight() - increases height of all trees
function increaseHeight() {
    for (const tree of trees) {
        tree.grow();
    }
}

// DATA
let trees = [
    { name: 'Oak', height: 15, age: 75, type: 'deciduous' },
    { name: 'Maple', height: 11, age: 65, type: 'deciduous' },
    { name: 'Pine', height: 20, age: 50, type: 'evergreen' },
    { name: 'Palm', height: 5, age: 10, type: 'evergreen' },
];

// MAIN
console.log('Welcome to Trees Please!');

// Checks if the number of trees in the list is less than the max
if (countTrees() < MAX_TREES) {
    addTree('Fir', 25, 75, 'evergreen');
} else {
    console.log('Cannot add tree. The maximum number of trees has been reached.');
}

// Heals a tree
healTree('Oak');

// Increases height of all trees
increaseHeight();

// Removes a tree
removeTree('Palm');

// Counts number of trees in the list
const totalTrees = countTrees();
console.log(`There are now ${totalTrees} trees in the list.`);