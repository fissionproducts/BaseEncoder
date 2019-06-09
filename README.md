PowerShell byte manipulation base conversion and encoding functions.
This module collects about a dozen functions for translating bytes into ASCII text and back
again using various encoding schemes: Base16 (hex), Base32, Base64, Ascii85 and UUencode.

Get-RandomByteArray
        A PowerShell function to generate an arbitrary number of cryptographically safe random
        bytes.

Get-CompressedByteArray
        A PowerShell function to apply GZip compression to a byte array.
        
Get-DecompressedByteArray
        A PowerShell function decompress GZip-compressed byte arrays.

ConvertTo-Ascii85
        A PowerShell function to convert arbitrary data into an Ascii85 (Base85) encoded string.
        
ConvertFrom-Ascii85
        A PowerShell function to convert an arbitrary Ascii85 encoded string into a byte array
        or binary file.

ConvertTo-Base16
        A PowerShell function to convert arbitrary data into a Base16 (hexadecimal) encoded
        string.
        
ConvertFrom-Base16
        A PowerShell function to convert an arbitrary Base16 encoded string into a byte array or
        binary file.
        
ConvertTo-Base32
        A PowerShell function to convert arbitrary data into a Base32 encoded string.
        
ConvertFrom-Base32
        A PowerShell function to convert an arbitrary Base32 encoded string into a byte array or
        binary file.
        
ConvertTo-Base64
        A PowerShell function to convert arbitrary data into a Base64 encoded string.
        
ConvertFrom-Base64
        A PowerShell function to convert an arbitrary Base64 encoded string into a byte array or
        binary file.

ConvertTo-UUEncoding
        A PowerShell function to convert an arbitrary byte array into a UNIX-to-UNIX (UU)
        encoded string.

ConvertFrom-UUEncoding
        A PowerShell function to convert UUencoded string data into a byte array or binary file.
        