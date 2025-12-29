Return-Path: <linux-i2c+bounces-14808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CECE5A27
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B13A3005FE4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D5E78F4A;
	Mon, 29 Dec 2025 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Zm+c/YrB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF71DDC07
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969799; cv=none; b=Qbv67zbRTKLfIFOehGTl+DwVpj+h9Uh2uyv6gvI8eACxd+sg0+WVSso7tjAIMeDFeUsbwa997ntsl4SW8eRk31KwAC6K89pqg8dDe4rT+ASiWNysfeCisTQdWMdKEoLUdXFj1+Gy48qjIMnUfg5hy9VJ9cWxT4EV7gzPcBhd5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969799; c=relaxed/simple;
	bh=lFyiWOVX2brlWtmVfHktauto4klGIhPgdGJJrRxezxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9CvioxzFxfUyPmUvAIVj2i1JddOQ7dx9yaMBjhQjyMdqiBENJDb0eGKlYYNmQIARidnftx/s+XzjSf+072hBYNdyloppW3D4EVby0XpmQIUZ1Nycxb9xmW/rDgnWHNqag8BAyHfaj6H+q+qZkBQHebREwuOS0epnJ8MO6eFQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Zm+c/YrB; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c0f13e4424so689471285a.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 16:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969795; x=1767574595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chd5C1r+QvEJa1mxnsnF87uCegfViBQfPxZ5xMBsCvk=;
        b=Zm+c/YrBg347nv62ykj+gewDVCCZLwtIja+JuuzqOmt9ho5I36OMQB5+I4DkvZWNqx
         jTnHctlpmCR58hCClmmWORi1TY2FdlUQqAhAtbgBxqbPo41Ma3/KK2fq11+5+8sQvfl4
         DwDdL/OAo4zpyHh/Cl70doYyXNIRRRaf+3lhERSxuNBTnDcAFD8H/KiYVZBpolwDz0+r
         mZv/R87Q4ZvMpCA+yPgHONLrfP//hTvc0BylshYRAwIcZY8YgfnvMyPyvc6yiq8pEk9j
         Ef1iiKrwRNVj08NKMzBirfgNnTE0MWVs26aUgWyqI47ffQr5muUaW41tAPJUhpvORh8q
         M34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969795; x=1767574595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chd5C1r+QvEJa1mxnsnF87uCegfViBQfPxZ5xMBsCvk=;
        b=Jd/iDbWnEzo/Td0+LLhEyA88KYf+XBTHksRTXYAcJbCOpWwyjKfOXEC9q2UFlGfKoM
         YF1Tj76Ar6uwlWhtu2Az3UI4We/1Q8CvLyiTMs0ozDWjbqau8W9xT7a6PEHway82kBTK
         N1h7eTXEAnIXvKAUk4Z5KIcLP2U4lgaomN+j1/ZYy6ecQfXkvznixh7hSZlnYFvn0kEv
         4vGqSq2unC/p5hd1JX3wPMErBCzFy043Aq0w84XV7YpKk89OIKBoqndbgncpU1E9dGJT
         e3B8lEoRU1ETtEZNDeT07NokkWB5w8EXr7IjK93y4bIw/pXJbRRJA46kXcZmcSHIXPro
         ad7w==
X-Gm-Message-State: AOJu0YwVmmuqCJzg+V9QdU72aIZ6NhB2oW1XKuX+dGgYH2gZYsLMr9a2
	mB7fLAdYQ6bBRCvP2KIhy0Jaek7Wg7jETKP67FbON+ExSX45os39IsnoaS7eCyoxxuR17gGUin2
	n8wLBfY8=
X-Gm-Gg: AY/fxX6OruNlY2EkSgXRBryN5SH120bCPkIuY2lorOZQC76NLqT07Oifv3nIL3172CS
	iZn1sQuNPSaDbJrXkEWFkiyX5xda40465/JZrPJnMtwiR7lcp6h6+eNdEUGO/vDlnnTdHdjSU+i
	fkEYX0Tmpf2y0kJLEYQ5CCNfWzWi+pWcuSDH5uUv1TP65Mwaa/k+2UFP+sXr6fM76h5kaJ+pT0z
	qT1U/a0VkeOyp3bjRIYeQ+ShHyK8UZWvxWl3SUpXNd9h6saNmXgaX2NZVPuOKtD1Y/hsAXgjB90
	rmjv1xpc7xXVXdFWAS7cv3zg9aP0lQL9z51yZKv0EFCnmBQk7dGGB5dqzfdKM0pjKdrsmtFFf8J
	fvTDfj2skhC6R+9W1tpb8Mm2Qa0K7JR7In4BGC+kiRPJ7wJ65zSoWs+C/TEGin/B0LK79kEcrT3
	5AQDO46U1GqEcM82o/wwJ2bOaBqtaJUkDZsX4tJPmp64p++WvdzEPFX73n6VGuHA==
X-Google-Smtp-Source: AGHT+IFZSL7EFbyMmKAmixx8BTsel/aBaAMunHwCL+sqd0dnzMbqM/E6+DHOSM5tZsDvXytxhtdC2Q==
X-Received: by 2002:a05:620a:7106:b0:8b1:be0f:da52 with SMTP id af79cd13be357-8c08fc00204mr3891810485a.7.1766969794706;
        Sun, 28 Dec 2025 16:56:34 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:34 -0800 (PST)
Message-ID: <c908f647-9460-4899-b4b1-489a3f95eafa@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:33 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-2-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-2-b5807b7dd0e6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 2:32 AM, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.

Was the above sentence meant to describe what the first
patch did?

I have a few comments below.

> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v5:
> - use __ffs() instead of *_SHIFT
> - remove useless *_SHIFT
> - check return value when scl clk name array is truncated
> - rebase to v6.19-rc1
> - Link to v3: https://lore.kernel.org/all/20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com/
> 
> Changelog in v4:
> - initialize clk_init_data with {} so that init.flags is implicitly set to 0
> - minor cleanup and style fixes for better readability
> - remove unused spacemit_i2c_scl_clk_exclusive_put() cleanup callback
> - replace clk_set_rate_exclusive()/clk_rate_exclusive_put() pair with clk_set_rate()
> - simplify LCR LV field macros by using FIELD_GET/FIELD_MAX helpers
> - Link to v3: https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/
> 
> Changelog in v3:
> - use MASK macro in `recalc_rate` function
> - rename clock name
> - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
> 
> Changelog in v2:
> - Align line breaks.
> - Check `lv` in `clk_set_rate` function.
> - Force fast mode when SCL frequency is illegal or unavailable.
> - Change "linux/bits.h" to <linux/bits.h>
> - Kconfig: Add dependency on CCF.
> - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> ---
>   drivers/i2c/busses/Kconfig  |   2 +-
>   drivers/i2c/busses/i2c-k1.c | 146 +++++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 139 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index cea87fcb4a1a945f805e9eff25d2f7ab9f61ddf9..b13fb7155786c246229f5e17aa57603c5e755683 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -799,7 +799,7 @@ config I2C_JZ4780
>   config I2C_K1
>   	tristate "SpacemiT K1 I2C adapter"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on OF
> +	depends on OF && COMMON_CLK
>   	help
>   	  This option enables support for the I2C interface on the SpacemiT K1
>   	  platform.
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 30cdf733deef264061c8ea565634c5a17f5aebfd..f0c35e23f4f2e139da0d09f314f3eb0e0462a382 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -4,7 +4,9 @@
>    */
>   
>   #include <linux/bitfield.h>
> +#include <linux/bits.h>
>   #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/i2c.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
> @@ -16,6 +18,7 @@
>   #define SPACEMIT_ISR		 0x4		/* Status register */
>   #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
>   #define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>   #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>   
>   /* SPACEMIT_ICR register fields */
> @@ -87,6 +90,11 @@
>   #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>   #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
>   
> +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
> +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(17, 9)

I think the code would be clearer if you just used these
FIELD_MAX() macros (below) where their values are used,
rather than defining this symbolic value.

If you had been assigning something different than the maximum,
I think a new symbol would be warranted, but since it's the max,
just say "we're using the maximum" in the code.

> +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	FIELD_MAX(SPACEMIT_LCR_LV_STANDARD_MASK)
> +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		FIELD_MAX(SPACEMIT_LCR_LV_FAST_MASK)
> +
>   /* i2c bus recover timeout: us */
>   #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
>   
> @@ -104,11 +112,20 @@ enum spacemit_i2c_state {
>   	SPACEMIT_STATE_WRITE,
>   };
>   
> +enum spacemit_i2c_mode {
> +	SPACEMIT_MODE_STANDARD,
> +	SPACEMIT_MODE_FAST

Will there ever be a mode other than standard and fast?

Just use a Boolean variable to indicate the mode, maybe
named fast_mode, so false means standard mode.

> +};
> +
>   /* i2c-spacemit driver's main struct */
>   struct spacemit_i2c_dev {
>   	struct device *dev;
>   	struct i2c_adapter adapt;
>   
> +	struct clk_hw scl_clk_hw;
> +	struct clk *scl_clk;
> +	enum spacemit_i2c_mode mode;
> +
>   	/* hardware resources */
>   	void __iomem *base;
>   	int irq;
> @@ -129,6 +146,77 @@ struct spacemit_i2c_dev {
>   	u32 status;
>   };
>   

I don't think this (next) function is needed.

> +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> +{
> +	struct spacemit_i2c_dev *i2c = data;
> +
> +	clk_disable_unprepare(i2c->scl_clk);
> +}
> +
> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lv, lcr, mask, max_lv;
> +
> +	lv = DIV_ROUND_UP(parent_rate, rate);

Would DIV_ROUND_CLOSEST() produce more accurate rates?  This
question applies everywhere you use something like this.

Since clk_round_rate() returns the exact rate that the clock
would provide for a given rate, it can be nice to have
clk_set_rate() use clk_round_rate().  As it is, it looks
like your clk_round_rate() returns a frequency value even if
the requested rate is out of range, while clk_set_rate()
would return an error when provided the same out-of-range
requested rate.

> +
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> +		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
> +		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> +		mask = SPACEMIT_LCR_LV_FAST_MASK;
> +		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> +	}

Since the standard and fast masks are distinct, what
is the meaning when they both have non-zero values?
Does the SPACEMIT_CR_MODE_FAST determine which of these
two fields is used, and the other is ignored?

> +
> +	if (!lv || lv > max_lv) {
> +		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> +		return -EINVAL;
> +	}
> +
> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +	lcr &= ~mask;
> +	lcr |= lv << __ffs(mask);
> +	writel(lcr, i2c->base + SPACEMIT_ILCR);

I suppose you can't use FIELD_MODIFY() here, because mask is
not constant.

I guess field_modify() should be defined; see c1c6ab80b25c8
("bitfield: Add non-constant field_{prep,get}() helpers").
But I'm not going to ask you to do that...

In any case, you could use this instead:

	lcr = readl(i2c->base + SPACEMIT_ILCR);
	lcr &= ~mask;
	lcr |= field_prep(mask, lv);
	writel(lcr, i2c->base + SPACEMIT_ILCR);

And if you're going to assign the max value, you could even do:

	lcr = readl(i2c->base + SPACEMIT_ILCR);
	lcr |= field_prep(mask, field_max(mask));
	writel(lcr, i2c->base + SPACEMIT_ILCR);

> +
> +	return 0;
> +}
> +
> +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long *parent_rate)
> +{
> +	u32 lv, freq;
> +
> +	lv = DIV_ROUND_UP(*parent_rate, rate);

Could lv contain 0 at this point?

> +	freq = DIV_ROUND_UP(*parent_rate, lv);
> +
> +	return freq;
> +}
> +
> +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lcr, lv = 0;
> +
> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD)
> +		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
> +	else if (i2c->mode == SPACEMIT_MODE_FAST)
> +		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
> +	else
> +		return 0;

What if lv contains 0 at this point?

> +	return DIV_ROUND_UP(parent_rate, lv);
> +}
> +
> +static const struct clk_ops spacemit_i2c_clk_ops = {
> +	.set_rate = spacemit_i2c_clk_set_rate,
> +	.round_rate = spacemit_i2c_clk_round_rate,
> +	.recalc_rate = spacemit_i2c_clk_recalc_rate,
> +};
> +
>   static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 val;
> @@ -147,6 +235,29 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   
> +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> +						 struct clk *parent)
> +{
> +	struct clk_init_data init = {};
> +	char name[64];
> +	int ret;
> +
> +	ret = snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> +	if (ret >= ARRAY_SIZE(name))
> +		dev_warn(i2c->dev, "scl clock name truncated");
> +
> +	init.name = name;
> +	init.ops = &spacemit_i2c_clk_ops;
> +	init.parent_data = (struct clk_parent_data[]) {
> +		{ .fw_name = "func" },
> +	};
> +	init.num_parents = 1;
> +
> +	i2c->scl_clk_hw.init = &init;
> +
> +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> +}
> +
>   static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
>   {
>   	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> @@ -257,7 +368,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   	 */
>   	val |= SPACEMIT_CR_DRFIE;
>   
> -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +	if (i2c->mode == SPACEMIT_MODE_FAST)
>   		val |= SPACEMIT_CR_MODE_FAST;
>   
>   	/* disable response to general call */
> @@ -545,14 +656,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>   
>   	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
> +	} else {
> +		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
> +		i2c->mode = SPACEMIT_MODE_FAST;

I might just be missing something while reviewing, but if it's
out of range, what rate is used?  Does clk_set_rate() force it
to be valid?

You could combine the fast rate conditions:

	if (!i2c->clock_freq ||
	    i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
		if (i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
			dev_warn("too fast... using %u", MAX);
			i2c->clock_freq = MAX;
		}
		i2c->mode = SPACEMIT_MODE_FAST;
	} else {
		i2c->mode = SPACEMIT_MODE_STANDARD;
	}

>   		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>   	}
>   
>   	i2c->dev = &pdev->dev;
> @@ -574,10 +686,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
>   
> +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> +	if (IS_ERR(i2c->scl_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> +				     "failed to register scl clock\n");
> +
>   	clk = devm_clk_get_enabled(dev, "bus");
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>   
> +	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
> +
> +	ret = clk_prepare_enable(i2c->scl_clk);

Just use:

	ret = devm_clk_get_enabled(i2c->scl_clk);

					-Alex

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
> +
> +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register cleanup action for clk disable and unprepare");
> +
>   	spacemit_i2c_reset(i2c);
>   
>   	i2c_set_adapdata(&i2c->adapt, i2c);
> 


