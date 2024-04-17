Return-Path: <linux-i2c+bounces-2997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 503408A854B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 15:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7B21B27EAB
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809AB14036D;
	Wed, 17 Apr 2024 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PrzHEOnH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9D139F;
	Wed, 17 Apr 2024 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713361845; cv=none; b=MFKSRIsC7cI8mJmzpxrUBDk2Jjy+ve8oLtAcpO2zdNPxN4n335qn7QnunnInFia7fWBEKkN9A4j1p4/BTXIwzvklCTr2Y888OpGNf2fAkMOCQQskcGGZRCAp01CkMywek0/i3f0i5y7OpjuNARtm1kzFN+OCQUzpY0lY40TE3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713361845; c=relaxed/simple;
	bh=7U4t8NbgtZTcO49HaTP+5cPne2unnwEZmITkIvAwtoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzIXL0ugsxbc1HxQMeraO0OHBfjxmOHyDqJbQP2NUzg2e+OJn7BYLlDtdR2/GFlTV6Q6az7UHKRCgwDnBT7VTNuVWs5DtpZkx7J+IPG3NZtsWCxHyvh4dDtgm6uyrBkN4PHvyZIzvgvLzH+oY4Eap00PAjr9vGqPrssv/1ARnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PrzHEOnH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HDi7xa005133;
	Wed, 17 Apr 2024 13:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5fzdOK7QxEyFmmo5BsA4cTduCSrhp2P9e6bDbDLl+0c=;
 b=PrzHEOnH4q9ZKAR5a/0tbMFWSbQ7UOTS4tSne5LjQgrfTx7LLv9PCJR+0xCkz1jQo7ur
 NCX/EqE8IFgNtQOEEhBUgO9KeMa5sD4x99jPAazboOVDfBn7mfhJmHhreNti4RM+ypaa
 BBXjgjBpthPq3Fop4brJLWv/adPVsNVsQyTMSNGpWHyXjG69RWBzw4QQmbzebcIzrcQc
 9+XHxUB1zgF5nMI+/1QmrWSE06li4OCes/U/VeAcC1t4tTiVghVlQX/4ET9u3nfLQ91Q
 nnclpXFAJ2H+YuXJaocEgEGAETZjZr3nbCL5kbwFf7FJU5+iO8BRF7fhfHt7rERYd2MJ Tw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjfjnr0ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 13:50:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43HCOJcP015506;
	Wed, 17 Apr 2024 13:50:19 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vmcn26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 13:50:19 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HDoGAk16319110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 13:50:18 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F9D25805C;
	Wed, 17 Apr 2024 13:50:16 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E72D58051;
	Wed, 17 Apr 2024 13:50:16 +0000 (GMT)
Received: from [9.61.157.174] (unknown [9.61.157.174])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 13:50:15 +0000 (GMT)
Message-ID: <c9b234e2-983f-4d24-a379-5d61ae9408cc@linux.ibm.com>
Date: Wed, 17 Apr 2024 08:50:15 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/31] i2c: fsi: Calculate clock divider from local bus
 frequency
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
        conor+dt@kernel.org, alistair@popple.id.au,
        linux-kernel@vger.kernel.org, lakshmiy@us.ibmcom,
        linux-i2c@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-fsi@lists.ozlabs.org, robh@kernel.org
References: <20240226165321.91976-1-eajames@linux.ibm.com>
 <20240226165321.91976-26-eajames@linux.ibm.com>
 <q6bl7sbskt4ukd3mylfgwpo6dmv444umdpycs6xp7ozd2kv335@syeymu62fczb>
 <2474f02c-c835-4691-b531-62c8c747aede@linux.ibm.com>
 <6e34260b-7d8e-4c86-9a11-6727f0c83a70@roeck-us.net>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <6e34260b-7d8e-4c86-9a11-6727f0c83a70@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8EzjMnlkNckKDJfGjEV1YwFu75fHNu57
X-Proofpoint-ORIG-GUID: 8EzjMnlkNckKDJfGjEV1YwFu75fHNu57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_10,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404170094


On 4/16/24 16:20, Guenter Roeck wrote:
> On Tue, Apr 16, 2024 at 01:09:04PM -0500, Eddie James wrote:
>> On 4/15/24 17:11, Andi Shyti wrote:
>>> Hi Eddie,
>>>
>>>> @@ -689,6 +692,20 @@ static int fsi_i2c_probe(struct device *dev)
>>>>    	mutex_init(&i2c->lock);
>>>>    	i2c->fsi = to_fsi_dev(dev);
>>>>    	INIT_LIST_HEAD(&i2c->ports);
>>>> +	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
>>>> +
>>>> +	lbus = fsi_device_local_bus_frequency(i2c->fsi);
>>>> +	if (lbus) {
>>>> +		u32 clock = I2C_DEFAULT_CLK_RATE;
>>> I don't see the need for initialization.
>>
>> Does device_property_read_u32 set clock if the property isn't found? If not,
>> it needs to be initialized here. Or I can set it in an else statement from
>> device_property_read_u32.
>>
>>
>>>> +
>>>> +		if (!device_property_read_u32(dev, "clock-frequency", &clock)) {
>>>> +			if (!clock)
>>>> +				clock = I2C_DEFAULT_CLK_RATE;
>>>> +		}
> 		if (device_property_read_u32(dev, "clock-frequency", &clock) || !clock)
> 			clock = I2C_DEFAULT_CLK_RATE;


Nice one, thanks.


>
>>>> +
>>>> +		// i2c clock rate = local bus clock / (4 * (i2c clock div + 1))
>>> You forgot to remove this.
>>
>> I actually meant to leave that comment to explain how the clock rate is
>> calculated, as the reverse calculation in the code is a little more
>> confusing.
>>
> Partially that is because you implemented DIV_ROUND_UP() manually.


Thanks Guenter, good point.


Eddie


>>> Andi
>>>
>>>> +		i2c->clock_div = (((lbus + (clock - 1)) / clock) / 4) - 1;
> 				= DIV_ROUND_UP(lbus, clock) / 4 - 1
>
> Guenter

