Public Class TreesPlease

Dim totalTrees As Integer

Dim plantedTrees As Integer

Sub PlantTrees()

For plantedTrees = 0 To 2000

'Select a location to plant tree

Dim treeX As Double

Dim treeY As Double

treeX = CInt(Rnd() * 1000)

treeY = CInt(Rnd() * 1000)

'Add tree to the environment

totalTrees = totalTrees + 1

plantedTrees = plantedTrees + 1

 'Display the number of trees planted

Console.WriteLine("Tree " & plantedTrees & " planted at (" & treeX & ", " & treeY & ")")

Next

Console.WriteLine("Trees Please planted " & totalTrees & " trees!")

End Sub


End Class