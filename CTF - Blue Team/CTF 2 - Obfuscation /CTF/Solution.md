## 🛠️ Solution:

### 🔁 Step 1: Reverse the Code
Use PowerShell to reverse the obfuscated string:

```powershell
$x = "=AgIA4CArBwYAUHAsBAIAQGAvBwbAcEAgAgLAMHAyBQZAQHA0BQZAwGAgAAbAEGA0BQaAAHAhBwYAACA0AAIAUGAyBQYAACAlBgcAUGAoBAVAACAuAwcAUGAzBQZAgGA0BgbAUGAyBQYAAHAgAgbAkGAgAAZA4GAhBQbA0GAvBwYAACAlBAaAQHAgAwcAkGAgAwZAEGAsBgZAACAlBAaAQHAgAwcAMHAlBwYAMGAhBAIA8GA0BAIAQGAyBwbAcHAzBwcAEGAwBAIAUGAoBAVAICAgAQKAQHAqAgKAoCAqAgKAoCAqAgKAoCAqAgKAoCAqAgKAoCAqAgKAUHAqAQLAoCAqAgKAoCAqAgKAoCAqAgKAoCAqAgKAoCAqAwVAACAtBwYAcGAoAgJ".ToCharArray(); 
[array]::Reverse($x); 
$x -join ""


### 📦 Step 2: Decode the Base64 String 
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('JgAoAGcAYwBtACAAVwAqACoAKgAqACoAKgAqACoAKgAqACoAKgAqACoALQAqAHUAKgAqACoAKgAqACoAKgAqACoAKgAqACoAKgAqACoAKgAqAHQAKQAgACIAVABoAGUAIABwAGEAcwBzAHcAbwByAGQAIAB0AG8AIABhAGMAYwBlAHMAcwAgAHQAaABlACAAZgBsAGEAZwAgAGkAcwAgAHQAaABlACAAYwBvAG0AbQBhAG4AZAAgAGkAbgAgAHAAYQByAGUAbgB0AGgAZQBzAGUAcwAuACAAVABoAGUAcgBlACAAYQByAGUAIAA0ACAAYwBhAHAAaQB0AGEAbAAgAGwAZQB0AHQAZQByAHMALgAgAEcAbwBvAGQAIABsAHUAYwBrAC4AIgA='))

This reveals the message:

    "The password to access the flag is the command in parentheses. There are 4 capital letters. Good luck."

### Step 3 : Understand that gcm is an alias for the Get-Command command, which itself displays aliases.

### Step 4 : Understand how * work. The clue is that the 2nd letter after the dash is a “u” and that in reality Powershell interprets the command despite X number of “*” so it doesn't represent the length of the command.

### Setp 4.bis : Enter the password to open the flag file: Get-Command Write-Output

### Step 5 : Decode flag encoder into byte 
Simply add “[char]” in front of the string. The clue here is to look at the formatting of the string. We can see that a [char] has been removed at the beginning.

So we get the flag: “Well done, the flag is: 0bfusc@710n_M@$73r3d”.
