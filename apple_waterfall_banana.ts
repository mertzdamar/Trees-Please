import { Tree } from 'trees-please';

class TreeNode {
  public children: TreeNode[];
  public value: any;
  constructor(value: any, children: TreeNode[]) {
    this.value = value;
    this.children = children;
  }
}

function createTree(nodes: TreeNode[]): Tree {
  const tree = new Tree();
  for (let i = 0; i < nodes.length; i++) {
    addNode(tree, nodes[i], null);
  }
  return tree;
}

function addNode(tree: Tree, node: TreeNode, parent: TreeNode | null): void {
  const treeNode = new Tree.Node(node.value);
  tree.add(treeNode, parent);
  for (let i = 0; i < node.children.length; i++) {
    addNode(tree, node.children[i], treeNode);
  }
}

const node1 = new TreeNode(1, []);

const node2 = new TreeNode(2, [
  new TreeNode(4, []),
  new TreeNode(5, [
    new TreeNode(7, [
      new TreeNode(9, [])
    ])
  ])
]);

const node3 = new TreeNode(3, [
  new TreeNode(6, [
    new TreeNode(8, [])
  ])
]);

const nodes = [node1, node2, node3];
const tree = createTree(nodes);

console.log(tree.toString());