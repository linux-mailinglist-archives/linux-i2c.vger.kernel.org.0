Return-Path: <linux-i2c+bounces-2052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F386BB14
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 23:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC6128ADC7
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 22:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C3F72907;
	Wed, 28 Feb 2024 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b="bo+aiqVx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3837290F;
	Wed, 28 Feb 2024 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709160883; cv=none; b=YbvaPjkLObth/jnwHBQi8bz04JeB25g9/yOL4A3P/kOM2A0ooJaIdU2syOExd3D5z3PW3MwCzrJyQ+ECuQXjPX0qvy7I1Cp9Y/LDWOSJX4Oo0hO4dd9rOJUEIzHCUjRypgKLYtZOu10zKZKT0ulSm4FSfuVbeN2sGstKdMf0t6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709160883; c=relaxed/simple;
	bh=JROr7bPFZhC9ly9W26owc3fwvH63LaDpRWCrZKDJInU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etHHpdzIVtytvnAkg0HHZ/xnKsLMluA6Gds3FWV6PEZsZWGPuj6iYt0l1MshyVC7PEAsz+ogiZAIV560KcvbdGpoFVoh7V69XPJLyogPt57RGrvtPfls0bsTKVdaSvzZg+HBr9hZAUii5DKg1M9ZI68/Vf0JBRzOjSv8bFTg1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b=bo+aiqVx; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1709160867; x=1709765667; i=hoehnp@gmx.de;
	bh=JROr7bPFZhC9ly9W26owc3fwvH63LaDpRWCrZKDJInU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=bo+aiqVxpFpY2tcxnyGR0dd+6wJYwejvMQ5mC6DwmD/vud+9T8Y9EUZnEvWUNHyw
	 +swQRc7eWG96N/H5w4LIvFkN5mQ1WbHP7wq/LsxVSa06x34U8r9Ple08lV+9b79j5
	 4RPs8NklYyQWgwHsum8KxfyjIeQN+GmDd7ZltQoCtWfM7mrT3sUh0BB6UtkUaIj6A
	 71HOdWemtB5A9vEgoIo8a1U6PUlKSzIlEiO3R41WL9EF+JaCkYK2TtapHd10btbvZ
	 GAIudki5CCqrga0Xt2eAVSloTGRSKlCrU3awciJgDSJNAkDqBCPyvPdCSAPXuq9o1
	 7SSCDX/expjutqVlXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.0.0.2] ([31.18.168.131]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1rFw9n42Qf-00PeuR; Wed, 28
 Feb 2024 23:54:27 +0100
Message-ID: <25bdda18-4e05-42a6-a0e1-3e35a81ca90f@gmx.de>
Date: Wed, 28 Feb 2024 23:54:10 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i801: Add lis3lv02d for Dell Precision M6800 v2
 Bios: A26
Content-Language: sv-SE
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240222215010.31456-1-hoehnp@gmx.de>
 <3s546clapu73llqqyhj7fhab5cwhchygrtq53juqcqoyttk2dx@47ylvwpqso5d>
From: =?UTF-8?Q?Patrick_H=C3=B6hn?= <hoehnp@gmx.de>
In-Reply-To: <3s546clapu73llqqyhj7fhab5cwhchygrtq53juqcqoyttk2dx@47ylvwpqso5d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k0qYc3urTRUhG9YT5npY5VQnC+fxQFaW6B3T+J1OgWG7CWlrVqz
 kXSWkz1aveFLyb2pO/wle02gSh/JO7QV2cGwNIDJ8/SIS9MhvQdvv6Vnjse2p43+B+/upDa
 dBqOPPEx1gX/GRt/+M/4fZqZAuz0zWkMh6RuhD3mYOtDO+ObS4KnzFcqz6ztKpj2Cg4MrQX
 sYykAA/vL6PlJMpHCvwPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kz83J+2lz6w=;jv6JANSlyKWaVCC9FVPAg8D1CQR
 059VGe9ltUT3Cum+n9mG2frt4F3vPzE09KlNP6iMF5odfTD0X+I8Z/GyZr+g+t6qvETXjNktL
 Cr9tXOvTJkekF/+WRUMFTMOGJMD8OyW+deR8oSNHtrt3xKuxgYF2BFvRFotPWyGcI7e5Th1Fy
 pkl3q6niqzKGxNYr7sQC7ewixa2aVd/qvimmlWF/vdKB37S0lTMDL4x32WgOG9vNvHqI3jocV
 CR9J2/lkhxyhRJTTPsOlaAZvNqKjklkI0egcEFqHsVtoQawN5uxYxFLwQerHxeJFhfCsm4FLI
 k8xBbIOzXr12m5Up0K4WSSXP6KmShj8NBuaOHHKupkw0yJtEmLYBjniBwgVIYANpl5SweiROh
 95ajlGsWHdyN8TlfaXEilTdk7jaITqRvP3GHLc8Udiqx1t+k/HWT8+whRlUDTQ7Ff1quYhvAE
 CBFlJCuTtn635AF4XJYHS+fwpRiUT23fh5gMPOnKlawsVROnuWsuOGqJRQy9XYMbZ4SKmfv15
 WcjqzcBZGn0SaWsOuqcIKdeSP84zFTg4xGHuoM19H+aAmo/0Jp0Pp+q0zWkXNROFMbLMRbYiM
 a9J0GHCxMm7IvPsd/PCbf3FcWJuBbkZVR5fbBzT5CbOoV+oMEgFuj7ZSO2EKXLLeEzGTKS3Yk
 fksOohVdUXO++XyzuZ0blZVFnNbjyXp3CMlSVJQfk9/yVU8KWH1a5iNGKyD3B17pbmsFd7731
 k4T+ZKQsxxwOK8e6xeFL0kD91cgs7o3icLeVLtfEKMMYZFw7nFyuqxYsr+gAQ37vHFBcjVIPD
 OA/KNB6uBC+6NASL7JnybIHJUSHW3rV+LP4yx4m2t/MWQ=

Hi Andi,

sorry for the late response. Since it is the first time I am
contributing, please excuse me, if my description still needs
improvement. I can simply describe what I did:

similiarly to what Paul did before, I identified that the M6800 has the
accelerometer installed and verified its address using my running Gentoo
System. Then I was applying the patch to latest kernel and confirmed
that it was booting successfully and the message about a successful
detection was present.

Is this along the lines you expect?

Best Regards,
Patrick
Den 2024-02-22 kl. 23:24, skrev Andi Shyti:
> Hi Patrick,
>
> On Thu, Feb 22, 2024 at 10:50:08PM +0100, Patrick H=C3=B6hn wrote:
>> Signed-off-by: Patrick H=C3=B6hn <hoehnp@gmx.de>
>
> I see that you've fixed almost everything that Paul has
> suggested, but please elaborate a bit more in the git commit.
>
> Spend some time adding a description. If you want, you can reply
> to this email with the commit log you have in mind, and I can add
> it for you, or you can send a v3.
>
> Thank you, Paul, for your excellent review.
>
> Andi
>
> PS: A small nitpick: there's no need to add 'v2' in the title.
>      '[PATCH v2]' is sufficient.
>
>> ---
>>   drivers/i2c/busses/i2c-i801.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i80=
1.c
>> index 2c36b36d7d51..c1fee2c61da1 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1231,6 +1231,7 @@ static const struct {
>>   	 */
>>   	{ "Latitude 5480",      0x29 },
>>   	{ "Precision 3540",     0x29 },
>> +	{ "Precision M6800",    0x29 },
>>   	{ "Vostro V131",        0x1d },
>>   	{ "Vostro 5568",        0x29 },
>>   	{ "XPS 15 7590",        0x29 },
>> --
>> 2.43.0
>>


