Param( [String]$Att,
	   [String]$Subj,
	   [String]$Body
	   )
Function Send-Email
{
	Param(
			[Parameter(Mandatory=$true)]
		[String]$To,
			[Parameter(Mandatory=$true)]
		[String]$From,
			[Parameter(Mandatory=$true)]
		[String]$Password,
			[Parameter(Mandatory=$true)]
		[String]$Subject,
			[Parameter(Mandatory=$true)]
		[String]$Body,
			[Parameter(Mandatory=$true)]
		[String]$attachment
		)
try
{	
	$Msg = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
	$Srv = "smtp.gmail.com"
	if($attachment -ne $null)
	{
		try
		{
			$Attachments = $attachment -split ("\:\:");
			
			ForEach($val in $Attachments)
			{
				$attch = New-Object System.net.Mail.Attachment($val)
				$Msg.Attachments.add($attch)
			
			}
		}
		catch
		{
			exit 2;
		}
		
		$Client = New-Object net.Mail.SmtpClient($srv, $87)
		$Client.EnableSsl = $true
		$Client.Credentials = New-Object System.Net.NetworkCredential($From.Split("@")[0])
		$Client.Send($Msg)
		Remove-Variable -Name Client
		Remove-Variable -Name Password
		exit 7;
	}
}
catch
	{
		exit 3;
	}
}

try 
{
	send-Email
		-attachment $Att 
		-To "Address of the recipient"
		-Body $Body
		-Subject $Subj
		-password "tralalala"
		-From " Address of the Sender"
}
catch
{
	exit 4;
}