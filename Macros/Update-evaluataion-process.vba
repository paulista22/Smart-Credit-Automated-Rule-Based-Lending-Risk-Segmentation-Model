' Process:
' 1. Detect new clients in the Clean table
' 2. Copy their data to the Evaluations table
' 3. Apply the credit evaluation rules
' 4. Store the client ID in a dictionary to avoid duplicates
' 5. Continue with the next client

Option Explicit

Sub UpdateEvaluation()

    Dim wsClean As Worksheet: Set wsClean = Sheets("Clean_macro.")
    Dim wsEval As Worksheet: Set wsEval = Sheets("Evaluations")
    
    Dim tblClean As ListObject: Set tblClean = wsClean.ListObjects(1)
    Dim tblEval As ListObject: Set tblEval = wsEval.ListObjects(1)
    
    Dim dict As Object
    Set dict = CreateObject("Scripting.Dictionary")
    
    Dim dataClean, dataEval
    Dim i As Long
    Dim clientID
    
    Application.ScreenUpdating = False
    Application.EnableEvents = False

    'Load evaluation table into dictionary 
    dataEval = tblEval.ListColumns("ID").DataBodyRange.Value
    
    For i = 1 To UBound(dataEval, 1)
        dict(dataEval(i, 1)) = True
    Next i

    'Load clen table in memory
    dataClean = tblClean.DataBodyRange.Value
    
    Dim nextRow As Long
    nextRow = tblEval.ListRows.Count + 1

    'Loop through new clients
    For i = 1 To UBound(dataClean, 1)
    
        clientID = dataClean(i, 2)
        
        If Not dict.exists(clientID) Then
        
            tblEval.ListRows.Add
            
            WriteToCell tblClean, wsEval, i, nextRow, "ID"
            WriteToCell tblClean, wsEval, i, nextRow, "Client_Name"
            WriteToCell tblClean, wsEval, i, nextRow, "Age"
            WriteToCell tblClean, wsEval, i, nextRow, "Monthly_Income"
            WriteToCell tblClean, wsEval, i, nextRow, "Loan_Amount"
            WriteToCell tblClean, wsEval, i, nextRow, "Annual_Rate"
            WriteToCell tblClean, wsEval, i, nextRow, "Term_Years"
            WriteToCell tblClean, wsEval, i, nextRow, "Credit_Score"
            WriteToCell tblClean, wsEval, i, nextRow, "Years_Employment"
            WriteToCell tblClean, wsEval, i, nextRow, "Current_Debt"
            
            EvaluateNewRow wsEval.Rows(nextRow)
            
            dict(clientID) = True
            nextRow = nextRow + 1
            
        End If
        
    Next i

    Application.EnableEvents = True
    Application.ScreenUpdating = True

    MsgBox "Clients updated successfully"

End Sub

' 2. HELPER FUNCTION: Look the column by name and writes the value
Sub WriteToCell(tSource As ListObject, wsDest As Worksheet, sourceRow As Long, destRow As Long, colName As String)
    On Error Resume Next
    Dim sCol As Long, dCol As Long
    sCol = tSource.ListColumns(colName).Index
    dCol = wsDest.ListObjects(1).ListColumns(colName).Index
    
    If sCol > 0 And dCol > 0 Then
        ' Usamos Value2 para que el 0.087 entre limpio
        wsDest.Cells(destRow, dCol).Value2 = tSource.DataBodyRange.Cells(sourceRow, sCol).Value2
    End If
    On Error GoTo 0
End Sub

' 3. RULES MOTOR: Calculate the decision for a especific row 
Sub EvaluateNewRow(rng As Range)
    Dim wsEval As Worksheet: Set wsEval = Sheets("Evaluations")
    Dim tblEval As ListObject: Set tblEval = wsEval.ListObjects(1)
    Dim rowIndex As Long
    
    ' Variables for the logic 
    Dim age As Double, creditScore As Double
    Dim yearsEmployment As Double, currentDebt As Double
    Dim decision As String, triggeredRule As String

    ' Calculate the position for the row inside the data range table 
    rowIndex = rng.Row - tblEval.DataBodyRange.Row + 1
    
    ' If the row is new, rowIndex would be correct 
    ' Get values using the evaluations table columns
    With tblEval
        age = Val(.ListColumns("Age").DataBodyRange.Cells(rowIndex).Value)
        creditScore = Val(.ListColumns("Credit_Score").DataBodyRange.Cells(rowIndex).Value)
        yearsEmployment = Val(.ListColumns("Years_Employment").DataBodyRange.Cells(rowIndex).Value)
        currentDebt = Val(.ListColumns("Current_Debt").DataBodyRange.Cells(rowIndex).Value)
    End With

    ' --- Business logical ---
    If age < 25 Then
        decision = "Refused"
        triggeredRule = "Age Rule"
    ElseIf creditScore < 650 Then
        decision = "Refused"
        triggeredRule = "Very Low Credit Score Rule"
    ElseIf creditScore >= 650 And creditScore < 680 Then
        decision = "Revision"
        triggeredRule = "Moderate Credit Score Rule"
    ElseIf creditScore >= 680 And creditScore <= 700 And currentDebt < 15000 Then
        decision = "Approved"
        triggeredRule = "Mid Credit Profile Rule"
    ElseIf creditScore > 700 And yearsEmployment >= 2 And currentDebt < 15000 Then
        decision = "Approved"
        triggeredRule = "Strong Credit Profile Rule"
    Else
        decision = "Revision"
        triggeredRule = "Other Risk Factors"
    End If

    ' Write the results in their columns
    tblEval.ListColumns("Decision").DataBodyRange.Cells(rowIndex).Value = decision
    tblEval.ListColumns("Rule_Flag").DataBodyRange.Cells(rowIndex).Value = triggeredRule
End Sub

' 4. MASIVE RE-EVALUATED:
Sub ReevaluateAllClients()
    Dim wsEval As Worksheet: Set wsEval = Sheets("Evaluations")
    Dim tblEval As ListObject: Set tblEval = wsEval.ListObjects(1)
    Dim i As Long
    
    Application.ScreenUpdating = False
    For i = 1 To tblEval.ListRows.Count
        Call EvaluateNewRow(tblEval.ListRows(i).Range)
    Next i
    Application.ScreenUpdating = True
    
    MsgBox "¡All clients have been re-evaluated!"
End Sub
