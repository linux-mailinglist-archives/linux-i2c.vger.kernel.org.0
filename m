Return-Path: <linux-i2c+bounces-1096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65517823A51
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079F8288014
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 01:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED97184F;
	Thu,  4 Jan 2024 01:44:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DC1847
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704332663-1eb14e0c7c0edb0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id s0lTLPMFDH4VGVBR (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 09:44:23 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 09:44:23 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 09:44:23 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <f8d20925-281d-4aa0-b9ba-95fe9851b35b@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 09:44:20 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] i2c: wmt: create wmt_i2c_init for general init
To: Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v6 1/8] i2c: wmt: create wmt_i2c_init for general init
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <19a2be1aeb0d935b433d0b0eff0dabaeaaaa3de7.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103125618.pzp4wtvinz2et4zp@zenone.zhora.eu>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103125618.pzp4wtvinz2et4zp@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1704332663
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1492
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118952
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/3 20:56, Andi Shyti wrote:
> Hi Hans,
>
> On Fri, Dec 29, 2023 at 02:30:32PM +0800, Hans Hu wrote:
>> v4->v5:
>> 	add previous prototype 'static' for wmt_i2c_init().
>>
>> Some common initialization actions are put in the function
>> wmt_i2c_init(), which is convenient to share with zhaoxin.
>>
>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>> ---
>>   drivers/i2c/busses/i2c-wmt.c | 67 +++++++++++++++++++-----------------
>>   1 file changed, 36 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
>> index ec2a8da134e5..f1888f100d83 100644
>> --- a/drivers/i2c/busses/i2c-wmt.c
>> +++ b/drivers/i2c/busses/i2c-wmt.c
>> @@ -286,6 +286,38 @@ static irqreturn_t wmt_i2c_isr(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
> looks good, I would rather make this a
>
>     static struct wmt_i2c_dev *wmt_i2c_init(struct platform_device *pdev)
>     {
> 	struct wmt_i2c_dev *i2c_dev;
>     	...
> 	return i2c_dev;
>     }
>
> kind of function and call it as:
>
>     i2c_dev = wmt_i2c_init(...);
>     if (IS_ERR(i2c_dev))
>     	return ERR_PTR(i2c_dev);
>
> Not a binding comment. It just looks nicer; in that case I would
> call the function wmt_i2c_dev_alloc().


OK, will change it.


> In any case:
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Andi
>

