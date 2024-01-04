Return-Path: <linux-i2c+bounces-1101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6B823AC0
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 03:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192392883D3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13D94C89;
	Thu,  4 Jan 2024 02:40:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80A4C7D
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704336024-1eb14e0c7d0ef10001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id 4sWTzUQRxKLG2lKu (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 10:40:24 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:40:24 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:40:23 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <36dce4b5-1e65-46aa-beaf-5eeb926cf514@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 10:40:20 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] i2c: add zhaoxin i2c controller driver
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 8/8] i2c: add zhaoxin i2c controller driver
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <a0e5f3ac6b344c5891367f5efe5edee80a7ce958.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103200201.wy6bzqgpoerngqt4@zenone.zhora.eu>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103200201.wy6bzqgpoerngqt4@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1704336024
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1400
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118954
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/4 04:02, Andi Shyti wrote:
> Hi Hans,
>
> [...]
>
>> --- a/drivers/i2c/busses/i2c-viai2c-common.c
>> +++ b/drivers/i2c/busses/i2c-viai2c-common.c
>> @@ -5,7 +5,7 @@
>>   #define VIAI2C_TIMEOUT			(msecs_to_jiffies(1000))
>>   #define VIAI2C_STRETCHING_TIMEOUT	200
>>   
>> -static int viai2c_wait_bus_ready(struct viai2c *i2c)
>> +int viai2c_wait_bus_ready(struct viai2c *i2c)
> no, please, choose the rigth prototype at the beginning, don't
> double change things in the same series.


ok, I will review my patch more carefully.


>>   {
>>   	unsigned long timeout;
>>   	void __iomem *base = i2c->base;
>> @@ -23,7 +23,7 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
>>   	return 0;
>>   }
>>   
>> -static int viai2c_wait_status(struct viai2c *i2c)
>> +int viai2c_wait_status(struct viai2c *i2c)
>>   {
>>   	int ret = 0;
>>   	unsigned long time_left;
>> @@ -71,6 +71,9 @@ static irqreturn_t viai2c_isr(int irq, void *data)
>>   
>>   	/* save the status and write-clear it */
>>   	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
>> +	if (!i2c->cmd_status)
>> +		return IRQ_NONE;
>> +
> is this change related to this patch? can you put this at the
> beginning?
>
> Andi


The original wmt driver does not have this, maybe I should use
'if (i2c->platform == VIAI2C_PLAT_ZHAOXIN &&! i2c->cmd_status)' instead?


Hans


