Return-Path: <linux-i2c+bounces-13271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4376FBA7C6A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 03:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B063B22D8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 01:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEDF212559;
	Mon, 29 Sep 2025 01:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="rkN5HEus"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD11DD9AD;
	Mon, 29 Sep 2025 01:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759110401; cv=none; b=TUmwF5uOTjGe9rnLGD7wc1JIR9bWulWBWh9+Xk9iu5T7bJyKJJvoTtVNzEw/XTHSHHECjA3NM1KQkVStdmOHCigU3Kzpy3eGh6Etz2kB6GXU0P0N7/Q0QIxrEFkdcEdLqKa7SFxonzQUiFcHBtsdzXiLfrJRGRsf3/U1lO9kAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759110401; c=relaxed/simple;
	bh=LJfAbHZ16BWvcqB3naBNNXqrUib0wXTv1KnCSdKXh4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTWhv6Y+nCtWYY2TOf8KfilUh4yGriU70HA+a4eoJM7jkusS2HPywbUF5cvFrOjrSLCBPE5/n0PXcr0jeVEB9mv63NXQP4IVvKCWBgkmEbSlOLdcktrPhCNo9j52+F+qmiByzApw4RPYOE7Z1XROP294lQUClZIeXyEg12vD7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=rkN5HEus; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759110345;
	bh=wcAdC64IoDvuOrQvlgtX3SSK7I/0Gqzr371QiaJ0eJ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=rkN5HEusaX7RsK4hwfEuyyEI0TPGsrNZE/odfh/Pot3u0A3i40TWTzU7GTbYd8Y5U
	 llNow34QmLN1Jgdu2Bz/FJNAbRkizQjlbi3zDtN5ofq10qEXF6FVnvTqCZ7X3Mkeqw
	 CqgtiOqYmKUlpRHk/4rFIgY6jq8mB3KyyfX9nzpY=
X-QQ-mid: zesmtpsz9t1759110335td8ec3eee
X-QQ-Originating-IP: ZTEZqM8iQJKnO0ZTHvsvnhsW6346pK427L64pLl8GU8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 09:45:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11380537982907392339
EX-QQ-RecipientCnt: 7
Date: Mon, 29 Sep 2025 09:45:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <F5859CB0056D50CB+aNnkveYgP3BM7XNp@kernel.org>
References: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
 <20250928110327-GYA1346428@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928110327-GYA1346428@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NXtWG+81RC1NyLNNPH2mjPkqIQFVWFkfKfENO7/0n9XlAJEM863MRHlH
	iqKStHFdjSckbyOIahXCcxMcYbIh8SQk8c3lzawG/MRWwrEJ7vOzf00M4VTouj9gZ1DNOoe
	7nvtXGvCprUFm4geQe1Srsu/9PEfj/vVTkh3+X50kqg/CWjoCCEWJP8QCmEtQRYNz23St8w
	eJwAbI++RbWZvKP2REyFW6RtqHBkobN0mmC+sqZXLU2A+dr09G8cxWmgtz+IugZm9QgJWoN
	DL3scOGO5Wpg9mk15ob0Vgzr5UARAbneWWVcjz2iRcgZQt2OqRq7gbdv2M8zAjNBh5rniRP
	WyN4zsDvPoUeVkGiq6FFwSekW98gkMFeun0UXNlU2vWs/D3/wclWekvmRWcxgD/IE7RwLby
	lri988y8ZYiTJ0O0wqfqOLDm/7XLbDdM+kQHXUuq5jMYXFmhDQ6KaINkH7PsR4u+YwtZmDR
	JK0gmgNUsYj7HltsJKh2KFHcN9rnmTKkq6U9fLA+bjKyiM54OeBMqJO8oPeYcrWEW59ajrx
	GvRGwqBZgWS1pF8+OrLfP5sre/M/QthLbkUpTZEvQqDyoYuiOgUSSIGGu+aV9AgvhKRnKzE
	rgpc9pqbLWi+iujEQ4uHOSYo2icKHPjr39EahEhDo2OA6VZNhw4Ys1eIFS9333voyco3ss6
	41svTKLmtyrGOq3VFMNq+tif5LAxI21wxutc+fsNzdBjBYeu+BZmwVT3wckwi9z9cgDZh2U
	JIsspJpLzyKKRI0jM1KJnl+RummpNfAtijO4qX3/k1WiZ9TpGA5JvNXwhIDuXmER5EgPq9j
	X3wz9/0O/pNcaS6gintM3AqTdIO0kH1amdxJ8MYAxJBMsgQE2+KmANbqp5pz2FQTzvsNJjI
	s32jSmwWXZaf/DvG1AxGF5ROLvA66qMaQv7AMtD0VGq7c8pvVMakTcI9Epj3RApAh3CaA95
	z5pyLhy1QFqY/lKP5tEEUE2CK6W1q9veoDIoo2PHF4AoUrOIlf5ZSI5KXMhiBhQEbr+7XcI
	LSoUPumSG9Zlwyoto1BmmdQzrpe/+Z//OzEFmWTUZJTzU65ZRFBq3hfyxdw8otue/VPeKxq
	mb9RggATqNWv9cAQtlgw4vLWh9jelTZrOp5KQMNVIgU
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

Hi Yixun, Thanks for your review!

On Sun, Sep 28, 2025 at 07:03:27PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 17:06 Thu 14 Aug     , Troy Mitchell wrote:
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> > 
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > 
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> > 
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > Changelog in v3:
> > - use MASK macro in `recalc_rate` function
> > - rename clock name
> > - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
> > 
> > Changelog in v2:
> > - Align line breaks.
> > - Check `lv` in `clk_set_rate` function.
> > - Force fast mode when SCL frequency is illegal or unavailable.
> > - Change "linux/bits.h" to <linux/bits.h>
> > - Kconfig: Add dependency on CCF.
> > - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> > ---
> >  drivers/i2c/busses/Kconfig  |   2 +-
> >  drivers/i2c/busses/i2c-k1.c | 180 ++++++++++++++++++++++++++++++++++++++++----
> >  2 files changed, 167 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index c8d115b58e449b59a38339b439190dcb0e332965..1382b6c257fa4ba4cf5098d684c1bbd5e2636fd4 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -797,7 +797,7 @@ config I2C_JZ4780
> >  config I2C_K1
> >  	tristate "SpacemiT K1 I2C adapter"
> >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> > -	depends on OF
> > +	depends on OF && COMMON_CLK
> >  	help
> >  	  This option enables support for the I2C interface on the SpacemiT K1
> >  	  platform.
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index b68a21fff0b56b59fe2032ccb7ca6953423aad32..34b22969cf6789e99de58dd93dda6f0951069f85 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -3,17 +3,20 @@
> >   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
> >   */
> >  
> > - #include <linux/clk.h>
> > - #include <linux/i2c.h>
> > - #include <linux/iopoll.h>
> > - #include <linux/module.h>
> > - #include <linux/of_address.h>
> > - #include <linux/platform_device.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> >  
> >  /* spacemit i2c registers */
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> >  #define SPACEMIT_ISR		 0x4		/* Status register */
> >  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> > +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
> >  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> >  
> >  /* SPACEMIT_ICR register fields */
> > @@ -80,6 +83,19 @@
> >  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> >  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> >  
> > +#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
> > +#define SPACEMIT_LCR_LV_FAST_SHIFT		9
> > +#define SPACEMIT_LCR_LV_STANDARD_WIDTH		9
> > +#define SPACEMIT_LCR_LV_FAST_WIDTH		9
> ..
> > +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0)
> > +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0)
> using GENMASK() makes people even confusing since it's not a mask, I would
> suggest simply put value directly here, which is 0x1ff
> 
> > +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(SPACEMIT_LCR_LV_STANDARD_SHIFT +\
> > +						SPACEMIT_LCR_LV_STANDARD_WIDTH - 1,\
> > +						SPACEMIT_LCR_LV_STANDARD_SHIFT)
> same reason here, suggest simplify as
> #define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
> which is more readable and maintenace friendly
Thanks, I will.

> 
> > +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(SPACEMIT_LCR_LV_FAST_SHIFT +\
> > +						SPACEMIT_LCR_LV_FAST_WIDTH - 1,\
> > +						SPACEMIT_LCR_LV_FAST_SHIFT)
> > +
> ..[snip]
> > +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> > +						 struct clk *parent)
> > +{
> > +	struct clk_init_data init;
> > +	char name[32];
> > +
> > +	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> > +
> > +	init.name = name;
> > +	init.ops = &spacemit_i2c_clk_ops;
> > +	init.parent_data = (struct clk_parent_data[]) {
> > +		{ .fw_name = "func" },
> > +	};
> > +	init.num_parents = 1;
> ..
> > +	init.flags = 0;
> I think you can drop this line, by simply init it at declaration
> 	struct clk_init_data init = {};
Sounds good to me.

> ..
> > +
> > +	i2c->scl_clk_hw.init = &init;
> > +
> > +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> > +}
> > +
> >  static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
> >  {
> >  	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> > @@ -224,7 +352,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	 */
> >  	val |= SPACEMIT_CR_DRFIE;
> >  
> > -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > +	if (i2c->mode == SPACEMIT_MODE_FAST)
> >  		val |= SPACEMIT_CR_MODE_FAST;
> >  
> >  	/* disable response to general call */
> > @@ -519,14 +647,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> >  
> >  	/* For now, this driver doesn't support high-speed. */
> > -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> > +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> > +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> > +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_STANDARD;
> > +	} else {
> > +		dev_warn(i2c->dev, "invalid clock-frequency, using fast mode");
> s/using../fallback to fast mode/
Thanks.

> 
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> >  		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> > -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> >  	}
> >  
> >  	i2c->dev = &pdev->dev;
> > @@ -548,10 +677,33 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >  	if (IS_ERR(clk))
> >  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> >  
> > +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> > +	if (IS_ERR(i2c->scl_clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> > +				     "failed to register scl clock\n");
> > +
> >  	clk = devm_clk_get_enabled(dev, "bus");
> >  	if (IS_ERR(clk))
> >  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> you can use dev_err_ptr_probe()
Oh nice API, I will use it.
> 
> >  
> > +	ret = clk_set_rate_exclusive(i2c->scl_clk, i2c->clock_freq);
> why use _exclusive_ API? is there multi consumers? can you explain?
No multi consumers. I will use clk_set_rate() in the next version.
Thanks for you pointing it out. Nice catch!

                        - Troy
> 
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to set exclusive rate for SCL clock");
> > +
>  
> 
> -- 
> Yixun Lan (dlan)
> 
> 

