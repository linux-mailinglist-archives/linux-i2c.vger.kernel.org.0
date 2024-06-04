Return-Path: <linux-i2c+bounces-3800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D21278FBCEB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 22:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B242B2513F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 20:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695D14B940;
	Tue,  4 Jun 2024 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="XOxU5kk9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx14lb.world4you.com (mx14lb.world4you.com [81.19.149.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAC2F25
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717531369; cv=none; b=L8adGk9nVEWOJ5heMyWzAtNBaJ3j9u0ZmhFeXxCJHagbUL9dPem208liypQSQio/MbfFthk4DzQ7YGfmYzon9N0HuMp/AiFXbAi6YR/3kOlCcpkhHAMxZu8l36tBB3oU3ZKp6Lx8xQuFaWh98WRaFBmSEnyKw6ONsZnXLYEkWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717531369; c=relaxed/simple;
	bh=bdxwLyrRMLQ+CvdEGRVuVD7Iz78Oq0cy2POaEGKl2l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFOnJKJ19aADHVcRpprdjlMPjmaHFPnHnrmovIQ/nkC+Mr7SIah+N/ywfaDk92VM5xgQzjI2JSrUZW2t3I9q8gbaMXSpwHEC56ahOAPlqWHuI6Q3O1KW1/vqJXWDw+dQJZAIbRrO+WKcmjq/X0B4yLtPv4n1FbJzKUF7epuuJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=XOxU5kk9; arc=none smtp.client-ip=81.19.149.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7H1fesgwXMgO7rJ2z2NxquH6QShflLB2sK2MSwTA4/U=; b=XOxU5kk9lovvEm98M1AxaZXFY2
	zVR3PynfQvWH23IPtEBZYgFrfR9CCxwZVp86K6rz01t9L4UHRX3mJQa7ezjBJNRrwjNvCM5GCXH0d
	ZO8YkNUGqChOfumWvodAPRxBAlU5NVSAqiVBEiISonnp2zBIasGdEz6es9cc5l50GKuI=;
Received: from [88.117.63.44] (helo=[10.0.0.160])
	by mx14lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sEZU4-0000mG-2o;
	Tue, 04 Jun 2024 21:06:13 +0200
Message-ID: <5c656faf-be5c-46b2-9d00-46fa8e002990@engleder-embedded.com>
Date: Tue, 4 Jun 2024 21:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Gerhard Engleder <eg@keba.com>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
 <20240601192846.68146-2-gerhard@engleder-embedded.com>
 <oo2eydydqmtysgzwzfee5p4oxncy66b2wwnuio53asubqm7wbo@ur2q2n7groll>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <oo2eydydqmtysgzwzfee5p4oxncy66b2wwnuio53asubqm7wbo@ur2q2n7groll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 04.06.24 00:37, Andi Shyti wrote:
> Hi Gerhard,

Hello Andi

> On Sat, Jun 01, 2024 at 09:28:45PM +0200, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA I2C controller is found in the system FPGA of KEBA PLC devices.
>> It is used to connect EEPROMs and hardware monitoring chips.
> 
> can you please add more information about the device, please?

I will add more information

>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) KEBA AG 2012
> 
> can we update the date here?

First driver version is from 2012. I will remove that line.

>> + * Copyright (C) KEBA Industrial Automation Gmbh 2024
>> + *
>> + * Driver for KEBA I2C controller FPGA IP core
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/i2c.h>
>> +#include <linux/platform_data/i2c-keba.h>
> 
> Can you sort them in alphabetical order, please?

Will be done.

>> +#define KI2C "i2c-keba"
>> +
>> +#define KI2C_CAPABILITY_REG	0x02
>> +#define KI2C_CONTROL_REG	0x04
>> +#define KI2C_CONTROL_DC_REG	0x05
>> +#define KI2C_STATUS_REG		0x08
>> +#define KI2C_STATUS_DC_REG	0x09
>> +#define KI2C_DATA_REG		0x0c
>> +
>> +#define KI2C_CAPABILITY_CRYPTO	0x01
> 
> This crypto is not used anywhere, did you add it for completness
> or have you forgotten to use it?

It is there for completeness/documentation.

>> +#define KI2C_CAPABILITY_DC	0x02
>> +
>> +#define KI2C_CONTROL_MEN	0x01
>> +#define KI2C_CONTROL_MSTA	0x02
>> +#define KI2C_CONTROL_RSTA	0x04
>> +#define KI2C_CONTROL_MTX	0x08
>> +#define KI2C_CONTROL_TXAK	0x10
>> +
>> +#define KI2C_STATUS_IN_USE	0x01
>> +#define KI2C_STATUS_ACK_CYC	0x02
>> +#define KI2C_STATUS_RXAK	0x04
>> +#define KI2C_STATUS_MCF		0x08
>> +
>> +#define KI2C_DC_SDA		0x01
>> +#define KI2C_DC_SCL		0x02
> 
> You could eventually make it as:
> 
> #define REG1_ADDR	0xXX
> #define   REG1_VAL_1	0xXX
> #define   REG1_VAL_2	0xXX
> #define   REG1_VAL_3	0xXX
> 
> #define REG2_ADDR	0xXX
> #define   REG2_VAL_1	0xXX
> #define   REG2_VAL_2	0xXX
> #define   REG2_VAL_3	0xXX
> 
> So that it's clear what belongs to what. Not a binding comment,
> just an aesthetic note.

I will give it a try.

>> +
>> +#define KI2C_INUSE_SLEEP_US	(2 * USEC_PER_MSEC)
>> +#define KI2C_INUSE_TIMEOUT_US	(10 * USEC_PER_SEC)
>> +
>> +#define KI2C_POLL_DELAY_US	5
>> +
>> +struct ki2c {
>> +	struct platform_device *pdev;
>> +	void __iomem *base;
>> +	struct i2c_adapter adapter;
>> +
>> +	struct i2c_client **client;
>> +	int client_size;
>> +};
>> +
>> +static int ki2c_inuse_lock(struct ki2c *ki2c)
>> +{
>> +	u8 sts;
>> +	int ret;
>> +
>> +	/* The I2C controller has an IN_USE bit for locking access to the
>> +	 * controller. This enables the use of I2C controller by other none
>> +	 * Linux processors.
> 
> Please use the proper commenting style:
> 
> 	/*
> 	 * Comment line 1
First driver version is from 2012. I will
> 	 * Comment line 2
> 	 * ...
> 	 * Comment line N
> 	 */
>

Sorry, I forgot that only net is using that style. Will be changed for
all comments.

>> +	 *
>> +	 * If the I2C controller is free, then the first read returns
>> +	 * IN_USE == 0. After that the I2C controller is locked and further
>> +	 * reads of IN_USE return 1.
>> +	 *
>> +	 * The I2C controller is unlocked by writing 1 into IN_USE.
>> +	 */
> 
> Basically this is a semaphore.

I will enhance the comment.

>> +	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
>> +				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
>> +				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);
> 
> we are waiting too long here... the documentaition recommends to
> use the readb_poll_timeout for less than 10us, while we are
> waiting 2ms.

I will check if it can be changed. Should be possible.

>> +	if (ret != 0)
>> +		dev_warn(&ki2c->pdev->dev, "%s err!\n", __func__);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ki2c_inuse_unlock(struct ki2c *ki2c)
>> +{
>> +	/* unlock the controller by writing 1 into IN_USE */
>> +	iowrite8(KI2C_STATUS_IN_USE, ki2c->base + KI2C_STATUS_REG);
>> +}
>> +
>> +static int ki2c_wait_for_bit(u8 mask, void __iomem *addr, unsigned long timeout)
> 
> It looks more natural to have "addr" as a first argument.

I will reorder.

>> +{
>> +	u8 val;
>> +
>> +	return readb_poll_timeout(addr, val, (val & mask), KI2C_POLL_DELAY_US,
>> +				  jiffies_to_usecs(timeout));
>> +}
>> +static int ki2c_get_sda(struct ki2c *ki2c)
>> +{
>> +	/* capability KI2C_CAPABILITY_DC required */
>> +	return (ioread8(ki2c->base + KI2C_STATUS_DC_REG) & KI2C_DC_SDA) != 0;
> 
> Please avoid using such compact style.

Will make it more readable.

>> +}
>> +	/* generate clock cycles */
>> +	ki2c_set_scl(ki2c, val);
>> +	ndelay(KI2C_RECOVERY_NDELAY);
>> +	while (count++ < KI2C_RECOVERY_CLK_CNT * 2) {
>> +		if (val) {
>> +			/* SCL shouldn't be low here */
>> +			if (!ki2c_get_scl(ki2c)) {
>> +				dev_err(&ki2c->pdev->dev,
>> +					"SCL is stuck low!\n");
>> +				ret = -EBUSY;
>> +				break;
>> +			}
>> +
>> +			/* break if SDA is high */
>> +			if (ki2c_get_sda(ki2c))
>> +				break;
>> +		}
>> +
>> +		val = !val;
>> +		ki2c_set_scl(ki2c, val);
>> +		ndelay(KI2C_RECOVERY_NDELAY);
> 
> I don't know how much sense it makes to wait in ndelays, this is
> not going to be precise and... are we sure we want to wait
> atomically here?

So far there were no problems so it should be precise enough. Delay
is only 5us so sleeping is not necessary. This is done during startup,
sleeping would delay startup.

>> +	}
>> +
>> +	if (!ki2c_get_sda(ki2c)) {
>> +		dev_err(&ki2c->pdev->dev, "SDA is still low!\n");
> 
> To me this and the above dev_err's are just spamming the dmesg as
> we are already printing up in the probe function. If we want to
> have more precision printing, then we need to chose where the
> dev_err's need to be.

I will improve the error reporting.

>> +		ret = -EBUSY;
>> +	}
>> +
>> +	/* reenable controller */
>> +	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
> 
> ...
> 
>> +	ret = ki2c_wait_for_data_ack(ki2c);
>> +	if (ret < 0)
>> +		/* For EEPROMs this is normal behavior during internal write
>> +		 * operation.
> 
> Please, mind the coding style.

I will do.

>> +		 */
>> +		dev_dbg(&ki2c->pdev->dev, "%s wait for ACK err at 0x%02x!\n",
>> +			__func__, m->addr);
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +static int ki2c_probe(struct platform_device *pdev)
>> +{
>> +	struct i2c_keba_platform_data *pdata;
>> +	struct device *dev = &pdev->dev;
>> +	struct i2c_adapter *adap;
>> +	struct resource *io;
>> +	struct ki2c *ki2c;
>> +	int ret;
>> +
>> +	pdata = dev->platform_data;
>> +	if (pdata == 0) {
>> +		dev_err(dev, "Platform data not found!\n");
>> +		return -ENODEV;
> 
> please use dev_err_probe()

This function is new to me. I will check.


Thank you for your review!

Gerhard

