Return-Path: <linux-i2c+bounces-3758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 970358FA59F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 00:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D6A28124E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 22:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A44713CF8D;
	Mon,  3 Jun 2024 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYSFb3Wl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9213CF86
	for <linux-i2c@vger.kernel.org>; Mon,  3 Jun 2024 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717454277; cv=none; b=H3cuvY33/8vNsgGaSYaBsebw0L2SVQfNqYGm77zH8nmiDwVnTHhcFCEfLWZU8wHUK5O8I0J5euI3gW9rDshGs2PqVG9zKc2Ii9STVEsWKd8XyzMtvmB9xW9u+qLjCjyOPlXmDp1HHJpDJ4+4DBMQBJr87StKeStRpTOUH0iTEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717454277; c=relaxed/simple;
	bh=0unIfdC3CWRO5ktvOnlmVh+rSbr4rDUITA8UI1ivBR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mztp2zDD8bD7mp0XFri8Sv/OvqmZ+ohYEUFUrX5UtUtSpaCVsMeTDHEqURmQKF0TKT7amAj7hIGnyIEP0U2QFjMcvojdQLVhglCInc8fe8ZBVU1YqYGMiNyl/BSfvw7xYzRIqY74ct2hB+5elwHECQ7pOUHP1y3VSzKFCwhWW1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYSFb3Wl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA60C4AF08;
	Mon,  3 Jun 2024 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717454276;
	bh=0unIfdC3CWRO5ktvOnlmVh+rSbr4rDUITA8UI1ivBR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYSFb3WlxboFT8K1mZAxkCix8/k1ybKgAS0gXZ7jsSX3y7ocPeKjwsbSKAT+WmfMF
	 AnmS9aAB+XG9FvIGJJr6HEXC4oYoWWi8j7DAv63PgRbc7LgleYdr0QBhp8Z+wS4MTQ
	 AGBh6b/RVdWxL2H/6dUxI/eTA3k9tiHh4GNefk6GYzBMvevAK02uuEXn8jJYxCPkb2
	 yykA9Lyx8dIqgy4aWrxG/AF2w9BEZmVzW5j44XI58Hgr/da8UTx80NNYd/Wv4G2qxE
	 RnOxnaHJVN3zYqO+EtcRoC2+GdryRYNcnc6M70Vr+lTU6YnANRut2GL9cFVQIGJYlK
	 KA/YG+9R9XrMA==
Date: Mon, 3 Jun 2024 23:37:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <oo2eydydqmtysgzwzfee5p4oxncy66b2wwnuio53asubqm7wbo@ur2q2n7groll>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
 <20240601192846.68146-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-2-gerhard@engleder-embedded.com>

Hi Gerhard,

On Sat, Jun 01, 2024 at 09:28:45PM +0200, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA I2C controller is found in the system FPGA of KEBA PLC devices.
> It is used to connect EEPROMs and hardware monitoring chips.

can you please add more information about the device, please?

...

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) KEBA AG 2012

can we update the date here?

> + * Copyright (C) KEBA Industrial Automation Gmbh 2024
> + *
> + * Driver for KEBA I2C controller FPGA IP core
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_data/i2c-keba.h>

Can you sort them in alphabetical order, please?

> +#define KI2C "i2c-keba"
> +
> +#define KI2C_CAPABILITY_REG	0x02
> +#define KI2C_CONTROL_REG	0x04
> +#define KI2C_CONTROL_DC_REG	0x05
> +#define KI2C_STATUS_REG		0x08
> +#define KI2C_STATUS_DC_REG	0x09
> +#define KI2C_DATA_REG		0x0c
> +
> +#define KI2C_CAPABILITY_CRYPTO	0x01

This crypto is not used anywhere, did you add it for completness
or have you forgotten to use it?

> +#define KI2C_CAPABILITY_DC	0x02
> +
> +#define KI2C_CONTROL_MEN	0x01
> +#define KI2C_CONTROL_MSTA	0x02
> +#define KI2C_CONTROL_RSTA	0x04
> +#define KI2C_CONTROL_MTX	0x08
> +#define KI2C_CONTROL_TXAK	0x10
> +
> +#define KI2C_STATUS_IN_USE	0x01
> +#define KI2C_STATUS_ACK_CYC	0x02
> +#define KI2C_STATUS_RXAK	0x04
> +#define KI2C_STATUS_MCF		0x08
> +
> +#define KI2C_DC_SDA		0x01
> +#define KI2C_DC_SCL		0x02

You could eventually make it as:

#define REG1_ADDR	0xXX
#define   REG1_VAL_1	0xXX
#define   REG1_VAL_2	0xXX
#define   REG1_VAL_3	0xXX

#define REG2_ADDR	0xXX
#define   REG2_VAL_1	0xXX
#define   REG2_VAL_2	0xXX
#define   REG2_VAL_3	0xXX

So that it's clear what belongs to what. Not a binding comment,
just an aesthetic note.

> +
> +#define KI2C_INUSE_SLEEP_US	(2 * USEC_PER_MSEC)
> +#define KI2C_INUSE_TIMEOUT_US	(10 * USEC_PER_SEC)
> +
> +#define KI2C_POLL_DELAY_US	5
> +
> +struct ki2c {
> +	struct platform_device *pdev;
> +	void __iomem *base;
> +	struct i2c_adapter adapter;
> +
> +	struct i2c_client **client;
> +	int client_size;
> +};
> +
> +static int ki2c_inuse_lock(struct ki2c *ki2c)
> +{
> +	u8 sts;
> +	int ret;
> +
> +	/* The I2C controller has an IN_USE bit for locking access to the
> +	 * controller. This enables the use of I2C controller by other none
> +	 * Linux processors.

Please use the proper commenting style:

	/*
	 * Comment line 1
	 * Comment line 2
	 * ...
	 * Comment line N
	 */

> +	 *
> +	 * If the I2C controller is free, then the first read returns
> +	 * IN_USE == 0. After that the I2C controller is locked and further
> +	 * reads of IN_USE return 1.
> +	 *
> +	 * The I2C controller is unlocked by writing 1 into IN_USE.
> +	 */

Basically this is a semaphore.

> +	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
> +				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
> +				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);

we are waiting too long here... the documentaition recommends to
use the readb_poll_timeout for less than 10us, while we are
waiting 2ms.

> +	if (ret != 0)
> +		dev_warn(&ki2c->pdev->dev, "%s err!\n", __func__);
> +
> +	return ret;
> +}
> +
> +static void ki2c_inuse_unlock(struct ki2c *ki2c)
> +{
> +	/* unlock the controller by writing 1 into IN_USE */
> +	iowrite8(KI2C_STATUS_IN_USE, ki2c->base + KI2C_STATUS_REG);
> +}
> +
> +static int ki2c_wait_for_bit(u8 mask, void __iomem *addr, unsigned long timeout)

It looks more natural to have "addr" as a first argument.

> +{
> +	u8 val;
> +
> +	return readb_poll_timeout(addr, val, (val & mask), KI2C_POLL_DELAY_US,
> +				  jiffies_to_usecs(timeout));
> +}
> +static int ki2c_get_sda(struct ki2c *ki2c)
> +{
> +	/* capability KI2C_CAPABILITY_DC required */
> +	return (ioread8(ki2c->base + KI2C_STATUS_DC_REG) & KI2C_DC_SDA) != 0;

Please avoid using such compact style.

> +}
> +	/* generate clock cycles */
> +	ki2c_set_scl(ki2c, val);
> +	ndelay(KI2C_RECOVERY_NDELAY);
> +	while (count++ < KI2C_RECOVERY_CLK_CNT * 2) {
> +		if (val) {
> +			/* SCL shouldn't be low here */
> +			if (!ki2c_get_scl(ki2c)) {
> +				dev_err(&ki2c->pdev->dev,
> +					"SCL is stuck low!\n");
> +				ret = -EBUSY;
> +				break;
> +			}
> +
> +			/* break if SDA is high */
> +			if (ki2c_get_sda(ki2c))
> +				break;
> +		}
> +
> +		val = !val;
> +		ki2c_set_scl(ki2c, val);
> +		ndelay(KI2C_RECOVERY_NDELAY);

I don't know how much sense it makes to wait in ndelays, this is
not going to be precise and... are we sure we want to wait
atomically here?

> +	}
> +
> +	if (!ki2c_get_sda(ki2c)) {
> +		dev_err(&ki2c->pdev->dev, "SDA is still low!\n");

To me this and the above dev_err's are just spamming the dmesg as
we are already printing up in the probe function. If we want to
have more precision printing, then we need to chose where the
dev_err's need to be.

> +		ret = -EBUSY;
> +	}
> +
> +	/* reenable controller */
> +	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);

...

> +	ret = ki2c_wait_for_data_ack(ki2c);
> +	if (ret < 0)
> +		/* For EEPROMs this is normal behavior during internal write
> +		 * operation.

Please, mind the coding style.

> +		 */
> +		dev_dbg(&ki2c->pdev->dev, "%s wait for ACK err at 0x%02x!\n",
> +			__func__, m->addr);
> +
> +	return ret;
> +}

...

> +static int ki2c_probe(struct platform_device *pdev)
> +{
> +	struct i2c_keba_platform_data *pdata;
> +	struct device *dev = &pdev->dev;
> +	struct i2c_adapter *adap;
> +	struct resource *io;
> +	struct ki2c *ki2c;
> +	int ret;
> +
> +	pdata = dev->platform_data;
> +	if (pdata == 0) {
> +		dev_err(dev, "Platform data not found!\n");
> +		return -ENODEV;

please use dev_err_probe()

Andi

...

