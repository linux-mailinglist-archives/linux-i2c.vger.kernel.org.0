Return-Path: <linux-i2c+bounces-8491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4162B9F11D7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656EF169E77
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 16:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9DB1E3DC4;
	Fri, 13 Dec 2024 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IFz2XB9K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08771E048B;
	Fri, 13 Dec 2024 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106409; cv=none; b=X8P70WlKNsQ9UQmIg5K3tzYb0IfbtiWTXzHjasnOew7qWxVHxuJBD5X3DcBtXcLg+6YcexebYt+3Qa1GIT+kc3Ndfdko02tgfEze+LqG8jgCGkLfWpr3S24CvSUh8mY6zZ6EC/o1gQQoO1CiBFHevojelZCmohO6tqqcyxPTpNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106409; c=relaxed/simple;
	bh=2aNxWGP9RBFyIZ2SBnAC7/aLNToELCNdvkqgTxTvl3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gSX261I6JsjkiD3cwjVyB+eyt4PvL1fs7gTbhQaRTDXMOYAfQtKr/o8UZD1sTam9Y7vLWhAt/aI8el+vQClunw16NZ10kvxrOJpzXj+P2jux92hTlRioRCd9GWoh35dT4bx3p5gMRrQa1DHQU3vX58UGSeaSRD14OHONo4U5n3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IFz2XB9K; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEIuv6015637;
	Fri, 13 Dec 2024 16:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PW1LH2
	F8Qxvgif3YU5Y3z1CGnrmFPIED3xPs36aiFdc=; b=IFz2XB9KxBQc8Ujd8Xiybl
	y8j268CsM6r8SqPK89Jql5bAhJZxtMSNtBiguZWzNpe3UOGr2OUCtFDu6cgcLzWx
	J90QX0C2oAH2PnsSFLjsC59qkkvX4dKReP8JOI639+rpZ686znUFKOiXcbl933rS
	rHjBO3icTzSSwF6ZdzL+iNxVmbGov+xLbe37GDK6jfliaLszFkZ0bz4bcWGbFmOj
	+2pGrlEelsjg9HOKuGahLSwcYDucIr8Nl1wq776HawnE5yRb0Bl8f12LxTLDBRJE
	6F40wT06m46cbatgGlY1uIb1kdsg+uNe7E6ciLDo7alYl3EyOtb3tp1xIw/uu2XQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43gh43a73g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:49 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BDGCmio015273;
	Fri, 13 Dec 2024 16:12:48 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43gh43a73d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDFWlBq032734;
	Fri, 13 Dec 2024 16:12:47 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0psxx0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:47 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BDGCkHw53936584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:12:46 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC53158058;
	Fri, 13 Dec 2024 16:12:45 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F91458059;
	Fri, 13 Dec 2024 16:12:42 +0000 (GMT)
Received: from [9.61.68.160] (unknown [9.61.68.160])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Dec 2024 16:12:42 +0000 (GMT)
Message-ID: <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Date: Fri, 13 Dec 2024 10:12:41 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Guenter Roeck <linux@roeck-us.net>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        ninad@linux.ibm.com
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
 <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NzpH0gdcpRWbYIcxxx5eotGsIgESifCn
X-Proofpoint-GUID: OxreHfqoC1Ht6a91pdGiYTk7dSHkFhRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=718 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130113

Hello Guenter,

On 12/12/24 16:06, Guenter Roeck wrote:
> On 12/12/24 13:49, Ninad Palsule wrote:
>> Adding label files for fan and temperature sensors in the power supply.
>> The openbmc application dbus-sensor(psusensor) requires those files to
>> consfigure those sensors.
>> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
>> as dbus-sensor(psusensor) application calculate index based on last
>> digit in the name so we do not want to make index double digit after
>> appending page index.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>
> We are not going to fix userspace problems in the kernel.
>
> Guenter
>

Thanks for the quick review.

Sorry I am not clear on this. I feel that it is better to support labels 
for temperature

sensors and fans like other. Are you saying we should not support these 
labels or

I need update in the patch to support them better?

Please let me know.

Thanks & Regards,

Ninad Palsule



