Return-Path: <linux-i2c+bounces-13418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB240BC71EC
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 03:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50BB34E309A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 01:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03D942065;
	Thu,  9 Oct 2025 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SIA0Y/4x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A5EEC3;
	Thu,  9 Oct 2025 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759973837; cv=none; b=V49mAoS7bLnwbcmOILEzjJlt5SRgPwxoxMqR+3RBy6TClkAUesuNR0NQgPNfc9hm7w8iC780QjhjjxqdHfbOPDoVW7HIAZjDZA0wRe6pHvQi02tvq9TuIT5aPWZUZBDCFldJops1eSosGum5jzof48bZ/RioWJI4zsbnTCaysqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759973837; c=relaxed/simple;
	bh=2eKAoBq9VairlD2QjgT1AeuEjCdtwzEhEoLFd8ZVOCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxmQNdQ5Q+0aKt+BQPGh34QNAP6PWjI6kW9gCB7+S3sQBVJIXreK2qEWAs38hixIb4mFFggR5Jh2QlYSxdln2nepOpZwsFqSTn6e2sGXopFEpY3d+byITAqfKbe9RzXB6ShD/vthJeyzYPHzQLAbRabbmmIsNiVJ2tTTbCPqdGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SIA0Y/4x; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759973579;
	bh=i2xWNQKH2TgGgU1SDcQN8autGqZbnUT8JSubjpginOs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=SIA0Y/4x70oxXz6Ow0E7/J7LnfX8HfM/iCQrMHd2mgixbbTVvGnVcG8pH71rInDBZ
	 Wqwnhr0tb8Nq4EyBqXfQZjlk4S2ZzoU3SmM6LSBZ2ex8DoafY5Z038h26c0ccD6aub
	 yPq1X+qSrdrEPMdb5rw/MaOVsnQHRV05TdqiZ0dw=
X-QQ-mid: esmtpsz19t1759973571t500c35fd
X-QQ-Originating-IP: 2se50e+rZZnFdbb9oKS5vlJfdlgwAcnotw9D+W7WDks=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 09:32:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6960230213181909255
EX-QQ-RecipientCnt: 9
Date: Thu, 9 Oct 2025 09:32:50 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <F7785DF1AA531CA1+aOcQwrTLmAvlQ3ik@kernel.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
 <20250930012702-GYA1357001@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930012702-GYA1357001@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7Xb23x27/8qEiYcWROf9XtGE4iLZMus4nQIEjwaDaE5ExD
	qrf6g+n3N06lfcgZxKCvsOZi6yFkEf5MKMzxa7xmqJ/1oAzGBf2rhTQ9nHL4aVnmsFJJBtW
	9StRDeXwgCodawXHIU7+iDwRC92lRuQXTPwjIQodh+Fo+Xc+JNuZsyh11STrenwSBmXXmOi
	TzPNijnT4U9KFXqzhIt8Ct5AJLgND5jBAXsFFcY1Vvb/92y2rfXyBF6xh9sXvtwE2EbhhWg
	OOddtyVR66M99zRz7ciixov+YgYegklXEp7GSMa6bVyG+RBtmF06xrcPMvBDqs9blG48+Ps
	xon8JMww+8bghKPMvVObS4xIDyClNuKp43UboHlkfYqqZUV3A0B0iSymTVzYF26ZQANhxg1
	KUGvyaIjTvkcccDtjFUzfu9MXSBk9VZryDTzvvn/xbBGpaKRqRWkElSk4zj0lFV/YAcOCEa
	9VnJb4z2xYCg7slyTG/F2ab/hiD7tmHj5jsfjO7kysjKYaqQp+XZWlBVJwXtKfddSDYo0Yn
	zCz7qVcJdlRN3qUDOtnfyxLb3Eb2TmBy1kWknO7ExvkyPUYfr5wykrwC/sbyuJLKQ6EQMq7
	zMzj2VSfgaZZnaKf5hbBuSN+x13NozmxNRrjDjC7kUZl43ww45DXTP6eEIS2iMOneiIIKQS
	h+IH6IVkZR+4TX29m61ZWop/Q3Rhh3khluuqUSeJoD9+nDU3lBVx9lwNJbZmwEfc6gA0cyd
	Dy0W8dCCnP53uLb73uZ3a+TwYm0XVImdIoRlZVci/3FOPIDRzfpCv9wgWlF3pC+qeALLj4T
	Hr6vbI7HHsAIprfMePexYULmWWsFuH1lcrQAcXELZ16sjMM/VE5pn5fajUd8XI1FOXA5ETJ
	x/5mk3b6ctBpTolzcFdPL2IcWV0LIscMda3q6dDRJIviQNULD3c9MKPNJRHRfwrQO7avW/2
	M91diM3eMtuw3vMR45yia3SvStvD2S4nmGiq7hTVgtOGENG5Bcehed+jZecHLYJdwUeeyX5
	2uzF5pvxQgts6Cxomn3usNBnynHVL+0ZH6bEXU9Rw6cu1/gLfyytoDbSo9Ud9vkn0ywkRb3
	wvIDuGBmGE066zcVf7iwDQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Tue, Sep 30, 2025 at 09:27:02AM +0800, Yixun Lan wrote:
> Hi Troy and I2C maintainer,
> 
> one thing I'd raise and seek I2C maintainer's suggestion, should this
> driver introduce lock to protect multi context - non-atomic vs atomic vs
> interrupt context, more than one i2c clients contend single controller?
> 
> On 14:07 Mon 29 Sep     , Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > Changes in v3:
> > - drop 1-5 patches (have been merged)
> > - modify commit message
> > - use readl_poll_timeout_atomic() in wait_pio_xfer()
> > - use msecs_to_jiffies() when get PIO mode timeout value
> > - factor out transfer state handling into spacemit_i2c_handle_state().
> > - do not disable/enable the controller IRQ around PIO transfers.
> > - consolidate spacemit_i2c_init() interrupt setup
> > - rename is_pio -> use_pio
> > - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> > - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> > - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> > - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> > - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> > 
> > Changes in v2:
> > - Patch 1/6:
> >   Patch 3/6:
> >   Patch 4/6:
> >     - nothing
> > - Patch 2/6:
> >   - remove is_pio judgement in irq_handler()
> > - Patch 5/6:
> >   - fix wrong comment
> >   - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
> >     return directly instead of using break.
> > - Patch 6/6:
> >   - add is_pio judgement in irq_handler()
> >   - use a fixed timeout value when PIO
> >   - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> > 
> > - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 206 ++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 161 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612e098b8ad17418f420d87c94df166..21c5dd56e71f5e59434767329fb84d50d5c04178 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -97,6 +97,9 @@
> >  
> >  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> >  
> [snip]..
> 
> > +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
> > +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
> please sort to avoid this kind declaration, if it's inevitable, 
> you can move to top, before the function, after macro 
Thanks, I will.

> 
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
> this is hard to read
> 		mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> 		if ((i2c->status & mask) == 0)
> 		..
Nice catch! Thanks.

> > +			continue;
> > +
> > +		spacemit_i2c_handle_state(i2c);
> > +
> > +		/*
> > +		 * This is the last byte to write of the current message.
> > +		 * If we do not wait here, control will proceed directly to start(),
> > +		 * which would overwrite the current data.
> > +		 */
> > +		if (!i2c->read && !i2c->unprocessed) {
> > +			ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +							i2c->status, i2c->status & SPACEMIT_SR_ITE,
> > +							30, 1000);
> > +			if (ret)
> > +				return 0;
> > +			/*
> > +			 * In read mode, err_check() in handle_state properly handles what happens
> > +			 * after the MSD bit is set. For writes it is different: in interrupt mode,
> > +			 * an ITE (write-empty) interrupt is triggered after the last byte, and the
> > +			 * MSD-related handling takes place there. In PIO mode, however, we need to
> > +			 * explicitly call err_check() to emulate this step, otherwise the next
> > +			 * transfer will fail.
> > +			 */
> > +			spacemit_i2c_err_check(i2c);
> > +		}
> > +	}
> > +
> > +	if (i2c->unprocessed)
> > +		return 0;
> > +
> > +	return 1;
> > +}
> > +
> >  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> >  {
> >  	unsigned long time_left;
> > @@ -310,10 +376,16 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> >  
> >  		reinit_completion(&i2c->complete);
> >  
> > -		spacemit_i2c_start(i2c);
> ..
> > +		if (i2c->use_pio) {
> > +			spacemit_i2c_start(i2c);
> > +
> > +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> > +		} else {
> > +			spacemit_i2c_start(i2c);
> > +			time_left = wait_for_completion_timeout(&i2c->complete,
> > +								i2c->adapt.timeout);
> > +		}
> suggest to distill a common function spacemit_i2c_wait_xfer_complete()
> and converge above if/else logic inside, which is more readable
It makes sense.

> 
> >  
> > -		time_left = wait_for_completion_timeout(&i2c->complete,
> > -							i2c->adapt.timeout);
> >  		if (!time_left) {
> >  			dev_err(i2c->dev, "msg completion timeout\n");
> ..
> >  			spacemit_i2c_conditionally_reset_bus(i2c);
> btw, not introduced in this patch, spacemit_i2c_reset() followed unconditionally after
> spacemit_i2c_conditionally_reset_bus() which is very confusing
Yes, It seems like a logical error.
> 
> please double check the logic
I drop the spacemit_i2c_reset() here and it seems to work fine,
though I'm not entirely sure if it could fail in some rare corner cases.
I'll double-check this, and if it's really redundant,
I'll remove it in the next version;
otherwise, I'll explain the reasoning.

> 
> 
> > @@ -341,6 +413,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
> >  
> >  static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
> >  {
> > +	if (!(i2c->status & SPACEMIT_SR_ITE))
> > +		return;
> > +
> >  	/* if transfer completes, SPACEMIT_ISR will handle it */
> >  	if (i2c->status & SPACEMIT_SR_MSD)
> >  		return;
> [snip]..
> >  
> > -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +static inline int
> > +spacemit_i2c_xfer_common(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool use_pio)
> >  {
> >  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> >  	int ret;
> >  
> > +	i2c->use_pio = use_pio;
> > +
> >  	i2c->msgs = msgs;
> >  	i2c->msg_num = num;
> >  
> ..
> > -	spacemit_i2c_calc_timeout(i2c);
> > +	if (!i2c->use_pio)
> > +		spacemit_i2c_calc_timeout(i2c);
> > +	else
> > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> suggest merge "if else" into spacemit_i2c_calc_timeout(), same as previous suggestion
I'll take it.

> >  
> >  	spacemit_i2c_init(i2c);
> >  
> >  	spacemit_i2c_enable(i2c);
> >  
> > +	/* To avoid being affected by the state of the previous transfer */
> > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > +
> I've not see my previous comment has been addressed!
Oops.. I forgot to delete it.
I'll remote it in the next version.

> 
> >  	ret = spacemit_i2c_wait_bus_idle(i2c);
> >  	if (!ret) {
> >  		ret = spacemit_i2c_xfer_msg(i2c);
> > @@ -506,11 +611,21 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> >  
> >  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
> >  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> > -			  ret, i2c->status & SPACEMIT_SR_ERR);
> > +			ret, i2c->status & SPACEMIT_SR_ERR);
> >  
> have to say, I personally don't like those unrelated changes, which
> makes people review the patch even difficult
Looks like I need to send a patch updating only that line...


> >  	return ret < 0 ? ret : num;
> >  }
> >  
> > +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +{
> > +	return spacemit_i2c_xfer_common(adapt, msgs, num, false);
> > +}
> > +
> > +static int spacemit_i2c_pio_xfer_atomic(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +{
> > +	return spacemit_i2c_xfer_common(adapt, msgs, num, true);
> > +}
> > +
> 
> atomic API should not call sleepable function, please check this
> spacemit_i2c_pio_xfer_atomic() -> 
>   spacemit_i2c_xfer_common() -> 
>     spacemit_i2c_xfer_msg() -> 
>       spacemit_i2c_conditionally_reset_bus() -> 
>         usleep_range()
>     spacemit_i2c_check_bus_release() -> 
>       usleep_range()
> 
> they are in err handle path, but still need to take care with caution
Good catch!I'll revisit the error handling to make sure no sleepable calls
are made there, and replace usleep_range() with a non-sleeping alternative.

                          - Troy
> 
> 
> -- 
> Yixun Lan (dlan)
> 

