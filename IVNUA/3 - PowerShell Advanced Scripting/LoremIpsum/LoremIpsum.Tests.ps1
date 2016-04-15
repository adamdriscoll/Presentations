Import-Module (Join-Path $PSScriptRoot 'LoremIpsum.psd1') -Force -ErrorAction Stop

Describe "New-LoremIpsum" {
    Context "minWords is 5" {
        It "Should return at least 5 words"{
            $LoremIpsum = New-LoremIpsum -minWords 5 -maxWords 10 -minSentences 1 -maxSentences 1 -numParagraphs 1
            ($LoremIpsum.Split(" ").Length -ge 4) | should be $true 
        }
    }

    Context "maxWords is 10" {
        It "Should not return more than 10 words"{
            $LoremIpsum = New-LoremIpsum -minWords 5 -maxWords 10 -minSentences 1 -maxSentences 1 -numParagraphs 1
            ($LoremIpsum.Split(" ").Length -le 9) | should be $true 
        }
    }
}