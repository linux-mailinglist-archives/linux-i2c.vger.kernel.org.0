Return-Path: <linux-i2c+bounces-12852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F2B52850
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 07:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E04D564C2A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 05:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF2F24BD04;
	Thu, 11 Sep 2025 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="o+xXjoOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B968329F31;
	Thu, 11 Sep 2025 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569939; cv=none; b=c4z5qK2EW5fGYm5P3tENgqVcXs19zeT8eIOIwj/3cx4DsyLeJJM6bPubiln2ySGlUrhhtj/tbop5cVrVohTn6jy3sCznYVIcJCHwfFss8nRAimDJ5WvNFwdQoa3hHmvfS4lkQiFtM7GOOS/YBcsgekGA3BLQIs8ZLXywwYLCZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569939; c=relaxed/simple;
	bh=H5jonDFHbG65KZ5OKa/kRL2jkFN84H+PxpIQsaewsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsoeRIm9i4LNXAHgDwXmc51TTG3p4/zDus9O4n8oGkXqSwYQ4rAzXCqwmB18/VkeWho8e0Uo/hxdDEBa4XH87bAAJ3j1coibMzIoHHPGIAdTpHlaQb5c5wn+C8GHMo/1LHNBC9QQTC68yTFim5B4/4m1cof556wBDQx8NPZBaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=o+xXjoOg; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757569843;
	bh=OIXI5kOeWiGTgBTW+aTuOQwjrv5hk73OkztHujK4Y0A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=o+xXjoOgklsPNMaSK9IGtLgg+EKp+zk5hz1Q4iyErxwavkZK04CbwiYvCaDDZo7/S
	 Kr+KagPB6yHHbu7o1dfgRGLcfKwtd/TWOHgSK8UWSHrYjtiBIE4OVLS4TcXIXygEuB
	 7x/699SZX9vlZncxbGeQLNTkOFcUhSaRwA3sJBXQ=
X-QQ-mid: zesmtpsz4t1757569837t4a70ed1d
X-QQ-Originating-IP: SH2cyfonqyFKF0DPCYETYGLWmn8kn9mKDWL4ETF9N3o=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 13:50:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8973411467968674582
EX-QQ-RecipientCnt: 7
Date: Thu, 11 Sep 2025 13:50:36 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <0E357339968F18D8+aMJjLLhA66Pe17I3@LT-Guozexi>
References: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NAUIJqpQ8r9OUMM5w/g9Qsto1YPK3gjvO96Ph+fm4+9afO39++HGg9Km
	MxdFoPBPjF61zT+SSfbfLFQJ4YQER+LXD37JFkRb9Lja365Hi88Mg8M/oV504yS6XIsOWW9
	QVIH5/DWMSmbLzrmkPztPHf46R2nUALHss/kE2Aj5muqPTPC0wL6J/1pu/UIEOtCd1dTzhY
	spPY9BnUyYWpjeHj8RKlzreBzTfYNkIacs/J0wmQZ3frTqDthgOxC8qAjR0grPRopN5nLeV
	sJM6d2OYhktDxlzqOvbkT5OKXjD09nloc4niNQgx8NsZ162D5ovwPZzQVfnNXfWZ1FOclyj
	AJA3bPW4LFY6NqliOTTwo3nqcKgFxsNMS4jwZYrygwCo3ZeaefNlxtmEhbnjH4DwvGUDVPx
	rHRH9ZC/Oqs+1BVQGENF/r3U79mHQq0inwmanstB8aCcO2HrOjyN6i0y/TWf9L83GaUwLQg
	PQPbRIIQ6C2yUG3LNFLYT6PfoLizilMg6EA5h53CNfhgSDZEpNxEXqD9YL40k4UD/OOP8hP
	Sul77cR4ZkpwmxElSKUj8MTHCx1Mr/Uai+yM6gL0EFyL8WX/hsygvTvbmqEDatscIdQl+2o
	xvYoHlYs+y5+QLb0KZTKHVWzcFHmvmGP6f7MTCdgy6S4KILr2Caq293h6yaHaONL0qqCPW8
	yu7RKpmsCqselRzQePXp69Zg5LKDfsiHVJ9mWh4hE8OWhgr6SBGXiKOpoXfrPMrrzhD7K84
	NjQJXRkn108OcC6Ych9AxIlRWQX2DsiWB3fJGu9yqjVRv+t9VnYrycpGsnFDNhZSGLdfbj0
	ywBiI7aAJsRnKl7d87rW3pvU2iKgJTGRthv8Szy/nwlyDJFTKv6dokdlV8zCMlG2Dto2K2p
	6iFzpKGSJQYasQf5oVxJDA5hGSpiIrcdoIiINdubBGPkxrMhmKaEJNhYiJyy0KaW4xGFDIg
	R6cuiskKgVjOeVNHbaYCRlis4DUu4lqBgOLZ482lXwVcLhrSaewO1aKhbP2bYqojThvv4DN
	hdMrs4vgKXAW+0z9OSnArKpfBPZFhUAWJVPEi1+QG8dR1GF1G/77QFTIepw6IOVK8yw3JD4
	vJf3HXDdqNaHhlGajZPtQ9TanDOh/wYJUdZkNvUxd6lRcOv9e9DNUM5W4o946qTDfdMk3Ad
	WdXJ
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Thu, Aug 14, 2025 at 05:06:01PM +0800, Troy Mitchell wrote:
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
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - use MASK macro in `recalc_rate` function
> - rename clock name
> - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
Gentle ping. Any comments on this patch?

It was last resent about 3 weeks ago.

                - Troy
> 
> Changelog in v2:
> - Align line breaks.
> - Check `lv` in `clk_set_rate` function.
> - Force fast mode when SCL frequency is illegal or unavailable.
> - Change "linux/bits.h" to <linux/bits.h>
> - Kconfig: Add dependency on CCF.
> - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> ---
>  drivers/i2c/busses/Kconfig  |   2 +-
>  drivers/i2c/busses/i2c-k1.c | 180 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 167 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index c8d115b58e449b59a38339b439190dcb0e332965..1382b6c257fa4ba4cf5098d684c1bbd5e2636fd4 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -797,7 +797,7 @@ config I2C_JZ4780
>  config I2C_K1
>  	tristate "SpacemiT K1 I2C adapter"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on OF
> +	depends on OF && COMMON_CLK
>  	help
>  	  This option enables support for the I2C interface on the SpacemiT K1
>  	  platform.
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index b68a21fff0b56b59fe2032ccb7ca6953423aad32..34b22969cf6789e99de58dd93dda6f0951069f85 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -3,17 +3,20 @@
>   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
>   */
>  
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -80,6 +83,19 @@
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
>  
> +#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
> +#define SPACEMIT_LCR_LV_FAST_SHIFT		9
> +#define SPACEMIT_LCR_LV_STANDARD_WIDTH		9
> +#define SPACEMIT_LCR_LV_FAST_WIDTH		9
> +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0)
> +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0)
> +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(SPACEMIT_LCR_LV_STANDARD_SHIFT +\
> +						SPACEMIT_LCR_LV_STANDARD_WIDTH - 1,\
> +						SPACEMIT_LCR_LV_STANDARD_SHIFT)
> +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(SPACEMIT_LCR_LV_FAST_SHIFT +\
> +						SPACEMIT_LCR_LV_FAST_WIDTH - 1,\
> +						SPACEMIT_LCR_LV_FAST_SHIFT)
> +
>  /* i2c bus recover timeout: us */
>  #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
>  
> @@ -95,11 +111,20 @@ enum spacemit_i2c_state {
>  	SPACEMIT_STATE_WRITE,
>  };
>  
> +enum spacemit_i2c_mode {
> +	SPACEMIT_MODE_STANDARD,
> +	SPACEMIT_MODE_FAST
> +};
> +
>  /* i2c-spacemit driver's main struct */
>  struct spacemit_i2c_dev {
>  	struct device *dev;
>  	struct i2c_adapter adapt;
>  
> +	struct clk_hw scl_clk_hw;
> +	struct clk *scl_clk;
> +	enum spacemit_i2c_mode mode;
> +
>  	/* hardware resources */
>  	void __iomem *base;
>  	int irq;
> @@ -120,6 +145,88 @@ struct spacemit_i2c_dev {
>  	u32 status;
>  };
>  
> +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> +{
> +	struct spacemit_i2c_dev *i2c = data;
> +
> +	clk_disable_unprepare(i2c->scl_clk);
> +}
> +
> +static void spacemit_i2c_scl_clk_exclusive_put(void *data)
> +{
> +	struct spacemit_i2c_dev *i2c = data;
> +
> +	clk_rate_exclusive_put(i2c->scl_clk);
> +}
> +
> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lv, lcr, mask, shift, max_lv;
> +
> +	lv = DIV_ROUND_UP(parent_rate, rate);
> +
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> +		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
> +		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> +		mask = SPACEMIT_LCR_LV_FAST_MASK;
> +		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
> +		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> +	}
> +
> +	if (!lv || lv > max_lv) {
> +		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> +		return -EINVAL;
> +	}
> +
> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +	lcr &= ~mask;
> +	lcr |= lv << shift;
> +	writel(lcr, i2c->base + SPACEMIT_ILCR);
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
> +		lv = (lcr & SPACEMIT_LCR_LV_STANDARD_MASK) >>
> +		     SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +	else if (i2c->mode == SPACEMIT_MODE_FAST)
> +		lv = (lcr & SPACEMIT_LCR_LV_FAST_MASK) >>
> +		     SPACEMIT_LCR_LV_FAST_SHIFT;
> +	else
> +		return 0;
> +
> +	return DIV_ROUND_UP(parent_rate, lv);
> +}
> +
> +static const struct clk_ops spacemit_i2c_clk_ops = {
> +	.set_rate = spacemit_i2c_clk_set_rate,
> +	.round_rate = spacemit_i2c_clk_round_rate,
> +	.recalc_rate = spacemit_i2c_clk_recalc_rate,
> +};
> +
>  static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
>  {
>  	u32 val;
> @@ -138,6 +245,27 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> +						 struct clk *parent)
> +{
> +	struct clk_init_data init;
> +	char name[32];
> +
> +	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> +
> +	init.name = name;
> +	init.ops = &spacemit_i2c_clk_ops;
> +	init.parent_data = (struct clk_parent_data[]) {
> +		{ .fw_name = "func" },
> +	};
> +	init.num_parents = 1;
> +	init.flags = 0;
> +
> +	i2c->scl_clk_hw.init = &init;
> +
> +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> +}
> +
>  static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
>  {
>  	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> @@ -224,7 +352,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 */
>  	val |= SPACEMIT_CR_DRFIE;
>  
> -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +	if (i2c->mode == SPACEMIT_MODE_FAST)
>  		val |= SPACEMIT_CR_MODE_FAST;
>  
>  	/* disable response to general call */
> @@ -519,14 +647,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>  
>  	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
> +	} else {
> +		dev_warn(i2c->dev, "invalid clock-frequency, using fast mode");
> +		i2c->mode = SPACEMIT_MODE_FAST;
>  		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
>  	i2c->dev = &pdev->dev;
> @@ -548,10 +677,33 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
>  
> +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> +	if (IS_ERR(i2c->scl_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> +				     "failed to register scl clock\n");
> +
>  	clk = devm_clk_get_enabled(dev, "bus");
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>  
> +	ret = clk_set_rate_exclusive(i2c->scl_clk, i2c->clock_freq);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to set exclusive rate for SCL clock");
> +
> +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_exclusive_put, i2c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				"failed to register cleanup action for exclusive SCL clock rate");
> +
> +	ret = clk_prepare_enable(i2c->scl_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
> +
> +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				"failed to register cleanup action for clk disable and unprepare");
> +
>  	spacemit_i2c_reset(i2c);
>  
>  	i2c_set_adapdata(&i2c->adapt, i2c);
> 
> ---
> base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
> change-id: 20250709-k1-i2c-ilcr-ea347e0850a4
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

