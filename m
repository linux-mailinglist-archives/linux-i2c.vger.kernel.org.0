Return-Path: <linux-i2c+bounces-13108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D4B93CE4
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 03:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60A42E1503
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 01:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF2F2C187;
	Tue, 23 Sep 2025 01:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tXaycL0I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B128834BA2E;
	Tue, 23 Sep 2025 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590177; cv=none; b=qqqsB0D8NXOQrOCBFXxUAN8oJVRyMWA+KozookEMjkFqfC5HlJdz+QFpKKuHGmeSE9llcssCOCJJ6n0QlINvFsGNkv3HanVHyiWpsHG15aWeiKdx7QOzm6f6K+ddzp9jyMXpiPy694kx0TqMlAtvQv/kOS1IT2PLojapppo6QG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590177; c=relaxed/simple;
	bh=D47QGo7Gq/OgpUPSttvWQoCpNgPFGKSeQfN1D/2aZtY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDOPThkXuNV7PSRSabsxSIaQ8WPyOghJqXzUtlTwTUqqLGEe35lpMAPobRx4CTkQBJasoRrbj8KE0JOjCzIiv6fmGWESbj9OzxSLq1tNVU+mXJFHlgipuqjKPbS3pM6pz90+e5DnJ+41wWGpZDMXmmdXLUmnnX2MXWevJ2DSkhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tXaycL0I; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758590086;
	bh=8HZ91EPL2+Fyzwo17A4pFYLtyX3U+LmV2+Sv9mAbTC0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tXaycL0ITmnkBN5TcIa+FtqLLH0jbEFGJgT0j4/NYEtWZ8/RSYS+KDKrJkZXxZc1G
	 gBvtQ2ayF4ogbgre3MZ1DJHXHAfm2aK5Xgc+uZAkqBhIOuZMUGMfh7R9zb7iWBr0oT
	 shmlrWKludNJA6qRyafblV6JmKjSi2P/iJ/L0pzA=
X-QQ-mid: esmtpgz13t1758590079t729c974a
X-QQ-Originating-IP: 7r3fLmpSev1kFaD5Ff3VWp7kieQ1JMh6/F0Gq5WW8lE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:14:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13364479648022014400
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 09:14:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <2ADE8BFFC8EF40BC+aNH0fplBawrkLp3Z@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-6-e59bea02d680@linux.spacemit.com>
 <aNG4CQLraAqyVjdc@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG4CQLraAqyVjdc@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N52o7LZX2YZeECO2HTpyTSkm1K+gM4FgirB8HLO6sMU5fFl7uJodzvTI
	Sm6H8VtNeqfJMAKbzc8nyT0bohYffbi7+DO4cdPWvnsRrqodugUEvrHA/yOtfvF8pNV0PvZ
	ZleAfWK1HxmEAdripobbAm/z6uqy2igr6mL2bvtyid9YY/S3mlw7I7pB0bQ91p2vKb2GLhv
	uVqER7/6RJ1x1iCalBnakyPaVW3ZoW+ejJ0T3vYa/ReDOr81wQXGS2omoQJpvtv7Caih6GR
	OHv2n1giIXqNR/x5hzeZ87X19xNRQDNp21qe7K5vIjk4BZhaBVlsTWLYcG708e5UpBV8uY4
	QXA7o2aSzgiDvmTIPYOi6yUfrloTkNlDzDgxZYTA7mbQqUcQTEmQy8/jn9wuq6NSlvGjTU2
	qkFkO/wkd4XdxS6iw4by2v41OkamHSd7XWmzoU3hLFlp18J4ZaAQwFxpk948cdB33/6O1pl
	RH7Vf3q1qsejR6B2cbNFHl5PgQHtq1xpPTIxUEbzE6+xm9l+cQQ9lbJ04gWFPOBzEPHIrjO
	xKZkZSMYcXTSSzj/cBB9DkgqU5q+Xeg6pWoRySV1PK2mB66yVFt7cFcRllI21S2LwA7dyCU
	7Z0Q+MgtKjwpXgADCPql2yYJIEboDuLKxmr1G0AFBC/AiDeB4d5ffKN0JiguiNjimNVN+Kg
	2vKIx4Cahz9nTLSiWZayvMPsslefiHb1w169a3dBb1zoZoiW4VEJEIS0YmPI80UJjfJJGHz
	HZwqe68dtCZdCfplS7nMZTNOyug26IgYdEgEr4pY0nur5Jt3m2lQg+smqh6HHG7mg7byO7S
	yGm1thvcUCXmgbryIa5KEUsmFKiIqPVx5zEMt6mCtLW10sHyNSqibCHoZvzxALb4FsYmGk/
	dlZMpAMBQWYTiHOLdbvIsk2vWbxB2BIhjcabSrDOmca2MnFeOFz1PmufvXUoPjYg9yDXxw9
	f4dKNRkIAi/OUnSf2/DipcyFgDbJZ17/+hFH2Q9RQtfg7d1dYcrmA4XWhHC3mI1H0V25QPX
	UmAcPL+bOeqXanoWyPNkcoJmXW1Al9JcINJkO38L3XSmtpSXk08/I65EKeo7MFkcUev5eUX
	cpK8M9LbmiylzXJoJ2wkeY1hKQuIV0RJegy14V/Jn/tF/qXmU5Duag=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 10:56:41PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C with interrupts disabled.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 139 ++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 120 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f..e558fe4cbd5a78b5b53b0c02cbbca818b6495d4a 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -124,6 +124,7 @@ struct spacemit_i2c_dev {
> >  
> >  	enum spacemit_i2c_state state;
> >  	bool read;
> > +	bool is_pio;
> >  	struct completion complete;
> >  	u32 status;
> >  };
> > @@ -228,7 +229,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
> >  
> >  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  {
> > -	u32 val;
> > +	u32 val = 0;
> >  
> >  	/*
> >  	 * Unmask interrupt bits for all xfer mode:
> > @@ -236,7 +237,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	 * For transaction complete signal, we use master stop
> >  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> >  	 */
> > -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > +	if (!i2c->is_pio)
> > +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> >  
> >  	/*
> >  	 * Unmask interrupt bits for interrupt xfer mode:
> > @@ -246,7 +248,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	 * i2c_start function.
> >  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> >  	 */
> > -	val |= SPACEMIT_CR_DRFIE;
> > +	if (!i2c->is_pio)
> > +		val |= SPACEMIT_CR_DRFIE;
> >  
> >  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> >  		val |= SPACEMIT_CR_MODE_FAST;
> > @@ -258,7 +261,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	val |= SPACEMIT_CR_SCLE;
> >  
> >  	/* enable master stop detected */
> > -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> > +	val |= SPACEMIT_CR_MSDE;
> > +
> > +	if (!i2c->is_pio)
> > +		val |= SPACEMIT_CR_MSDIE;
> >  
> >  	writel(val, i2c->base + SPACEMIT_ICR);
> >  
> > @@ -295,10 +301,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
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
> 
> For all the above is_pio conditions, I have a stupid question, and the
> answer probably depends on the controller behaviour. 
> 
> Given all the individual interrupts are kept disabled, does it make 
> sense to disable the controller interrupt in spacemit_i2c_xfer_msg() 
> below? Or maybe the reverse question, does it make sense to disable the 
> controller interrupt in spacemit_i2c_xfer_msg() given all individual 
> interrupts are kept disabled?
I'll double check this.
If disabling the individual interrupt bits is not really necessary,
I'll drop them and just disable the controller interrupt in
spacemit_i2c_xfer_msg().

Good catch, thanks!
> 
> > +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
> 
> The i2c->adapt.timeout value is computed without a lot of margin, so I 
> wonder if it is also valid in PIO mode where there is more overhead?
> 
> Note that I haven't encountered any issue, but OTOH I only tried writing 
> one register of the P1 chip.
> 
> Maybe this whole computation could be simplified, other adapters seems 
> to use a fixed value independent of the message, of between 200 ms to 
> 6s. That could also fix a timeout if the SCL clock is slowed down by the 
> slave (again that's not something I have tried or experienced).
>
Thanks for pointing this out. You are right that the current timeout is
derived quite tightly from the message length and bus clock, and I only
tested simple register writes so far. In PIO mode the additional CPU
overhead, or in case a slave stretches SCL, this margin may indeed not
be sufficient.

I agree that using a fixed timeout as done in other adapters could make
the behaviour more robust. I can update the driver to use a fixed value
in PIO mode, or at least increase the margin, to avoid spurious
timeouts.
> 
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
> > +
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		/*
> > +		 * This is the last byte to write of the current message.
> > +		 * If we do not wait here, control will proceed directly to start(),
> > +		 * which would overwrite the current data.
> > +		 */
> > +		if (!i2c->read && !i2c->unprocessed) {
> > +			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> > +						i2c->status, i2c->status & SPACEMIT_SR_ITE,
> > +						30, 1000);
> 
> You can't use readl_poll_timeout() in an atomic context. You should use 
> readl_poll_timeout_atomic() instead. Note that there is another one to 
> fix in spacemit_i2c_wait_bus_idle.
will fix it. :0

Thanks!

                - Troy
> 
> > +			if (ret)
> > +				return 0;
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
> > @@ -312,10 +362,27 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> >  
> >  		reinit_completion(&i2c->complete);
> >  
> > -		spacemit_i2c_start(i2c);
> > +		if (i2c->is_pio) {
> > +			disable_irq(i2c->irq);
> > +
> > +			/*
> > +			 * The K1 I2C controller has a quirk:
> > +			 * when doing PIO transfers, the status register must be cleared
> > +			 * of all other bits before issuing a START.
> > +			 * Failing to do so will prevent the transfer from working properly.
> > +			 */
> > +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > +
> > +			spacemit_i2c_start(i2c);
> > +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> > +
> > +			enable_irq(i2c->irq);
> > +		} else {
> > +			spacemit_i2c_start(i2c);
> > +			time_left = wait_for_completion_timeout(&i2c->complete,
> > +								i2c->adapt.timeout);
> > +		}
> >  
> > -		time_left = wait_for_completion_timeout(&i2c->complete,
> > -							i2c->adapt.timeout);
> >  		if (!time_left) {
> >  			dev_err(i2c->dev, "msg completion timeout\n");
> >  			spacemit_i2c_conditionally_reset_bus(i2c);
> > @@ -343,6 +410,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
> >  
> >  static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
> >  {
> > +	if (!(i2c->status & SPACEMIT_SR_ITE))
> > +		return;
> > +
> >  	/* if transfer completes, SPACEMIT_ISR will handle it */
> >  	if (i2c->status & SPACEMIT_SR_MSD)
> >  		return;
> > @@ -355,14 +425,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
> >  
> >  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> >  	i2c->state = SPACEMIT_STATE_IDLE;
> > -	complete(&i2c->complete);
> > +
> > +	if (!i2c->is_pio)
> > +		complete(&i2c->complete);
> >  }
> >  
> >  static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
> >  {
> > +	if (!(i2c->status & SPACEMIT_SR_IRF))
> > +		return;
> > +
> >  	if (i2c->unprocessed) {
> >  		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
> >  		i2c->unprocessed--;
> > +		return;
> >  	}
> >  
> >  	/* if transfer completes, SPACEMIT_ISR will handle it */
> > @@ -375,7 +451,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
> >  
> >  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> >  	i2c->state = SPACEMIT_STATE_IDLE;
> > -	complete(&i2c->complete);
> > +
> > +	if (!i2c->is_pio)
> > +		complete(&i2c->complete);
> >  }
> >  
> >  static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
> > @@ -410,7 +488,9 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
> >  	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> >  
> >  	i2c->state = SPACEMIT_STATE_IDLE;
> > -	complete(&i2c->complete);
> > +
> > +	if (!i2c->is_pio)
> > +		complete(&i2c->complete);
> >  }
> >  
> >  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> > @@ -418,13 +498,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> >  	struct spacemit_i2c_dev *i2c = devid;
> >  	u32 status, val;
> >  
> > -	status = readl(i2c->base + SPACEMIT_ISR);
> > -	if (!status)
> > -		return IRQ_HANDLED;
> > +	/*
> > +	 * In PIO mode, do not read status again.
> > +	 * It has already been read in wait_pio_xfer(),
> > +	 * and reading it clears some bits.
> > +	 */
> > +	if (!i2c->is_pio) {
> > +		status = readl(i2c->base + SPACEMIT_ISR);
> > +		if (!status)
> > +			return IRQ_HANDLED;
> >  
> > -	i2c->status = status;
> > +		i2c->status = status;
> >  
> > -	spacemit_i2c_clear_int_status(i2c, status);
> > +		spacemit_i2c_clear_int_status(i2c, status);
> > +	}
> >  
> >  	if (i2c->status & SPACEMIT_SR_ERR)
> >  		goto err_out;
> > @@ -483,11 +570,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> >  	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
> >  }
> >  
> > -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +static inline int
> > +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
> >  {
> >  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> >  	int ret;
> >  
> > +	i2c->is_pio = is_pio;
> > +
> >  	i2c->msgs = msgs;
> >  	i2c->msg_num = num;
> >  
> > @@ -510,18 +600,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> >  
> >  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
> >  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> > -			  ret, i2c->status & SPACEMIT_SR_ERR);
> > +			ret, i2c->status & SPACEMIT_SR_ERR);
> >  
> >  	return ret < 0 ? ret : num;
> >  }
> >  
> > +static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +{
> > +	return spacemit_i2c_xfer(adapt, msgs, num, false);
> > +}
> > +
> > +static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +{
> > +	return spacemit_i2c_xfer(adapt, msgs, num, true);
> > +}
> > +
> >  static u32 spacemit_i2c_func(struct i2c_adapter *adap)
> >  {
> >  	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> >  }
> >  
> >  static const struct i2c_algorithm spacemit_i2c_algo = {
> > -	.xfer = spacemit_i2c_xfer,
> > +	.xfer = spacemit_i2c_int_xfer,
> > +	.xfer_atomic = spacemit_i2c_pio_xfer,
> >  	.functionality = spacemit_i2c_func,
> >  };
> >  
> > 
> > -- 
> > 2.50.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

