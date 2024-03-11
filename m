Return-Path: <linux-i2c+bounces-2319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C844877ADB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 07:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F881F213FD
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 06:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EF2C8E2;
	Mon, 11 Mar 2024 06:12:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9456D1C20
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710137529; cv=none; b=lucNEUphZtrMEpjdthJjn2Ri+TQ6qEKncwNBtmCC/Igf5uUmKi/MFbsmK19B0jQdFf9FWKOn+R1AnQ6NUEISD1dNlXRWKlb/3LAl+EMvlkV61xo9Y4/H1JSSMoNAoVcgIy2HJdpOCxYI+ZCBfJ+9X+fc0IPMx+6Iuek8Id07//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710137529; c=relaxed/simple;
	bh=Mg3DkAy8UIAgTDYAOKNsyvb/EqdcTZTNp1mgyvsVXqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mr2WFqbKzBYCrqVJLiZ4ZyEueqkCtYJ3xpCrruXmZCX+ol1TKVL7a9eW9UZYqrBbvvzv0/nMwBFwSKm6rp0iSmI+Ld6qV4A3S/uKJuwzwxYUE5RIkqsZS49LVcmeD8Goh/O+jabRNICCxpInHd/8gFSKopHZ3Rp1TWMzqBqDOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1710137512-086e23661807d20001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id 29YqB47EdE3wIukp (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 11 Mar 2024 14:11:52 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 14:11:50 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 14:11:47 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <36ec34ac-14b9-4dda-b39c-5544ce1dc372@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Mon, 11 Mar 2024 14:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
CC: <hanshu@zhaoxin.com>
References: <20240311032600.56244-1-hanshu-oc@zhaoxin.com>
 <20240311032600.56244-2-hanshu-oc@zhaoxin.com>
 <97503419-f6a9-4939-89ee-195ce21b5d1e@quicinc.com>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <97503419-f6a9-4939-89ee-195ce21b5d1e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1710137512
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1937
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -1.62
X-Barracuda-Spam-Status: No, SCORE=-1.62 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_SC0_SA085b
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121958
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.40 BSF_SC0_SA085b         Custom Rule SA085b

Hi Mukesh,


> On 3/11/2024 8:56 AM, Hans Hu wrote:
>> This is a bug that was accidentally introduced when
>> adjusting the wmt driver. Now fix it
>>
>
> what exactly is the bug which you are fixing here ?
>

This bug was introduced by myself in a recent commit,

id: 4b0c0569f03261aa4c10c8f5b24df6c1ca27f889

https://patchwork.ozlabs.org/project/linux-i2c/patch/20240306212413.1850236-5-andi.shyti@kernel.org/


The function viai2c_irq_xfer() is working in the interrupt context,

if it returns a non-0 value indicating that the current msg access

has ended, otherwise it has not ended.


For the access that msg->len is 0, when the interruption occurs,

it means that the access has ended, it should return 1;

Otherwise wait_for_completion_timeout() will timeout.


>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>> ---
>>   drivers/i2c/busses/i2c-viai2c-common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-viai2c-common.c 
>> b/drivers/i2c/busses/i2c-viai2c-common.c
>> index 4c208b3a509e..894d24c6b4d3 100644
>> --- a/drivers/i2c/busses/i2c-viai2c-common.c
>> +++ b/drivers/i2c/busses/i2c-viai2c-common.c
>> @@ -145,7 +145,7 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
>>               if (msg->len == 0) {
>>                       val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | 
>> VIAI2C_CR_ENABLE;
>>                       writew(val, base + VIAI2C_REG_CR);
>> -                     return 0;
>> +                     return 1;
> Question: Do you really need to do anything when no data is there to
> transfer ? I am not sure what's the strategy adopted here.


This is to be consistent with former i2c-wmt.c:
https://elixir.bootlin.com/linux/v6.8/source/drivers/i2c/busses/i2c-wmt.c#L175


Hans,

Thanks


