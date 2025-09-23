Return-Path: <linux-i2c+bounces-13109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96498B93D42
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 03:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A758F3B9F22
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 01:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36911EEA31;
	Tue, 23 Sep 2025 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Ph7sT31r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20561386B4;
	Tue, 23 Sep 2025 01:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590539; cv=none; b=V+h3WFkkMdCSryMzPnSGUbUQB8H2eBm5we/UnrlQ7QQzjMHlUvpwaCYLNZV1eCKul6GeDcvDKusvfwP+l444WTUg7TD4eJOT3Ar6OJjLBdVlX4LI47+kJAeJ0e0uvk3OUq8n+bsLnLCOJ9+jzUu6tuDUMBGbPNF144xqTRGOdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590539; c=relaxed/simple;
	bh=m10yKXImOty1yTeMJTsn2SgV/JQw9Ni/zqUQoYNWm2c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtAnqKK/2WMbjCgTJlJFwpLHHNrGW5IrzgX4pihS7OWz0cuFvxmlWvsy1Yr1uDwteSMbdpEfbBwMfGcNjB9wAX+FcIMZLF5T0y6O6oQgzTjvYA4XJ2D86pHd1Hg5H7LaatkAlscZiDIDBvjxzzxERah96ByDsCpUoeX64+6Jfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Ph7sT31r; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758590470;
	bh=YnYeaEF7lW8PBZKj4engkqA+pthANILnpSy7RV4Mu2w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Ph7sT31rqsjQHzSSL36Cmlvi+PW2jgDrpzmHmyWp+S/k5kIob7P2g6ckfiIIhYfPy
	 9zIr8eAQalAJ3GCYVO8E6vcDxD2wjK6zOUzKqVE4saMQU4ritwnRakXctgAYdhT4X6
	 jCGanu0DQ18bgg87/UjsorwzU2vM2mI7xwGq8Tu8=
X-QQ-mid: zesmtpgz6t1758590463tce5aa759
X-QQ-Originating-IP: exD+oHlvatqaVcZezO/UsFbfIW6aVUq+n+j3q0+P5Bc=
Received: from = ( [14.123.255.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:21:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6591138198704204517
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 09:21:02 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <5BD02C45F1EF140A+aNH1_lCx9mNFyI1K@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-6-e59bea02d680@linux.spacemit.com>
 <aNG4CQLraAqyVjdc@aurel32.net>
 <2ADE8BFFC8EF40BC+aNH0fplBawrkLp3Z@LT-Guozexi>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ADE8BFFC8EF40BC+aNH0fplBawrkLp3Z@LT-Guozexi>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ODm/QSITZk1PVk9wXtrO3arIuWJPC47ORuFrD7ZhGP3YPS3GEhwTm/qs
	whyf7nPS5Q4a6+CpYaxNDMyY5lkoCW/i2ohOYLEHK4puqElpKr50GVsHPfHjKpmZ2Jj6dbg
	wCAeYZbyAdtMQRpXTedyIL5XYOPNoKPPRGPNaznIl+oEUvKZIpcsgKHnW43+QizdR8OEKEO
	V/nBJ0bCnbDw/IEd0DrBk0O2e39SyqkCZYWC7hWUdVbWy66osEuzthom2YnXAjGYAHPHAo+
	l7CpStqdcrfKmwSremlmK6etUMQY1WNPdbDmcpbfZzHBT1VZAZiG5l0mABatEFnszPz0wuA
	ao5W2eRDodRov3w9ejdjGcwhiwhQ27mLKr7GQwQyt5jJfwMSZnTYBUdwZm6pk3rsM1UxBHJ
	Ya/rz4+s8FYR0kQLbMuF47fniFsB3i+A48tfgHcnhnrWzvVf3tBuLoBMHZfklfVMV9B4z0K
	jtWOpluNRjFjd9/TWYbgNs72n+0PIDj5it+vK7/ONaFujX9MQtfao8GIb4UVZaOPC/klqKf
	+ob8LhWc3NxTE5/tZFjdZ3UEek4ayLZD6quc/rZmL8GgCZFO9Kd5BBN5VFxyvSkAKlZC9Lw
	MmN7LwQac9B/YH2UzC86YT5QXDOLsE2FkgCFOjNhe8VPvldJyVX5EpbGG5/L7XsQdaZA8Ga
	cRtB4wbt30FdYaBWLp8Cc4IOWNbW+8ENDJmi3Fx3YvCfL3KcueQNuNWAN+6ldoMpuCiXcan
	aWFNGsVeqXwrcGYSb7V/18AUjoXl4lWO5kv2C+FeIfGhD2gAxrpvyBttREwRhpDa1tL/nTa
	LpYx0NbmB2Loz7tsBrDMO6Imd9o/oCSuVSZueOarMRtmUr+7bi1O232GIA7XccCb7omasWu
	f2PayqNBHw0VgXGKZoklRE61KK9uoX+hsd6QifH3TvrE1OanpH2ndfYPwzD8/pqcAwEX7Da
	DR3wpO4seWH4fuG5FSNwgKXs5UBwWgD6+gfUSm/scvwf+XNkS2+4uo9mgPeC6Moti+Ep7ku
	mZY4BAJF2tvOlDfySDoElu7BSHNW4whKZaT8ZDoyjt6S9N28UgPND6KvMFK+g9tNWct7SkU
	+mxIm6bLYNCnreZdPdlZaXJ82Lihn4oqv0v1eEX3TzF08L/MRsNw+4=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Tue, Sep 23, 2025 at 09:14:38AM +0800, Troy Mitchell wrote:
> On Mon, Sep 22, 2025 at 10:56:41PM +0200, Aurelien Jarno wrote:
> > On 2025-08-27 15:39, Troy Mitchell wrote:
> > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > enabling the use of I2C with interrupts disabled.
> > > 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >  drivers/i2c/busses/i2c-k1.c | 139 ++++++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 120 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > > index d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f..e558fe4cbd5a78b5b53b0c02cbbca818b6495d4a 100644
> > > --- a/drivers/i2c/busses/i2c-k1.c
> > > +++ b/drivers/i2c/busses/i2c-k1.c
> > > @@ -124,6 +124,7 @@ struct spacemit_i2c_dev {
> > >  
> > >  	enum spacemit_i2c_state state;
> > >  	bool read;
> > > +	bool is_pio;
> > >  	struct completion complete;
> > >  	u32 status;
> > >  };
> > > @@ -228,7 +229,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
> > >  
> > >  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> > >  {
> > > -	u32 val;
> > > +	u32 val = 0;
> > >  
> > >  	/*
> > >  	 * Unmask interrupt bits for all xfer mode:
> > > @@ -236,7 +237,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> > >  	 * For transaction complete signal, we use master stop
> > >  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> > >  	 */
> > > -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > > +	if (!i2c->is_pio)
> > > +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > >  
> > >  	/*
> > >  	 * Unmask interrupt bits for interrupt xfer mode:
> > > @@ -246,7 +248,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> > >  	 * i2c_start function.
> > >  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> > >  	 */
> > > -	val |= SPACEMIT_CR_DRFIE;
> > > +	if (!i2c->is_pio)
> > > +		val |= SPACEMIT_CR_DRFIE;
> > >  
> > >  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > >  		val |= SPACEMIT_CR_MODE_FAST;
> > > @@ -258,7 +261,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> > >  	val |= SPACEMIT_CR_SCLE;
> > >  
> > >  	/* enable master stop detected */
> > > -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> > > +	val |= SPACEMIT_CR_MSDE;
> > > +
> > > +	if (!i2c->is_pio)
> > > +		val |= SPACEMIT_CR_MSDIE;
> > >  
> > >  	writel(val, i2c->base + SPACEMIT_ICR);
> > >  
> > > @@ -295,10 +301,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
> > >  	/* send start pulse */
> > >  	val = readl(i2c->base + SPACEMIT_ICR);
> > >  	val &= ~SPACEMIT_CR_STOP;
> > > -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> > > +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> > > +
> > > +	if (!i2c->is_pio)
> > > +		val |= SPACEMIT_CR_DTEIE;
> > > +
> > >  	writel(val, i2c->base + SPACEMIT_ICR);
> > >  }
> > 
> > For all the above is_pio conditions, I have a stupid question, and the
> > answer probably depends on the controller behaviour. 
> > 
> > Given all the individual interrupts are kept disabled, does it make 
> > sense to disable the controller interrupt in spacemit_i2c_xfer_msg() 
> > below? Or maybe the reverse question, does it make sense to disable the 
> > controller interrupt in spacemit_i2c_xfer_msg() given all individual 
> > interrupts are kept disabled?
> I'll double check this.
> If disabling the individual interrupt bits is not really necessary,
> I'll drop them and just disable the controller interrupt in
> spacemit_i2c_xfer_msg().
> 
> Good catch, thanks!
I'll disable the controller interrupt in xfer_msg().

                - Troy
> > 
> > > +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> > > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > > +{
> > > +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
> > 
> > The i2c->adapt.timeout value is computed without a lot of margin, so I 
> > wonder if it is also valid in PIO mode where there is more overhead?
> > 
> > Note that I haven't encountered any issue, but OTOH I only tried writing 
> > one register of the P1 chip.
> > 
> > Maybe this whole computation could be simplified, other adapters seems 
> > to use a fixed value independent of the message, of between 200 ms to 
> > 6s. That could also fix a timeout if the SCL clock is slowed down by the 
> > slave (again that's not something I have tried or experienced).
> >
> Thanks for pointing this out. You are right that the current timeout is
> derived quite tightly from the message length and bus clock, and I only
> tested simple register writes so far. In PIO mode the additional CPU
> overhead, or in case a slave stretches SCL, this margin may indeed not
> be sufficient.
> 
> I agree that using a fixed timeout as done in other adapters could make
> the behaviour more robust. I can update the driver to use a fixed value
> in PIO mode, or at least increase the margin, to avoid spurious
> timeouts.
> > 
> > > +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> > > +	int ret;
> > > +
> > > +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> > > +		udelay(10);
> > > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > > +
> > > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> > > +
> > > +		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
> > > +			continue;
> > > +
> > > +		spacemit_i2c_irq_handler(0, i2c);
> > > +
> > > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > > +
> > > +		/*
> > > +		 * This is the last byte to write of the current message.
> > > +		 * If we do not wait here, control will proceed directly to start(),
> > > +		 * which would overwrite the current data.
> > > +		 */
> > > +		if (!i2c->read && !i2c->unprocessed) {
> > > +			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> > > +						i2c->status, i2c->status & SPACEMIT_SR_ITE,
> > > +						30, 1000);
> > 
> > You can't use readl_poll_timeout() in an atomic context. You should use 
> > readl_poll_timeout_atomic() instead. Note that there is another one to 
> > fix in spacemit_i2c_wait_bus_idle.
> will fix it. :0
> 
> Thanks!
> 
>                 - Troy
> > 
> > > +			if (ret)
> > > +				return 0;
> > > +		}
> > > +	}
> > > +
> > > +	if (i2c->unprocessed)
> > > +		return 0;
> > > +
> > > +	return 1;
> > > +}
> > > +
> > >  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > >  {
> > >  	unsigned long time_left;
> > > @@ -312,10 +362,27 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > >  
> > >  		reinit_completion(&i2c->complete);
> > >  
> > > -		spacemit_i2c_start(i2c);
> > > +		if (i2c->is_pio) {
> > > +			disable_irq(i2c->irq);
> > > +
> > > +			/*
> > > +			 * The K1 I2C controller has a quirk:
> > > +			 * when doing PIO transfers, the status register must be cleared
> > > +			 * of all other bits before issuing a START.
> > > +			 * Failing to do so will prevent the transfer from working properly.
> > > +			 */
> > > +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > +
> > > +			spacemit_i2c_start(i2c);
> > > +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> > > +
> > > +			enable_irq(i2c->irq);
> > > +		} else {
> > > +			spacemit_i2c_start(i2c);
> > > +			time_left = wait_for_completion_timeout(&i2c->complete,
> > > +								i2c->adapt.timeout);
> > > +		}
> > >  
> > > -		time_left = wait_for_completion_timeout(&i2c->complete,
> > > -							i2c->adapt.timeout);
> > >  		if (!time_left) {
> > >  			dev_err(i2c->dev, "msg completion timeout\n");
> > >  			spacemit_i2c_conditionally_reset_bus(i2c);
> > > @@ -343,6 +410,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
> > >  
> > >  static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
> > >  {
> > > +	if (!(i2c->status & SPACEMIT_SR_ITE))
> > > +		return;
> > > +
> > >  	/* if transfer completes, SPACEMIT_ISR will handle it */
> > >  	if (i2c->status & SPACEMIT_SR_MSD)
> > >  		return;
> > > @@ -355,14 +425,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
> > >  
> > >  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> > >  	i2c->state = SPACEMIT_STATE_IDLE;
> > > -	complete(&i2c->complete);
> > > +
> > > +	if (!i2c->is_pio)
> > > +		complete(&i2c->complete);
> > >  }
> > >  
> > >  static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
> > >  {
> > > +	if (!(i2c->status & SPACEMIT_SR_IRF))
> > > +		return;
> > > +
> > >  	if (i2c->unprocessed) {
> > >  		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
> > >  		i2c->unprocessed--;
> > > +		return;
> > >  	}
> > >  
> > >  	/* if transfer completes, SPACEMIT_ISR will handle it */
> > > @@ -375,7 +451,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
> > >  
> > >  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> > >  	i2c->state = SPACEMIT_STATE_IDLE;
> > > -	complete(&i2c->complete);
> > > +
> > > +	if (!i2c->is_pio)
> > > +		complete(&i2c->complete);
> > >  }
> > >  
> > >  static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
> > > @@ -410,7 +488,9 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
> > >  	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > >  
> > >  	i2c->state = SPACEMIT_STATE_IDLE;
> > > -	complete(&i2c->complete);
> > > +
> > > +	if (!i2c->is_pio)
> > > +		complete(&i2c->complete);
> > >  }
> > >  
> > >  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> > > @@ -418,13 +498,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> > >  	struct spacemit_i2c_dev *i2c = devid;
> > >  	u32 status, val;
> > >  
> > > -	status = readl(i2c->base + SPACEMIT_ISR);
> > > -	if (!status)
> > > -		return IRQ_HANDLED;
> > > +	/*
> > > +	 * In PIO mode, do not read status again.
> > > +	 * It has already been read in wait_pio_xfer(),
> > > +	 * and reading it clears some bits.
> > > +	 */
> > > +	if (!i2c->is_pio) {
> > > +		status = readl(i2c->base + SPACEMIT_ISR);
> > > +		if (!status)
> > > +			return IRQ_HANDLED;
> > >  
> > > -	i2c->status = status;
> > > +		i2c->status = status;
> > >  
> > > -	spacemit_i2c_clear_int_status(i2c, status);
> > > +		spacemit_i2c_clear_int_status(i2c, status);
> > > +	}
> > >  
> > >  	if (i2c->status & SPACEMIT_SR_ERR)
> > >  		goto err_out;
> > > @@ -483,11 +570,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> > >  	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
> > >  }
> > >  
> > > -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > > +static inline int
> > > +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
> > >  {
> > >  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> > >  	int ret;
> > >  
> > > +	i2c->is_pio = is_pio;
> > > +
> > >  	i2c->msgs = msgs;
> > >  	i2c->msg_num = num;
> > >  
> > > @@ -510,18 +600,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > >  
> > >  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
> > >  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> > > -			  ret, i2c->status & SPACEMIT_SR_ERR);
> > > +			ret, i2c->status & SPACEMIT_SR_ERR);
> > >  
> > >  	return ret < 0 ? ret : num;
> > >  }
> > >  
> > > +static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > > +{
> > > +	return spacemit_i2c_xfer(adapt, msgs, num, false);
> > > +}
> > > +
> > > +static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > > +{
> > > +	return spacemit_i2c_xfer(adapt, msgs, num, true);
> > > +}
> > > +
> > >  static u32 spacemit_i2c_func(struct i2c_adapter *adap)
> > >  {
> > >  	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> > >  }
> > >  
> > >  static const struct i2c_algorithm spacemit_i2c_algo = {
> > > -	.xfer = spacemit_i2c_xfer,
> > > +	.xfer = spacemit_i2c_int_xfer,
> > > +	.xfer_atomic = spacemit_i2c_pio_xfer,
> > >  	.functionality = spacemit_i2c_func,
> > >  };
> > >  
> > > 
> > > -- 
> > > 2.50.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > > 
> > 
> > -- 
> > Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> > aurelien@aurel32.net                     http://aurel32.net
> > 

