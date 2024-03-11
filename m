Return-Path: <linux-i2c+bounces-2321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A67877B0B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 07:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 643121F21009
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 06:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3FDFBF2;
	Mon, 11 Mar 2024 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gTyVsjsZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1CF9CC
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139641; cv=none; b=htYXrUbGYpoNjwIsSkFougoCBCZlC9lKG6ptsL6v4wowPOobWmLvAUI2HnDwLsu754sgP67+uX78eE4Q9FOcx+KgRY+XEKQjHJ6S/1vyQN7uQ6/vlFhtutK82FAqn/bW2/X0rQBwgljAB/ejmAPr0x+D+NOejK1eoPw/fcBiK2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139641; c=relaxed/simple;
	bh=Tq05/rijRFkBDe0DCBHavR3unH6AqBe42bbhnXJ1qgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jzUdwjhFbXfRSwazDIkxNrBrR1ZQmoOm9cl46JJyPpHhEoHHVI41q5MludhigD+yWs4mRh62s+AjL0GcvDcgcyi8+6N4tmgWQAstG8rYY2ZsTs1j2n60FFP1I5V5Si2nblwiwl7MFfKIcL/HQ7aAVnKe9EBKMLsSkYrOR72LL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gTyVsjsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B5CZtd008566;
	Mon, 11 Mar 2024 06:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PnwMpNsuf0L3SyID9VZjkA1l3K34lnd9UOjBXAr3vZQ=; b=gT
	yVsjsZGxQRyCqM6jqC7ssg7sAPzWYsE7clxM0F5sEClrY547EQmo4WDg+zTBKSrT
	3k2YdGClDNXGCShiZ2p8hJRV/7lUw4OBW4TQ5fzIxYKiWLQmjfZz6eio4hOoBKTU
	v/qitIq4pFw8VDd/sCeSobKsHBHXjFlsCERxgInDyUaJOgdHgKfMO/u6T3Dvjj3q
	3SZol6PubanQ8uXJLRMMq2ErrfrLcSfsiCAQf1NW5zQMt5or1VwRW2lmr7Oktm54
	7DdZJoc4PKsxFCyZ4U16DYO5ILbmBpwVFb9NjGP40pfWAOquz6T4V25hMZc2b6D5
	1gk6liYcz6JVNtuj3vHg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wssyg09kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 06:47:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42B6l4nb028356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 06:47:04 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 10 Mar
 2024 23:47:02 -0700
Message-ID: <9469a44f-dc2d-475f-ac6c-199e8c4594dd@quicinc.com>
Date: Mon, 11 Mar 2024 12:16:58 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
Content-Language: en-US
To: Hans Hu <HansHu-oc@zhaoxin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
CC: <hanshu@zhaoxin.com>
References: <20240311032600.56244-1-hanshu-oc@zhaoxin.com>
 <20240311032600.56244-2-hanshu-oc@zhaoxin.com>
 <97503419-f6a9-4939-89ee-195ce21b5d1e@quicinc.com>
 <36ec34ac-14b9-4dda-b39c-5544ce1dc372@zhaoxin.com>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <36ec34ac-14b9-4dda-b39c-5544ce1dc372@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rn_AQDHXHlKwHE3bZ4qvJGlSjO9KIQNb
X-Proofpoint-GUID: Rn_AQDHXHlKwHE3bZ4qvJGlSjO9KIQNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_03,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403110050

Hi Hans,

On 3/11/2024 11:41 AM, Hans Hu wrote:
> Hi Mukesh,
> 
> 
>> On 3/11/2024 8:56 AM, Hans Hu wrote:
>>> This is a bug that was accidentally introduced when
>>> adjusting the wmt driver. Now fix it
>>>
>>
>> what exactly is the bug which you are fixing here ?
>>
> 
> This bug was introduced by myself in a recent commit,
> 
> id: 4b0c0569f03261aa4c10c8f5b24df6c1ca27f889
> 
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20240306212413.1850236-5-andi.shyti@kernel.org/
> 
> 
> The function viai2c_irq_xfer() is working in the interrupt context,
> 
> if it returns a non-0 value indicating that the current msg access
> 
> has ended, otherwise it has not ended.
Should be otherway around ? zero indicates success as per general 
practices.

Also i think accordingly your commit log should have the explanation.

> 
> For the access that msg->len is 0, when the interruption occurs,
> 
> it means that the access has ended, it should return 1;
> 
> Otherwise wait_for_completion_timeout() will timeout.
> 
> 
IIUC, msg->len = 0 it indicates your transfer is completed and then you
want to return 1 indicating current message transfer is successful ?
Please ammend the logs reflecting the scenario to match with the code 
changes.

I would be more clear if commit log explains what you are doing.

>>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>>> ---
>>>   drivers/i2c/busses/i2c-viai2c-common.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-viai2c-common.c 
>>> b/drivers/i2c/busses/i2c-viai2c-common.c
>>> index 4c208b3a509e..894d24c6b4d3 100644
>>> --- a/drivers/i2c/busses/i2c-viai2c-common.c
>>> +++ b/drivers/i2c/busses/i2c-viai2c-common.c
>>> @@ -145,7 +145,7 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
>>>               if (msg->len == 0) {
>>>                       val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | 
>>> VIAI2C_CR_ENABLE;
>>>                       writew(val, base + VIAI2C_REG_CR);
>>> -                     return 0;
>>> +                     return 1;
>> Question: Do you really need to do anything when no data is there to
>> transfer ? I am not sure what's the strategy adopted here.
> 
> 
> This is to be consistent with former i2c-wmt.c:
> https://elixir.bootlin.com/linux/v6.8/source/drivers/i2c/busses/i2c-wmt.c#L175
> 
> 
> Hans,
> 
> Thanks
> 

