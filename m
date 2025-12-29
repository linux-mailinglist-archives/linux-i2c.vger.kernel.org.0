Return-Path: <linux-i2c+bounces-14813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661CCE5B4B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 02:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10D553003523
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1858A22F74D;
	Mon, 29 Dec 2025 01:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="svqj1OJ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6781724;
	Mon, 29 Dec 2025 01:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766972930; cv=none; b=gbxzAptakBprrEHqEfl9bQDvG9EYodDsTVloVl1wgT65Y+S4zTjZ71a7ZfF37iCtNB9vXNbRdePMG07y1Hm/0WNyk+bkxWQ7XErRZ+9xmz5OnLJ81v4LREFe/hBdYBgLaOqDvxCnNxiUXJI/HfILj4846v2uywrhpt380fQzFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766972930; c=relaxed/simple;
	bh=I2S8U9E2PDYYAhIBEi5OpvGwaYLqVjdS+2NSpXWICS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq+/0gQnGJl+BwZqP5w0dwtyZAg/tp30yonquRuINU4RpDLAyyZn3G77XTiW4Z2MZx+P3maNWrwq4H5fPo51o0zBQgNqeq6SKp0hUEky52gVHTJMhujAJ0rORoNo7plg+ZDznWaJ1wsiBKj9Bz6rH0xh2RQ012TlI0Bn/TD0Ixg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=svqj1OJ6; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766972851;
	bh=pKp4BBBIzjtkrzHb/TY0Sl2Q7CgjyC3CDa0BygRoEz8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=svqj1OJ6z8PotYvGJ31W3RIARbC40HzAz9k8EUa7ClUs6DP7AKctwmuQFefjEiwDC
	 GeqG/Bymm8ASQB4ws7xa8g1ofyzTFLhANDgdzkWpWG2zYNS6T7Oyaxine015+F2NfQ
	 GyOKupOLb5Mb87FYLLt0CkJcjrv4yHRTsZlaMSTY=
X-QQ-mid: zesmtpsz9t1766972845t1d74bf97
X-QQ-Originating-IP: 6Txu1FUhwNOVdW4fl7stehIexYlfVE6QKCcW/5Pak58=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:47:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2698254073377554635
EX-QQ-RecipientCnt: 8
Date: Mon, 29 Dec 2025 09:47:23 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <04D8C3B41BE04120+aVHdqwWZmkPDVGtz@kernel.org>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-2-b5807b7dd0e6@linux.spacemit.com>
 <c908f647-9460-4899-b4b1-489a3f95eafa@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c908f647-9460-4899-b4b1-489a3f95eafa@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWLpwLZrMWrIXaUnIu+eOoYvOELtg9D1Rbus24AAFiWcbI9PERxWsXYG
	Idb76FeA2vyP0dc+aaK6NGxIS6UoQiMUP7+Tq0vbRaklfoQOuB/l8Nkz5SEg9ZaMAjS+JF6
	B+xI7T9Lrgx3hYGTBVpJsvtbArWVFoIk+J/ZJ52TzeKo7u64JwWrx98dzzEVeu0qFCUVDce
	uQAGiSXjF2blDWRh1hC3YHdJy4L7Yk1gFYMSyS4lSgvY0V8lGd0Q60o4eJZGNKakXGYl53k
	q+qEVEYguvykwj9k28MaxXI5QQcxAy+LvdtbVe9X4yQBIaZeJpk39bwFWTHuRt5pbrsXDkL
	JW/aSukou2wl9tfLhOEXTM/2E0osgeyfAznn0TJJBFTTBIO0CQgIp8kkqjQ1PRKDdaRb0j1
	itR8Bqyf6AUMCl5zPNbGjfhRB6HD3cpAHOywxo7yQo8arUZWYnZaSK43RgrgzcRTDURheoX
	bdlBYqUflcEI1Ck/+1cUibgA6FDR6QKDg6/iZedk6V53Ve1ktXSrLNl1ONmatXJ1W0y7/4c
	GTyoQThFeVQkJHikfKysPimeKUVSPcQ+9DVAJREEmklCu5+baJsq2Qf8zEUf3LOqMragx+z
	72+oMytJ5k1CSiIQFYddnGRp254Pw09m2ryUNjWTEDcotabgk037yH5NFpy6gMjMuWzeXrh
	xO5Q1wmoW9J1sLWaBxDFZKOMMDMIXzFrtI+O3ORXoebErMKjSUEphs8RkCpcblRkSMLQ4lX
	/lpJ8iIfRACIxikVYW7dkVywLBV4sTPRPACU9EE1312fGO4vDSI47fogKQvVg2Q10xura65
	zOEY81Yj/hM6RqNpWP/CTQyr2NM64YGyI4l8LTlbgol2MCYEFkvB93jUQ4sFEO8M4H0su+v
	J0LjI4Fl4IBRUhcQNjSDRpmnlcIJYdvEILbmtb4dVg52t5depJoDzOTJzPrq+R3S4sNreFD
	xw+ogK/RCDljDDRDHN+7HD+OiPEuASBwvfbOWdwKugHULRVKqS+uurewkcsenAzN7wfKkBM
	F5N2cuPaLFDu+MkoWDknDXjzcJNyVOvIsFJcEXC+te7FpTAnL0nyO5t4IouPnoGaVjDUAI7
	w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 06:56:33PM -0600, Alex Elder wrote:
> On 12/26/25 2:32 AM, Troy Mitchell wrote:
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
> 
> Was the above sentence meant to describe what the first
> patch did?
Yes, I forgot to remove.

> 
> I have a few comments below.
[...]
> 
> > @@ -104,11 +112,20 @@ enum spacemit_i2c_state {
> >   	SPACEMIT_STATE_WRITE,
> >   };
> > +enum spacemit_i2c_mode {
> > +	SPACEMIT_MODE_STANDARD,
> > +	SPACEMIT_MODE_FAST
> 
> Will there ever be a mode other than standard and fast?
> 
> Just use a Boolean variable to indicate the mode, maybe
> named fast_mode, so false means standard mode.
I have talked about that [1]
> 
> > +};
> > +
> >   /* i2c-spacemit driver's main struct */
> >   struct spacemit_i2c_dev {
> >   	struct device *dev;
> >   	struct i2c_adapter adapt;
> > +	struct clk_hw scl_clk_hw;
> > +	struct clk *scl_clk;
> > +	enum spacemit_i2c_mode mode;
> > +
> >   	/* hardware resources */
> >   	void __iomem *base;
> >   	int irq;
> > @@ -129,6 +146,77 @@ struct spacemit_i2c_dev {
> >   	u32 status;
> >   };
> 
> I don't think this (next) function is needed.
I agree this is a very small wrapper.
But it is intended to be used as a devm_add_action_or_reset() callback, so
that we can avoid additional goto-based error handling in probe().

> 
> > +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> > +{
> > +	struct spacemit_i2c_dev *i2c = data;
> > +
> > +	clk_disable_unprepare(i2c->scl_clk);
> > +}
> > +
> > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lv, lcr, mask, max_lv;
> > +
> > +	lv = DIV_ROUND_UP(parent_rate, rate);
> 
> Would DIV_ROUND_CLOSEST() produce more accurate rates?  This
> question applies everywhere you use something like this.
> 
> Since clk_round_rate() returns the exact rate that the clock
> would provide for a given rate, it can be nice to have
> clk_set_rate() use clk_round_rate().  As it is, it looks
> like your clk_round_rate() returns a frequency value even if
> the requested rate is out of range, while clk_set_rate()
> would return an error when provided the same out-of-range
> requested rate.
Right, this implies that clk_round_rate() should only return rates that
clk_set_rate() can accept.
I will switch to using DIV_ROUND_CLOSEST() and drop the max_lv check in
clk_set_rate() to keep the behavior consistent.
> 
> > +
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> > +		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
> > +		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> > +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> > +		mask = SPACEMIT_LCR_LV_FAST_MASK;
> > +		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> > +	}
> 
> Since the standard and fast masks are distinct, what
> is the meaning when they both have non-zero values?
> Does the SPACEMIT_CR_MODE_FAST determine which of these
> two fields is used, and the other is ignored?
Yes, This is hardware behavior.
> 
> > +
> > +	if (!lv || lv > max_lv) {
> > +		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> > +		return -EINVAL;
> > +	}
> > +
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +	lcr &= ~mask;
> > +	lcr |= lv << __ffs(mask);
> > +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> 
> I suppose you can't use FIELD_MODIFY() here, because mask is
> not constant.
> 
> I guess field_modify() should be defined; see c1c6ab80b25c8
> ("bitfield: Add non-constant field_{prep,get}() helpers").
> But I'm not going to ask you to do that...
> 
> In any case, you could use this instead:
> 
> 	lcr = readl(i2c->base + SPACEMIT_ILCR);
> 	lcr &= ~mask;
> 	lcr |= field_prep(mask, lv);
> 	writel(lcr, i2c->base + SPACEMIT_ILCR);
> 
> And if you're going to assign the max value, you could even do:
> 
> 	lcr = readl(i2c->base + SPACEMIT_ILCR);
> 	lcr |= field_prep(mask, field_max(mask));
> 	writel(lcr, i2c->base + SPACEMIT_ILCR);
Thanks! Since clk_round_rate() uses DIV_ROUND_CLOSEST(), clk_set_rate() no
longer needs to validate the divider value.
I will remove the lv check and use FIELD_MODIFY() instead.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +					unsigned long *parent_rate)
> > +{
> > +	u32 lv, freq;
> > +
> > +	lv = DIV_ROUND_UP(*parent_rate, rate);
> 
> Could lv contain 0 at this point?
lv can't be 0.

> 
> > +	freq = DIV_ROUND_UP(*parent_rate, lv);
> > +
> > +	return freq;
> > +}
> > +
> > +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> > +						  unsigned long parent_rate)
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lcr, lv = 0;
> > +
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD)
> > +		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
> > +	else if (i2c->mode == SPACEMIT_MODE_FAST)
> > +		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
> > +	else
> > +		return 0;
> 
> What if lv contains 0 at this point?
The scl clock is: parent_clk_rate / lv.
So idk the hardware behavior if lv is 0.
I'll check the lv value.
> 
> > +	return DIV_ROUND_UP(parent_rate, lv);
> > +}
> > +
> > +static const struct clk_ops spacemit_i2c_clk_ops = {
> > +	.set_rate = spacemit_i2c_clk_set_rate,
> > +	.round_rate = spacemit_i2c_clk_round_rate,
> > +	.recalc_rate = spacemit_i2c_clk_recalc_rate,
> > +};
> > +
> >   static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
> >   {
> >   	u32 val;
> > @@ -147,6 +235,29 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
> >   	writel(val, i2c->base + SPACEMIT_ICR);
> >   }
> > +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> > +						 struct clk *parent)
> > +{
> > +	struct clk_init_data init = {};
> > +	char name[64];
> > +	int ret;
> > +
> > +	ret = snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> > +	if (ret >= ARRAY_SIZE(name))
> > +		dev_warn(i2c->dev, "scl clock name truncated");
> > +
> > +	init.name = name;
> > +	init.ops = &spacemit_i2c_clk_ops;
> > +	init.parent_data = (struct clk_parent_data[]) {
> > +		{ .fw_name = "func" },
> > +	};
> > +	init.num_parents = 1;
> > +
> > +	i2c->scl_clk_hw.init = &init;
> > +
> > +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> > +}
> > +
> >   static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
> >   {
> >   	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> > @@ -257,7 +368,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >   	 */
> >   	val |= SPACEMIT_CR_DRFIE;
> > -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > +	if (i2c->mode == SPACEMIT_MODE_FAST)
> >   		val |= SPACEMIT_CR_MODE_FAST;
> >   	/* disable response to general call */
> > @@ -545,14 +656,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >   		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> >   	/* For now, this driver doesn't support high-speed. */
> > -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> > +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> > +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> > +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_STANDARD;
> > +	} else {
> > +		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> 
> I might just be missing something while reviewing, but if it's
> out of range,
>
> what rate is used?  Does clk_set_rate() force it
> to be valid?
If it's out of range, it's high-speed mode. up to 3.3MHZ
set|round|recal_rate don't support. bcs that's another filed in ILCR.
> 
> You could combine the fast rate conditions:
> 
> 	if (!i2c->clock_freq ||
> 	    i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> 		if (i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> 			dev_warn("too fast... using %u", MAX);
> 			i2c->clock_freq = MAX;
> 		}
No, when add high-speed mode, it must be destroy.

> 		i2c->mode = SPACEMIT_MODE_FAST;
> 	} else {
> 		i2c->mode = SPACEMIT_MODE_STANDARD;
> 	}
> 
> >   		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> > -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> >   	}
> >   	i2c->dev = &pdev->dev;
> > @@ -574,10 +686,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >   	if (IS_ERR(clk))
> >   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> > +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> > +	if (IS_ERR(i2c->scl_clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> > +				     "failed to register scl clock\n");
> > +
> >   	clk = devm_clk_get_enabled(dev, "bus");
> >   	if (IS_ERR(clk))
> >   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> > +	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
> > +
> > +	ret = clk_prepare_enable(i2c->scl_clk);
> 
> Just use:
> 
> 	ret = devm_clk_get_enabled(i2c->scl_clk);
Thanks.

Link: https://lore.kernel.org/all/BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org/ [1]

                            - Troy
> 
> 					-Alex
> 
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
> > +
> > +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to register cleanup action for clk disable and unprepare");
> > +
> >   	spacemit_i2c_reset(i2c);
> >   	i2c_set_adapdata(&i2c->adapt, i2c);
> > 
> 
> 

