Return-Path: <linux-i2c+bounces-1097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCC823A59
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBCBBB22F30
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 01:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B701FB3;
	Thu,  4 Jan 2024 01:50:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFDE1FA4
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 01:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704333003-086e230f270fe10001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id tklqT5yywecrfy7w (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 09:50:03 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 09:50:02 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 09:50:01 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <1a19cd8d-9b1f-4952-9c6d-fb5b9b47e56b@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 09:49:59 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] i2c: wmt: adjust line length to meet style
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 3/8] i2c: wmt: adjust line length to meet style
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <c417d693bbdb3a4b804c1c3ba03e57bf4e8c33e1.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103165248.77h7uaguphbktebf@zenone.zhora.eu>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103165248.77h7uaguphbktebf@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1704333003
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1878
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118953
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/4 00:52, Andi Shyti wrote:
> Hi Hans,
>
> in case you are going to resend this series, you could think
> about these improvements.


Ok, will think about all of these


Hans


> On Fri, Dec 29, 2023 at 02:30:34PM +0800, Hans Hu wrote:
>> v4->v5:
>> 	add previous prototype 'static' for wmt_i2c_init().
> please, put the changelog at the end of the commit log.
>
> Where is the changelog from v1?
>
>> Tweaked a few formatting things:
>> rename wmt_i2c_dev to wmt_i2c, i2c_dev to i2c, etc.
> Please just list the renames, you are not doing formatting
> improvements here.
>
>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ...
>
>> -static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
>> +static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
>>   {
>>   	unsigned long timeout;
>> +	void __iomem *base = i2c->base;
> this change and similar below, are not listed in the commit log.
>
>>   
>>   	timeout = jiffies + WMT_I2C_TIMEOUT;
>> -	while (!(readw(i2c_dev->base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
>> +	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
>>   		if (time_after(jiffies, timeout)) {
>> -			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
>> +			dev_warn(i2c->dev,
>> +					"timeout waiting for bus ready\n");
> with /i2c_dev/i2c/ you don't need to break the line anymore (BTW,
> now 100 character lines are allowed, however not encouraged).
>
>>   			return -EBUSY;
>>   		}
>>   		msleep(20);
> ...
>
>> -	tcr_val |= (WMTI2C_TCR_MASTER_WRITE | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
>> +	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
>> +		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
> this change is not listed in the commit log and please, remember,
> the new 100 characters rule which makes these changes
> unnecessary).
>
> Andi

