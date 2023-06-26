Public Class TreesPlease
    Private Sub TreesPlease_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim totalTrees As Integer
        Dim treeToPlant As Integer
        Dim treesPlanted As Integer
        Dim treesToGo As Integer
        Dim currentTree As Integer
        Dim message As String
        Dim messageResult As DialogResult
        Dim plantedTrees As Boolean

        totalTrees = 2000
        treeToPlant = 0
        treesPlanted = 0
        treesToGo = 0
        currentTree = 0
        plantedTrees = False

        Do While (plantedTrees = False)
            currentTree = currentTree + 1
            message = "Do you wish to plant tree number " & currentTree.ToString() & "?"
            messageResult = MessageBox.Show(message, "Plant This Tree?", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If (messageResult = DialogResult.Yes) Then
                treeToPlant = treeToPlant + 1
            End If

            If (treesPlanted >= totalTrees) Then
                plantedTrees = True
            Else
                treesToGo = totalTrees - treesPlanted
            End If
        Loop
        message = "You have planted " & treeToPlant.ToString() & " trees! " & treesToGo.ToString() & " trees remain to be planted."
        MessageBox.Show(message, "Trees Planted!", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
End Class