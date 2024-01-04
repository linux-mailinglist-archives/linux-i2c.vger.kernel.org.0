Return-Path: <linux-i2c+bounces-1100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A7823AA8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 03:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F0221C245F2
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D304C67;
	Thu,  4 Jan 2024 02:30:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F23D63
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704335423-1eb14e0c7f0ef60001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id KvKnXCfDkjhfGsbP (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 10:30:23 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:30:23 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:30:22 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <249630b9-e1d7-4f3a-b053-02edcc50bf42@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 10:30:19 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1704335423
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2704
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118954
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/4 03:39, Andi Shyti wrote:
> Hi Hans,
>
> [...]
>
>>   static int viai2c_wait_bus_ready(struct viai2c *i2c)
>>   {
>> @@ -25,12 +26,35 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
>>   static int viai2c_wait_status(struct viai2c *i2c)
>>   {
>>   	int ret = 0;
>> -	unsigned long wait_result;
>> +	unsigned long time_left;
>> +	unsigned long delta_ms;
>> +
>> +	time_left = wait_for_completion_timeout(&i2c->complete,
>> +						VIAI2C_TIMEOUT);
>> +	if (!time_left) {
>> +		dev_err(i2c->dev, "bus transfer timeout\n");
>> +		return -EIO;
>> +	}
>>   
>> -	wait_result = wait_for_completion_timeout(&i2c->complete,
>> -						msecs_to_jiffies(500));
>> -	if (!wait_result)
>> -		return -ETIMEDOUT;
> this change is unrelated. Why are you changing the timeout here
> from 500 to 1000?


it does unrelated, will drop it.


>> +	/*
>> +	 * During each byte access, the host performs clock stretching.
>> +	 * In this case, the thread may be interrupted by preemption,
>> +	 * resulting in a long stretching time.
>> +	 * However, some touchpad can only tolerate host clock stretching
>> +	 * of no more than 200 ms. We reduce the impact of this through
>> +	 * a retransmission mechanism.
>> +	 */
> is the hardware sending the stretching on its own?
>

Yes, controller will handle it.


>> +	local_irq_disable();
>> +	i2c->to = ktime_get();
>> +	delta_ms = ktime_to_ms(ktime_sub(i2c->to, i2c->ti));
>> +	if (delta_ms > VIAI2C_STRETCHING_TIMEOUT) {
>> +		local_irq_enable();
>> +		dev_warn(i2c->dev, "thread blocked more than %ldms\n",
>> +				delta_ms);
>> +		return -EAGAIN;
>> +	}
>> +	i2c->ti = i2c->to;
>> +	local_irq_enable();
>>   
>>   	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
>>   		ret = -EIO;
>> @@ -184,6 +208,7 @@ int viai2c_xfer(struct i2c_adapter *adap,
>>   	int ret = 0;
>>   	struct viai2c *i2c = i2c_get_adapdata(adap);
>>   
>> +	i2c->to = i2c->ti = ktime_get();
>>   	for (i = 0; ret >= 0 && i < num; i++) {
>>   		pmsg = &msgs[i];
>>   		if (!(pmsg->flags & I2C_M_NOSTART)) {
>> diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
>> index f171f81e4d0f..73a88398d763 100644
>> --- a/drivers/i2c/busses/i2c-viai2c-common.h
>> +++ b/drivers/i2c/busses/i2c-viai2c-common.h
>> @@ -58,6 +58,8 @@ struct viai2c {
>>   	u16			tcr;
>>   	int			irq;
>>   	u16			cmd_status;
>> +	ktime_t			ti;
>> +	ktime_t			to;
> don't these need some arbitration?
>
> Andi


I don't think it needs to be arbitration.
the controllers are independent of each other,
each access is locked using __i2c_lock_bus_helper().
Am I missing something?


Hans



