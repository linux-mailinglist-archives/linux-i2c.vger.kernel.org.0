Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B992164F8C3
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 11:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiLQKv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 05:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiLQKvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 05:51:52 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE8B29807
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:51:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id y4so4575860ljc.9
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TY4p8EryeFXDBXwp3U35uK5m641hh70mIAf0/pl5P+k=;
        b=TL5a31nPxNfnxrosp33acdUTqjQwo+1P4Yck8CRPfzGDh5AMaDDEi+ENXVH34icT4z
         LMyY50X4uXxmf0VD4efGux+B/s7DYy0/gKzvg6GON8Xchz2n8vpsl8n611C2/Gej9nKR
         dT3Q+CM7nYwK9L5OUkmtNHUTASxt6OQulzE0degrzcSx5AvGFO53U7BgCCdIt27hATbK
         dvTbU2QJsgZhbHZc8RQnetYaBER5XC7BcGAVLj7i0TOP9+KQVqS5zPXHaIm9HC6yS/gF
         B+qUW9Mq3YMRyx4r92uNjYpOdSbaMuG/wYtLQyQaJZZs3DMUykTzDLDKkEP2tkLLoiNm
         so4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TY4p8EryeFXDBXwp3U35uK5m641hh70mIAf0/pl5P+k=;
        b=gzdYWPsJxq8YO6k4qlN1pYeoaQhaP5lg+5rrqq8FnfLxK5refOX9EQ1B+kC91ahWo/
         CU1Yq1uAxu5OKpFN3eCqe6I8NU+an0vZ8Zm5o5mvD/5l9d0lAAsg/W/gaEUXTmOvu4aw
         MU8ch/1EoLxr83h8ZICSVLNp+EqadsQyZnD6IcT+TryhMWlA8PWIq9uouwKqU2FiGo88
         d5Sf4/O+F3Mr95eczIUAWx1GPuAhdXwY6CM4nXGnImS1bWIClw5r0APz1aITWHzoQQCv
         e68W/BZ4kasEMhHH7udz0YBUptye0FZlcHxBqCniT7nYJTwQXS4YSSyTK4n3obLbd9Ju
         dA9g==
X-Gm-Message-State: ANoB5plQn5REI1pj+KW59nAISHAmiQKqt07CBx2M3y2WK5UgfLcJbg0U
        2W0nm6mSSphrHltK2F++hi0IOcKvQkaIh1x8
X-Google-Smtp-Source: AA0mqf64kgxQpyftyGIwRS3Dn2vCEdr8vIZYZa4MZ8Aa3VZuRKiq57DubGr4mFnYugN8CUHBit9hNQ==
X-Received: by 2002:a2e:b894:0:b0:277:8b20:3a19 with SMTP id r20-20020a2eb894000000b002778b203a19mr11546710ljp.29.1671274308417;
        Sat, 17 Dec 2022 02:51:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f19-20020a2eb5b3000000b00279a15e635asm306585ljn.58.2022.12.17.02.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:51:48 -0800 (PST)
Message-ID: <832510cf-0a1d-35cb-8754-7d9c9e94b0a6@linaro.org>
Date:   Sat, 17 Dec 2022 11:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/6] i2c: hpe: Add GXP SoC I2C Controller
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-2-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216183532.78933-2-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/12/2022 19:35, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The GXP SoC supports 10 I2C engines. Each I2C engine is completely
> independent and can function both as an I2C master and I2C slave. The
> I2C master can operate in a multi master environment. The engines support
> a scalable speed from 8kHZ to 1.5 Mhz.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  drivers/i2c/busses/Kconfig   |   7 +
>  drivers/i2c/busses/Makefile  |   1 +
>  drivers/i2c/busses/i2c-gxp.c | 641 +++++++++++++++++++++++++++++++++++
>  3 files changed, 649 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-gxp.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e50f9603d189..8b3951e0ca5c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1457,4 +1457,11 @@ config I2C_VIRTIO
>            This driver can also be built as a module. If so, the module
>            will be called i2c-virtio.
>  
> +config I2C_GXP
> +	tristate "GXP I2C Interface"
> +	depends on ARCH_HPE_GXP || COMPILE_TEST
> +	help
> +	  This enables support for GXP I2C interface. The I2C engines can be
> +	  either I2C master or I2C slaves.
> +
>  endmenu
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index e73cdb1d2b5a..dcc96eab6d68 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -127,6 +127,7 @@ obj-$(CONFIG_I2C_THUNDERX)	+= i2c-thunderx.o
>  obj-$(CONFIG_I2C_XILINX)	+= i2c-xiic.o
>  obj-$(CONFIG_I2C_XLP9XX)	+= i2c-xlp9xx.o
>  obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
> +obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
>  
>  # External I2C/SMBus adapter drivers
>  obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
> diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
> new file mode 100644
> index 000000000000..a67c0c4d7520
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-gxp.c
> @@ -0,0 +1,641 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define GXP_MAX_I2C_ENGINE 10
> +static const char * const gxp_i2c_name[] = {
> +	"gxp-i2c0", "gxp-i2c1", "gxp-i2c2", "gxp-i2c3",
> +	"gxp-i2c4", "gxp-i2c5", "gxp-i2c6", "gxp-i2c7",
> +	"gxp-i2c8",	"gxp-i2c9" };
> +
> +/* Default value */
> +#define GXP_I2C_BIT_RATE	100000	/* 100kHz */
> +
> +/* GXP I2C Global interrupt status/enable register*/
> +#define GXP_I2CINTSTAT		0x00
> +#define GXP_I2CINTEN		0x04
> +
> +/* GXP I2C registers */
> +#define GXP_I2CSTAT		0x00
> +#define MASK_STOP_EVENT		0x20
> +#define MASK_ACK		0x08
> +#define MASK_RW			0x04
> +#define GXP_I2CEVTERR		0x01
> +#define MASK_SLAVE_CMD_EVENT	0x01
> +#define MASK_SLAVE_DATA_EVENT	0x02
> +#define MASK_MASTER_EVENT	0x10
> +#define GXP_I2CSNPDAT		0x02
> +#define GXP_I2CMCMD		0x04
> +#define GXP_I2CSCMD		0x06
> +#define GXP_I2CSNPAA		0x09
> +#define GXP_I2CADVFEAT		0x0A
> +#define GXP_I2COWNADR		0x0B
> +#define GXP_I2CFREQDIV		0x0C
> +#define GXP_I2CFLTFAIR		0x0D
> +#define GXP_I2CTMOEDG		0x0E
> +#define GXP_I2CCYCTIM		0x0F
> +
> +static bool i2c_global_init_done;
> +
> +enum {
> +	GXP_I2C_IDLE = 0,
> +	GXP_I2C_ADDR_PHASE,
> +	GXP_I2C_RDATA_PHASE,
> +	GXP_I2C_WDATA_PHASE,
> +	GXP_I2C_ADDR_NACK,
> +	GXP_I2C_DATA_NACK,
> +	GXP_I2C_ERROR,
> +	GXP_I2C_COMP
> +};
> +
> +struct gxp_i2c_drvdata {
> +	struct device *dev;
> +	void __iomem	*base;

Keep consistent style - either indent or do not indent variable name.

> +	u32 bus_frequency;
> +	int engine;
> +	int irq;
> +	struct completion completion;
> +	struct i2c_adapter	adapter;
> +	struct i2c_msg *curr_msg;
> +	int msgs_remaining;
> +	int msgs_num;
> +	u8 *buf;
> +	size_t buf_remaining;
> +	unsigned char		state;
> +	struct i2c_client *slave;
> +	unsigned char stopped;
> +};
> +
> +static struct regmap *i2cg_map;
> +
> +static void gxp_i2c_start(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;

It's used only once, so having a placeholder variable does not make the
code smaller nor easier to read. Drop the variable.


> +	u16 value;
> +
> +	drvdata->buf = drvdata->curr_msg->buf;
> +	drvdata->buf_remaining = drvdata->curr_msg->len;
> +
> +	/* Note: Address in struct i2c_msg is 7 bits */
> +	value = drvdata->curr_msg->addr << 9;
> +
> +	if (drvdata->curr_msg->flags & I2C_M_RD) {
> +		/* Read */
> +		value |= 0x05;
> +	} else {
> +		/* Write */
> +		value |= 0x01;
> +	}
> +
> +	drvdata->state = GXP_I2C_ADDR_PHASE;
> +	writew(value, base + GXP_I2CMCMD);
> +}
> +
> +static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	int ret;
> +	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(adapter);
> +	unsigned long time_left;
> +
> +	drvdata->msgs_remaining = num;
> +	drvdata->curr_msg = msgs;
> +	drvdata->msgs_num = num;
> +	reinit_completion(&drvdata->completion);
> +
> +	gxp_i2c_start(drvdata);
> +
> +	time_left = wait_for_completion_timeout(&drvdata->completion,
> +						adapter->timeout);
> +	ret = num - drvdata->msgs_remaining;
> +	if (time_left == 0) {
> +		switch (drvdata->state) {
> +		case GXP_I2C_WDATA_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:write Data phase timeout at msg[%d]\n",
> +			ret);
> +			break;
> +		case GXP_I2C_RDATA_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:read Data phase timeout at msg[%d]\n",
> +			ret);
> +			break;
> +		case GXP_I2C_ADDR_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:Addr phase timeout\n");
> +			break;
> +		default:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:i2c transfer timeout state=%d\n",
> +			drvdata->state);
> +			break;
> +		}
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (drvdata->state == GXP_I2C_ADDR_NACK) {
> +		dev_dbg(drvdata->dev,
> +			"gxp_i2c_start:No ACK for address phase\n");
> +		return -EIO;
> +	} else if (drvdata->state == GXP_I2C_DATA_NACK) {
> +		dev_dbg(drvdata->dev, "gxp_i2c_start:No ACK for data phase\n");
> +		return -EIO;
> +	}
> +
> +	return ret;
> +}
> +
> +static u32 gxp_i2c_func(struct i2c_adapter *adap)
> +{
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Shouldn't this be instead:
	if (IS_ENABLED())
?

> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SLAVE;
> +#else
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +#endif
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int gxp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
> +	void __iomem *base = drvdata->base;
> +
> +	pr_info("[%s] I2C engine%d addr:0x%02x\n", __func__, drvdata->engine, slave->addr);

1. Registerin devices does not deserve printks. You can have debug if
you need this.
2. dev_ not pr_

> +	if (drvdata->slave)
> +		return -EBUSY;
> +
> +	if (slave->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	drvdata->slave = slave;
> +
> +	writeb(slave->addr << 1, base + GXP_I2COWNADR);
> +	writeb(0x69, base + GXP_I2CSCMD);
> +
> +	return 0;
> +}
> +
> +static int gxp_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
> +	void __iomem *base = drvdata->base;
> +
> +	pr_info("[%s] I2C engine%d\n", __func__, drvdata->engine);

Ditto

> +	WARN_ON(!drvdata->slave);
> +
> +	writeb(0x00, base + GXP_I2COWNADR);
> +	writeb(0xF0, base + GXP_I2CSCMD);
> +
> +	drvdata->slave = NULL;
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct i2c_algorithm gxp_i2c_algo = {
> +	.master_xfer   = gxp_i2c_master_xfer,
> +	.functionality = gxp_i2c_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave     = gxp_i2c_reg_slave,
> +	.unreg_slave   = gxp_i2c_unreg_slave,
> +#endif
> +};
> +
> +static void gxp_i2c_stop(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;

I really don't see how this helps to have moer readable code...

> +
> +	/* Clear event and send stop */
> +	writeb(0x82, base + GXP_I2CMCMD);
> +
> +	complete(&drvdata->completion);
> +}
> +
> +static void gxp_i2c_restart(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +	u16 value;
> +
> +	drvdata->buf = drvdata->curr_msg->buf;
> +	drvdata->buf_remaining = drvdata->curr_msg->len;
> +
> +	value = drvdata->curr_msg->addr << 9;
> +
> +	if (drvdata->curr_msg->flags & I2C_M_RD) {
> +		/* Read and clear master event */
> +		value |= 0x85;
> +	} else {
> +		/* Write and clear master event */
> +		value |= 0x81;
> +	}
> +
> +	drvdata->state = GXP_I2C_ADDR_PHASE;
> +
> +	writew(value, base + GXP_I2CMCMD);
> +}
> +
> +static void gxp_i2c_chk_addr_ack(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +	u16 value;
> +
> +	value = readb(base + GXP_I2CSTAT);
> +	if (!(value & MASK_ACK)) {
> +		/* Got no ack, stop */
> +		drvdata->state = GXP_I2C_ADDR_NACK;
> +		gxp_i2c_stop(drvdata);
> +		return;
> +	}
> +
> +	if (drvdata->curr_msg->flags & I2C_M_RD) {
> +		/* Start to read data from slave */
> +		if (drvdata->buf_remaining == 0) {
> +			/* No more data to read, stop */
> +			drvdata->msgs_remaining--;
> +			drvdata->state = GXP_I2C_COMP;
> +			gxp_i2c_stop(drvdata);
> +			return;
> +		}
> +		drvdata->state = GXP_I2C_RDATA_PHASE;
> +
> +		if (drvdata->buf_remaining == 1) {
> +			/* The last data, do not ack */
> +			writeb(0x84, base + GXP_I2CMCMD);
> +		} else {
> +			/* Read data and ack it */
> +			writeb(0x8C, base + GXP_I2CMCMD);
> +		}
> +	} else {
> +		/* Start to write first data to slave */
> +		if (drvdata->buf_remaining == 0) {
> +			/* No more data to write, stop */
> +			drvdata->msgs_remaining--;
> +			drvdata->state = GXP_I2C_COMP;
> +			gxp_i2c_stop(drvdata);
> +			return;
> +		}
> +		value = *drvdata->buf;
> +		value = value << 8;
> +		/* Clear master event */
> +		value |= 0x80;
> +		drvdata->buf++;
> +		drvdata->buf_remaining--;
> +		drvdata->state = GXP_I2C_WDATA_PHASE;
> +		writew(value, base + GXP_I2CMCMD);
> +	}
> +}
> +
> +static void gxp_i2c_ack_data(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +	u8 value;
> +
> +	/* Store the data returned */
> +	value = readb(base + GXP_I2CSNPDAT);
> +	*drvdata->buf = value;
> +	drvdata->buf++;
> +	drvdata->buf_remaining--;
> +
> +	if (drvdata->buf_remaining == 0) {
> +		/* No more data, this message is completed. */
> +		drvdata->msgs_remaining--;
> +
> +		if (drvdata->msgs_remaining == 0) {
> +			/* No more messages, stop */
> +			drvdata->state = GXP_I2C_COMP;
> +			gxp_i2c_stop(drvdata);
> +			return;
> +		}
> +		/* Move to next message and start transfer */
> +		drvdata->curr_msg++;
> +		gxp_i2c_restart(drvdata);
> +		return;
> +	}
> +
> +	/* Ack the slave to make it send next byte */
> +	drvdata->state = GXP_I2C_RDATA_PHASE;
> +	if (drvdata->buf_remaining == 1) {
> +		/* The last data, do not ack */
> +		writeb(0x84, base + GXP_I2CMCMD);
> +	} else {
> +		/* Read data and ack it */
> +		writeb(0x8C, base + GXP_I2CMCMD);
> +	}
> +}
> +
> +static void gxp_i2c_chk_data_ack(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +	u16 value;
> +
> +	value = readb(base + GXP_I2CSTAT);
> +	if (!(value & MASK_ACK)) {
> +		/* Received No ack, stop */
> +		drvdata->state = GXP_I2C_DATA_NACK;
> +		gxp_i2c_stop(drvdata);
> +		return;
> +	}
> +
> +	/* Got ack, check if there is more data to write */
> +	if (drvdata->buf_remaining == 0) {
> +		/* No more data, this message is completed */
> +		drvdata->msgs_remaining--;
> +
> +		if (drvdata->msgs_remaining == 0) {
> +			/* No more messages, stop */
> +			drvdata->state = GXP_I2C_COMP;
> +			gxp_i2c_stop(drvdata);
> +			return;
> +		}
> +		/* Move to next message and start transfer */
> +		drvdata->curr_msg++;
> +		gxp_i2c_restart(drvdata);
> +		return;
> +	}
> +
> +	/* Write data to slave */
> +	value = *drvdata->buf;
> +	value = value << 8;
> +
> +	/* Clear master event */
> +	value |= 0x80;
> +	drvdata->buf++;
> +	drvdata->buf_remaining--;
> +	drvdata->state = GXP_I2C_WDATA_PHASE;
> +	writew(value, base + GXP_I2CMCMD);
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool gxp_i2c_slave_irq_handler(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +	u16 value;
> +	u8 buf;
> +	int ret;
> +
> +	value = readb(base + GXP_I2CEVTERR);
> +
> +	/* Received start or stop event */
> +	if (value & MASK_SLAVE_CMD_EVENT) {
> +		value = readb(base + GXP_I2CSTAT);
> +		/* Master sent stop */
> +		if (value & MASK_STOP_EVENT) {
> +			if (drvdata->stopped == 0)
> +				i2c_slave_event(drvdata->slave, I2C_SLAVE_STOP, &buf);
> +			writeb(0x69, base + GXP_I2CSCMD);
> +			drvdata->stopped = 1;
> +		} else {
> +			/* Master sent start and  wants to read */
> +			drvdata->stopped = 0;
> +			if (value & MASK_RW) {
> +				i2c_slave_event(drvdata->slave,
> +						I2C_SLAVE_READ_REQUESTED, &buf);
> +				value = buf << 8 | 0x61;
> +				writew(value, base + GXP_I2CSCMD);
> +			} else {
> +				/* Master wants to write to us */
> +				ret = i2c_slave_event(drvdata->slave,
> +						      I2C_SLAVE_WRITE_REQUESTED, &buf);
> +				if (!ret) {
> +					/* Ack next byte from master */
> +					writeb(0x69, base + GXP_I2CSCMD);
> +				} else {
> +					/* Nack next byte from master */
> +					writeb(0x61, base + GXP_I2CSCMD);
> +				}
> +			}
> +		}
> +	} else if (value & MASK_SLAVE_DATA_EVENT) {
> +		value = readb(base + GXP_I2CSTAT);
> +		/* Master wants to read */
> +		if (value & MASK_RW) {
> +			/* Master wants another byte */
> +			if (value & MASK_ACK) {
> +				i2c_slave_event(drvdata->slave,
> +						I2C_SLAVE_READ_PROCESSED, &buf);
> +				value = buf << 8 | 0x61;
> +				writew(value, base + GXP_I2CSCMD);
> +			} else {
> +				/* No more bytes needed */
> +				writew(0x69, base + GXP_I2CSCMD);
> +			}
> +		} else {
> +			/* Master wants to write to us */
> +			value = readb(base + GXP_I2CSNPDAT);
> +			buf = (uint8_t)value;
> +			ret = i2c_slave_event(drvdata->slave,
> +					      I2C_SLAVE_WRITE_RECEIVED, &buf);
> +			if (!ret) {
> +				/* Ack next byte from master */
> +				writeb(0x69, base + GXP_I2CSCMD);
> +			} else {
> +				/* Nack next byte from master */
> +				writeb(0x61, base + GXP_I2CSCMD);
> +			}
> +		}
> +	} else {
> +		return false;
> +	}
> +
> +	return true;
> +}
> +#endif
> +
> +static irqreturn_t gxp_i2c_irq_handler(int irq, void *_drvdata)
> +{
> +	struct gxp_i2c_drvdata *drvdata = (struct gxp_i2c_drvdata *)_drvdata;
> +	u32 value;
> +	void __iomem *base = drvdata->base;
> +
> +	regmap_read(i2cg_map, GXP_I2CINTSTAT, &value);
> +	if (!(value & (1 << drvdata->engine)))
> +		return IRQ_NONE;
> +
> +	value = readb(base + GXP_I2CEVTERR);
> +
> +	/* Error */
> +	if (value & ~(MASK_MASTER_EVENT | MASK_SLAVE_CMD_EVENT |
> +				MASK_SLAVE_DATA_EVENT)) {
> +		pr_alert("[%s] I2C Error, GXP_I2CEVTERR = 0x%x\n", __func__,
> +			 value);

dev_ not pr_
So if you have recurring error on the bus, you will flood the warn with
alerts? Looks excessive. Interrupt handlers should avoid printing
messages. If they really need, then ratelimit?

> +
> +		/* Clear all events */
> +		writeb(0x00, base + GXP_I2CEVTERR);
> +		drvdata->state = GXP_I2C_ERROR;
> +		gxp_i2c_stop(drvdata);
> +		return IRQ_HANDLED;
> +	}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

if (IS_ENABLED(...))

> +	/* Slave mode */
> +	if (value & (MASK_SLAVE_CMD_EVENT | MASK_SLAVE_DATA_EVENT)) {
> +		if (gxp_i2c_slave_irq_handler(drvdata))
> +			return IRQ_HANDLED;
> +		pr_alert("[%s] I2C Error, GXP_I2CEVTERR = 0x%x\n",
> +			 __func__, value);

Same problem with prints

> +		return IRQ_NONE;
> +	}
> +#endif
> +
> +	/*  Master mode */
> +	switch (drvdata->state) {
> +	case GXP_I2C_ADDR_PHASE:
> +		gxp_i2c_chk_addr_ack(drvdata);
> +		break;
> +
> +	case GXP_I2C_RDATA_PHASE:
> +		gxp_i2c_ack_data(drvdata);
> +		break;
> +
> +	case GXP_I2C_WDATA_PHASE:
> +		gxp_i2c_chk_data_ack(drvdata);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void gxp_i2c_init(struct gxp_i2c_drvdata *drvdata)
> +{
> +	void __iomem *base = drvdata->base;
> +
> +	drvdata->state = GXP_I2C_IDLE;
> +	writeb(2000000 / drvdata->bus_frequency, base + GXP_I2CFREQDIV);
> +	writeb(0x32, base + GXP_I2CFLTFAIR);
> +	writeb(0x0a, base + GXP_I2CTMOEDG);
> +	writeb(0x00, base + GXP_I2CCYCTIM);
> +	writeb(0x00, base + GXP_I2CSNPAA);
> +	writeb(0x00, base + GXP_I2CADVFEAT);
> +	writeb(0xF0, base + GXP_I2CSCMD);
> +	writeb(0x80, base + GXP_I2CMCMD);
> +	writeb(0x00, base + GXP_I2CEVTERR);
> +	writeb(0x00, base + GXP_I2COWNADR);
> +}
> +
> +static int gxp_i2c_probe(struct platform_device *pdev)
> +{
> +	struct gxp_i2c_drvdata *drvdata;
> +	int rc;
> +	struct resource *res;
> +	struct i2c_adapter *adapter;
> +
> +	if (!i2c_global_init_done) {
> +		pr_info("[%s] I2c global init\n", __func__);

Nope, I don't get from where do you get this code. You should base your
driver on some recent Linux kernel driver.

1. No pr_ but dev_
2. No informational prints at all during probe.

> +		i2cg_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							   "hpe,sysreg-phandle");
> +		if (IS_ERR(i2cg_map)) {
> +			dev_err(&pdev->dev, "failed to map i2cg_handle\n");

return dev_err_probe

> +			return -ENODEV;
> +		}
> +
> +		/* Disable interrupt */
> +		regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);
> +		i2c_global_init_done = true;
> +	}
> +
> +	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct gxp_i2c_drvdata),

sizeof(*)

> +			       GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, drvdata);
> +	drvdata->dev = &pdev->dev;
> +	init_completion(&drvdata->completion);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	drvdata->base = devm_ioremap_resource(&pdev->dev, res);

It's one call, not two. Use the respective helper.

> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	drvdata->engine = (res->start & 0xf00) >> 8;
> +	pr_info("%s: i2c engine%d\n", __func__, drvdata->engine);

No prints in probe.

> +	if (drvdata->engine >= GXP_MAX_I2C_ENGINE) {
> +		dev_err(&pdev->dev, "i2c engine% is unsupported\n",
> +			drvdata->engine);
> +		return -EINVAL;

dev_err_probe

> +	}
> +
> +	rc = platform_get_irq(pdev, 0);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "unable to obtain IRQ number\n");
> +		return rc;

dev_err_probe

> +	}
> +
> +	drvdata->irq = rc;
> +	pr_info("[%s] i2c engine%d, rq = %d\n", __func__, drvdata->engine,
> +		drvdata->irq);

No prints...

> +
> +	rc = devm_request_irq(&pdev->dev, drvdata->irq, gxp_i2c_irq_handler,
> +			      IRQF_SHARED, gxp_i2c_name[drvdata->engine], drvdata);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "irq request failed\n");
> +		return rc;


dev_err_probe

> +	}
> +
> +	rc = of_property_read_u32(pdev->dev.of_node,
> +				  "hpe,i2c-max-bus-freq", &drvdata->bus_frequency);
> +	if (rc < 0) {
> +		dev_info(&pdev->dev,
> +			 "Could not read bus-frequency property, use default frequency:100000\n");

1. Use define, do not hard-code constants.
2. About property, I'll check in  bindings.

> +		drvdata->bus_frequency = GXP_I2C_BIT_RATE;
> +	}
> +
> +	gxp_i2c_init(drvdata);
> +
> +	/* Enable interrupt */
> +	regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine),
> +			   BIT(drvdata->engine));
> +
> +	adapter = &drvdata->adapter;
> +	i2c_set_adapdata(adapter, drvdata);
> +
> +	adapter->owner = THIS_MODULE;
> +	adapter->class = I2C_CLASS_DEPRECATED;
> +	strscpy(adapter->name, "HPE GXP I2C adapter", sizeof(adapter->name));
> +	adapter->algo = &gxp_i2c_algo;
> +	adapter->dev.parent = &pdev->dev;
> +	adapter->dev.of_node = pdev->dev.of_node;
> +
> +	rc = i2c_add_adapter(adapter);
> +	if (rc)
> +		dev_err(&pdev->dev, "i2c add adapter failed\n");

dev_err_probe() if you even need this.


> +
> +	return rc;
> +}
> +
> +static int gxp_i2c_remove(struct platform_device *pdev)
> +{
> +	struct gxp_i2c_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	pr_info("[%s] drvdata engine %d\n", __func__, drvdata->engine);

Really? On remove? No. Prints are not for debugging function calls. You
have ftrace for that.

> +	i2c_del_adapter(&drvdata->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id gxp_i2c_of_match[] = {
> +	{ .compatible = "hpe,gxp-i2c" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, gxp_i2c_of_match);
> +
> +static struct platform_driver gxp_i2c_driver = {
> +	.probe	= gxp_i2c_probe,
> +	.remove = gxp_i2c_remove,
> +	.driver = {
> +		.name = "gxp-i2c",
> +		.of_match_table = gxp_i2c_of_match,
> +	},
> +};
> +module_platform_driver(gxp_i2c_driver);
> +
> +MODULE_AUTHOR("Nick Hawkins <nick.hawkins@hpe.com>");
> +MODULE_DESCRIPTION("HPE GXP I2C bus driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

