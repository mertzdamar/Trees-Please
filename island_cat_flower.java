game

import java.util.ArrayList;
import java.util.Scanner;

public class TreesPlease {
    
    // Data members
    private ArrayList<String> trees;
    
    // Constructor
    public TreesPlease() {
        this.trees = new ArrayList<String>();
    }
    
    // Methods
    
    // Adds a tree to the list
    public void addTree(){
        Scanner in = new Scanner(System.in);
        System.out.print("Name your tree: ");
        String treeName = in.nextLine();
        if (this.trees.contains(treeName)){
            System.out.println("This tree has already been added");
        }
        else {
            this.trees.add(treeName);
            System.out.println("Tree has been added succesfully");
        }
        in.close();
    }
    
    // Prints the list of trees
    public void printTrees(){
        if (this.trees.isEmpty()){
            System.out.println("No trees have been added yet");
        }
        else {
            for (String treeName : this.trees){
                System.out.println(treeName);
            }
        }
    }
    
    // Deletes a tree from the list
    public void deleteTree(){
        if (this.trees.isEmpty()){
            System.out.println("No trees to delete");
        }
        else {
            Scanner in = new Scanner(System.in);
            System.out.print("Type the name of the tree you want to delete: ");
            String input = in.nextLine();
            if(this.trees.contains(input)) {
                this.trees.remove(input);
                System.out.println("Tree has been deleted successfully");
            }
            else {
                System.out.println("Tree not found");
            }
            in.close();
        }
    }
    
    // Main method
    public static void main(String [] args){
        TreesPlease tp = new TreesPlease();
        tp.addTree();
        tp.addTree();
        tp.printTrees();
        tp.deleteTree();
        tp.printTrees();
    }
}