Return-Path: <linux-i2c+bounces-8711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFEE9FC70C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E671E162908
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 00:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3C7C8C5;
	Thu, 26 Dec 2024 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUjTK965"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D436139E;
	Thu, 26 Dec 2024 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735173796; cv=none; b=sSx5+P5++FIjYno0Jl5Bto9/shAfuTnx4d2J/LCHuxe14jZ2gyQ6WZHhCadvpphsUuq9WDokReM0AJCteqfEs6vouWJXBo7TxxbZ92+6deQzYkiahX0VK1pth4nvwQMsJVdX8I+yD/tK3eYVk9jSbomEdjhV4GBwNfRsvbdfaVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735173796; c=relaxed/simple;
	bh=79SfWQyy0Ns0evUnqLPgOQsgkHfyQiB7aLKDBzlwdBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvQvQ4gckoORlZBp0brJbjSCUnU/sBqKURUzddJaQZi1U3m4UZdQglsix+NWDe33YjtbgOqS1wb083KceQHAtz01Xo1pFZAOcZQZWu5C3IuIoOGdv2lk9oj8bleehdvV7C9dMDix1+ZOto+jVuxEFKu6r3gQQ76IDdM47TsfSH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUjTK965; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFCBC4CECD;
	Thu, 26 Dec 2024 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735173796;
	bh=79SfWQyy0Ns0evUnqLPgOQsgkHfyQiB7aLKDBzlwdBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUjTK965hYSXrp2XAshLLNcE8akpZBVdBnYiL7fmuFS60ukegSKxuEfdkvqJ9rSOx
	 dRksivwAQxAX9upZo3LQveptEL5FsT/SltJdhrHP8QmP5GN1uvuHSF54QIsAUWQCNI
	 NgOxSIRQuz6xvci7NX/iwEMTljx2qXhilnhBkNTPEOJZHCnqXXvkJtlfnrlFntK4Ia
	 3ISgGpYL75VPrBwEWF2iEbGDsbv5udM2vdaSqSr1eH7g5PBEWLP2xAt/ZjWAOSOmMG
	 +2rxHio9DzvDFpwMH4TNGhXY7soLup9iID69hRrVfp1NGY4HXTQxUGlwZzxjJRz1i8
	 Cbwmnq7Rpe4pQ==
Date: Thu, 26 Dec 2024 01:43:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 3/7] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <qe7rucm65tixgnlendfdlr6iemrvs2ecun7odlbl3csofj7qjj@sl6vypb66awz>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-4-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210104524.2466586-4-tmyu0@nuvoton.com>

Hi Ming,

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 I2C adapter driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +/* Host interface */

What does it mean "Host interface"?

> +#define NCT6694_I2C_MOD		0x03
> +
> +/* Message Channel*/
> +/* Command 00h */

This comments are meaningless, either make them clearer or remove
them.

> +#define NCT6694_I2C_CMD0_OFFSET	0x0000	/* OFFSET = SEL|CMD */

I find this comment quite meaningless. Can you please make it
clearer?

> +#define NCT6694_I2C_CMD0_LEN	0x90
> +
> +enum i2c_baudrate {
> +	I2C_BR_25K = 0,
> +	I2C_BR_50K,
> +	I2C_BR_100K,
> +	I2C_BR_200K,
> +	I2C_BR_400K,
> +	I2C_BR_800K,
> +	I2C_BR_1M
> +};
> +
> +struct __packed nct6694_i2c_cmd0 {
> +	u8 port;
> +	u8 br;
> +	u8 addr;
> +	u8 w_cnt;
> +	u8 r_cnt;
> +	u8 rsv[11];
> +	u8 write_data[0x40];
> +	u8 read_data[0x40];
> +};
> +
> +struct nct6694_i2c_data {
> +	struct nct6694 *nct6694;
> +	struct i2c_adapter adapter;
> +	unsigned char *xmit_buf;

why isn't this a nct6694_i2c_cmd0 type?

> +	unsigned char port;
> +	unsigned char br;
> +};
> +
> +static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct nct6694_i2c_data *data = adap->algo_data;
> +	struct nct6694_i2c_cmd0 *cmd = (struct nct6694_i2c_cmd0 *)data->xmit_buf;
> +	int ret, i;
> +
> +	for (i = 0; i < num ; i++) {
> +		struct i2c_msg *msg_temp = &msgs[i];
> +
> +		memset(data->xmit_buf, 0, sizeof(struct nct6694_i2c_cmd0));
> +
> +		if (msg_temp->len > 64)
> +			return -EPROTO;
> +		cmd->port = data->port;
> +		cmd->br = data->br;
> +		cmd->addr = i2c_8bit_addr_from_msg(msg_temp);
> +		if (msg_temp->flags & I2C_M_RD) {
> +			cmd->r_cnt = msg_temp->len;
> +			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
> +						NCT6694_I2C_CMD0_OFFSET,
> +						NCT6694_I2C_CMD0_LEN,
> +						cmd);
> +			if (ret < 0)
> +				return 0;

why not return ret?

> +
> +			memcpy(msg_temp->buf, cmd->read_data, msg_temp->len);
> +		} else {
> +			cmd->w_cnt = msg_temp->len;
> +			memcpy(cmd->write_data, msg_temp->buf, msg_temp->len);
> +			ret = nct6694_write_msg(data->nct6694, NCT6694_I2C_MOD,
> +						NCT6694_I2C_CMD0_OFFSET,
> +						NCT6694_I2C_CMD0_LEN,
> +						cmd);
> +			if (ret < 0)
> +				return 0;
> +		}
> +	}
> +
> +	return num;
> +}
> +
> +static u32 nct6694_func(struct i2c_adapter *adapter)
> +{
> +	return (I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL);

parenthesis are not needed.

> +}

...

> +static struct platform_driver nct6694_i2c_driver = {
> +	.driver = {
> +		.name	= "nct6694-i2c",
> +	},
> +	.probe		= nct6694_i2c_probe,
> +	.remove		= nct6694_i2c_remove,
> +};
> +
> +module_platform_driver(nct6694_i2c_driver);

what I meant in v1 is to try using module_auxiliary_driver().
Check, e.g., i2c-ljca.c or i2c-keba.c.

Andi

> +MODULE_DESCRIPTION("USB-I2C adapter driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-i2c");
> -- 
> 2.34.1
> 

