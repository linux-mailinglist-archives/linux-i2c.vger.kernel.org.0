Return-Path: <linux-i2c+bounces-8555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800649F3D7B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 23:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D771691F0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 22:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2211D63F0;
	Mon, 16 Dec 2024 22:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P1U0+WWf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8B1D63D0;
	Mon, 16 Dec 2024 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388141; cv=none; b=lVzvI00lOjQdbrJdPlNg1Q+xL2vC1zqeDBzid5uwM4fLF5HtM8xUktzt2cH9H1yYC0jUy8iAeeiOtNXqd1r3pOrhcyUuTBaWrFrgQxlm6W6kpTe0ZEfqcDLP/vIrgkkTzw3tmxLX3nLUVj6no6pSjqNadLXYb3FbArNLw5u3amg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388141; c=relaxed/simple;
	bh=eoGW4rYwbaZ/2M4LrMHKJQyWKn4iJ3is+QY0McqNHsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SI3Ul/dWsJCGmDuVi0CXr1F1cAFUmmCj8u+HeHehcTBNAfy/0MrkzpBS1ovWAJn08Zny+hGnlksPKC0GSTc/cnHCUK3G+DGBX+NlWT9vvj5QUNMNpwVNjaBzgfdvr3ZoiJ/XcU9sNzM6sZtIv9mU2PBF78IrRYbT4/GX22K6wlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P1U0+WWf; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKksXh020555;
	Mon, 16 Dec 2024 22:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jcj1Ps
	OJ7ipuwbemWQTh7kw6w3cBtHTDi0TGzxH0yUQ=; b=P1U0+WWfiZWiZWG3tFCOmf
	OGbLABgMlNl5MRg23nL+4vRrM8e0isnb3xYXjMv/zCcvgsH2819umwEYZSn0w2HS
	v98q/rb02Zx+fgasjG166/kP7LZLBAin1sucQO06HI/imbHKTR1evSx4APEw3ytI
	2VL1KlXCjvq9nB9kv2+B/uXBjfjiUegWNuHvZN8fZQ7hV+lzHYXUkYE57bDBZtF6
	IFSG2Fyas1DpM5R0GERX0jyw1KpkRyPgG9yw0OQKXc6Af6rVvQeAGob1xB4qOOTc
	ujQ5dGUP2/ok/obrczlYm+OJhQE6ZlycU8GjmccgRS7hxQR0CdxqwpDHXXLi1jag
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j8xanf4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:28:23 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGMPNMO017656;
	Mon, 16 Dec 2024 22:28:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j8xanf4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:28:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGI6B6R024022;
	Mon, 16 Dec 2024 22:28:22 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnuk7xdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:28:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGMSLMl44368558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:28:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 516D85805E;
	Mon, 16 Dec 2024 22:28:21 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 099265805A;
	Mon, 16 Dec 2024 22:28:19 +0000 (GMT)
Received: from [9.61.165.36] (unknown [9.61.165.36])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 22:28:18 +0000 (GMT)
Message-ID: <ff077ea7-80dd-4cdf-8c08-f2eb7104f213@linux.ibm.com>
Date: Mon, 16 Dec 2024 16:28:18 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
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
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <20241216175044.4144442-4-ninad@linux.ibm.com>
 <a010366e-b911-43bd-8445-e893e11fa51a@roeck-us.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <a010366e-b911-43bd-8445-e893e11fa51a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q_maQMCl2FphVcf93vPs1YdNBNN9Qq6s
X-Proofpoint-ORIG-GUID: oelKxqLF5j-DBXP5kL4ownZBFq4ejKiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160181

Hi Guenter,

Thanks for the review.

On 12/16/24 12:47, Guenter Roeck wrote:
> On 12/16/24 09:50, Ninad Palsule wrote:
>> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
>> trivial. It is trivial because only compatibility string is required in
>> the device tree to load this driver.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>
> Krzysztof had Acked this patch. I don't immediately see why you 
> dropped it.
> Am I missing something ?
>
> Guenter
>
I think that was my mistake. Adding it in version 3.


>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml 
>> b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index 73a49d50c4ef..7d07b08b1459 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -151,6 +151,8 @@ properties:
>>             - injoinic,ip5306
>>               # Inspur Power System power supply unit version 1
>>             - inspur,ipsps1
>> +            # Intel common redudant power supply crps185
>> +          - intel,crps185
>>               # Intersil ISL29028 Ambient Light and Proximity Sensor
>>             - isil,isl29028
>>               # Intersil ISL29030 Ambient Light and Proximity Sensor
>
>

