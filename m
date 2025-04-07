Return-Path: <linux-i2c+bounces-10128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A96A7D612
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4237117A0DD
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 07:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD5A229B23;
	Mon,  7 Apr 2025 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="E465NOXN";
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="JdQsRew5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AB221F35;
	Mon,  7 Apr 2025 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010692; cv=none; b=KXJ8yUUedJ/ZdtZzda2OyXdIcESWAaQryf8aArQQWBeABuaGu6/jPJMkWlz+5tDLm3QtBv9P+RcGL7Jr7358YT4miVkiRbaKd8YRmrIXdmi6aOWOK3XAsUmrt+mjnTte9TwwYfv50YhgD4d/lmEsD8CY1W6cwHOBgg2pv1jwjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010692; c=relaxed/simple;
	bh=oAGPqDTX3zmSA83g9u7XMjn0BqfmdVqu2X1s/bGMqi0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F5q+tGQcStABJB9rrVeoJ2p41XSKZHTH8+TATgQaGCJfaXDKFMapYn0EPsKB6CvhsIXvcNGGJrV+j0obQLojyumQj9uRDQNPUg0uSx29wSKt3cRbvU/p8go9mEd5YPp19DEB1ULRfVds/5l+iVYz0VO9PN8v38wH2a5Yqhb8gH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=E465NOXN; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=JdQsRew5; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1744010690; x=1775546690;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=oAGPqDTX3zmSA83g9u7XMjn0BqfmdVqu2X1s/bGMqi0=;
  b=E465NOXNu4rJLZzlx7o650TAchsKugtEgU4UBbpTOh5XkMPALrhKWgL9
   ngB+7tIghQ7xYfmy3agk2CFRZEk7dQ6UtO596by8/jiaJ+RfjIe1YE4aV
   7y6PG0M3hQGdfs/eUiX1lUEUUw1wE2hZ9hyEhq88VYCUfAUbkCRt7A+ZG
   I=;
X-CSE-ConnectionGUID: tfUnLbm1SDmVDGLeyBXZxg==
X-CSE-MsgGUID: SbuofVYMSsWFqFGImftvMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="81401858"
X-IronPort-AV: E=Sophos;i="6.15,193,1739833200"; 
   d="p7s'346?scan'346,208,346";a="81401858"
Received: from unknown (HELO mucxv003.muc.infineon.com) ([172.23.11.20])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:23:38 +0200
Received: from mucxv003 (localhost [127.0.0.1])
	by mucxv003.muc.infineon.com (Postfix) with SMTP id 4ZWLKj5zl0zbkc;
	Mon,  7 Apr 2025 09:23:37 +0200 (CEST)
Received: from smtp9.infineon.com (unknown [10.32.30.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mucxv003.muc.infineon.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 09:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1744010617; x=1775546617;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=oAGPqDTX3zmSA83g9u7XMjn0BqfmdVqu2X1s/bGMqi0=;
  b=JdQsRew5Jt2xzXCddLZ0L0SoNUxfswmEXnCR3dQ79v/BADRmNGz5dE46
   2VPusxIxSpkSGelrMHxnnpS5ZUzrmQ0DCfM9GxhFtJXxXn3VXCdnBsl4B
   kXg5isYG8Rk7i3kVf133HfBMRzKwz0BYiJlVwu4P90gwSMiW4hNCyujQM
   Y=;
X-CSE-ConnectionGUID: lOXucf8lSCGGqJ14bxOALg==
X-CSE-MsgGUID: MkvOx1pGRWWUqy3E07GYAw==
X-Encrypted-To-SeppBox: True
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="47963969"
X-IronPort-AV: E=Sophos;i="6.15,193,1739833200"; 
   d="p7s'346?scan'346,208,346";a="47963969"
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:23:37 +0200
Received: from MUCSE833.infineon.com (172.23.7.105) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.39; Mon, 7 Apr
 2025 09:23:36 +0200
Received: from MUCSE830.infineon.com (172.23.29.23) by MUCSE833.infineon.com
 (172.23.7.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.39; Mon, 7 Apr
 2025 09:23:36 +0200
Received: from MUCSE830.infineon.com ([fe80::8a9e:b625:94f9:169d]) by
 MUCSE830.infineon.com ([fe80::8a9e:b625:94f9:169d%19]) with mapi id
 15.02.1258.039; Mon, 7 Apr 2025 09:23:36 +0200
From: <Shirley.Lin@infineon.com>
To: <quic_msavaliy@quicinc.com>, <wsa+renesas@sang-engineering.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
	<patrick.rudolph@9elements.com>, <bhelgaas@google.com>,
	<ninad@linux.ibm.com>, <festevam@denx.de>, <devicetree@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<Mills.Liu@infineon.com>, <Ashish.Yadav@infineon.com>,
	<Ian.Fang@infineon.com>
Subject: RE: Update driver xdpe152c4.c
Thread-Topic: Update driver xdpe152c4.c
Thread-Index: AduncG4+KOQ8tLMYRdSyF3hlAwcSU///8T2AgAAUjoCAAAzUAP//3JNw
Date: Mon, 7 Apr 2025 07:23:36 +0000
Message-ID: <a47a4741e79044df98a1369e6dc6175f@infineon.com>
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <eeef6c60-8de2-4a4d-8bc5-2c321d759672@quicinc.com> <Z_Ns419SpW_z2Xnr@shikoro>
 <441ccdc7-bc0e-41ad-9878-d922ec1bfaa1@quicinc.com>
In-Reply-To: <441ccdc7-bc0e-41ad-9878-d922ec1bfaa1@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0055_01DBA7D1.00106700"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

------=_NextPart_000_0055_01DBA7D1.00106700
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


Thanks a lot for prompt reviewing and kind comments from Mukesh Kumar Savaliya 
<quic_msavaliy@quicinc.com> and Wolfram Sang 
<wsa+renesas@sang-engineering.com>. We will include/amend with patch and 
resend. Sincerely appreciate your kind help.


------=_NextPart_000_0055_01DBA7D1.00106700
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMyjCCA+4w
ggLWoAMCAQICEGsk517Bqmu0TbjoYC/BbAIwDQYJKoZIhvcNAQEFBQAwXTELMAkGA1UEBhMCZGUx
ITAfBgNVBAoTGEluZmluZW9uIFRlY2hub2xvZ2llcyBBRzErMCkGA1UEAxMiSW5maW5lb24gVGVj
aG5vbG9naWVzIEFHIFJvb3QgQ0EgMjAeFw0xMTA3MjYxMzEyMjBaFw0zNjA3MjYxMzIyMjBaMF0x
CzAJBgNVBAYTAmRlMSEwHwYDVQQKExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMT
IkluZmluZW9uIFRlY2hub2xvZ2llcyBBRyBSb290IENBIDIwggEiMA0GCSqGSIb3DQEBAQUAA4IB
DwAwggEKAoIBAQDMQpw2+wMM1Zu9gvlmBJSMi0GGkpvNL+RUfdNatlMGrliwyaCEB+HZzZP9CLys
cLIglTKWeANzKozlAjE4ubdO/Y1IBmnuJMDW2lI73bZOwR2Y0shwmO1esRd2EyGCtVa9RgKa7HD3
pEHJAXlu9+IejoYv94lF80E/5jsNMeczlwUV7cF3NwXQKMoRd1BHGtFnwwOqIVELmDC/coQM6UXe
MlUzYpfVJyqdCiNHU0wPzFNyeDObgDOLNIH222OuRR5wsDvmDiP/6j8QPTBJ71uGWlFE6B7cVvAO
QXVDCZYLpfQLkNFnG8BElOH7gSzuAiBvQtoERRC1QyZZC2MEValdAgMBAAGjgakwgaYwDgYDVR0P
AQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQEwHQYDVR0OBBYEFDhv1fR35slaIStRFWrWIKsC
DacVMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jcmwuaW5maW5lb24uY29tL3Jvb3RjYTIvcm9v
dGNhMi5jcmwwEAYJKwYBBAGCNxUBBAMCAQAwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEB
BQUAA4IBAQCsiCetpToA0t9yFxPkiw1pekvEPPEeOqsMEGa/Xf6JyqZCC0lSAyu9Uo6l6YSCAb73
f0TjNH0JDNApW2q6556qloVM0almOTirDaM+R8bJzeRg7xHeZriif9QWfA9czBfK6MSDTDULatcH
mJwNznVQWuRBefTg/txo0OuPvvmbuGVT8hhdEf1fu0rcX7fE1X7zP27opZ3DjMk+ocu9MRk3L+Cw
ISxiCfo2af0hWLZBTuQPqODjx73waxOAK317QwRC4m84BwUEZ3IR3CfvK3ukk6UQ8Pgl6SmDdzNw
KGVNo+tNELKtgW125xQ5znatvPJQjYJjhB0XikvWjdKJL48PMIIEIzCCAwugAwIBAgIKYR4k+gAA
AAAAAjANBgkqhkiG9w0BAQUFADBdMQswCQYDVQQGEwJkZTEhMB8GA1UEChMYSW5maW5lb24gVGVj
aG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcgUm9vdCBDQSAy
MB4XDTExMDcyNzEyMzIwNVoXDTI2MDcyNzEyNDIwNVowXTELMAkGA1UEBhMCZGUxITAfBgNVBAoT
GEluZmluZW9uIFRlY2hub2xvZ2llcyBBRzErMCkGA1UEAxMiSW5maW5lb24gVGVjaG5vbG9naWVz
IEFHIFVzZXIgQ0EgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKBHZyb03ScBt//g
4A4cOg5bRHXlpCBOyzJo/X4sMpuxu+47KFkVAIWhUlyhVk4f22+EDos6Ley7/10Pl7VNBuTj0i07
P5vjTbT/CgshA3mcRb4xqyXZx4Eh/rnMicAlXQ8OUhbg+uBMjBOuvQrhXg2epP6+etKdg6LlXDrD
edZflpmIGvn8sgGyfbAiH0Wy/HGJngg6dncHacL6hPzGTrhR4bJwTnogxhN7NaDmuU1OxzKjsPc7
cidAmTtIlGpEfXj162C8GZ6vQjmBjH+ZqEdnz86IPGnUHb4Ifoa/GVzSlH0hPtMmybczi/BAcAQO
obiKhfCbpNU8/nXhuiQ3kbcCAwEAAaOB5DCB4TALBgNVHQ8EBAMCAYYwHQYDVR0OBBYEFBoYmNi4
E/3bHsoMirMTA3B3wxeWMB8GA1UdIwQYMBaAFDhv1fR35slaIStRFWrWIKsCDacVMDwGA1UdHwQ1
MDMwMaAvoC2GK2h0dHA6Ly9jcmwuaW5maW5lb24uY29tL3Jvb3RjYTIvcm9vdGNhMi5jcmwwEgYD
VR0TAQH/BAgwBgEB/wIBADBABgNVHSAEOTA3MDUGCyqCFABEChQBAQEBMCYwJAYIKwYBBQUHAgEW
GGh0dHBzOi8vY3BzLmluZmluZW9uLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAbOjg2haQMCPP0ZcS
1+hd0teYaBpi2LpwADGVyFAUO2UuPKGxAfYxWf3/v0FNW2IOhNKj8w3f076sKkeSlb6WiZZIe+ao
kG2H6AimMIlhvv4GGAFHzQLVclXIz9jM7H4fH/wA/gHE4wDE1dvsGVjeM2fEjwTOtNrPzGF9SF1s
NyJy8a2AZ83b6J6WIN72Jg2KXXQuVsa61/q2C5AAMfXLL4shuWN1JnYO03PBUjYWxqNdcETppKhc
swaIZJ0MjKDttzuT9IntFeoOYMJx27KGowOqMDbmRoXRGWZahO4m4UkjIo9uzMX7U5EQymoMiVJc
Ndp3qT5b48QXhmDe7Cmd4DCCBK0wggOVoAMCAQICAwKfGzANBgkqhkiG9w0BAQUFADBdMQswCQYD
VQQGEwJkZTEhMB8GA1UEChMYSW5maW5lb24gVGVjaG5vbG9naWVzIEFHMSswKQYDVQQDEyJJbmZp
bmVvbiBUZWNobm9sb2dpZXMgQUcgVXNlciBDQSAyMB4XDTIyMDMwODExMTA1NVoXDTI2MDMwODEx
MTA1NVowejELMAkGA1UEBhMCVFcxLjAsBgNVBAoTJUluZmluZW9uIFRlY2hub2xvZ2llcyBUYWl3
YW4gQ28uIEx0ZC4xEjAQBgNVBAMTCVl1LUp1IExpbjEnMCUGCSqGSIb3DQEJARYYU2hpcmxleS5M
aW5AaW5maW5lb24uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgDs0ynVd4meT
2rX3L6tInFY7OR15+UH0skOnj87kokM2jZIGKfpo9adMADnd9uBErtHPwvDzqAcFbCKQHrYPPwN9
rHw5OiuOwR6LYK0uYnZoRw66XwQ6wxRHgGWRf3rffhkt5TqIAHPyQ7he0PeGZtf0MPGhRL7+F+np
9zKRcVkhLFPjSiHhuz6q56W6w1AKpCNVrZeWF3ENIBqiu2QXc28l+q591QG4hIltna8v0dWDIyqk
syN8DnQ7jX2FFrk0ziUW+XZ+MPf8qQIZnYlNkgW0hkang49ZwIAvDB7mBjQCHVUk3uNAD2dR3IsG
AGvMKdLwK6FqJ3BEr8CK8sXcRQIDAQABo4IBVzCCAVMwIwYDVR0RBBwwGoEYU2hpcmxleS5MaW5A
aW5maW5lb24uY29tMEAGA1UdIAQ5MDcwNQYLKoIUAEQKFAEBAQEwJjAkBggrBgEFBQcCARYYaHR0
cHM6Ly9jcHMuaW5maW5lb24uY29tMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jcmwuaW5maW5l
b24uY29tL3VzZXJjYTIvdXNlcmNhMi5jcmwwDgYDVR0PAQH/BAQDAgTwMBMGA1UdJQQMMAoGCCsG
AQUFBwMEMEcGCCsGAQUFBwEBBDswOTA3BggrBgEFBQcwAoYraHR0cDovL2NybC5pbmZpbmVvbi5j
b20vdXNlcmNhMi91c2VyY2EyLmNydDAfBgNVHSMEGDAWgBQaGJjYuBP92x7KDIqzEwNwd8MXljAd
BgNVHQ4EFgQUrwtYSHJ3S+EU2JUrqd1KvSA0tAUwDQYJKoZIhvcNAQEFBQADggEBABeLjTB14zW9
sBtyq9NG7IEN6GWxhPe5KZ+5JBOIiiQDbsrscZkPgLT0XJQmBm8043UMGCF8WtQx6HEBlg17cMA+
llVItLiMIEBMLK5misLGs3eGOjsCNQw4lT683jtS9oyqcfJ0NUGzLExsmUr5OjC3Cd5KTUMOhiEU
ux06JDD60vZDjNS7gThg3lQvNaUVJPeJ+cF+bEknYrP1IK3GLfD1JcAwsCVxe5qCPf2XPdqeeGt2
dKN0lLtiT1o8LJ8lWc2Im1z0Yxwg8iPSBSM14yfNNzt6aTKfkv+oxdp6svfk4Y/RqFk2Fgf52KS/
wsy5R+PTMcWrfBeQu/SEf5q3cKwxggNuMIIDagIBATBkMF0xCzAJBgNVBAYTAmRlMSEwHwYDVQQK
ExhJbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hub2xvZ2ll
cyBBRyBVc2VyIENBIDICAwKfGzAJBgUrDgMCGgUAoIIB3zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
AQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA0MDcwNzIzMjJaMCMGCSqGSIb3DQEJBDEWBBRX97TqJICx
fl6b8eGpdPmbjb+qvjBzBgkrBgEEAYI3EAQxZjBkMF0xCzAJBgNVBAYTAmRlMSEwHwYDVQQKExhJ
bmZpbmVvbiBUZWNobm9sb2dpZXMgQUcxKzApBgNVBAMTIkluZmluZW9uIFRlY2hub2xvZ2llcyBB
RyBVc2VyIENBIDICAwKfGzB1BgsqhkiG9w0BCRACCzFmoGQwXTELMAkGA1UEBhMCZGUxITAfBgNV
BAoTGEluZmluZW9uIFRlY2hub2xvZ2llcyBBRzErMCkGA1UEAxMiSW5maW5lb24gVGVjaG5vbG9n
aWVzIEFHIFVzZXIgQ0EgMgIDAp8bMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsG
CWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAC4ZLWJes1j3nxQ15GlxRwLCKaSq+QG4z9oOa+PxxoulpSxqe9Yl
6QLGUVjNEbR9YVW8seCBqxNJjhWPcG4bNd/DhHJB+Cdfn1nFwTHDB7uCfccSSwtwDwnHlAB+hLjQ
KADhC0mRPMSdhLPrlUa71bKZq4CmPRbL8+6ZLkkPvf77WD1a3v+nSwDpj9SuMaPb8NY/vuXitYqd
uQoDCcI1D3qhvMFvx9BFCOmvImX1GiV1GqUbFfFdBPjo4zrZ3NXdtbonB9Idpdc3c25u8kRqdjf6
Zv9AG96G1VTSX/SpfUk5WwXW9Iv9/nw/4lYmoyF2NiBE5yPm5UXbkcfBwrNe/t4AAAAAAAA=

------=_NextPart_000_0055_01DBA7D1.00106700--

