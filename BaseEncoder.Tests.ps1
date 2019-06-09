Import-Module BaseEncoder
InModuleScope BaseEncoder {
    Describe "BaseEncoder Functional Tests" {
        Context "Prepare Temporary Test Files and Test Data" {
            Context "Set Test Variables" {
                It "SHA1CryptoServiceProvider Instance" {
                    $script:SHA1 = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
                    $SHA1 | Should -BeOfType System.Security.Cryptography.SHA1
                }
                It "Test Binary File Size Parameters" {
                    $script:SmallBinSize = 512000
                    $script:MedBinSize = 1024000
                    $script:LargeBinSize = 10240000
                    $SmallBinSize | Should -Be 512000
                    $MedBinSize | Should -Be 1024000
                    $LargeBinSize | Should -Be 10240000
                }
            }
            Context "Create Temporary Files" {
                It "Binary Files" {
                    $script:TestFile_smallbin = New-TemporaryFile
                    $script:TestFile_medbin = New-TemporaryFile
                    $script:TestFile_largebin = New-TemporaryFile
                    $TestFile_smallbin | Should -Exist
                    $TestFile_medbin | Should -Exist
                    $TestFile_largebin | Should -Exist
                }
                It "Plaintext Files with Known Content" {
                    $script:TestFile1_plain = New-TemporaryFile
                    $script:TestFile2_plain = New-TemporaryFile
                    $script:TestFile3_plain = New-TemporaryFile
                    $script:TestFile4_plain = New-TemporaryFile
                    $script:TestFile5_plain = New-TemporaryFile
                    $script:TestFile6_plain = New-TemporaryFile
                    $TestFile1_plain | Should -Exist
                    $TestFile2_plain | Should -Exist
                    $TestFile3_plain | Should -Exist
                    $TestFile4_plain | Should -Exist
                    $TestFile5_plain | Should -Exist
                    $TestFile6_plain | Should -Exist
                }
                It "Temporary Files For Encoding / Decoding Functions - Binary" {
                    $script:A85_ENC_smallfile = New-TemporaryFile
                    $script:A85_ENC_medfile = New-TemporaryFile
                    $script:A85_ENC_largefile = New-TemporaryFile
                    $script:B16_ENC_smallfile = New-TemporaryFile
                    $script:B16_ENC_medfile = New-TemporaryFile
                    $script:B16_ENC_largefile = New-TemporaryFile
                    $script:B32_ENC_smallfile = New-TemporaryFile
                    $script:B32_ENC_medfile = New-TemporaryFile
                    $script:B32_ENC_largefile = New-TemporaryFile
                    $script:B32h_ENC_smallfile = New-TemporaryFile
                    $script:B32h_ENC_medfile = New-TemporaryFile
                    $script:B32h_ENC_largefile = New-TemporaryFile
                    $script:B64_ENC_smallfile = New-TemporaryFile
                    $script:B64_ENC_medfile = New-TemporaryFile
                    $script:B64_ENC_largefile = New-TemporaryFile
                    $script:UU_F_ENC_smallfile = New-TemporaryFile
                    $script:UU_F_ENC_medfile = New-TemporaryFile
                    $script:UU_F_ENC_largefile = New-TemporaryFile
                    $script:UU_UNF_ENC_smallfile = New-TemporaryFile
                    $script:UU_UNF_ENC_medfile = New-TemporaryFile
                    $script:UU_UNF_ENC_largefile = New-TemporaryFile
                    $A85_ENC_smallfile | Should -Exist
                    $A85_ENC_medfile | Should -Exist
                    $A85_ENC_largefile | Should -Exist
                    $B16_ENC_smallfile | Should -Exist
                    $B16_ENC_medfile | Should -Exist
                    $B16_ENC_largefile | Should -Exist
                    $B32_ENC_smallfile | Should -Exist
                    $B32_ENC_medfile | Should -Exist
                    $B32_ENC_largefile | Should -Exist
                    $B32h_ENC_smallfile | Should -Exist
                    $B32h_ENC_medfile | Should -Exist
                    $B32h_ENC_largefile | Should -Exist
                    $B64_ENC_smallfile | Should -Exist
                    $B64_ENC_medfile | Should -Exist
                    $B64_ENC_largefile | Should -Exist
                    $UU_F_ENC_smallfile | Should -Exist
                    $UU_F_ENC_medfile | Should -Exist
                    $UU_F_ENC_largefile | Should -Exist
                    $UU_UNF_ENC_smallfile | Should -Exist
                    $UU_UNF_ENC_medfile | Should -Exist
                    $UU_UNF_ENC_largefile | Should -Exist
                }
                It "Temporary Files For Encoding / Decoding Functions - Text" {
                    $script:TestFile1_A85 = New-TemporaryFile
                    $script:TestFile2_A85 = New-TemporaryFile
                    $script:TestFile3_A85 = New-TemporaryFile
                    $script:TestFile1_B16 = New-TemporaryFile
                    $script:TestFile2_B16 = New-TemporaryFile
                    $script:TestFile3_B16 = New-TemporaryFile
                    $script:TestFile1_B32 = New-TemporaryFile
                    $script:TestFile2_B32 = New-TemporaryFile
                    $script:TestFile3_B32 = New-TemporaryFile
                    $script:TestFile4_B32h = New-TemporaryFile
                    $script:TestFile5_B32h = New-TemporaryFile
                    $script:TestFile6_B32h = New-TemporaryFile
                    $script:TestFile1_B64 = New-TemporaryFile
                    $script:TestFile2_B64 = New-TemporaryFile
                    $script:TestFile3_B64 = New-TemporaryFile
                    $script:TestFile1_UU = New-TemporaryFile
                    $script:TestFile2_UU = New-TemporaryFile
                    $script:TestFile3_UU = New-TemporaryFile
                    $TestFile1_A85 | Should -Exist
                    $TestFile2_A85 | Should -Exist
                    $TestFile3_A85 | Should -Exist
                    $TestFile1_B16 | Should -Exist
                    $TestFile2_B16 | Should -Exist
                    $TestFile3_B16 | Should -Exist
                    $TestFile1_B32 | Should -Exist
                    $TestFile2_B32 | Should -Exist
                    $TestFile3_B32 | Should -Exist
                    $TestFile4_B32h | Should -Exist
                    $TestFile5_B32h | Should -Exist
                    $TestFile6_B32h | Should -Exist
                    $TestFile1_B64 | Should -Exist
                    $TestFile2_B64 | Should -Exist
                    $TestFile3_B64 | Should -Exist
                    $TestFile1_UU | Should -Exist
                    $TestFile2_UU | Should -Exist
                    $TestFile3_UU | Should -Exist
                }
            }
            Context "Create Test File Content" {
                It "Small Binary File" {
                    $Null = [System.IO.File]::WriteAllBytes($TestFile_smallbin, (Get-RandomByteArray($SmallBinSize)))
                    Context "Create Binary File of $($SmallBinSize) Bytes and Calculate SHA-1 Hash" {
                        $script:TestFile_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($TestFile_smallbin)))|ForEach-Object ToString X2) -join '')"
                    }
                    $TestFile_smallbin.Length | Should -Be $SmallBinSize
                }
                It "Medium Binary File" {
                    $Null = [System.IO.File]::WriteAllBytes($TestFile_medbin, (Get-RandomByteArray($MedBinSize)))
                    Context "Create Binary File of $($MedBinSize) Bytes and Calculate SHA-1 Hash" {
                        $script:TestFile_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($TestFile_medbin)))|ForEach-Object ToString X2) -join '')"
                    }
                    $TestFile_medbin.Length | Should -Be $MedBinSize
                }
                It "Large Binary File" {
                    $Null = [System.IO.File]::WriteAllBytes($TestFile_largebin, (Get-RandomByteArray($LargeBinSize)))
                    Context "Create Binary File of $($LargeBinSize) Bytes and Calculate SHA-1 Hash" {
                        $script:TestFile_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($TestFile_largebin)))|ForEach-Object ToString X2) -join '')"
                    }
                    $TestFile_largebin.Length | Should -Be $LargeBinSize
                }
                Context "Populate Test File Content" {
                    Set-Content -Path $TestFile1_plain -Value "This is plain text file 1"
                    Set-Content -Path $TestFile2_plain -Value "Short file #2"
                    Set-Content -Path $TestFile3_plain -Value "This is a large, more complex text file! Now with punctuation!"
                    Set-Content -Path $TestFile4_plain -Value "This is plain text file 1"
                    Set-Content -Path $TestFile5_plain -Value "Short file #2"
                    Set-Content -Path $TestFile6_plain -Value "This is a large, more complex text file! Now with punctuation!"
                    Set-Content -Path $TestFile1_A85 -Value "<+oue+DGm>E,8rsDBO%4G]Y'?Bl%?'0``"
                    Set-Content -Path $TestFile2_A85 -Value ";eU)iF<G10Ch4_61&"
                    Set-Content -Path $TestFile3_A85 -Value "<+oue+DGm>@3BApEbAr7+Dl%;AKYK`$D/a<&GT_*>G]Y'?Bl%?(+AQj!+EqOABHV8:DI[d2@<?4%DBS"
                    Set-Content -Path $TestFile1_B16 -Value "5468697320697320706C61696E20746578742066696C6520310D0A"
                    Set-Content -Path $TestFile2_B16 -Value "53686F72742066696C652023320D0A"
                    Set-Content -Path $TestFile3_B16 -Value "546869732069732061206C617267652C206D6F726520636F6D706C657820746578742066696C6521204E6F7720776974682070756E6374756174696F6E210D0A"
                    Set-Content -Path $TestFile1_B32 -Value "KRUGS4ZANFZSA4DMMFUW4IDUMV4HIIDGNFWGKIBRBUFA===="
                    Set-Content -Path $TestFile2_B32 -Value "KNUG64TUEBTGS3DFEARTEDIK"
                    Set-Content -Path $TestFile3_B32 -Value "KRUGS4ZANFZSAYJANRQXEZ3FFQQG233SMUQGG33NOBWGK6BAORSXQ5BAMZUWYZJBEBHG65ZAO5UXI2BAOB2W4Y3UOVQXI2LPNYQQ2CQ="
                    Set-Content -Path $TestFile4_B32h -Value "AHK6ISP0D5PI0S3CC5KMS83KCLS78836D5M6A81H1K50===="
                    Set-Content -Path $TestFile5_B32h -Value "ADK6USJK41J6IR3540HJ438A"
                    Set-Content -Path $TestFile6_B32h -Value "AHK6ISP0D5PI0O90DHGN4PR55GG6QRRICKG66RRDE1M6AU10EHINGT10CPKMOP914176UTP0ETKN8Q10E1QMSORKELGN8QBFDOGGQ2G="
                    Set-Content -Path $TestFile1_B64 -Value "VGhpcyBpcyBwbGFpbiB0ZXh0IGZpbGUgMQ0K"
                    Set-Content -Path $TestFile2_B64 -Value "U2hvcnQgZmlsZSAjMg0K"
                    Set-Content -Path $TestFile3_B64 -Value "VGhpcyBpcyBhIGxhcmdlLCBtb3JlIGNvbXBsZXggdGV4dCBmaWxlISBOb3cgd2l0aCBwdW5jdHVhdGlvbiENCg=="
                    Set-Content -Path $TestFile1_UU -Value "begin 0744 testfile`n;5&AI<R!I<R!P;&%I;B!T97AT(&9I;&4@,0T*`n```nend"
                    Set-Content -Path $TestFile2_UU -Value "begin 0744 testfile`n/4VAO<G0@9FEL92 C,@T*`n```nend"
                    Set-Content -Path $TestFile3_UU -Value "begin 0744 testfile`nM5&AI<R!I<R!A(&QA<F=E+""!M;W)E(&-O;7!L97@@=&5X=""!F:6QE(2!.;W<@`n3=VET:""!P=6YC='5A=&EO;B$-""@`n```nend"
                }
            }
        }
 Describe "Ascii85 Functional Tests" {
            Describe "ConvertTo-Ascii85 Byte Input Operations" {
                It "Given bytes 0x66, return string 'Ac'" {
                    [System.Byte[]]$TestBytes1_A85 = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$A85_b_f = ConvertTo-Ascii85 $TestBytes1_A85 -Unformatted
                    $A85_b_f.Ascii85EncodedData | Should -Be "Ac"
                }
                It "Given bytes 0x666F, return string 'Ao@'" {
                    [System.Byte[]]$TestBytes2_A85 = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$A85_b_fo = ConvertTo-Ascii85 $TestBytes2_A85 -Unformatted
                    $A85_b_fo.Ascii85EncodedData | Should -Be "Ao@"
                }
                It "Given bytes 0x666F6F, return string 'AoDS'" {
                    [System.Byte[]]$TestBytes3_A85 = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$A85_b_foo = ConvertTo-Ascii85 $TestBytes3_A85 -Unformatted
                    $A85_b_foo.Ascii85EncodedData | Should -Be "AoDS"
                }
                It "Given bytes 0x666F6F62, return string 'AoDTs'" {
                    [System.Byte[]]$TestBytes4_A85 = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$A85_b_foob = ConvertTo-Ascii85 $TestBytes4_A85 -Unformatted
                    $A85_b_foob.Ascii85EncodedData | Should -Be "AoDTs"
                }
                It "Given bytes 0x666F6F6261, return string 'AoDTs@/'" {
                    [System.Byte[]]$TestBytes5_A85 = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$A85_b_fooba = ConvertTo-Ascii85 $TestBytes5_A85 -Unformatted
                    $A85_b_fooba.Ascii85EncodedData | Should -Be "AoDTs@/"
                }
                It "Given bytes 0x666F6F626172, return string 'AoDTs@<)'" {
                    [System.Byte[]]$TestBytes6_A85 = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$A85_b_foobar = ConvertTo-Ascii85 $TestBytes6_A85 -Unformatted
                    $A85_b_foobar.Ascii85EncodedData | Should -Be "AoDTs@<)"
                }
            }
            Describe "ConvertTo-Ascii85 String Input Operations" {
                It "Given string 'f', return string 'Ac'" {
                    [System.String]$A85_s_f = ConvertTo-Ascii85 "f" -Raw -Unformatted
                    $A85_s_f | Should -Be "Ac"
                }
                It "Given string 'fo', return string 'Ao@'" {
                    [System.String]$A85_s_fo = ConvertTo-Ascii85 "fo" -Raw -Unformatted
                    $A85_s_fo | Should -Be "Ao@"
                }
                It "Given string 'foo', return string 'AoDS'" {
                    [System.String]$A85_s_foo = ConvertTo-Ascii85 "foo" -Raw -Unformatted
                    $A85_s_foo | Should -Be "AoDS"
                }
                It "Given string 'foob', return string 'AoDTs'" {
                    [System.String]$A85_s_foob = ConvertTo-Ascii85 "foob" -Raw -Unformatted
                    $A85_s_foob | Should -Be "AoDTs"
                }
                It "Given string 'fooba', return string 'AoDTs@/'" {
                    [System.String]$A85_s_fooba = ConvertTo-Ascii85 "fooba" -Raw -Unformatted
                    $A85_s_fooba | Should -Be "AoDTs@/"
                }
                It "Given string 'foobar', return string 'AoDTs@<)'" {
                    [System.String]$A85_s_foobar = ConvertTo-Ascii85 "foobar" -Raw -Unformatted
                    $A85_s_foobar | Should -Be "AoDTs@<)"
                }
            }
            Describe "ConvertTo-Ascii85 File Operations - Content" {
                It "Given file with content 'This is plain text file 1', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile1_A85out = ConvertTo-Ascii85 -InFile $TestFile1_plain -AutoSave "A85" -Unformatted
                    $TestFile1_A85out.FullName -like "*.A85" | Should -Be $True
                    $TestFile1_A85out.Exists | Should -Be $True
                    Get-Content $TestFile1_A85out | Should -Be "<+oue+DGm>E,8rsDBO%4G]Y'?Bl%?'0b""H"
                    $Null = Remove-Item $TestFile1_A85out
                }
                It "Given file with content 'Short file #2', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile2_A85out = ConvertTo-Ascii85 $TestFile2_plain -AutoSave "A85" -Unformatted
                    $TestFile2_A85out.FullName -like "*.A85" | Should -Be $True
                    $TestFile2_A85out.Exists | Should -Be $True
                    Get-Content $TestFile2_A85out | Should -Be ";eU)iF<G10Ch4_61(=Q"
                    $Null = Remove-Item $TestFile2_A85out
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile3_A85out = ConvertTo-Ascii85 $TestFile3_plain -AutoSave "A85" -Unformatted
                    $TestFile3_A85out.FullName -like "*.A85" | Should -Be $True
                    $TestFile3_A85out.Exists | Should -Be $True
                    Get-Content $TestFile3_A85out | Should -Be "<+oue+DGm>@3BApEbAr7+Dl%;AKYK`$D/a<&GT_*>G]Y'?Bl%?(+AQj!+EqOABHV8:DI[d2@<?4%DBTGr"
                    $Null = Remove-Item $TestFile3_A85out
                }
            }
            Describe "ConvertTo-Ascii85 File Operations - Integrity" {
                It "Convert small binary file to Ascii85 format output file" {
                    $A85_ENC_smallbin = ConvertTo-Ascii85 -InFile $TestFile_smallbin -AutoSave "A85"
                    $A85_ENC_smallbin.FullName -like "*.A85" | Should -Be $True
                    $A85_ENC_smallbin.Exists | Should -Be $True
                    $A85_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    $A85_ENC_smallbin_contentH = Get-Content $A85_ENC_smallbin -First 1
                    $A85_ENC_smallbin_contentF = Get-Content $A85_ENC_smallbin -Tail 1
                    $A85_ENC_smallbin_contentH.SubString(0,2) | Should -Be "<~"
                    $A85_ENC_smallbin_contentF.SubString($A85_ENC_smallbin_contentF.Length - 2) | Should -Be "~>"
                    Copy-Item -Path $A85_ENC_smallbin -Destination $A85_ENC_smallfile -Force
                    $Null = Remove-Item $A85_ENC_smallbin
                }
                It "Convert medium binary file to Ascii85 format output file" {
                    $A85_ENC_medbin = ConvertTo-Ascii85 -InFile $TestFile_medbin -AutoSave "A85"
                    $A85_ENC_medbin.FullName -like "*.A85" | Should -Be $True
                    $A85_ENC_medbin.Exists | Should -Be $True
                    $A85_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    $A85_ENC_medbin_contentH = Get-Content $A85_ENC_medbin -First 1
                    $A85_ENC_medbin_contentF = Get-Content $A85_ENC_medbin -Tail 1
                    $A85_ENC_medbin_contentH.SubString(0,2) | Should -Be "<~"
                    $A85_ENC_medbin_contentF.SubString($A85_ENC_medbin_contentF.Length - 2) | Should -Be "~>"
                    Copy-Item -Path $A85_ENC_medbin -Destination $A85_ENC_medfile -Force
                    $Null = Remove-Item $A85_ENC_medbin
                }
                It "Convert large binary file to Ascii85 format output file" {
                    $A85_ENC_largebin = ConvertTo-Ascii85 -InFile $TestFile_largebin -AutoSave "A85"
                    $A85_ENC_largebin.FullName -like "*.A85" | Should -Be $True
                    $A85_ENC_largebin.Exists | Should -Be $True
                    $A85_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    $A85_ENC_largebin_contentH = Get-Content $A85_ENC_largebin -First 1
                    $A85_ENC_largebin_contentF = Get-Content $A85_ENC_largebin -Tail 1
                    $A85_ENC_largebin_contentH.SubString(0,2) | Should -Be "<~"
                    $A85_ENC_largebin_contentF.SubString($A85_ENC_largebin_contentF.Length - 2) | Should -Be "~>"
                    Copy-Item -Path $A85_ENC_largebin -Destination $A85_ENC_largefile -Force
                    $Null = Remove-Item $A85_ENC_largebin
                }
            }
            Describe "ConvertFrom-Ascii85 Byte Output Operations" {
                It "Given string 'Ac', return bytes 0x66" {
                    [System.Byte[]]$b_f_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "Ac" -OutBytes -Raw
                    $b_f_A85 | Should -Be 0x66
                }
                It "Given string 'Ao@', return bytes 0x666F" {
                    [System.Byte[]]$b_fo_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "Ao@" -OutBytes -Raw
                    $b_fo_A85 | Should -Be @(0x66,0x6F)
                }
                It "Given string 'AoDS', return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDS" -OutBytes -Raw
                    $b_foo_A85 | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string 'AoDTs', return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs" -OutBytes -Raw
                    $b_foob_A85 | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string 'AoDTs@/', return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs@/" -OutBytes -Raw
                    $b_fooba_A85 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string 'AoDTs@<)', return bytes 0x666F6F626172" {
                    [System.Byte[]]$b_foobar_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs@<)" -OutBytes -Raw
                    $b_foobar_A85 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
            }
            Describe "ConvertFrom-Ascii85 String Output Operations" {
                It "Given string 'Ac', return string 'f'" {
                    [System.String]$s_f_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "Ac" -Raw
                    $s_f_A85 | Should -Be "f"
                }
                It "Given string 'Ao@', return string 'fo'" {
                    [System.String]$s_fo_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "Ao@" -Raw
                    $s_fo_A85 | Should -Be "fo"
                }
                It "Given string 'AoDS', return string 'foo'" {
                    [System.String]$s_foo_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDS" -Raw
                    $s_foo_A85 | Should -Be "foo"
                }
                It "Given string 'AoDTs', return string 'foob'" {
                    [System.String]$s_foob_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs" -Raw
                    $s_foob_A85 | Should -Be "foob"
                }
                It "Given string 'AoDTs@/', return string 'fooba'" {
                    [System.String]$s_fooba_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs@/" -Raw
                    $s_fooba_A85 | Should -Be "fooba"
                }
                It "Given string 'AoDTs@<)', return string 'foobar'" {
                    [System.String]$s_foobar_A85 = ConvertFrom-Ascii85 -Ascii85EncodedString "AoDTs@<)" -Raw
                    $s_foobar_A85 | Should -Be "foobar"
                }
            }
            Describe "ConvertFrom-Ascii85 File Operations - Content" {
                It "Given file with content '<+oue+DGm>E,8rsDBO%4G]Y'?Bl%?'0``', produce file with correct plaintext" {
                    [System.IO.FileInfo]$A85_TestFile1out = ConvertFrom-Ascii85 $TestFile1_A85 -AutoSave "DEC"
                    $A85_TestFile1out.FullName -like "*.DEC" | Should -Be $True
                    $A85_TestFile1out.Exists | Should -Be $True
                    Get-Content $A85_TestFile1out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $A85_TestFile1out
                }
                It "Given file with content ';eU)iF<G10Ch4_61&', produce file with correct plaintext" {
                    [System.IO.FileInfo]$A85_TestFile2out = ConvertFrom-Ascii85 $TestFile2_A85 -AutoSave "DEC"
                    $A85_TestFile2out.FullName -like "*.DEC" | Should -Be $True
                    $A85_TestFile2out.Exists | Should -Be $True
                    Get-Content $A85_TestFile2out | Should -Be "Short file #2"
                    $Null = Remove-Item $A85_TestFile2out
                }
                It "Given file with content '<+oue+DGm>@3BApEbAr7+Dl%;AKYK`$D/a<&GT_*>G]Y'?Bl%?(+AQj!+EqOABHV8:DI[d2@<?4%DBS', produce file with correct plaintext" {
                    [System.IO.FileInfo]$A85_TestFile3out = ConvertFrom-Ascii85 $TestFile3_A85 -AutoSave "DEC"
                    $A85_TestFile3out.FullName -like "*.DEC" | Should -Be $True
                    $A85_TestFile3out.Exists | Should -Be $True
                    Get-Content $A85_TestFile3out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $A85_TestFile3out
                }
            }
            Describe "ConvertFrom-Ascii85 File Operations - Integrity" {
                It "Decode small binary file from Ascii85 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$A85_DEC_smallbin = ConvertFrom-Ascii85 -InFile $A85_ENC_smallfile -AutoSave "A85DEC"
                    [System.String]$A85_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($A85_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $A85_DEC_smallbin.FullName -like "*.A85DEC" | Should -Be $True
                    $A85_DEC_smallbin.Exists | Should -Be $True
                    $A85_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $A85_DEC_smallbin
                }
                It "Decode medium binary file from Ascii85 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$A85_DEC_medbin = ConvertFrom-Ascii85 -InFile $A85_ENC_medfile -AutoSave "A85DEC"
                    [System.String]$A85_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($A85_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $A85_DEC_medbin.FullName -like "*.A85DEC" | Should -Be $True
                    $A85_DEC_medbin.Exists | Should -Be $True
                    $A85_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $A85_DEC_medbin
                }
                It "Decode large binary file from Ascii85 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$A85_DEC_largebin = ConvertFrom-Ascii85 -InFile $A85_ENC_largefile -AutoSave "A85DEC"
                    [System.String]$A85_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($A85_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $A85_DEC_largebin.FullName -like "*.A85DEC" | Should -Be $True
                    $A85_DEC_largebin.Exists | Should -Be $True
                    $A85_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $A85_DEC_largebin
                }
            }
        }
        Describe "Base16 Functional Tests" {
            Describe "ConvertTo-Base16 Byte Input Operations" {
                It "Given bytes 0x66, return string '66'" {
                    [System.Byte[]]$TestBytes1_B16 = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$B16_b_f = ConvertTo-Base16 $TestBytes1_B16 -Unformatted
                    $B16_b_f.Base16EncodedData | Should -Be "66"
                }
                It "Given bytes 0x666F, return string '666F'" {
                    [System.Byte[]]$TestBytes2_B16 = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$B16_b_fo = ConvertTo-Base16 $TestBytes2_B16 -Unformatted
                    $B16_b_fo.Base16EncodedData | Should -Be "666F"
                }
                It "Given bytes 0x666F6F, return string '666F6F'" {
                    [System.Byte[]]$TestBytes3_B16 = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$B16_b_foo = ConvertTo-Base16 $TestBytes3_B16 -Unformatted
                    $B16_b_foo.Base16EncodedData | Should -Be "666F6F"
                }
                It "Given bytes 0x666F6F62, return string '666F6F62'" {
                    [System.Byte[]]$TestBytes4_B16 = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$B16_b_foob = ConvertTo-Base16 $TestBytes4_B16 -Unformatted
                    $B16_b_foob.Base16EncodedData | Should -Be "666F6F62"
                }
                It "Given bytes 0x666F6F6261, return string '666F6F6261'" {
                    [System.Byte[]]$TestBytes5_B16 = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$B16_b_fooba = ConvertTo-Base16 $TestBytes5_B16 -Unformatted
                    $B16_b_fooba.Base16EncodedData | Should -Be "666F6F6261"
                }
                It "Given bytes 0x666F6F626172, return string '666F6F626172'" {
                    [System.Byte[]]$TestBytes6_B16 = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$B16_b_foobar = ConvertTo-Base16 $TestBytes6_B16 -Unformatted
                    $B16_b_foobar.Base16EncodedData | Should -Be "666F6F626172"
                }
            }
            Describe "ConvertTo-Base16 String Input Operations" {
                It "Given string 'f', return string '66'" {
                    [System.String]$B16_s_f = ConvertTo-Base16 "f" -Raw -Unformatted
                    $B16_s_f | Should -Be "66"
                }
                It "Given string 'fo', return string '666F'" {
                    [System.String]$B16_s_fo = ConvertTo-Base16 "fo" -Raw -Unformatted
                    $B16_s_fo | Should -Be "666F"
                }
                It "Given string 'foo', return string '666F6F'" {
                    [System.String]$B16_s_foo = ConvertTo-Base16 "foo" -Raw -Unformatted
                    $B16_s_foo | Should -Be "666F6F"
                }
                It "Given string 'foob', return string '666F6F62'" {
                    [System.String]$B16_s_foob = ConvertTo-Base16 "foob" -Raw -Unformatted
                    $B16_s_foob | Should -Be "666F6F62"
                }
                It "Given string 'fooba', return string '666F6F6261'" {
                    [System.String]$B16_s_fooba = ConvertTo-Base16 "fooba" -Raw -Unformatted
                    $B16_s_fooba | Should -Be "666F6F6261"
                }
                It "Given string 'foobar', return string '666F6F626172'" {
                    [System.String]$B16_s_foobar = ConvertTo-Base16 "foobar" -Raw -Unformatted
                    $B16_s_foobar | Should -Be "666F6F626172"
                }
            }
            Describe "ConvertTo-Base16 File Operations - Content" {
                It "Given file with content 'This is plain text file 1', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile1_B16out = ConvertTo-Base16 -InFile $TestFile1_plain -AutoSave "B16" -Unformatted
                    $TestFile1_B16out.FullName -like "*.B16" | Should -Be $True
                    $TestFile1_B16out.Exists | Should -Be $True
                    Get-Content $TestFile1_B16out | Should -Be "5468697320697320706C61696E20746578742066696C6520310D0A"
                    $Null = Remove-Item $TestFile1_B16out
                }
                It "Given file with content 'Short file #2', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile2_B16out = ConvertTo-Base16 $TestFile2_plain -AutoSave "B16" -Unformatted
                    $TestFile2_B16out.FullName -like "*.B16" | Should -Be $True
                    $TestFile2_B16out.Exists | Should -Be $True
                    Get-Content $TestFile2_B16out | Should -Be "53686F72742066696C652023320D0A"
                    $Null = Remove-Item $TestFile2_B16out
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile3_B16out = ConvertTo-Base16 $TestFile3_plain -AutoSave "B16" -Unformatted
                    $TestFile3_B16out.FullName -like "*.B16" | Should -Be $True
                    $TestFile3_B16out.Exists | Should -Be $True
                    Get-Content $TestFile3_B16out | Should -Be "546869732069732061206C617267652C206D6F726520636F6D706C657820746578742066696C6521204E6F7720776974682070756E6374756174696F6E210D0A"
                    $Null = Remove-Item $TestFile3_B16out
                }
            }
            Describe "ConvertTo-Base16 File Operations - Integrity" {
                It "Convert small binary file to Base16 format output file" {
                    $B16_ENC_smallbin = ConvertTo-Base16 -InFile $TestFile_smallbin -AutoSave "B16"
                    $B16_ENC_smallbin.FullName -like "*.B16" | Should -Be $True
                    $B16_ENC_smallbin.Exists | Should -Be $True
                    $B16_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Get-Content $B16_ENC_smallbin -First 1 | Should -Be "-----BEGIN BASE16 ENCODED DATA-----"
                    Get-Content $B16_ENC_smallbin -Tail 1 | Should -Be "-----END BASE16 ENCODED DATA-----"
                    Copy-Item -Path $B16_ENC_smallbin -Destination $B16_ENC_smallfile -Force
                    $Null = Remove-Item $B16_ENC_smallbin
                }
                It "Convert medium binary file to Base16 format output file" {
                    $B16_ENC_medbin = ConvertTo-Base16 -InFile $TestFile_medbin -AutoSave "B16"
                    $B16_ENC_medbin.FullName -like "*.B16" | Should -Be $True
                    $B16_ENC_medbin.Exists | Should -Be $True
                    $B16_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Get-Content $B16_ENC_medbin -First 1 | Should -Be "-----BEGIN BASE16 ENCODED DATA-----"
                    Get-Content $B16_ENC_medbin -Tail 1 | Should -Be "-----END BASE16 ENCODED DATA-----"
                    Copy-Item -Path $B16_ENC_medbin -Destination $B16_ENC_medfile -Force
                    $Null = Remove-Item $B16_ENC_medbin
                }
                It "Convert large binary file to Base16 format output file" {
                    $B16_ENC_largebin = ConvertTo-Base16 -InFile $TestFile_largebin -AutoSave "B16"
                    $B16_ENC_largebin.FullName -like "*.B16" | Should -Be $True
                    $B16_ENC_largebin.Exists | Should -Be $True
                    $B16_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Get-Content $B16_ENC_largebin -First 1 | Should -Be "-----BEGIN BASE16 ENCODED DATA-----"
                    Get-Content $B16_ENC_largebin -Tail 1 | Should -Be "-----END BASE16 ENCODED DATA-----"
                    Copy-Item -Path $B16_ENC_largebin -Destination $B16_ENC_largefile -Force
                    $Null = Remove-Item $B16_ENC_largebin
                }
            }
            Describe "ConvertFrom-Base16 Byte Output Operations" {
                It "Given string '66', return bytes 0x66" {
                    [System.Byte[]]$b_f_B16 = ConvertFrom-Base16 -Base16EncodedString "66" -OutBytes -Raw
                    $b_f_B16 | Should -Be 0x66
                }
                It "Given string '666F', return bytes 0x666F" {
                    [System.Byte[]]$b_fo_B16 = ConvertFrom-Base16 -Base16EncodedString "666F" -OutBytes -Raw
                    $b_fo_B16 | Should -Be @(0x66,0x6F)
                }
                It "Given string '666F6F', return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F" -OutBytes -Raw
                    $b_foo_B16 | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string '666F6F62', return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F62" -OutBytes -Raw
                    $b_foob_B16 | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string '666F6F6261', return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F6261" -OutBytes -Raw
                    $b_fooba_B16 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string '666F6F626172', return bytes 0x666F6F626172" {
                    [System.Byte[]]$b_foobar_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F626172" -OutBytes -Raw
                    $b_foobar_B16 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
            }
            Describe "ConvertFrom-Base16 String Output Operations" {
                It "Given string '66', return string 'f'" {
                    [System.String]$s_f_B16 = ConvertFrom-Base16 -Base16EncodedString "66" -Raw
                    $s_f_B16 | Should -Be "f"
                }
                It "Given string '666F', return string 'fo'" {
                    [System.String]$s_fo_B16 = ConvertFrom-Base16 -Base16EncodedString "666F" -Raw
                    $s_fo_B16 | Should -Be "fo"
                }
                It "Given string '666F6F', return string 'foo'" {
                    [System.String]$s_foo_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F" -Raw
                    $s_foo_B16 | Should -Be "foo"
                }
                It "Given string '666F6F62', return string 'foob'" {
                    [System.String]$s_foob_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F62" -Raw
                    $s_foob_B16 | Should -Be "foob"
                }
                It "Given string '666F6F6261', return string 'fooba'" {
                    [System.String]$s_fooba_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F6261" -Raw
                    $s_fooba_B16 | Should -Be "fooba"
                }
                It "Given string '666F6F626172', return string 'foobar'" {
                    [System.String]$s_foobar_B16 = ConvertFrom-Base16 -Base16EncodedString "666F6F626172" -Raw
                    $s_foobar_B16 | Should -Be "foobar"
                }
            }
            Describe "ConvertFrom-Base16 File Operations - Content" {
                It "Given file with content '5468697320697320706C61696E20746578742066696C6520310D0A', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B16_TestFile1out = ConvertFrom-Base16 $TestFile1_B16 -AutoSave "DEC"
                    $B16_TestFile1out.FullName -like "*.DEC" | Should -Be $True
                    $B16_TestFile1out.Exists | Should -Be $True
                    Get-Content $B16_TestFile1out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $B16_TestFile1out
                }
                It "Given file with content '53686F72742066696C652023320D0A', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B16_TestFile2out = ConvertFrom-Base16 $TestFile2_B16 -AutoSave "DEC"
                    $B16_TestFile2out.FullName -like "*.DEC" | Should -Be $True
                    $B16_TestFile2out.Exists | Should -Be $True
                    Get-Content $B16_TestFile2out | Should -Be "Short file #2"
                    $Null = Remove-Item $B16_TestFile2out
                }
                It "Given file with content '546869732069732061206C617267652C206D6F726520636F6D706C657820746578742066696C6521204E6F7720776974682070756E6374756174696F6E210D0A', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B16_TestFile3out = ConvertFrom-Base16 $TestFile3_B16 -AutoSave "DEC"
                    $B16_TestFile3out.FullName -like "*.DEC" | Should -Be $True
                    $B16_TestFile3out.Exists | Should -Be $True
                    Get-Content $B16_TestFile3out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $B16_TestFile3out
                }
            }
            Describe "ConvertFrom-Base16 File Operations - Integrity" {
                It "Decode small binary file from Base16 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B16_DEC_smallbin = ConvertFrom-Base16 -InFile $B16_ENC_smallfile -AutoSave "B16DEC"
                    [System.String]$B16_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B16_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $B16_DEC_smallbin.FullName -like "*.B16DEC" | Should -Be $True
                    $B16_DEC_smallbin.Exists | Should -Be $True
                    $B16_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $B16_DEC_smallbin
                }
                It "Decode medium binary file from Base16 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B16_DEC_medbin = ConvertFrom-Base16 -InFile $B16_ENC_medfile -AutoSave "B16DEC"
                    [System.String]$B16_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B16_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $B16_DEC_medbin.FullName -like "*.B16DEC" | Should -Be $True
                    $B16_DEC_medbin.Exists | Should -Be $True
                    $B16_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $B16_DEC_medbin
                }
                It "Decode large binary file from Base16 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B16_DEC_largebin = ConvertFrom-Base16 -InFile $B16_ENC_largefile -AutoSave "B16DEC"
                    [System.String]$B16_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B16_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $B16_DEC_largebin.FullName -like "*.B16DEC" | Should -Be $True
                    $B16_DEC_largebin.Exists | Should -Be $True
                    $B16_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $B16_DEC_largebin
                }
            }
        }
        Describe "Base32 Functional Tests" {
            Describe "ConvertTo-Base32 Byte Input Operations" {
                It "Given bytes 0x66, return string 'MY======'" {
                    [System.Byte[]]$TestBytes1_B32 = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$B32_b_f = ConvertTo-Base32 $TestBytes1_B32 -Unformatted
                    $B32_b_f.Base32EncodedData | Should -Be "MY======"
                }
                It "Given bytes 0x666F, return string 'MZXQ===='" {
                    [System.Byte[]]$TestBytes2_B32 = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$B32_b_fo = ConvertTo-Base32 $TestBytes2_B32 -Unformatted
                    $B32_b_fo.Base32EncodedData | Should -Be "MZXQ===="
                }
                It "Given bytes 0x666F6F, return string 'MZXW6==='" {
                    [System.Byte[]]$TestBytes3_B32 = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$B32_b_foo = ConvertTo-Base32 $TestBytes3_B32 -Unformatted
                    $B32_b_foo.Base32EncodedData | Should -Be "MZXW6==="
                }
                It "Given bytes 0x666F6F62, return string 'MZXW6YQ='" {
                    [System.Byte[]]$TestBytes4_B32 = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$B32_b_foob = ConvertTo-Base32 $TestBytes4_B32 -Unformatted
                    $B32_b_foob.Base32EncodedData | Should -Be "MZXW6YQ="
                }
                It "Given bytes 0x666F6F6261, return string 'MZXW6YTB'" {
                    [System.Byte[]]$TestBytes5_B32 = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$B32_b_fooba = ConvertTo-Base32 $TestBytes5_B32 -Unformatted
                    $B32_b_fooba.Base32EncodedData | Should -Be "MZXW6YTB"
                }
                It "Given bytes 0x666F6F6272, return string 'MZXW6YTBOI======'" {
                    [System.Byte[]]$TestBytes6_B32 = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$B32_b_foobar = ConvertTo-Base32 $TestBytes6_B32 -Unformatted
                    $B32_b_foobar.Base32EncodedData | Should -Be "MZXW6YTBOI======"
                }
                It "Given bytes 0x66 and param -Base32Hex, return string 'CO======'" {
                    [System.Byte[]]$TestBytes1_B32h = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$B32h_b_f = ConvertTo-Base32 $TestBytes1_B32h -Base32Hex -Unformatted
                    $B32h_b_f.Base32EncodedData | Should -Be "CO======"
                }
                It "Given bytes 0x666F and param -Base32Hex, return string 'CPNG===='" {
                    [System.Byte[]]$TestBytes2_B32h = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$B32h_b_fo = ConvertTo-Base32 $TestBytes2_B32h -Base32Hex -Unformatted
                    $B32h_b_fo.Base32EncodedData | Should -Be "CPNG===="
                }
                It "Given bytes 0x666F6F and param -Base32Hex, return string 'CPNMU==='" {
                    [System.Byte[]]$TestBytes3_B32h = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$B32h_b_foo = ConvertTo-Base32 $TestBytes3_B32h -Base32Hex -Unformatted
                    $B32h_b_foo.Base32EncodedData | Should -Be "CPNMU==="
                }
                It "Given bytes 0x666F6F62 and param -Base32Hex, return string 'CPNMUOG='" {
                    [System.Byte[]]$TestBytes4_B32h = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$B32h_b_foob = ConvertTo-Base32 $TestBytes4_B32h -Base32Hex -Unformatted
                    $B32h_b_foob.Base32EncodedData | Should -Be "CPNMUOG="
                }
                It "Given bytes 0x666F6F6261 and param -Base32Hex, return string 'CPNMUOJ1'" {
                    [System.Byte[]]$TestBytes5_B32h = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$B32h_b_fooba = ConvertTo-Base32 $TestBytes5_B32h -Base32Hex -Unformatted
                    $B32h_b_fooba.Base32EncodedData | Should -Be "CPNMUOJ1"
                }
                It "Given bytes 0x666F6F6272 and param -Base32Hex, return string 'CPNMUOJ1E8======'" {
                    [System.Byte[]]$TestBytes6_B32h = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$B32h_b_foobar = ConvertTo-Base32 $TestBytes6_B32h -Base32Hex -Unformatted
                    $B32h_b_foobar.Base32EncodedData | Should -Be "CPNMUOJ1E8======"
                }
            }
            Describe "ConvertTo-Base32 String Input Operations" {
                It "Given string 'f', return string 'MY======'" {
                    [System.String]$B32_s_f = ConvertTo-Base32 "f" -Raw -Unformatted
                    $B32_s_f | Should -Be "MY======"
                }
                It "Given string 'fo', return string 'MZXQ===='" {
                    [System.String]$B32_s_fo = ConvertTo-Base32 "fo" -Raw -Unformatted
                    $B32_s_fo | Should -Be "MZXQ===="
                }
                It "Given string 'foo', return string 'MZXW6==='" {
                    [System.String]$B32_s_foo = ConvertTo-Base32 "foo" -Raw -Unformatted
                    $B32_s_foo | Should -Be "MZXW6==="
                }
                It "Given string 'foob', return string 'MZXW6YQ='" {
                    [System.String]$B32_s_foob = ConvertTo-Base32 "foob" -Raw -Unformatted
                    $B32_s_foob | Should -Be "MZXW6YQ="
                }
                It "Given string 'fooba', return string 'MZXW6YTB'" {
                    [System.String]$B32_s_fooba = ConvertTo-Base32 "fooba" -Raw -Unformatted
                    $B32_s_fooba | Should -Be "MZXW6YTB"
                }
                It "Given string 'foobar', return string 'MZXW6YTBOI======'" {
                    [System.String]$B32_s_foobar = ConvertTo-Base32 "foobar" -Raw -Unformatted
                    $B32_s_foobar | Should -Be "MZXW6YTBOI======"
                }
                It "Given string 'f' and param -Base32Hex, return string 'CO======'" {
                    [System.String]$B32h_s_f = ConvertTo-Base32 "f" -Base32Hex -Raw -Unformatted
                    $B32h_s_f | Should -Be "CO======"
                }
                It "Given string 'fo' and param -Base32Hex, return string 'CPNG===='" {
                    [System.String]$B32h_s_fo = ConvertTo-Base32 "fo" -Base32Hex -Raw -Unformatted
                    $B32h_s_fo | Should -Be "CPNG===="
                }
                It "Given string 'foo' and param -Base32Hex, return string 'CPNMU==='" {
                    [System.String]$B32h_s_foo = ConvertTo-Base32 "foo" -Base32Hex -Raw -Unformatted
                    $B32h_s_foo | Should -Be "CPNMU==="
                }
                It "Given string 'foob' and param -Base32Hex, return string 'CPNMUOG='" {
                    [System.String]$B32h_s_foob = ConvertTo-Base32 "foob" -Base32Hex -Raw -Unformatted
                    $B32h_s_foob | Should -Be "CPNMUOG="
                }
                It "Given string 'fooba' and param -Base32Hex, return string 'CPNMUOJ1'" {
                    [System.String]$B32h_s_fooba = ConvertTo-Base32 "fooba" -Base32Hex -Raw -Unformatted
                    $B32h_s_fooba | Should -Be "CPNMUOJ1"
                }
                It "Given string 'foobar' and param -Base32Hex, return string 'CPNMUOJ1E8======'" {
                    [System.String]$B32h_s_foobar = ConvertTo-Base32 "foobar" -Base32Hex -Raw -Unformatted
                    $B32h_s_foobar | Should -Be "CPNMUOJ1E8======"
                }
            }
            Describe "ConvertTo-Base32 File Operations - Content" {
                It "Given file with content 'This is plain text file 1', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile1_B32out = ConvertTo-Base32 -InFile $TestFile1_plain -AutoSave "B32" -Unformatted
                    $TestFile1_B32out.FullName -like "*.B32" | Should -Be $True
                    $TestFile1_B32out.Exists | Should -Be $True
                    Get-Content $TestFile1_B32out | Should -Be "KRUGS4ZANFZSA4DMMFUW4IDUMV4HIIDGNFWGKIBRBUFA===="
                    $Null = Remove-Item $TestFile1_B32out
                }
                It "Given file with content 'Short file #2', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile2_B32out = ConvertTo-Base32 $TestFile2_plain -AutoSave "B32" -Unformatted
                    $TestFile2_B32out.FullName -like "*.B32" | Should -Be $True
                    $TestFile2_B32out.Exists | Should -Be $True
                    Get-Content $TestFile2_B32out | Should -Be "KNUG64TUEBTGS3DFEARTEDIK"
                    $Null = Remove-Item $TestFile2_B32out
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile3_B32out = ConvertTo-Base32 $TestFile3_plain -AutoSave "B32" -Unformatted
                    $TestFile3_B32out.FullName -like "*.B32" | Should -Be $True
                    $TestFile3_B32out.Exists | Should -Be $True
                    Get-Content $TestFile3_B32out | Should -Be "KRUGS4ZANFZSAYJANRQXEZ3FFQQG233SMUQGG33NOBWGK6BAORSXQ5BAMZUWYZJBEBHG65ZAO5UXI2BAOB2W4Y3UOVQXI2LPNYQQ2CQ="
                    $Null = Remove-Item $TestFile3_B32out
                }
                It "Given file with content 'This is plain text file 1' and param -Base32Hex, produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile4_B32hout = ConvertTo-Base32 $TestFile4_plain -Base32Hex -AutoSave "B32" -Unformatted
                    $TestFile4_B32hout.FullName -like "*.B32" | Should -Be $True
                    $TestFile4_B32hout.Exists | Should -Be $True
                    Get-Content $TestFile4_B32hout | Should -Be "AHK6ISP0D5PI0S3CC5KMS83KCLS78836D5M6A81H1K50===="
                    $Null = Remove-Item $TestFile4_B32hout
                }
                It "Given file with content 'Short file #2' and param -Base32Hex, produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile5_B32hout = ConvertTo-Base32 $TestFile5_plain -Base32Hex -AutoSave "B32" -Unformatted
                    $TestFile5_B32hout.FullName -like "*.B32" | Should -Be $True
                    $TestFile5_B32hout.Exists | Should -Be $True
                    Get-Content $TestFile5_B32hout | Should -Be "ADK6USJK41J6IR3540HJ438A"
                    $Null = Remove-Item $TestFile5_B32hout
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!' and param -Base32Hex, produce file with correct encoded content'" {
                    [System.IO.FileInfo]$TestFile6_B32hout = ConvertTo-Base32 $TestFile6_plain -Base32Hex -AutoSave "B32" -Unformatted
                    $TestFile6_B32hout.FullName -like "*.B32" | Should -Be $True
                    $TestFile6_B32hout.Exists | Should -Be $True
                    Get-Content $TestFile6_B32hout | Should -Be "AHK6ISP0D5PI0O90DHGN4PR55GG6QRRICKG66RRDE1M6AU10EHINGT10CPKMOP914176UTP0ETKN8Q10E1QMSORKELGN8QBFDOGGQ2G="
                    $Null = Remove-Item $TestFile6_B32hout
                }
            }
            Describe "ConvertTo-Base32 File Operations - Integrity" {
                It "Convert small binary file to Base32 format output file" {
                    $B32_ENC_smallbin = ConvertTo-Base32 -InFile $TestFile_smallbin -AutoSave "B32"
                    $B32_ENC_smallbin.FullName -like "*.B32" | Should -Be $True
                    $B32_ENC_smallbin.Exists | Should -Be $True
                    $B32_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Get-Content $B32_ENC_smallbin -First 1 | Should -Be "-----BEGIN BASE32 ENCODED DATA-----"
                    Get-Content $B32_ENC_smallbin -Tail 1 | Should -Be "-----END BASE32 ENCODED DATA-----"
                    Copy-Item -Path $B32_ENC_smallbin -Destination $B32_ENC_smallfile -Force
                    $Null = Remove-Item $B32_ENC_smallbin
                }
                It "Convert medium binary file to Base32 format output file" {
                    $B32_ENC_medbin = ConvertTo-Base32 -InFile $TestFile_medbin -AutoSave "B32"
                    $B32_ENC_medbin.FullName -like "*.B32" | Should -Be $True
                    $B32_ENC_medbin.Exists | Should -Be $True
                    $B32_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Get-Content $B32_ENC_medbin -First 1 | Should -Be "-----BEGIN BASE32 ENCODED DATA-----"
                    Get-Content $B32_ENC_medbin -Tail 1 | Should -Be "-----END BASE32 ENCODED DATA-----"
                    Copy-Item -Path $B32_ENC_medbin -Destination $B32_ENC_medfile -Force
                    $Null = Remove-Item $B32_ENC_medbin
                }
                It "Convert large binary file to Base32 format output file" {
                    $B32_ENC_largebin = ConvertTo-Base32 -InFile $TestFile_largebin -AutoSave "B32"
                    $B32_ENC_largebin.FullName -like "*.B32" | Should -Be $True
                    $B32_ENC_largebin.Exists | Should -Be $True
                    $B32_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Get-Content $B32_ENC_largebin -First 1 | Should -Be "-----BEGIN BASE32 ENCODED DATA-----"
                    Get-Content $B32_ENC_largebin -Tail 1 | Should -Be "-----END BASE32 ENCODED DATA-----"
                    Copy-Item -Path $B32_ENC_largebin -Destination $B32_ENC_largefile -Force
                    $Null = Remove-Item $B32_ENC_largebin
                }
                It "Convert small binary file to Base32 Hex format output file" {
                    $B32h_ENC_smallbin = ConvertTo-Base32 -InFile $TestFile_smallbin -AutoSave "B32H" -Base32Hex
                    $B32h_ENC_smallbin.FullName -like "*.B32H" | Should -Be $True
                    $B32h_ENC_smallbin.Exists | Should -Be $True
                    $B32h_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Get-Content $B32h_ENC_smallbin -First 1 | Should -Be "-----BEGIN BASE32-HEX ENCODED DATA-----"
                    Get-Content $B32h_ENC_smallbin -Tail 1 | Should -Be "-----END BASE32-HEX ENCODED DATA-----"
                    Copy-Item -Path $B32h_ENC_smallbin -Destination $B32h_ENC_smallfile -Force
                    $Null = Remove-Item $B32h_ENC_smallbin
                }
                It "Convert medium binary file to Base32 Hex format output file" {
                    $B32h_ENC_medbin = ConvertTo-Base32 -InFile $TestFile_medbin -AutoSave "B32H" -Base32Hex
                    $B32h_ENC_medbin.FullName -like "*.B32H" | Should -Be $True
                    $B32h_ENC_medbin.Exists | Should -Be $True
                    $B32h_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Get-Content $B32h_ENC_medbin -First 1 | Should -Be "-----BEGIN BASE32-HEX ENCODED DATA-----"
                    Get-Content $B32h_ENC_medbin -Tail 1 | Should -Be "-----END BASE32-HEX ENCODED DATA-----"
                    Copy-Item -Path $B32h_ENC_medbin -Destination $B32h_ENC_medfile -Force
                    $Null = Remove-Item $B32h_ENC_medbin
                }
                It "Convert large binary file to Base32 Hex format output file" {
                    $B32h_ENC_largebin = ConvertTo-Base32 -InFile $TestFile_largebin -AutoSave "B32H" -Base32Hex
                    $B32h_ENC_largebin.FullName -like "*.B32H" | Should -Be $True
                    $B32h_ENC_largebin.Exists | Should -Be $True
                    $B32h_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Get-Content $B32h_ENC_largebin -First 1 | Should -Be "-----BEGIN BASE32-HEX ENCODED DATA-----"
                    Get-Content $B32h_ENC_largebin -Tail 1 | Should -Be "-----END BASE32-HEX ENCODED DATA-----"
                    Copy-Item -Path $B32h_ENC_largebin -Destination $B32h_ENC_largefile -Force
                    $Null = Remove-Item $B32h_ENC_largebin
                }
            }
            Describe "ConvertFrom-Base32 Byte Output Operations" {
                It "Given string 'MY======', return bytes 0x66" {
                    [System.Byte[]]$b_f_B32 = ConvertFrom-Base32 -Base32EncodedString "MY======" -OutBytes -Raw
                    $b_f_B32 | Should -Be 0x66
                }
                It "Given string 'MZXQ====', return bytes 0x666F" {
                    [System.Byte[]]$b_fo_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXQ====" -OutBytes -Raw
                    $b_fo_B32 | Should -Be @(0x66,0x6F)
                }
                It "Given string 'MZXW6===', return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6===" -OutBytes -Raw
                    $b_foo_B32 | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string 'MZXW6YQ=', return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YQ=" -OutBytes -Raw
                    $b_foob_B32 | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string 'MZXW6YTB', return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YTB" -OutBytes -Raw
                    $b_fooba_B32 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string 'MZXW6YTBOI======', return bytes 0x666F6F6272" {
                    [System.Byte[]]$b_foobar_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YTBOI======" -OutBytes -Raw
                    $b_foobar_B32 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
                It "Given string 'CO======' and param -Base32Hex, return bytes 0x66" {
                    [System.Byte[]]$b_f_B32h = ConvertFrom-Base32 -Base32EncodedString "CO======" -Base32Hex -OutBytes -Raw
                    $b_f_B32h | Should -Be 0x66
                }
                It "Given string 'CPNG====' and param -Base32Hex, return bytes 0x666F" {
                    [System.Byte[]]$b_fo_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNG====" -Base32Hex -OutBytes -Raw
                    $b_fo_B32h | Should -Be @(0x66,0x6F)
                }
                It "Given string 'CPNMU===' and param -Base32Hex, return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMU===" -Base32Hex -OutBytes -Raw
                    $b_foo_B32h | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string 'CPNMUOG=' and param -Base32Hex, return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOG=" -Base32Hex -OutBytes -Raw
                    $b_foob_B32h | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string 'CPNMUOJ1' and param -Base32Hex, return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOJ1" -Base32Hex -OutBytes -Raw
                    $b_fooba_B32h | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string 'CPNMUOJ1E8======' and param -Base32Hex, return bytes 0x666F6F6272" {
                    [System.Byte[]]$b_foobar_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOJ1E8======" -Base32Hex -OutBytes -Raw
                    $b_foobar_B32h | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
            }
            Describe "ConvertFrom-Base32 String Output Operations" {
                It "Given string 'MY======', return string 'f'" {
                    [System.String]$s_f_B32 = ConvertFrom-Base32 -Base32EncodedString "MY======" -Raw
                    $s_f_B32 | Should -Be "f"
                }
                It "Given string 'MZXQ====', return string 'fo'" {
                    [System.String]$s_fo_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXQ====" -Raw
                    $s_fo_B32 | Should -Be "fo"
                }
                It "Given string 'MZXW6===', return string 'foo'" {
                    [System.String]$s_foo_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6===" -Raw
                    $s_foo_B32 | Should -Be "foo"
                }
                It "Given string 'MZXW6YQ=', return string 'foob'" {
                    [System.String]$s_foob_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YQ=" -Raw
                    $s_foob_B32 | Should -Be "foob"
                }
                It "Given string 'MZXW6YTB', return string 'fooba'" {
                    [System.String]$s_fooba_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YTB" -Raw
                    $s_fooba_B32 | Should -Be "fooba"
                }
                It "Given string 'MZXW6YTBOI======', return string 'foobar'" {
                    [System.String]$s_foobar_B32 = ConvertFrom-Base32 -Base32EncodedString "MZXW6YTBOI======" -Raw
                    $s_foobar_B32 | Should -Be "foobar"
                }
                It "Given string 'CO======' and param -Base32Hex, return string 'f'" {
                    [System.String]$s_f_B32h = ConvertFrom-Base32 -Base32EncodedString "CO======" -Base32Hex -Raw
                    $s_f_B32h | Should -Be "f"
                }
                It "Given string 'CPNG====' and param -Base32Hex, return string 'fo'" {
                    [System.String]$s_fo_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNG====" -Base32Hex -Raw
                    $s_fo_B32h | Should -Be "fo"
                }
                It "Given string 'CPNMU===' and param -Base32Hex, return string 'foo'" {
                    [System.String]$s_foo_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMU===" -Base32Hex -Raw
                    $s_foo_B32h | Should -Be "foo"
                }
                It "Given string 'CPNMUOG=' and param -Base32Hex, return string 'foob'" {
                    [System.String]$s_foob_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOG=" -Base32Hex -Raw
                    $s_foob_B32h | Should -Be "foob"
                }
                It "Given string 'CPNMUOJ1' and param -Base32Hex, return string 'fooba'" {
                    [System.String]$s_fooba_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOJ1" -Base32Hex -Raw
                    $s_fooba_B32h | Should -Be "fooba"
                }
                It "Given string 'CPNMUOJ1E8======' and param -Base32Hex, return string 'foobar'" {
                    [System.String]$s_foobar_B32h = ConvertFrom-Base32 -Base32EncodedString "CPNMUOJ1E8======" -Base32Hex -Raw
                    $s_foobar_B32h | Should -Be "foobar"
                }
            }
            Describe "ConvertFrom-Base32 File Operations - Content" {
                It "Given file with content 'KRUGS4ZANFZSA4DMMFUW4IDUMV4HIIDGNFWGKIBRBUFA====', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32_TestFile1out = ConvertFrom-Base32 $TestFile1_B32 -AutoSave "DEC"
                    $B32_TestFile1out.FullName -like "*.DEC" | Should -Be $True
                    $B32_TestFile1out.Exists | Should -Be $True
                    Get-Content $B32_TestFile1out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $B32_TestFile1out
                }
                It "Given file with content 'KNUG64TUEBTGS3DFEARTEDIK', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32_TestFile2out = ConvertFrom-Base32 $TestFile2_B32 -AutoSave "DEC"
                    $B32_TestFile2out.FullName -like "*.DEC" | Should -Be $True
                    $B32_TestFile2out.Exists | Should -Be $True
                    Get-Content $B32_TestFile2out | Should -Be "Short file #2"
                    $Null = Remove-Item $B32_TestFile2out
                }
                It "Given file with content 'KRUGS4ZANFZSAYJANRQXEZ3FFQQG233SMUQGG33NOBWGK6BAORSXQ5BAMZUWYZJBEBHG65ZAO5UXI2BAOB2W4Y3UOVQXI2LPNYQQ2CQ=', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32_TestFile3out = ConvertFrom-Base32 $TestFile3_B32 -AutoSave "DEC"
                    $B32_TestFile3out.FullName -like "*.DEC" | Should -Be $True
                    $B32_TestFile3out.Exists | Should -Be $True
                    Get-Content $B32_TestFile3out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $B32_TestFile3out
                }
                It "Given file with content 'AHK6ISP0D5PI0S3CC5KMS83KCLS78836D5M6A81H1K50====' and param -Base32Hex, produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32h_TestFile4out = ConvertFrom-Base32 -Base32Hex $TestFile4_B32h -AutoSave "DEC"
                    $B32h_TestFile4out.FullName -like "*.DEC" | Should -Be $True
                    $B32h_TestFile4out.Exists | Should -Be $True
                    Get-Content $B32h_TestFile4out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $B32h_TestFile4out
                }
                It "Given file with content 'ADK6USJK41J6IR3540HJ438A' and param -Base32Hex, produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32h_TestFile5out = ConvertFrom-Base32 -Base32Hex $TestFile5_B32h -AutoSave "DEC"
                    $B32h_TestFile5out.FullName -like "*.DEC" | Should -Be $True
                    $B32h_TestFile5out.Exists | Should -Be $True
                    Get-Content $B32h_TestFile5out | Should -Be "Short file #2"
                    $Null = Remove-Item $B32h_TestFile5out
                }
                It "Given file with content 'AHK6ISP0D5PI0O90DHGN4PR55GG6QRRICKG66RRDE1M6AU10EHINGT10CPKMOP914176UTP0ETKN8Q10E1QMSORKELGN8QBFDOGGQ2G=' and param -Base32Hex, produce file with correct plaintext" {
                    [System.IO.FileInfo]$B32h_TestFile6out = ConvertFrom-Base32 -Base32Hex $TestFile6_B32h -AutoSave "DEC"
                    $B32h_TestFile6out.FullName -like "*.DEC" | Should -Be $True
                    $B32h_TestFile6out.Exists | Should -Be $True
                    Get-Content $B32h_TestFile6out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $B32h_TestFile6out
                }
            }
            Describe "ConvertFrom-Base32 File Operations - Integrity" {
                It "Decode small binary file from Base32 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32_DEC_smallbin = ConvertFrom-Base32 -InFile $B32_ENC_smallfile -AutoSave "B32DEC"
                    [System.String]$B32_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $B32_DEC_smallbin.FullName -like "*.B32DEC" | Should -Be $True
                    $B32_DEC_smallbin.Exists | Should -Be $True
                    $B32_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $B32_DEC_smallbin
                }
                It "Decode medium binary file from Base32 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32_DEC_medbin = ConvertFrom-Base32 -InFile $B32_ENC_medfile -AutoSave "B32DEC"
                    [System.String]$B32_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $B32_DEC_medbin.FullName -like "*.B32DEC" | Should -Be $True
                    $B32_DEC_medbin.Exists | Should -Be $True
                    $B32_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $B32_DEC_medbin
                }
                It "Decode large binary file from Base32 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32_DEC_largebin = ConvertFrom-Base32 -InFile $B32_ENC_largefile -AutoSave "B32DEC"
                    [System.String]$B32_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $B32_DEC_largebin.FullName -like "*.B32DEC" | Should -Be $True
                    $B32_DEC_largebin.Exists | Should -Be $True
                    $B32_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $B32_DEC_largebin
                }
                It "Decode small binary file from Base32 Hex input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32h_DEC_smallbin = ConvertFrom-Base32 -InFile $B32h_ENC_smallfile -AutoSave "B32HDEC" -Base32Hex
                    [System.String]$B32h_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32h_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $B32h_DEC_smallbin.FullName -like "*.B32HDEC" | Should -Be $True
                    $B32h_DEC_smallbin.Exists | Should -Be $True
                    $B32h_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $B32h_DEC_smallbin
                }
                It "Decode medium binary file from Base32 Hex input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32h_DEC_medbin = ConvertFrom-Base32 -InFile $B32h_ENC_medfile -AutoSave "B32HDEC" -Base32Hex
                    [System.String]$B32h_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32h_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $B32h_DEC_medbin.FullName -like "*.B32HDEC" | Should -Be $True
                    $B32h_DEC_medbin.Exists | Should -Be $True
                    $B32h_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $B32h_DEC_medbin
                }
                It "Decode large binary file from Base32 Hex input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B32h_DEC_largebin = ConvertFrom-Base32 -InFile $B32h_ENC_largefile -AutoSave "B32HDEC" -Base32Hex
                    [System.String]$B32h_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B32h_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $B32h_DEC_largebin.FullName -like "*.B32HDEC" | Should -Be $True
                    $B32h_DEC_largebin.Exists | Should -Be $True
                    $B32h_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $B32h_DEC_largebin
                }
            }
        }
        Describe "Base64 Functional Tests" {
            Describe "ConvertTo-Base64 Byte Input Operations" {
                It "Given bytes 0x66, return string 'Zg=='" {
                    [System.Byte[]]$TestBytes1_B64 = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$B64_b_f = ConvertTo-Base64 $TestBytes1_B64 -Unformatted
                    $B64_b_f.Base64EncodedData | Should -Be "Zg=="
                }
                It "Given bytes 0x666F, return string 'Zm8='" {
                    [System.Byte[]]$TestBytes2_B64 = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$B64_b_fo = ConvertTo-Base64 $TestBytes2_B64 -Unformatted
                    $B64_b_fo.Base64EncodedData | Should -Be "Zm8="
                }
                It "Given bytes 0x666F6F, return string 'Zm9v'" {
                    [System.Byte[]]$TestBytes3_B64 = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$B64_b_foo = ConvertTo-Base64 $TestBytes3_B64 -Unformatted
                    $B64_b_foo.Base64EncodedData | Should -Be "Zm9v"
                }
                It "Given bytes 0x666F6F62, return string 'Zm9vYg=='" {
                    [System.Byte[]]$TestBytes4_B64 = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$B64_b_foob = ConvertTo-Base64 $TestBytes4_B64 -Unformatted
                    $B64_b_foob.Base64EncodedData | Should -Be "Zm9vYg=="
                }
                It "Given bytes 0x666F6F6261, return string 'Zm9vYmE='" {
                    [System.Byte[]]$TestBytes5_B64 = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$B64_b_fooba = ConvertTo-Base64 $TestBytes5_B64 -Unformatted
                    $B64_b_fooba.Base64EncodedData | Should -Be "Zm9vYmE="
                }
                It "Given bytes 0x666F6F626172, return string 'Zm9vYmFy'" {
                    [System.Byte[]]$TestBytes6_B64 = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$B64_b_foobar = ConvertTo-Base64 $TestBytes6_B64 -Unformatted
                    $B64_b_foobar.Base64EncodedData | Should -Be "Zm9vYmFy"
                }
            }
            Describe "ConvertTo-Base64 String Input Operations" {
                It "Given string 'f', return string 'Zg=='" {
                    [System.String]$B64_s_f = ConvertTo-Base64 "f" -Raw -Unformatted
                    $B64_s_f | Should -Be "Zg=="
                }
                It "Given string 'fo', return string 'Zm8='" {
                    [System.String]$B64_s_fo = ConvertTo-Base64 "fo" -Raw -Unformatted
                    $B64_s_fo | Should -Be "Zm8="
                }
                It "Given string 'foo', return string 'Zm9v'" {
                    [System.String]$B64_s_foo = ConvertTo-Base64 "foo" -Raw -Unformatted
                    $B64_s_foo | Should -Be "Zm9v"
                }
                It "Given string 'foob', return string 'Zm9vYg=='" {
                    [System.String]$B64_s_foob = ConvertTo-Base64 "foob" -Raw -Unformatted
                    $B64_s_foob | Should -Be "Zm9vYg=="
                }
                It "Given string 'fooba', return string 'Zm9vYmE='" {
                    [System.String]$B64_s_fooba = ConvertTo-Base64 "fooba" -Raw -Unformatted
                    $B64_s_fooba | Should -Be "Zm9vYmE="
                }
                It "Given string 'foobar', return string 'Zm9vYmFy'" {
                    [System.String]$B64_s_foobar = ConvertTo-Base64 "foobar" -Raw -Unformatted
                    $B64_s_foobar | Should -Be "Zm9vYmFy"
                }
            }
            Describe "ConvertTo-Base64 File Operations - Content" {
                It "Given file with content 'This is plain text file 1', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile1_B64out = ConvertTo-Base64 -InFile $TestFile1_plain -AutoSave "B64" -Unformatted
                    $TestFile1_B64out.FullName -like "*.B64" | Should -Be $True
                    $TestFile1_B64out.Exists | Should -Be $True
                    Get-Content $TestFile1_B64out | Should -Be "VGhpcyBpcyBwbGFpbiB0ZXh0IGZpbGUgMQ0K"
                    $Null = Remove-Item $TestFile1_B64out
                }
                It "Given file with content 'Short file #2', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile2_B64out = ConvertTo-Base64 $TestFile2_plain -AutoSave "B64" -Unformatted
                    $TestFile2_B64out.FullName -like "*.B64" | Should -Be $True
                    $TestFile2_B64out.Exists | Should -Be $True
                    Get-Content $TestFile2_B64out | Should -Be "U2hvcnQgZmlsZSAjMg0K"
                    $Null = Remove-Item $TestFile2_B64out
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile3_B64out = ConvertTo-Base64 $TestFile3_plain -AutoSave "B64" -Unformatted
                    $TestFile3_B64out.FullName -like "*.B64" | Should -Be $True
                    $TestFile3_B64out.Exists | Should -Be $True
                    Get-Content $TestFile3_B64out | Should -Be "VGhpcyBpcyBhIGxhcmdlLCBtb3JlIGNvbXBsZXggdGV4dCBmaWxlISBOb3cgd2l0aCBwdW5jdHVhdGlvbiENCg=="
                    $Null = Remove-Item $TestFile3_B64out
                }
            }
            Describe "ConvertTo-Base64 File Operations - Integrity" {
                It "Convert small binary file to Base64 format output file" {
                    $B64_ENC_smallbin = ConvertTo-Base64 -InFile $TestFile_smallbin -AutoSave "B64"
                    $B64_ENC_smallbin.FullName -like "*.B64" | Should -Be $True
                    $B64_ENC_smallbin.Exists | Should -Be $True
                    $B64_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Get-Content $B64_ENC_smallbin -First 1 | Should -Be "-----BEGIN BASE64 ENCODED DATA-----"
                    Get-Content $B64_ENC_smallbin -Tail 1 | Should -Be "-----END BASE64 ENCODED DATA-----"
                    Copy-Item -Path $B64_ENC_smallbin -Destination $B64_ENC_smallfile -Force
                    $Null = Remove-Item $B64_ENC_smallbin
                }
                It "Convert medium binary file to Base64 format output file" {
                    $B64_ENC_medbin = ConvertTo-Base64 -InFile $TestFile_medbin -AutoSave "B64"
                    $B64_ENC_medbin.FullName -like "*.B64" | Should -Be $True
                    $B64_ENC_medbin.Exists | Should -Be $True
                    $B64_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Get-Content $B64_ENC_medbin -First 1 | Should -Be "-----BEGIN BASE64 ENCODED DATA-----"
                    Get-Content $B64_ENC_medbin -Tail 1 | Should -Be "-----END BASE64 ENCODED DATA-----"
                    Copy-Item -Path $B64_ENC_medbin -Destination $B64_ENC_medfile -Force
                    $Null = Remove-Item $B64_ENC_medbin
                }
                It "Convert large binary file to Base64 format output file" {
                    $B64_ENC_largebin = ConvertTo-Base64 -InFile $TestFile_largebin -AutoSave "B64"
                    $B64_ENC_largebin.FullName -like "*.B64" | Should -Be $True
                    $B64_ENC_largebin.Exists | Should -Be $True
                    $B64_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Get-Content $B64_ENC_largebin -First 1 | Should -Be "-----BEGIN BASE64 ENCODED DATA-----"
                    Get-Content $B64_ENC_largebin -Tail 1 | Should -Be "-----END BASE64 ENCODED DATA-----"
                    Copy-Item -Path $B64_ENC_largebin -Destination $B64_ENC_largefile -Force
                    $Null = Remove-Item $B64_ENC_largebin
                }
            }
            Describe "ConvertFrom-Base64 Byte Output Operations" {
                It "Given string 'Zg==', return bytes 0x66" {
                    [System.Byte[]]$b_f_B64 = ConvertFrom-Base64 -Base64EncodedString "Zg==" -OutBytes -Raw
                    $b_f_B64 | Should -Be 0x66
                }
                It "Given string 'Zm8=', return bytes 0x666F" {
                    [System.Byte[]]$b_fo_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm8=" -OutBytes -Raw
                    $b_fo_B64 | Should -Be @(0x66,0x6F)
                }
                It "Given string 'Zm9v', return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9v" -OutBytes -Raw
                    $b_foo_B64 | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string 'Zm9vYg==', return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYg==" -OutBytes -Raw
                    $b_foob_B64 | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string 'Zm9vYmE=', return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYmE=" -OutBytes -Raw
                    $b_fooba_B64 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string 'Zm9vYmFy', return bytes 0x666F6F626172" {
                    [System.Byte[]]$b_foobar_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYmFy" -OutBytes -Raw
                    $b_foobar_B64 | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
            }
            Describe "ConvertFrom-Base64 String Output Operations" {
                It "Given string 'Zg==', return string 'f'" {
                    [System.String]$s_f_B64 = ConvertFrom-Base64 -Base64EncodedString "Zg==" -Raw
                    $s_f_B64 | Should -Be "f"
                }
                It "Given string 'Zm8=', return string 'fo'" {
                    [System.String]$s_fo_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm8=" -Raw
                    $s_fo_B64 | Should -Be "fo"
                }
                It "Given string 'Zm9v', return string 'foo'" {
                    [System.String]$s_foo_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9v" -Raw
                    $s_foo_B64 | Should -Be "foo"
                }
                It "Given string 'Zm9vYg==', return string 'foob'" {
                    [System.String]$s_foob_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYg==" -Raw
                    $s_foob_B64 | Should -Be "foob"
                }
                It "Given string 'Zm9vYmE=', return string 'fooba'" {
                    [System.String]$s_fooba_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYmE=" -Raw
                    $s_fooba_B64 | Should -Be "fooba"
                }
                It "Given string 'Zm9vYmFy', return string 'foobar'" {
                    [System.String]$s_foobar_B64 = ConvertFrom-Base64 -Base64EncodedString "Zm9vYmFy" -Raw
                    $s_foobar_B64 | Should -Be "foobar"
                }
            }
            Describe "ConvertFrom-Base64 File Operations - Content" {
                It "Given file with content 'VGhpcyBpcyBwbGFpbiB0ZXh0IGZpbGUgMQ0K', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B64_TestFile1out = ConvertFrom-Base64 $TestFile1_B64 -AutoSave "DEC"
                    $B64_TestFile1out.FullName -like "*.DEC" | Should -Be $True
                    $B64_TestFile1out.Exists | Should -Be $True
                    Get-Content $B64_TestFile1out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $B64_TestFile1out
                }
                It "Given file with content 'U2hvcnQgZmlsZSAjMg0K', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B64_TestFile2out = ConvertFrom-Base64 $TestFile2_B64 -AutoSave "DEC"
                    $B64_TestFile2out.FullName -like "*.DEC" | Should -Be $True
                    $B64_TestFile2out.Exists | Should -Be $True
                    Get-Content $B64_TestFile2out | Should -Be "Short file #2"
                    $Null = Remove-Item $B64_TestFile2out
                }
                It "Given file with content 'VGhpcyBpcyBhIGxhcmdlLCBtb3JlIGNvbXBsZXggdGV4dCBmaWxlISBOb3cgd2l0aCBwdW5jdHVhdGlvbiENCg==', produce file with correct plaintext" {
                    [System.IO.FileInfo]$B64_TestFile3out = ConvertFrom-Base64 $TestFile3_B64 -AutoSave "DEC"
                    $B64_TestFile3out.FullName -like "*.DEC" | Should -Be $True
                    $B64_TestFile3out.Exists | Should -Be $True
                    Get-Content $B64_TestFile3out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $B64_TestFile3out
                }
            }
            Describe "ConvertFrom-Base64 File Operations - Integrity" {
                It "Decode small binary file from Base64 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B64_DEC_smallbin = ConvertFrom-Base64 -InFile $B64_ENC_smallfile -AutoSave "B64DEC"
                    [System.String]$B64_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B64_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $B64_DEC_smallbin.FullName -like "*.B64DEC" | Should -Be $True
                    $B64_DEC_smallbin.Exists | Should -Be $True
                    $B64_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $B64_DEC_smallbin
                }
                It "Decode medium binary file from Base64 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B64_DEC_medbin = ConvertFrom-Base64 -InFile $B64_ENC_medfile -AutoSave "B64DEC"
                    [System.String]$B64_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B64_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $B64_DEC_medbin.FullName -like "*.B64DEC" | Should -Be $True
                    $B64_DEC_medbin.Exists | Should -Be $True
                    $B64_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $B64_DEC_medbin
                }
                It "Decode large binary file from Base64 input file and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$B64_DEC_largebin = ConvertFrom-Base64 -InFile $B64_ENC_largefile -AutoSave "B64DEC"
                    [System.String]$B64_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($B64_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $B64_DEC_largebin.FullName -like "*.B64DEC" | Should -Be $True
                    $B64_DEC_largebin.Exists | Should -Be $True
                    $B64_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $B64_DEC_largebin
                }
            }
        }
        Describe "UUEncode Functional Tests" {
            Describe "ConvertTo-UUEncoding Byte Input Operations" {
                It "Given bytes 0x66, return string '!9@'" {
                    [System.Byte[]]$TestBytes1_UU = [System.Text.Encoding]::ASCII.GetBytes("f")
                    [System.Object]$UU_b_f = ConvertTo-UUEncoding $TestBytes1_UU
                    ($UU_b_f.UUEncodedData).Split([Environment]::NewLine)[1] | Should -Be "!9@"
                }
                It "Given bytes 0x666F, return string '""9F\'" {
                    [System.Byte[]]$TestBytes2_UU = [System.Text.Encoding]::ASCII.GetBytes("fo")
                    [System.Object]$UU_b_fo = ConvertTo-UUEncoding $TestBytes2_UU
                    ($UU_b_fo.UUEncodedData).Split([Environment]::NewLine)[1]  | Should -Be """9F\"
                }
                It "Given bytes 0x666F6F, return string '#9F]O'" {
                    [System.Byte[]]$TestBytes3_UU = [System.Text.Encoding]::ASCII.GetBytes("foo")
                    [System.Object]$UU_b_foo = ConvertTo-UUEncoding $TestBytes3_UU
                    ($UU_b_foo.UUEncodedData).Split([Environment]::NewLine)[1]  | Should -Be "#9F]O"
                }
                It "Given bytes 0x666F6F62, return string '`$9F]O8@'" {
                    [System.Byte[]]$TestBytes4_UU = [System.Text.Encoding]::ASCII.GetBytes("foob")
                    [System.Object]$UU_b_foob = ConvertTo-UUEncoding $TestBytes4_UU
                    ($UU_b_foob.UUEncodedData).Split([Environment]::NewLine)[1]  | Should -Be "`$9F]O8@"
                }
                It "Given bytes 0x666F6F6261, return string '%9F]O8F`$'" {
                    [System.Byte[]]$TestBytes5_UU = [System.Text.Encoding]::ASCII.GetBytes("fooba")
                    [System.Object]$UU_b_fooba = ConvertTo-UUEncoding $TestBytes5_UU
                    ($UU_b_fooba.UUEncodedData).Split([Environment]::NewLine)[1]  | Should -Be "%9F]O8F`$"
                }
                It "Given bytes 0x666F6F626172, return string '&9F]O8F%R'" {
                    [System.Byte[]]$TestBytes6_UU = [System.Text.Encoding]::ASCII.GetBytes("foobar")
                    [System.Object]$UU_b_foobar = ConvertTo-UUEncoding $TestBytes6_UU
                    ($UU_b_foobar.UUEncodedData).Split([Environment]::NewLine)[1]  | Should -Be "&9F]O8F%R"
                }
            }
            Describe "ConvertTo-UUEncoding String Input Operations" {
                It "Given string 'f', return string '!9@'" {
                    [System.String]$UU_s_f = ConvertTo-UUEncoding "f" -Raw
                    $UU_s_f.Split([Environment]::NewLine)[1] | Should -Be "!9@"
                }
                It "Given string 'fo', return string '""9F\'" {
                    [System.String]$UU_s_fo = ConvertTo-UUEncoding "fo" -Raw
                    $UU_s_fo.Split([Environment]::NewLine)[1] | Should -Be """9F\"
                }
                It "Given string 'foo', return string '#9F]O'" {
                    [System.String]$UU_s_foo = ConvertTo-UUEncoding "foo" -Raw
                    $UU_s_foo.Split([Environment]::NewLine)[1] | Should -Be "#9F]O"
                }
                It "Given string 'foob', return string '`$9F]O8@'" {
                    [System.String]$UU_s_foob = ConvertTo-UUEncoding "foob" -Raw
                    $UU_s_foob.Split([Environment]::NewLine)[1] | Should -Be "`$9F]O8@"
                }
                It "Given string 'fooba', return string '%9F]O8F`$'" {
                    [System.String]$UU_s_fooba = ConvertTo-UUEncoding "fooba" -Raw
                    $UU_s_fooba.Split([Environment]::NewLine)[1] | Should -Be "%9F]O8F`$"
                }
                It "Given string 'foobar', return string '&9F]O8F%R'" {
                    [System.String]$UU_s_foobar = ConvertTo-UUEncoding "foobar" -Raw
                    $UU_s_foobar.Split([Environment]::NewLine)[1] | Should -Be "&9F]O8F%R"
                }
            }
            Describe "ConvertTo-UUEncoding File Operations - Content" {
                It "Given file with content 'This is plain text file 1', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile1_UUout = ConvertTo-UUEncoding -InFile $TestFile1_plain -AutoSave "UU"
                    $TestFile1_UUout.FullName -like "*.UU" | Should -Be $True
                    $TestFile1_UUout.Exists | Should -Be $True
                    (Get-Content $TestFile1_UUout).Split([Environment]::NewLine)[1] | Should -Be ";5&AI<R!I<R!P;&%I;B!T97AT(&9I;&4@,0T*"
                    $Null = Remove-Item $TestFile1_UUout
                }
                It "Given file with content 'Short file #2', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile2_UUout = ConvertTo-UUEncoding $TestFile2_plain -AutoSave "UU"
                    $TestFile2_UUout.FullName -like "*.UU" | Should -Be $True
                    $TestFile2_UUout.Exists | Should -Be $True
                    (Get-Content $TestFile2_UUout).Split([Environment]::NewLine)[1] | Should -Be "/4VAO<G0@9FEL92 C,@T*"
                    $Null = Remove-Item $TestFile2_UUout
                }
                It "Given file with content 'This is a large, more complex text file! Now with punctuation!', produce file with correct encoded content" {
                    [System.IO.FileInfo]$TestFile3_UUout = ConvertTo-UUEncoding $TestFile3_plain -AutoSave "UU"
                    $TestFile3_UUout.FullName -like "*.UU" | Should -Be $True
                    $TestFile3_UUout.Exists | Should -Be $True
                    (Get-Content $TestFile3_UUout).Split([Environment]::NewLine)[1] | Should -Be "M5&AI<R!I<R!A(&QA<F=E+""!M;W)E(&-O;7!L97@@=&5X=""!F:6QE(2!.;W<@"
                    (Get-Content $TestFile3_UUout).Split([Environment]::NewLine)[2] | Should -Be "3=VET:""!P=6YC='5A=&EO;B$-""@"
                    $Null = Remove-Item $TestFile3_UUout
                }
            }
            Describe "ConvertTo-UUEncoding File Operations - Integrity" {
                It "Convert small binary file to UUencoded output file - formatted" {
                    $UU_ENC_smallbin = ConvertTo-UUEncoding -InFile $TestFile_smallbin -AutoSave "UU"
                    $UU_ENC_smallbin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_smallbin.Exists | Should -Be $True
                    $UU_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Get-Content $UU_ENC_smallbin -First 1 | Should -Be "begin 0744 $($TestFile_smallbin.Name)"
                    Get-Content $UU_ENC_smallbin -Tail 1 | Should -Be "end"
                    Copy-Item -Path $UU_ENC_smallbin -Destination $UU_F_ENC_smallfile -Force
                    $Null = Remove-Item $UU_ENC_smallbin
                }
                It "Convert medium binary file to UUencoded output file - formatted" {
                    $UU_ENC_medbin = ConvertTo-UUEncoding -InFile $TestFile_medbin -AutoSave "UU"
                    $UU_ENC_medbin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_medbin.Exists | Should -Be $True
                    $UU_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Get-Content $UU_ENC_medbin -First 1 | Should -Be "begin 0744 $($TestFile_medbin.Name)"
                    Get-Content $UU_ENC_medbin -Tail 1 | Should -Be "end"
                    Copy-Item -Path $UU_ENC_medbin -Destination $UU_F_ENC_medfile -Force
                    $Null = Remove-Item $UU_ENC_medbin
                }
                It "Convert large binary file to UUencoded output file - formatted" {
                    $UU_ENC_largebin = ConvertTo-UUEncoding -InFile $TestFile_largebin -AutoSave "UU"
                    $UU_ENC_largebin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_largebin.Exists | Should -Be $True
                    $UU_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Get-Content $UU_ENC_largebin -First 1 | Should -Be "begin 0744 $($TestFile_largebin.Name)"
                    Get-Content $UU_ENC_largebin -Tail 1 | Should -Be "end"
                    Copy-Item -Path $UU_ENC_largebin -Destination $UU_F_ENC_largefile -Force
                    $Null = Remove-Item $UU_ENC_largebin
                }
                It "Convert small binary file to UUencoded output file - unformatted" {
                    $UU_ENC_smallbin = ConvertTo-UUEncoding -InFile $TestFile_smallbin -AutoSave "UU" -Unformatted
                    $UU_ENC_smallbin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_smallbin.Exists | Should -Be $True
                    $UU_ENC_smallbin.Length | Should -BeGreaterThan $SmallBinSize
                    Copy-Item -Path $UU_ENC_smallbin -Destination $UU_UNF_ENC_smallfile -Force
                    $Null = Remove-Item $UU_ENC_smallbin
                }
                It "Convert medium binary file to UUencoded output file - unformatted" {
                    $UU_ENC_medbin = ConvertTo-UUEncoding -InFile $TestFile_medbin -AutoSave "UU" -Unformatted
                    $UU_ENC_medbin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_medbin.Exists | Should -Be $True
                    $UU_ENC_medbin.Length | Should -BeGreaterThan $MedBinSize
                    Copy-Item -Path $UU_ENC_medbin -Destination $UU_UNF_ENC_medfile -Force
                    $Null = Remove-Item $UU_ENC_medbin
                }
                It "Convert large binary file to UUencoded output file - unformatted" {
                    $UU_ENC_largebin = ConvertTo-UUEncoding -InFile $TestFile_largebin -AutoSave "UU" -Unformatted
                    $UU_ENC_largebin.FullName -like "*.UU" | Should -Be $True
                    $UU_ENC_largebin.Exists | Should -Be $True
                    $UU_ENC_largebin.Length | Should -BeGreaterThan $LargeBinSize
                    Copy-Item -Path $UU_ENC_largebin -Destination $UU_UNF_ENC_largefile -Force
                    $Null = Remove-Item $UU_ENC_largebin
                }
            }
            Describe "ConvertFrom-UUEncoding Byte Output Operations" {
                It "Given string '!9@', return bytes 0x66" {
                    [System.Byte[]]$b_f_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n!9@`n```nend" -OutBytes -Raw
                    $b_f_UU | Should -Be 0x66
                }
                It "Given string '""9F\', return bytes 0x666F" {
                    [System.Byte[]]$b_fo_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n""9F\`n```nend" -OutBytes -Raw
                    $b_fo_UU | Should -Be @(0x66,0x6F)
                }
                It "Given string '#9F]O', return bytes 0x666F6F" {
                    [System.Byte[]]$b_foo_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n#9F]O`n```nend" -OutBytes -Raw
                    $b_foo_UU | Should -Be @(0x66,0x6F,0x6F)
                }
                It "Given string '`$9F]O8@', return bytes 0x666F6F62" {
                    [System.Byte[]]$b_foob_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n`$9F]O8@`n```nend" -OutBytes -Raw
                    $b_foob_UU | Should -Be @(0x66,0x6F,0x6F,0x62)
                }
                It "Given string '%9F]O8F`$', return bytes 0x666F6F6261" {
                    [System.Byte[]]$b_fooba_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n%9F]O8F`$`n```nend" -OutBytes -Raw
                    $b_fooba_UU | Should -Be @(0x66,0x6F,0x6F,0x62,0x61)
                }
                It "Given string '&9F]O8F%R', return bytes 0x666F6F626172" {
                    [System.Byte[]]$b_foobar_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n&9F]O8F%R`n```nend" -OutBytes -Raw
                    $b_foobar_UU | Should -Be @(0x66,0x6F,0x6F,0x62,0x61,0x72)
                }
            }
            Describe "ConvertFrom-UUEncoding String Output Operations" {
                It "Given string '!9@', return string 'f'" {
                    [System.String]$s_f_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n!9@`n```nend" -Raw
                    $s_f_UU | Should -Be "f"
                }
                It "Given string '""9F\', return string 'fo'" {
                    [System.String]$s_fo_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n""9F\`n```nend" -Raw
                    $s_fo_UU | Should -Be "fo"
                }
                It "Given string '#9F]O', return string 'foo'" {
                    [System.String]$s_foo_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n#9F]O`n```nend" -Raw
                    $s_foo_UU | Should -Be "foo"
                }
                It "Given string '`$9F]O8@', return string 'foob'" {
                    [System.String]$s_foob_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n`$9F]O8@`n```nend" -Raw
                    $s_foob_UU | Should -Be "foob"
                }
                It "Given string '%9F]O8F`$', return string 'fooba'" {
                    [System.String]$s_fooba_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n%9F]O8F`$`n```nend" -Raw
                    $s_fooba_UU | Should -Be "fooba"
                }
                It "Given string '&9F]O8F%R', return string 'foobar'" {
                    [System.String]$s_foobar_UU = ConvertFrom-UUEncoding -UUEncodedString "begin 0744 testfile`n&9F]O8F%R`n```nend" -Raw
                    $s_foobar_UU | Should -Be "foobar"
                }
            }
            Describe "ConvertFrom-UUEncoding File Operations - Content" {
                It "Given file with content ';5&AI<R!I<R!P;&%I;B!T97AT(&9I;&4@,0T*', produce file with correct plaintext" {
                    [System.IO.FileInfo]$UU_TestFile1out = ConvertFrom-UUEncoding $TestFile1_UU -AutoSave "UUDEC"
                    $UU_TestFile1out.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_TestFile1out.Exists | Should -Be $True
                    Get-Content $UU_TestFile1out | Should -Be "This is plain text file 1"
                    $Null = Remove-Item $UU_TestFile1out
                }
                It "Given file with content 'U2hvcnQgZmlsZSAjMg0K', produce file with correct plaintext" {
                    [System.IO.FileInfo]$UU_TestFile2out = ConvertFrom-UUEncoding $TestFile2_UU -AutoSave "UUDEC"
                    $UU_TestFile2out.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_TestFile2out.Exists | Should -Be $True
                    Get-Content $UU_TestFile2out | Should -Be "Short file #2"
                    $Null = Remove-Item $UU_TestFile2out
                }
                It "Given file with content 'VGhpcyBpcyBhIGxhcmdlLCBtb3JlIGNvbXBsZXggdGV4dCBmaWxlISBOb3cgd2l0aCBwdW5jdHVhdGlvbiENCg==', produce file with correct plaintext" {
                    [System.IO.FileInfo]$UU_TestFile3out = ConvertFrom-UUEncoding $TestFile3_UU -AutoSave "UUDEC"
                    $UU_TestFile3out.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_TestFile3out.Exists | Should -Be $True
                    Get-Content $UU_TestFile3out | Should -Be "This is a large, more complex text file! Now with punctuation!"
                    $Null = Remove-Item $UU_TestFile3out
                }
            }
            Describe "ConvertFrom-UUEncoding File Operations - Integrity" {
                It "Decode small binary file from UUencoded input file with formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_smallbin = ConvertFrom-UUEncoding -InFile $UU_F_ENC_smallfile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_smallbin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_smallbin.Exists | Should -Be $True
                    $UU_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $UU_DEC_smallbin
                }
                It "Decode medium binary file from UUencoded input file with formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_medbin = ConvertFrom-UUEncoding -InFile $UU_F_ENC_medfile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_medbin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_medbin.Exists | Should -Be $True
                    $UU_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $UU_DEC_medbin
                }
                It "Decode large binary file from UUencoded input file with formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_largebin = ConvertFrom-UUEncoding -InFile $UU_F_ENC_largefile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_largebin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_largebin.Exists | Should -Be $True
                    $UU_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $UU_DEC_largebin
                }
                It "Decode small binary file from UUencoded input file without formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_smallbin = ConvertFrom-UUEncoding -InFile $UU_UNF_ENC_smallfile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_smallbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_smallbin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_smallbin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_smallbin.Exists | Should -Be $True
                    $UU_DEC_smallbin_SHA1 | Should -Be $TestFile_smallbin_SHA1
                    $Null = Remove-Item $UU_DEC_smallbin
                }
                It "Decode medium binary file from UUencoded input file without formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_medbin = ConvertFrom-UUEncoding -InFile $UU_UNF_ENC_medfile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_medbin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_medbin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_medbin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_medbin.Exists | Should -Be $True
                    $UU_DEC_medbin_SHA1 | Should -Be $TestFile_medbin_SHA1
                    $Null = Remove-Item $UU_DEC_medbin
                }
                It "Decode large binary file from UUencoded input file without formatting and have resulting file SHA-1 hash match the original file SHA-1 hash" {
                    [System.IO.Fileinfo]$UU_DEC_largebin = ConvertFrom-UUEncoding -InFile $UU_UNF_ENC_largefile -AutoSave "UUDEC"
                    [System.String]$UU_DEC_largebin_SHA1 = "$((($SHA1.ComputeHash([System.IO.File]::ReadAllBytes($UU_DEC_largebin)))|ForEach-Object ToString X2) -join '')"
                    $UU_DEC_largebin.FullName -like "*.UUDEC" | Should -Be $True
                    $UU_DEC_largebin.Exists | Should -Be $True
                    $UU_DEC_largebin_SHA1 | Should -Be $TestFile_largebin_SHA1
                    $Null = Remove-Item $UU_DEC_largebin
                }
            }
        }
        Context "Clean Up Temporary Test Files and Test Data" {
            It "Remove Binary Files" {
                $Null = Remove-Item $TestFile_smallbin
                $Null = Remove-Item $TestFile_medbin
                $Null = Remove-Item $TestFile_largebin
                $TestFile_smallbin | Should -Not -Exist
                $TestFile_medbin | Should -Not -Exist
                $TestFile_largebin | Should -Not -Exist
            }
            It "Remove Plaintext Files with Known Content" {
                $Null = Remove-Item $TestFile1_plain
                $Null = Remove-Item $TestFile2_plain
                $Null = Remove-Item $TestFile3_plain
                $Null = Remove-Item $TestFile4_plain
                $Null = Remove-Item $TestFile5_plain
                $Null = Remove-Item $TestFile6_plain
                $TestFile1_plain | Should -Not -Exist
                $TestFile2_plain | Should -Not -Exist
                $TestFile3_plain | Should -Not -Exist
                $TestFile4_plain | Should -Not -Exist
                $TestFile5_plain | Should -Not -Exist
                $TestFile6_plain | Should -Not -Exist
            }
            It "Remove Temporary Files For Encoding / Decoding Functions - Binary" {
                $Null = Remove-Item $A85_ENC_smallfile
                $Null = Remove-Item $A85_ENC_medfile
                $Null = Remove-Item $A85_ENC_largefile
                $Null = Remove-Item $B16_ENC_smallfile
                $Null = Remove-Item $B16_ENC_medfile
                $Null = Remove-Item $B16_ENC_largefile
                $Null = Remove-Item $B32_ENC_smallfile
                $Null = Remove-Item $B32_ENC_medfile
                $Null = Remove-Item $B32_ENC_largefile
                $Null = Remove-Item $B32h_ENC_smallfile
                $Null = Remove-Item $B32h_ENC_medfile
                $Null = Remove-Item $B32h_ENC_largefile
                $Null = Remove-Item $B64_ENC_smallfile
                $Null = Remove-Item $B64_ENC_medfile
                $Null = Remove-Item $B64_ENC_largefile
                $Null = Remove-Item $UU_F_ENC_smallfile
                $Null = Remove-Item $UU_F_ENC_medfile
                $Null = Remove-Item $UU_F_ENC_largefile
                $Null = Remove-Item $UU_UNF_ENC_smallfile
                $Null = Remove-Item $UU_UNF_ENC_medfile
                $Null = Remove-Item $UU_UNF_ENC_largefile
                $A85_ENC_smallfile | Should -Not -Exist
                $A85_ENC_medfile | Should -Not -Exist
                $A85_ENC_largefile | Should -Not -Exist
                $B16_ENC_smallfile | Should -Not -Exist
                $B16_ENC_medfile | Should -Not -Exist
                $B16_ENC_largefile | Should -Not -Exist
                $B32_ENC_smallfile | Should -Not -Exist
                $B32_ENC_medfile | Should -Not -Exist
                $B32_ENC_largefile | Should -Not -Exist
                $B32h_ENC_smallfile | Should -Not -Exist
                $B32h_ENC_medfile | Should -Not -Exist
                $B32h_ENC_largefile | Should -Not -Exist
                $B64_ENC_smallfile | Should -Not -Exist
                $B64_ENC_medfile | Should -Not -Exist
                $B64_ENC_largefile | Should -Not -Exist
                $UU_F_ENC_smallfile | Should -Not -Exist
                $UU_F_ENC_medfile | Should -Not -Exist
                $UU_F_ENC_largefile | Should -Not -Exist
                $UU_UNF_ENC_smallfile | Should -Not -Exist
                $UU_UNF_ENC_medfile | Should -Not -Exist
                $UU_UNF_ENC_largefile | Should -Not -Exist
            }
            It "Remove Temporary Files For Encoding / Decoding Functions - Text" {
                $Null = Remove-Item $TestFile1_A85
                $Null = Remove-Item $TestFile2_A85
                $Null = Remove-Item $TestFile3_A85
                $Null = Remove-Item $TestFile1_B16
                $Null = Remove-Item $TestFile2_B16
                $Null = Remove-Item $TestFile3_B16
                $Null = Remove-Item $TestFile1_B32
                $Null = Remove-Item $TestFile2_B32
                $Null = Remove-Item $TestFile3_B32
                $Null = Remove-Item $TestFile4_B32h
                $Null = Remove-Item $TestFile5_B32h
                $Null = Remove-Item $TestFile6_B32h
                $Null = Remove-Item $TestFile1_B64
                $Null = Remove-Item $TestFile2_B64
                $Null = Remove-Item $TestFile3_B64
                $Null = Remove-Item $TestFile1_UU
                $Null = Remove-Item $TestFile2_UU
                $Null = Remove-Item $TestFile3_UU
                $TestFile1_A85 | Should -Not -Exist
                $TestFile2_A85 | Should -Not -Exist
                $TestFile3_A85 | Should -Not -Exist
                $TestFile1_B16 | Should -Not -Exist
                $TestFile2_B16 | Should -Not -Exist
                $TestFile3_B16 | Should -Not -Exist
                $TestFile1_B32 | Should -Not -Exist
                $TestFile2_B32 | Should -Not -Exist
                $TestFile3_B32 | Should -Not -Exist
                $TestFile4_B32h | Should -Not -Exist
                $TestFile5_B32h | Should -Not -Exist
                $TestFile6_B32h | Should -Not -Exist
                $TestFile1_B64 | Should -Not -Exist
                $TestFile2_B64 | Should -Not -Exist
                $TestFile3_B64 | Should -Not -Exist
                $TestFile1_UU | Should -Not -Exist
                $TestFile2_UU | Should -Not -Exist
                $TestFile3_UU | Should -Not -Exist
            }
        }
    }
}