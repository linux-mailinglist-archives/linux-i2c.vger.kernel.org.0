Return-Path: <linux-i2c+bounces-9799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A008A5D42C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 02:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A53673B4790
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 01:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751488633A;
	Wed, 12 Mar 2025 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aFpYlJIh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36703FB1B
	for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 01:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741743997; cv=none; b=cGC8gRaaK9tCwOJcvug116qfGeEfipmuEEg2cWuxRO8+QBN4xnfcELqxrkxRoI39whySqOalOC0wVe1tFODVAmpaNr44g3iVpIH76Hzb5JMH7U73sx/fWMIFfvpVeBx7Xl3wn9NgJ9oq+aRibMCUb9aW0kxFbwP/uW98g6aD2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741743997; c=relaxed/simple;
	bh=hd70bcPfXIsu30lUfwpwqnh173v3xCJQRNp8TB6j1Gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS/aCMs1X/sFO/HyN4+Rii72DpO08y/Ufa3zk600rdkuzRyIRWzhBjDVSF2LUEyEgOVaJY+ABLJqh44L7ok8keOv2QMQvPqpskyMUjTaEPW/ETxZPx/azNwtJjrpdhUGBy+V7A+afcDGZHYfqt4YrXekSdcSvCYU1PKfEw6wSG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aFpYlJIh; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d43bb5727fso16964495ab.1
        for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 18:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1741743994; x=1742348794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FB2V6QtdCcfZkX+JuKOMy58zGXvLKnGeA8XbC/5PkiM=;
        b=aFpYlJIh2KavDw7OGucej3P4aePz3Y/t6CfBSklVFMiy1MJYmfTDdNjVd/t1WZXGan
         2BU0dXNxH1QaSygMoSn+v4In2oSHiHLMiV4RPfZ6GL+8DJ6V4rbLq9om8h6zSmTXZ2hM
         whhBng8ajlmdqEoSmJS1WF9nb5WRCyW7Ko8Yus7cph7FaHdsiv94GeX9BFn1H6DRqHh2
         zcQClMgNF8RxVbzwlNfpnlLobb2tCH47ajKO/k662AtngxLRpGvZZ9L5itp0U/by0jyU
         PzCL7a39Omxlq7Y+lXWpz67VzlsbNbiQzwEakbHyUh188tHXi2Aqm6R672R8meaVFdhQ
         CvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741743994; x=1742348794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FB2V6QtdCcfZkX+JuKOMy58zGXvLKnGeA8XbC/5PkiM=;
        b=Da9bw0SUoyKud+19u7dkgWKIaYVydjKlsm77hjP9ZK69yVys0zLMhvUD5iKJQEqY4T
         XdH//+63rWC53zbNQkH5WAFaSg5hDPbC0xZtC1fDB3d3wo1UXDw0pCCwJn/JEillkoDb
         TvA9STz8FEHfkmIXpm0499sGxUA8eaKbFPlaTdd7MiK1Cql2hStCyjvbzCBvTzIvfZZO
         P7D6LjdEox8pd6GXKJEKhlyeI5q529k/UoR6J4XioUmE5+AFxBoNbLNVoUDSVxSyFi/Z
         Ws+76Hcv596y7u6qTHNpqY0lsZMkIJig58OasuDY7vhdqZtRmLQ4dWpWqFf/y1qFZjFk
         RKAw==
X-Forwarded-Encrypted: i=1; AJvYcCUWndRt+7aYahMrzJKACKnCPtwyTW7s3Sbkod2oPxP94XpmdrbxMx9xaucULhWZg24sEdMa0Q+Wskk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNo0QKwdQQlB7B/+jUOLn+kZU93zBvYQkEhbsRiCM3Jw2r7U8
	GGzN/oL4N9Q/BXv/8zTozMLlBXgs+KPu04xQHdNrxl6h5W+dpbl94WMhixr+0v0=
X-Gm-Gg: ASbGncvDbhSaP4Z3Fdc4U8EmdnRuOZUgVIezQJAQuEEFC+XWw6go3zBKdYbGZg0/8Ns
	cWkt98fwsGbRSvLDpNTcC79E1YYEqUygsPzvYvQd2OGfGhYynVYD0ZBA59UI5uIsd56Enojnq0+
	DIfegZuXAxpCqUx37dSiJBWxEhubE2nafW7v6Rnd1nyAQjfoQzaLy880sNQfA3c3ZI/bQaIvo3A
	EUoOrWtxpLOIOvJM1G7hqAZNhSDbTW+diOPN2ruChO6Jvp7A0mZnDOajK4hcIwcxyNkELTl4bIK
	0GiebC4IpmjuP4ylYCDX70OBQYg12MZArBR5oDnUEq4Qvxw7Pv8Cr7Qr5Dcc6hLkwpS4DC1Yk1e
	utwP/cy/M
X-Google-Smtp-Source: AGHT+IFNl/LOv6cvvb25Zi+xeko7zVBW5q6yh0IgPfpjtyHa74TInbGv9C4bATUIo7PS9ZWxshZtgA==
X-Received: by 2002:a92:c56a:0:b0:3d4:3eed:2755 with SMTP id e9e14a558f8ab-3d4418fd32amr210624095ab.12.1741743993898;
        Tue, 11 Mar 2025 18:46:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d43b4f69f8sm28699735ab.23.2025.03.11.18.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 18:46:33 -0700 (PDT)
Message-ID: <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
Date: Tue, 11 Mar 2025 20:46:31 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
 <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/25 7:13 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

I have a bunch of really small suggestions.  Please consider
them, but whatever you choose to do this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/Kconfig  |  17 ++
>   drivers/i2c/busses/Makefile |   1 +
>   drivers/i2c/busses/i2c-k1.c | 601 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 619 insertions(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fc438f4457713d5559d163840a7b11e8cdbb8f58..12d0e99566d8625aa374279956b71a4034ded4ac 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -783,6 +783,23 @@ config I2C_JZ4780
>   
>   	 If you don't know what to do here, say N.
>   
> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver can
> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.

Does SpacemiT prefer to have the T at the end of their name
capitalized?

> +
> +	  This driver can also be built as a module.  If so, the
> +	  module will be called `i2c-k1`.
> +
>   config I2C_KEBA
>   	tristate "KEBA I2C controller support"
>   	depends on HAS_IOMEM
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1c2a4510abe44a689dfe67d2d64cf0cf3434f510..c1252e2b779e2e47492d66179b442f2202ec0416 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_I2C_IMX)		+= i2c-imx.o
>   obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
>   obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
>   obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
> +obj-$(CONFIG_I2C_K1)		+= i2c-k1.o
>   obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
>   obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
>   obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1ef98a303fb14ce10d283225ce0617a0b9f405f7
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>

Maybe update your copyright date(s) to include this year before
your final version of the patch.

> + */
> +
> + #include <linux/clk.h>
> + #include <linux/i2c.h>
> + #include <linux/iopoll.h>
> + #include <linux/module.h>
> + #include <linux/of_address.h>
> + #include <linux/platform_device.h>
> +
> +/* spacemit i2c registers */
> +#define SPACEMIT_ICR		 0x0		/* Control Register */

s/Register/register/

> +#define SPACEMIT_ISR		 0x4		/* Status Register */

s/Register/register/

> +#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
s/Buffer Re/buffer re/

> +#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> +
> +/* SPACEMIT_ICR register fields */
> +#define SPACEMIT_CR_START        BIT(0)		/* start bit */
> +#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
> +#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
> +#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */
> +/* Bits 4-7 are reserved */
> +#define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
> +/* Bit 9 is reserved */
> +#define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
> +/* Bits 11-12 are reserved */
> +#define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
> +#define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
> +/* Bits 15-17 are reserved */
> +#define SPACEMIT_CR_ALDIE        BIT(18)	/* enable arbitration interrupt */
> +#define SPACEMIT_CR_DTEIE        BIT(19)	/* enable tx interrupts */
> +#define SPACEMIT_CR_DRFIE        BIT(20)	/* enable rx interrupts */
> +#define SPACEMIT_CR_GCD          BIT(21)	/* general call disable */
> +#define SPACEMIT_CR_BEIE         BIT(22)	/* enable bus error ints */
> +/* Bits 23-24 are reserved */
> +#define SPACEMIT_CR_MSDIE        BIT(25)	/* master STOP detected int enable */
> +#define SPACEMIT_CR_MSDE         BIT(26)	/* master STOP detected enable */
> +#define SPACEMIT_CR_TXDONEIE     BIT(27)	/* transaction done int enable */
> +#define SPACEMIT_CR_TXEIE        BIT(28)	/* transmit FIFO empty int enable */
> +#define SPACEMIT_CR_RXHFIE       BIT(29)	/* receive FIFO half-full int enable */
> +#define SPACEMIT_CR_RXFIE        BIT(30)	/* receive FIFO full int enable */
> +#define SPACEMIT_CR_RXOVIE       BIT(31)	/* receive FIFO overrun int enable */
> +
> +#define SPACEMIT_I2C_INT_CTRL_MASK	(SPACEMIT_CR_ALDIE | SPACEMIT_CR_DTEIE | \
> +					 SPACEMIT_CR_DRFIE | SPACEMIT_CR_BEIE | \
> +					 SPACEMIT_CR_TXDONEIE | SPACEMIT_CR_TXEIE | \
> +					 SPACEMIT_CR_RXHFIE | SPACEMIT_CR_RXFIE | \
> +					 SPACEMIT_CR_RXOVIE | SPACEMIT_CR_MSDIE)
> +
> +/* SPACEMIT_ISR register fields */
> +/* Bits 0-13 are reserved */
> +#define SPACEMIT_SR_ACKNAK       BIT(14)	/* ACK/NACK status */
> +#define SPACEMIT_SR_UB           BIT(15)	/* unit busy */
> +#define SPACEMIT_SR_IBB          BIT(16)	/* i2c bus busy */
> +#define SPACEMIT_SR_EBB          BIT(17)	/* early bus busy */
> +#define SPACEMIT_SR_ALD          BIT(18)	/* arbitration loss detected */
> +#define SPACEMIT_SR_ITE          BIT(19)	/* tx buffer empty */
> +#define SPACEMIT_SR_IRF          BIT(20)	/* rx buffer full */
> +#define SPACEMIT_SR_GCAD         BIT(21)	/* general call address detected */
> +#define SPACEMIT_SR_BED          BIT(22)	/* bus error no ACK/NAK */
> +#define SPACEMIT_SR_SAD          BIT(23)	/* slave address detected */
> +#define SPACEMIT_SR_SSD          BIT(24)	/* slave stop detected */
> +/* Bit 25 is reserved */
> +#define SPACEMIT_SR_MSD          BIT(26)	/* master stop detected */
> +#define SPACEMIT_SR_TXDONE       BIT(27)	/* transaction done */
> +#define SPACEMIT_SR_TXE          BIT(28)	/* tx FIFO empty */
> +#define SPACEMIT_SR_RXHF         BIT(29)	/* rx FIFO half-full */
> +#define SPACEMIT_SR_RXF          BIT(30)	/* rx FIFO full */
> +#define SPACEMIT_SR_RXOV         BIT(31)	/* RX FIFO overrun */

s/RX FIFO/rx FIFO/

Or preferably, use "TX" and "RX" an all the comments (and anywhere
else you use "tx" and "rx" in the file).

> +
> +#define SPACEMIT_I2C_INT_STATUS_MASK	(SPACEMIT_SR_RXOV | SPACEMIT_SR_RXF | SPACEMIT_SR_RXHF | \
> +					SPACEMIT_SR_TXE | SPACEMIT_SR_TXDONE | SPACEMIT_SR_MSD | \
> +					SPACEMIT_SR_SSD | SPACEMIT_SR_SAD | SPACEMIT_SR_BED | \
> +					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
> +					SPACEMIT_SR_ALD)
> +
> +/* SPACEMIT_IBMR register fields */
> +#define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> +#define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> +
> +/* i2c bus recover timeout: us */
> +#define SPACEMIT_I2C_BUS_BUSY_TIMEOUT	100000

Align the 100000 above with the frequency values below.

> +
> +#define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
> +

Maybe it's obvious but you could comment that the unit
for these values is Hz.

> +#define SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ	100000
> +#define SPACEMIT_I2C_MAX_FAST_MODE_FREQ		400000
> +
> +enum spacemit_i2c_state {
> +	STATE_IDLE,
> +	STATE_START,
> +	STATE_READ,
> +	STATE_WRITE,
> +};
> +
> +/* i2c-spacemit driver's main struct */
> +struct spacemit_i2c_dev {
> +	struct device *dev;
> +	struct i2c_adapter adapt;
> +
> +	/* hardware resources */
> +	void __iomem *base;
> +	int irq;
> +	u32 clock_freq;
> +
> +	struct i2c_msg *msgs;
> +	int msg_num;

You'll never have a negative number of messages.  (I see
it's assigned an int value, but my statement is still true.)
So this can be unsigned (u32).

> +
> +	/* index of the current message being processed */
> +	int msg_idx;

msg_idx can also be unsigned.

> +	u8 *msg_buf;
> +	/* the number of unprocessed bytes remaining in each message  */

s/each/the current/

> +	size_t unprocessed;

Why is unprocessed a size_t?  It's OK, but msg_idx is a
simple (unsigned) int.

> +
> +	enum spacemit_i2c_state state;
> +	bool read;
> +	struct completion complete;
> +	u32 status;
> +};
> +
> +static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val |= SPACEMIT_CR_IUE;
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val &= ~SPACEMIT_CR_IUE;
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
> +{
> +	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> +	udelay(5);
> +	writel(0, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
> +{
> +	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n", i2c->status);
> +
> +	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> +		spacemit_i2c_reset(i2c);
> +		return -EAGAIN;
> +	}
> +
> +	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> +}
> +
> +static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 status;
> +
> +	/* if bus is locked, reset unit. 0: locked */
> +	status = readl(i2c->base + SPACEMIT_IBMR);
> +	if ((status & SPACEMIT_BMR_SDA) && (status & SPACEMIT_BMR_SCL))
> +		return;
> +
> +	spacemit_i2c_reset(i2c);
> +	usleep_range(10, 20);
> +
> +	/* check scl status again */
> +	status = readl(i2c->base + SPACEMIT_IBMR);
> +	if (!(status & SPACEMIT_BMR_SCL))
> +		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
> +}
> +

I think this is waiting for the bus to *not* be busy.
So spacemit_i2c_wait_bus_free() (or maybe _idle()) would
make more sense.

> +static int spacemit_i2c_wait_bus_busy(struct spacemit_i2c_dev *i2c)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = readl(i2c->base + SPACEMIT_ISR);
> +	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
> +		return 0;
> +
> +	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (ret)
> +		spacemit_i2c_reset(i2c);
> +
> +	return ret;
> +}
> +
> +static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
> +{
> +	/* in case bus is not released after transfer completes */
> +	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
> +		spacemit_i2c_conditionally_reset_bus(i2c);
> +		usleep_range(90, 150);
> +	}
> +}
> +
> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Unmask interrupt bits for all xfer mode:
> +	 * bus error, arbitration loss detected.
> +	 * For transaction complete signal, we use master stop
> +	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +	 */
> +	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +	/*
> +	 * Unmask interrupt bits for interrupt xfer mode:
> +	 * DBR rx full.
> +	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
> +	 * need to enable when trigger byte transfer to start
> +	 * data sending.
> +	 */
> +	val |= SPACEMIT_CR_DRFIE;
> +
> +	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +		val |= SPACEMIT_CR_MODE_FAST;
> +
> +	/* disable response to general call */
> +	val |= SPACEMIT_CR_GCD;
> +
> +	/* enable SCL clock output */
> +	val |= SPACEMIT_CR_SCLE;
> +
> +	/* enable master stop detected */
> +	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static inline void

s/inline //

> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
> +{
> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
> +}
> +
> +static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 slave_addr_rw, val;
> +	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
> +
> +	i2c->read = !!(cur_msg->flags & I2C_M_RD);
> +
> +	i2c->state = STATE_START;
> +
> +	slave_addr_rw = (cur_msg->addr & 0x7f) << 1;
> +	if (cur_msg->flags & I2C_M_RD)
> +		slave_addr_rw |= 1;
> +
> +	writel(slave_addr_rw, i2c->base + SPACEMIT_IDBR);
> +
> +	/* send start pulse */
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val &= ~SPACEMIT_CR_STOP;
> +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> +
> +	if (i2c->read)
> +		val |= SPACEMIT_CR_ACKNAK;
> +
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		i2c->msg_buf = (i2c->msgs + i2c->msg_idx)->buf;
> +		i2c->status = 0;
> +		i2c->unprocessed = (i2c->msgs + i2c->msg_idx)->len;

I think this might be more understandable.  The array syntax
shows it's really an array; and the local variable simplifies
the right-hand sides.

	struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];

	i2c->msg_buf = msg->buf;
	i2c->unprocessed = msg->len;
	i2c->status = 0;

> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (time_left == 0) {

		if (!time_left) {

> +			dev_err(i2c->dev, "msg completion timeout\n");
> +			spacemit_i2c_conditionally_reset_bus(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c->status & SPACEMIT_SR_ERR)
> +			return spacemit_i2c_handle_err(i2c);
> +	}
> +
> +	return 0;
> +}

. . .

> +static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long timeout;
> +	int idx = 0, cnt = 0;
> +
> +	while (idx < i2c->msg_num) {
> +		cnt += (i2c->msgs + idx)->len + 1;
> +		idx++;
> +	}
> +
> +	/*
> +	 * multiply by 9 because each byte in I2C transmission requires
> +	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
> +	 */
> +	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
> +
> +	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 2) / i2c->msg_num;

I think the half second pad on your timeout will essentially
always dominate the timeout period.  If you transfer a
maximally-sized message at 100000 Hz it'll take almost
6 seconds.  But in practice I'm sure transfers are under
32 bytes (maybe 256?).  At 256 bytes you're looking at
23 milliseconds (plus 500000) at 100 KHz.

I looked around and the timeouts used for I2C adapters are
all over the map.  50 seconds, 1 second, 100 milliseconds,
and so on, so I guess what you're doing is fine.

That said, it might not be very important to be as precise
as you are here.

> +}
> +

. . .

> +static const struct i2c_algorithm spacemit_i2c_algo = {
> +	.xfer = spacemit_i2c_xfer,
> +	.functionality = spacemit_i2c_func,
> +};
> +
> +static int spacemit_i2c_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct spacemit_i2c_dev *i2c;
> +	int ret;
> +
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read clock-frequency property");

Your binding doesn't say that the "clock-frequency" property is
required.  If it's not found, you should default to 400000 Hz.
There should be no error here.

> +
> +	/* For now, this driver doesn't support high-speed. */

The clock frequency is unsigned, so:

	if (!i2c->clock_freq || ...) {

> +	if (i2c->clock_freq < 1 || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		dev_warn(dev, "unsupport clock frequency: %d, default: %d",

	dev_warn(dev, "unsupported clock frequency %u; using %u\n",

> +			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> +	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {

I would issue the same warning message here.

> +		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> +	}
> +
> +	i2c->dev = &pdev->dev;
> +
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c->base))
> +		return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
> +
> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq");
> +
> +	clk = devm_clk_get_enabled(dev, "func");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> +
> +	clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> +
> +	spacemit_i2c_reset(i2c);
> +
> +	i2c_set_adapdata(&i2c->adapt, i2c);
> +	i2c->adapt.owner = THIS_MODULE;
> +	i2c->adapt.algo = &spacemit_i2c_algo;
> +	i2c->adapt.dev.parent = i2c->dev;
> +	i2c->adapt.nr = pdev->id;
> +
> +	i2c->adapt.dev.of_node = of_node;
> +	i2c->adapt.algo_data = i2c;

I don't think you ever use i2c->adapt.algo_data.  All you
need is the i2c pointer you set with i2c_set_adapdata().

That's it!

					-Alex

> +
> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> +
> +	init_completion(&i2c->complete);
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> +
> +	return 0;
> +}
> +
> +static void spacemit_i2c_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adapt);
> +}
> +
> +static const struct of_device_id spacemit_i2c_of_match[] = {
> +	{ .compatible = "spacemit,k1-i2c", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
> +
> +static struct platform_driver spacemit_i2c_driver = {
> +	.probe = spacemit_i2c_probe,
> +	.remove = spacemit_i2c_remove,
> +	.driver = {
> +		.name = "i2c-k1",
> +		.of_match_table = spacemit_i2c_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
> 


