Return-Path: <linux-i2c+bounces-9274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00878A26467
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 21:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD91885432
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 20:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9220E01B;
	Mon,  3 Feb 2025 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iEac8gpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE34414
	for <linux-i2c@vger.kernel.org>; Mon,  3 Feb 2025 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614594; cv=none; b=P3HA0sxCJji8D4nqC+G0dsdEGOYLAVAyTIIP6bxjzYf52VsWHuE0qRY6l6FLSEhwgG20uqiF03mAcLtrF6QsRUQJrmzvbiGATfVi0NgwrNrlabCoWLTkuD4fWGqbxE9I6I4xZgNgInK+UhbeswjSk4Y0PvKGxFcZJPKfy6SkeLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614594; c=relaxed/simple;
	bh=kzgX1p1OnlOm69q7e3/YGsx0vHHqRPiA0zzlrmjcEsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCCTJMk74lNYWTcm04lM5ad1VDtUuSuJrVmK44AMIyOm2Uc4WDQ1EbUsC+hV5CTeVtCLNu2EbH+09ZX2B2/YDk1PMAiSpInYkunKmPsf7W+9pAaQ0/vrdDqNpAalz/+Equa28qWP/qbe/CIJpkMlqnUJ7KN7As8Jz9raGsr1KW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iEac8gpa; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513CWMHB027391;
	Mon, 3 Feb 2025 20:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vHHGmk
	2ZyRPCLUNnDWwR9+YcQFM7Vw39nj7kNg6z2e0=; b=iEac8gpaIoyt6vUBPn+hZI
	Uk6w8x03gcBM/zYHpxcbf5cL99DmFDYUeSzECgL/EhlHAiv5PPgilmu4WhZLs2VK
	pBrW3alIG0y4eB2kQJjamAETciplrEpeWhVD1P2koFXeYBmCPDwQ8g6/l9yxc4LM
	z4xbn4QuWSELNZwlIsMoDqOemjTl3F1ui+TVBkWDyP8/ub2fUKMo6ovVPo1nftSV
	RNIALNK0kVoGygTRDtN1ZJakRx0TWX8ts1vf+5bABXS+jkxSsPMC504D05hfBkt6
	jzwo62M2sFa3z3HZUZA8VDUXNWhpJsFgG9KZN/Ao7ws23DF2SMn807+h3Q/hYqww
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jkv953uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 20:29:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQPKF005258;
	Mon, 3 Feb 2025 20:29:29 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j05jqx77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 20:29:29 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 513KTToo1639006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 20:29:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 114A258053;
	Mon,  3 Feb 2025 20:29:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99DFA5805D;
	Mon,  3 Feb 2025 20:29:28 +0000 (GMT)
Received: from [9.61.155.52] (unknown [9.61.155.52])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Feb 2025 20:29:28 +0000 (GMT)
Message-ID: <e68a787b-f442-4509-bd3b-b407a6075130@linux.ibm.com>
Date: Mon, 3 Feb 2025 14:29:26 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: Nullify bus messages after timeout
To: Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, ryan_chen@aspeedtech.com,
        benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org
References: <20250131222941.798065-1-eajames@linux.ibm.com>
 <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tt03ERHPwl54gXJ5K0Etqp5HxDgC35Ya
X-Proofpoint-ORIG-GUID: Tt03ERHPwl54gXJ5K0Etqp5HxDgC35Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030148


On 2/2/25 21:31, Andrew Jeffery wrote:
> On Fri, 2025-01-31 at 16:29 -0600, Eddie James wrote:
>> For multimaster case, it's conceivable that an interrupt comes
>> in after the transfer times out and attempts to use bus messages
>> that have already been freed by the i2c core.
> This description seems a little vague. Did you hit this case in
> practice?


Yes. I no longer have the back trace but it's a null pointer access in 
the interrupt handler. We had a certain system that would hit this under 
certain conditions and this patch fixed it.


I can update the commit message with some more detail.


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c
>> b/drivers/i2c/busses/i2c-aspeed.c
>> index 1550d3d552aed..e344dcc2233fe 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct
>> i2c_adapter *adap,
>>                   * master command.
>>                   */
>>                  spin_lock_irqsave(&bus->lock, flags);
>> +               bus->msgs = NULL;
> It feels like there's buggy code elsewhere in the driver that this is
> protecting (broken state machine)? I've had a look at the
> aspeed_i2c_master_irq() implementation and can't see what though, as we
> take an early-exit (before indexing into bus->msgs) if bus-
>> master_state is INACTIVE or PENDING.
> Can you be a bit more specific about where the issue lies?


I'm sure the state machine isn't perfect, yea. The bad access can happen 
like this: if a transfer times out while waiting for an interrupt, the 
aspeed_i2c_master_xfer function will either reset the engine or recover 
the bus, and exit ETIMEDOUT. Resetting the engine will turn off 
interrupts, so we're safe. But recovering the bus doesn't turn off 
interrupts, so after the function exits ETIMEDOUT, I assume what happens 
is we get the interrupt for the previous transfer and try and access the 
messages pointer, which the i2c core has already freed.


Thanks for looking!

Eddie



>
> Andrew
>
>
>>                  if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>>                          bus->master_state =
>> ASPEED_I2C_MASTER_INACTIVE;
>>                  spin_unlock_irqrestore(&bus->lock, flags);

