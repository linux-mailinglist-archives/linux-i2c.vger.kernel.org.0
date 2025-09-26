Return-Path: <linux-i2c+bounces-13205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B7BA3D72
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 15:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05CA97413F6
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 13:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEBA2EC55B;
	Fri, 26 Sep 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pmKlua2q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9181E571;
	Fri, 26 Sep 2025 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892529; cv=none; b=IOZyNi9DqLO1Zchihhvi1jH4PgB5tdDRKpjQ44YoLZtNA63F1uu+lUp1J2fbCI4sIUNycOCZ2YpJPRh3eYWWJmELsnR4t81fykbVo1RmlSbUkqVserPE+X6+GMiNdL7zKHOimaYs9DMjTnqCkctVVMN+/lKW1DfVGi7S23fJ1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892529; c=relaxed/simple;
	bh=TP4y7btQ2yuNPHcgufcuSpIh5LLrl9hUvTpYYi94+3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2sr1mdefTK5B49dqgk0162tDqe/6G5wwTMzhxvp4LeJDGQ2+M4pMBo7mkwrABEBBzytzER/3GJnJkeaWtHtQQELxq8fsfL+gyJcfYy9kdoIzTlDHNAddzNwURTvgR/AiuhqW6EkpT87e3F6E94MioGrQ786fs5qXQEp15R0peQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pmKlua2q; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758892447;
	bh=s6CtHE1/1WmxKMTN9D3vwoe2Ga2u3KBuHe0wYjxJ1VU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=pmKlua2qjeQd6kxnTID5obBVUlgQ2CveCTlMlr28R9ORsICE8T1J5TSIiZw9/M5zx
	 /HmeO9QRfRgXXxKlLiF2PKKyaJfKp4N6bAvU8jWktMj2+VagDtngD2duN2dLBhqfvE
	 Utn/lp1b8hz+ayRjXbUBF2Y5fFcqKsG04Ayvy1SY=
X-QQ-mid: esmtpsz21t1758892440t15b7130e
X-QQ-Originating-IP: kpUVCoQgfxE8DW5ibzlGKMt0fyzU8Nb9xixsMe3my2U=
Received: from = ( [58.254.68.229])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Sep 2025 21:13:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6412552634682604585
EX-QQ-RecipientCnt: 9
Date: Fri, 26 Sep 2025 21:13:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926111055-GYB1324993@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MkOD54hCLcMzeNRWAVQoGA4kZLWfjp/s8LTDXN6+OSacjryOVv6XILTn
	Zp7nZUEyVYVxOB+SGDjZ+2huq7hUpa6o9KWbuV9XZcpstUXBA18cYCBOJaYH5T/QfvIZhqo
	dAwg6pM0q4lSbG5NAPIPuFKeCC8UO7nd6y22eyQjG5kxL/Wb3eVK+BNVSS2/AeOguwkx+7a
	g4UlB5F3jgH3lrxixpYRNfr89qo4f5u0gAunP7QIma5Zs/DsQdcBdFVMz0Gnsm6RtHDF7Hw
	t6Bz+OtjbyV7YkcEx1X3rbHMJ+1Szy+6Vy6NC8uzIt4+KeJqa0Fn+DmHsz4+PVFQmx0w6aI
	47Ocewie6Z1mAP1V8sElOeCL+1yM8bILGvPoZR0puQEGNOtK4SA1gTtqkHYmWtO9mTK3oKU
	AqZUhoDeB2BTdAcoelbIs/I4DCIrEXs59wqCAXBi6z0vvwaNb8R8ptHPo+YsJZ2umXC2QFM
	2PX00oXyynsRysP6rEikojchwf/z4mMFmG3jijOiCKdkC1bIVI+keGyyf6FxzfYDBGeHcBq
	r9dmCbJ97R31LUnY0vv1JNBV63Nl7dm8WjrkJWoJc/sYkO/NA/2v1K/eemob77QoNP3CwBH
	c8MeT+DRzE5NvEbrkE8FdCh4riLheYUEkBnxm03dyDvqRg7lLpBBpa+oKSb3zFASTD/Z2WY
	FHY465sKnFfd36EcbV6nKH+MjZFVKEvW67pcaqs61i3qrS4AcTdS3hRWbcCCeZ/1Y9EWRPt
	8iDZl2OF3rOTlUDSdD5KrLjfIiWXAGcP8IcNLd+mEYRCMEoLh27D5We00UgT0AINZp9AG8n
	tQ7tboDzNAYtz8hndHFFmb60NwXcrL7PVx3dHAmoIsnIXxIKABZxZb8eVeW9SZ/KZyHYCTC
	ak50fxCIf5GJYWxiVR/BbIPsr9xIhY96CjkKDWoci3dqKUXzTDNG8WTpv5jkHSQ01lAB4BE
	UsCP229tIjLhm1YU8B59xZdpp3AldnnePNRjwFDu8B2Mq1qEJDq4KmNH/05UWVwlsBbRSU2
	82mAQhkUiRaPSO+JPs0ZRqL+i/7zae8kabdGHGdR0KYvLtTjdg6Nl9Nj3YM5O8jJPlN2xlu
	CyRVUXXaNTs8Q8feiK6WnJjV4ekhxMzBQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Fri, Sep 26, 2025 at 07:10:55PM +0800, Yixun Lan wrote:
> Hi Troy,
Hi Yixun,
Thanks for your review.

I have a question regarding the patch series.
Since patches 1–5 have already been merged,
should I keep the current version number and just send this single patch ?

About reply, see below.
> 
> On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C with interrupts disabled.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 140 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -97,6 +97,9 @@
> >  
> >  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> >  
> > +/* Constants */
> > +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> > +
> >  enum spacemit_i2c_state {
> >  	SPACEMIT_STATE_IDLE,
> >  	SPACEMIT_STATE_START,
> > @@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
> >  
> >  	enum spacemit_i2c_state state;
> >  	bool read;
> > +	bool is_pio;
> using_pio_mode or simply use_pio, but have to say..
> 
> I feel it's improper to have this flag here, since it's not a controller
> level feature, I understand it was introduced to support aotmic operation
> 
> Personally, I'd suggest to pass the flag in xfer(), then propagate down to
> whatever needed, so it limit to single transmission which more flexible
I agree. I'll move the flag to xfer().

> 
> >  	struct completion complete;
> >  	u32 status;
> >  };
> > @@ -206,9 +210,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
> >  	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
> >  		return 0;
> >  
> > -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> > -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> > -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> > +	if (!i2c->is_pio)
> > +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> > +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> > +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> > +	else
> > +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> > +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> question, since you have already used state-machine to track the I2C process,
> can you not poke hardware ISR register in a scatter way?

>
> I'd rather see it handled
> more closely in a interrupt context or related?
> 
> btw, does some bits of the ISR register have read-then-clear feature?
> which may require special attention to handle..
I’m not reading the ISR state all over the place. It is only accessed in
spacemit_i2c_wait_bus_idle() and spacemit_i2c_check_bus_release().
The first one is used before a transfer starts, and the second one is used
after a transfer error. In these cases I don’t see a way to rely on the
irq_handler to get the information in time.

In addition, with PIO support, the ISR needs to be read inside
wait_pio_xfer(). This is required, otherwise we can’t know when to
proceed with RX/TX.

As you mentioned, some ISR bits are indeed read-to-clear. I’ve already
added handling for that in the irq_handler to avoid losing events.
> 
> >  	if (ret)
> >  		spacemit_i2c_reset(i2c);
> >  
> > @@ -226,7 +235,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
> >  
> >  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  {
> > -	u32 val;
> > +	u32 val = 0;
> >  
> >  	/*
> >  	 * Unmask interrupt bits for all xfer mode:
> > @@ -234,7 +243,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	 * For transaction complete signal, we use master stop
> >  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> >  	 */
> > -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > +	if (!i2c->is_pio)
> ..
> > +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> >  
> >  	/*
> >  	 * Unmask interrupt bits for interrupt xfer mode:
> > @@ -244,7 +254,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	 * i2c_start function.
> >  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> >  	 */
> > -	val |= SPACEMIT_CR_DRFIE;
> > +	if (!i2c->is_pio)
> ..
> > +		val |= SPACEMIT_CR_DRFIE;
> >  
> >  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> >  		val |= SPACEMIT_CR_MODE_FAST;
> > @@ -256,7 +267,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	val |= SPACEMIT_CR_SCLE;
> >  
> >  	/* enable master stop detected */
> > -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> > +	val |= SPACEMIT_CR_MSDE;
> > +
> > +	if (!i2c->is_pio)
> > +		val |= SPACEMIT_CR_MSDIE;
> can you converge all assignment under one if?
Yes, I'll fix it in the next version.

> >  
> >  	writel(val, i2c->base + SPACEMIT_ICR);
> >  
> > @@ -293,10 +307,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
> >  	/* send start pulse */
> >  	val = readl(i2c->base + SPACEMIT_ICR);
> >  	val &= ~SPACEMIT_CR_STOP;
> > -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> > +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> > +
> > +	if (!i2c->is_pio)
> > +		val |= SPACEMIT_CR_DTEIE;
> > +
> >  	writel(val, i2c->base + SPACEMIT_ICR);
> >  }
> >  
> > +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
> > +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> > +	int ret;
> > +
> > +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> > +		udelay(10);
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> > +
> > +		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
> > +			continue;
> > +
> > +		spacemit_i2c_irq_handler(0, i2c);
> 
> can you refactor and construct a new function? that can be reused between
> irq() and pio() cases, it makes people confused..
It makes sense. I will.
> 
> > +
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		/*
[...]
> >  
> > -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +static inline int
> > +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
> s/spacemit_i2c_xfer/spacemit_i2c_xfer_common/
Great suggesstion!

> 
> s/is_pio/atomic/, I'd suggest to distinguish 'pio' vs 'atomic'
Uh, But I wanna keep the original name 'pio' to avoid confusion.
In the public doc, It is named PIO..

> 
> >  {
> >  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> >  	int ret;
> >  
> > +	i2c->is_pio = is_pio;
> so, check my previous comment, you use this member to cache the flag..
> 
> > +
[...]
> >  
> >  static const struct i2c_algorithm spacemit_i2c_algo = {
> > -	.xfer = spacemit_i2c_xfer,
> > +	.xfer = spacemit_i2c_int_xfer,
> > +	.xfer_atomic = spacemit_i2c_pio_xfer,
> I'd suggest to align with core function's prototype,
> s/spacemit_i2c_int_xfer/spacemit_i2c_xfer/
> s/spacemit_i2c_pio_xfer/spacemit_i2c_pio_xfer_atomic /
Thanks.
                - Troy
> 
> >  	.functionality = spacemit_i2c_func,
> >  };
> >  
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> Yixun Lan (dlan)
> 

