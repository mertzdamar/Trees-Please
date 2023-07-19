#include <stdio.h>
#include <stdlib.h>

struct node {
	int data;
	struct node *left, *right;
};

// Create a new node 
struct node *newNode(int item) 
{ 
	struct node *temp =  (struct node *)malloc(sizeof(struct node)); 
	temp->data = item; 
	temp->left = temp->right = NULL; 
	return temp; 
} 

// Inserts a new node in BST 
struct node *insert(struct node *node, int key) 
{ 
	// If the tree is empty, return a new node 
	if (node == NULL) return newNode(key); 

	// Otherwise, recur down the tree 
	if (key < node->data) 
		node->left = insert(node->left, key); 
	else if (key > node->data) 
		node->right = insert(node->right, key); 

	// return the (unchanged) node pointer 
	return node; 
} 

// function for Inorder Traversal 
void inorder(struct node *root) 
{ 
	if (root != NULL) 
	{ 
		inorder(root->left); 
		printf("%d ", root->data); 
		inorder(root->right); 
	} 
} 

// Return greatest value in right subtree 
struct node * minValueNode(struct node* node) 
{ 
	struct node* current = node; 

	// loop down to find the leftmost leaf 
	while (current && current->left != NULL) 
		current = current->left; 

	return current; 
} 

// deleting a node 
struct node* deleteNode(struct node* root, int key) 
{ 
	// base case 
	if (root == NULL) return root; 

	// If the key to be deleted is smaller than the root's key, 
	// then it lies in left subtree 
	if (key < root->data) 
		root->left = deleteNode(root->left, key); 

	// If the key to be deleted is greater than the root's key, 
	// then it lies in right subtree 
	else if (key > root->data) 
		root->right = deleteNode(root->right, key); 

	// if key is same as root's key, then This is the node 
	// to be deleted 
	else
	{ 
		// node with only one child or no child 
		if (root->left == NULL) 
		{ 
			struct node *temp = root->right; 
			free(root); 
			return temp; 
		} 
		else if (root->right == NULL) 
		{ 
			struct node *temp = root->left; 
			free(root); 
			return temp; 
		} 

		// node with two children: Get the inorder successor (smallest 
		// in the right subtree) 
		struct node* temp = minValueNode(root->right); 

		// Copy the inorder successor's content to this node 
		root->data = temp->data; 

		// Delete the inorder successor 
		root->right = deleteNode(root->right, temp->data); 
	} 
	return root; 
} 

// Searches for a given value in BST 
struct node *search(struct node *root, int item) 
{ 
	// Base Cases: root is null or key is present at root 
	if (root == NULL || root->data == item) 
		return root; 

	// Key is greater than root's key 
	if (root->data < item) 
		return search(root->right, item); 

	// Key is smaller than root's key 
	return search(root->left, item); 
} 

// Main function
int main() 
{ 
	/* Let us create following BST 
			  50 
		   /	 \ 
		  30	 70 
		 / \	 / \ 
	   20 40  60 80 */
	struct node *root = NULL; 
	root = insert(root, 50); 
	root = insert(root, 30); 
	root = insert(root, 20); 
	root = insert(root, 40); 
	root = insert(root, 70); 
	root = insert(root, 60); 
	root = insert(root, 80); 

	printf("Inorder traversal of the given tree \n"); 
	inorder(root); 

	printf("\nDelete 20\n"); 
	root = deleteNode(root, 20); 
	printf("Inorder traversal of the modified tree \n"); 
	inorder(root); 

	printf("\nDelete 30\n"); 
	root = deleteNode(root, 30); 
	printf("Inorder traversal of the modified tree \n"); 
	inorder(root); 

	printf("\nDelete 50\n"); 
	root = deleteNode(root, 50); 
	printf("Inorder traversal of the modified tree \n"); 
	inorder(root); 

	struct node *res = search(root, 50); 
	(res == NULL)? printf("50 Not Found\n"): 
					printf("50 Found\n"); 

	return 0; 
}