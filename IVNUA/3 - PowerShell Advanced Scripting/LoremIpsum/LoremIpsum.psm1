<#
    .SYNOPSIS 
        Creates a new Lorem Ipsum string with the specified characteristics.
#>
function New-LoremIpsum
{
    param([int]$minWords, [int]$maxWords, [int]$minSentences, [int]$maxSentences, [int]$numParagraphs) 
    
    if ($minWords -lt 0 -or $maxWords -lt 0 -or $minSentences -lt 0 -or $maxSentences -lt 0 -or $numParagraphs -lt 0)
    {
        throw "Parameters cannot be null."    
    }
    
    if ($minWords -lt $maxWords)
    {
        throw "MinWords cannot be greater than MaxWords."
    }
    
    if ($minSentences -lt $maxSentences)
    {
        throw "MinSentences cannot be greater than MaxSentences."
    }

    $words = @("lorem", "ipsum", "dolor", "sit", "amet", "consectetuer",
        "adipiscing", "elit", "sed", "diam", "nonummy", "nibh", "euismod",
        "tincidunt", "ut", "laoreet", "dolore", "magna", "aliquam", "erat")

    $numSentences = Get-Random -Minimum $minSentences -Maximum ($maxSentences + 1) 
    $numWords = Get-Random -Minimum $minWords -Maximum ($maxWords + 1) 

    $result = New-Object System.Text.StringBuilder
    for($p = 0; $p -lt $numParagraphs; $p++) {
        for($s = 0; $s -lt $numSentences; $s++) {
            for($w = 0; $w -lt $numWords; $w++) {
                if ($w -gt 0) { $result.Append(" ") | Out-Null }
                $result.Append($words[(Get-Random -Minimum 0 -Maximum $words.Length)]) | Out-Null
            }
            $result.Append(". ") | Out-Null
        }
        $result.Append("`r`n") | Out-Null
    }

    $result.ToString()
}