Return-Path: <linux-i2c+bounces-14534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E41CBC928
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 06:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 259013010E32
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 05:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852B7326923;
	Mon, 15 Dec 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LxhNB6KN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06E86359;
	Mon, 15 Dec 2025 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765777460; cv=none; b=uHagifUmSQsq5NN5i5D9wBehRWjMI31UlBhpaB7SlXzLXdk57x/UpL5xJFaUBW4wJyjnm+RpislnZ2uz1o6LMYuiN8772plwIkR2voREMthMlLROLH+ziWilgyC2/SNOhedLPVQdp+2AIHTLseB7+cup45Fth47IO/d4nCO0jo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765777460; c=relaxed/simple;
	bh=QPvB4kHja07Xy0ogH5Ym3ZLvXASXupJFH70Dp4cOLyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX4wn8yK9jE57VxNzP9dCyMg0XKbHsg8VhRLmN7SSLBv8eiDQUj+PQ0tapy7KNMD2mATDRZDa1+xSN3FZRTmISgs4iK5r5UsKcHNHMlDWagNUay30GcLCvsXuTqeqp3X6s22dxS+Y+vlPPxtnFWo16oxnqi8HE3PxSXOf2HgT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LxhNB6KN; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765777349;
	bh=7/v1AHp7ETagX1mpcxBqNuxe1AHAbWNnCz90pyxs+iQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=LxhNB6KNkjNsGT14J3i2hsafQH60gPsrxIcZ+kpyMUbIDZKXWccjtAAhK8o6dxF2m
	 F81YqT4mrTzV3+hesi8DkMoeqnDorIgKCBpmA0TtjQ43Dj2QEbOgN4uuhJDJ72YGeS
	 UUBbapi3VVJr84zA2oHxNy8FcSicoriVBjomd73U=
X-QQ-mid: esmtpsz20t1765777341t3b4a168c
X-QQ-Originating-IP: +Mmtspt6z7F8uojFBjQIxWik8MaTcVWNGK/uU8N3P6Y=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 13:42:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11472735917233781318
EX-QQ-RecipientCnt: 9
Date: Mon, 15 Dec 2025 13:42:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <7413B6F44E526F60+aT-fu7gTS6YjEEKy@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4WhQbLQyIqSuIpHePOmbUvP03EF+IW1Eo8Em4MkQiA4VtOUt0n/Lsvx
	9euNI2JHxAz1c2Rx0id9ZSkjAilgHp/Lim4i9E9/0sCE3rjnH3bg5TGPamgmd5h0qZi2VXr
	S/JM2RrawfZVi3dFQAFqBzY/D6fgH4OWuYra6OaKQr2Lvs9qELyfRVNNtei5/KWXk3TeEvL
	rDXnvBWv7g5Z2McFWctMUy++JraLWO7jClQ3no2hGtZIcCn/XMLlVsOXxa1A0+EAKWUtMnl
	OHkrkD4UMQSXCrvMqafACZ+YElvAzlkJLPDNN/bEzNpxc82jSgNd/OJclPx0yF0RQy+JrTb
	yS29MEZ/8YvssgR1PGKZkPxuBGEB/72fHqvxWPvJQEZe9JiH6E/0B7Zr/X/Ku6Jk9cJ0QYU
	qvpbYWCMD1KT73T6uDufWk60zozlqSozk++iPquPOO0LAgtlIGpKiky8f63uPBVJb/H2wCJ
	dFpNwzr3/Y7upuE+IqAOOrueISF0Q72cdW3rTNAlUMuThZ8SU98TZ6vzaaVvWi+mZTFzhKe
	8caBE/LtLzzCbIvJ74gptdp5b1iRPGELPK50sWa0DZEPnJLs1ahVa8++Sq0ksJ78ZwOhyD2
	aS1/RTIOWGvPYFF+KiUbww0+OM0EDV1zMFE6sqEHMxagWUGDJi5cNsFXwTENthGBxj8YTk/
	rEzMqMKIjlXLgzJcw/ePbIcmmRpze8GVduP37+b/5vKIG2lG46Bkg/LjSw7vcfdFwIvjDTy
	QmTJ11CjeCsWIl82rdMpN8XyxD6Mssv+kZHNrPrQJxUkywK2d7/eM4QxoquKVAanWM5fI/J
	yLsfRRyZeRPTg21s6VmgpjBxojtS+PdoinwRLFjupCYter7GaRGzTCFU0S1BamS2q/MhYMT
	i/Skhu9m8xbnaFCrX9hUqty7JQKUxeZa2vOT0TTQfN45gRQOJQUJvsAx2GMgpKO9WD8qFWL
	Aiu/cyzSHEbVYlFS9IoRsohcIbyefnnVy32ZMI8v4aQtKudriu74OmaUhgw0PJHDx9FyPmL
	cn3E8TLE/o4oFdnbLhv4owZEYFtj6mrmxPx+Q1+rlH540/ltcXzsgQNLjdAJz7p5rad7/mJ
	5p2J4bIgYwf88/pcFNZ6HZHvyrr2ThwBg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Fri, Nov 07, 2025 at 09:50:26AM -0600, Alex Elder wrote:
> On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> 
> (Sorry I haven't commented on your earlier versions.  They
> included other changes to prepare for this; I'm looking at
> this patch in isolation and haven't reviewed the others.)
> 
> An aside:  I notice the #includes are indented an additional
> space in this source file;  perhaps you can get rid of those
> (in a separate patch) at some point.
Uh? Where?
I didn't do that in this patch.
> 
> You really need to provide more information about how this
> is implemented.  This patch makes non-trivial changes to
> the logic.
I'll provide more infomation in the next version.

[...]

> >   static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >   {
> > -	u32 val;
> > -
> > -	/*
> > -	 * Unmask interrupt bits for all xfer mode:
> > -	 * bus error, arbitration loss detected.
> > -	 * For transaction complete signal, we use master stop
> > -	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> > -	 */
> > -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > -
> > -	/*
> > -	 * Unmask interrupt bits for interrupt xfer mode:
> > -	 * When IDBR receives a byte, an interrupt is triggered.
> > -	 *
> > -	 * For the tx empty interrupt, it will be enabled in the
> > -	 * i2c_start function.
> > -	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> > -	 */
> > -	val |= SPACEMIT_CR_DRFIE;
> > +	u32 val = 0;
> > +
> > +	if (!i2c->use_pio) {
> 
> Why does this block of initialization only need to be done
> when not using PIO?  What happens in the PIO case?  I think
> the answer is that you don't want any interrupts when using
> PIO.  But... what if these conditions occur in PIO mode?
We always read ISR register in the pio_xfer().
Disabling the interrupt for a error bit only prevents the interrupt from
firing; it does not prevent the error bit itself from being set in the
ISR.
And we reused handle_state() so the error check is still there.

> 
> > +		/*
> > +		 * Unmask interrupt bits for all xfer mode:
> > +		 * bus error, arbitration loss detected.
> > +		 * For transaction complete signal, we use master stop
> > +		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> > +		 */
> > +		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> > +
> > +		/*
> > +		 * Unmask interrupt bits for interrupt xfer mode:
> > +		 * When IDBR receives a byte, an interrupt is triggered.
> > +		 *
> > +		 * For the tx empty interrupt, it will be enabled in the
> > +		 * i2c_start function.
> > +		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> > +		 */
> > +		val |= SPACEMIT_CR_DRFIE;
> 
> It's worth explaining (somewhere, possibly in the patch
> header) that this is different from what was done before.
> As a reviewer I didn't realize this at first; I thought
> you were simply making a block of code conditional on
> the value of use_pio.
See above. And I'll put them into commit message.

> 
> > +		/* unmask master stop interrupt bit */
> > +		val |= SPACEMIT_CR_MSDIE;
> > +	}
> 
> I would find it easier to follow if you set up the
> common bit assignments to the SPACEMIT_ICR register
> first, and then do the non-PIO specific ones afterward.
I don't think so. I think it should be configured on demand; otherwise
we will need to do the same thing again when FIFO support or high-speed
transfer modes are added in the future.
Moreover, in the PIO path we would still have to disable the FIFO and
high-speed bits, which makes the approach counterproductive.

[...]

> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> > +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> > +	int ret;
> > +
> > +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> 
> I think this can be a do..while block instead.  Both conditions
> will certainly be true initially.
> 
> > +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> > +		udelay(10);
> 
> Why do you delay *first*?  I think you should read the status
> and only if you're not done, insert the delay.
> 
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> > +
> > +		if (!(i2c->status & mask))
> > +			continue;
> > +
> > +		spacemit_i2c_handle_state(i2c);
> > +
> > +		/*
> > +		 * This is the last byte to write of the current message.
> 
> You mean *if* this is the last byte to write in the message, ...
Yes I lost *if*.

[...]
> 
> > @@ -445,7 +547,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> >   	}
> >   	if (i2c->state != SPACEMIT_STATE_IDLE) {
> > -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> > +		val |= SPACEMIT_CR_TB;
> > +		if (i2c->use_pio)
> > +			val |= SPACEMIT_CR_ALDIE;
> > +
> >   		if (spacemit_i2c_is_last_msg(i2c)) {
> >   			/* trigger next byte with stop */
> > @@ -459,6 +564,23 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> >   err_out:
> >   	spacemit_i2c_err_check(i2c);
> > +}
> > +
> > +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> 
> Introducing spacemit_i2c_handle_state() as a simple separate
> initial patch would simplify review.  (Not a big deal, but
> something to think about for future patch series.)
I will. Thanks.
> 
> > +{
> > +	struct spacemit_i2c_dev *i2c = devid;
> > +	u32 status;
> > +
> > +	status = readl(i2c->base + SPACEMIT_ISR);
> > +	if (!status)
> > +		return IRQ_HANDLED;
> > +
> > +	i2c->status = status;
> > +
> > +	spacemit_i2c_clear_int_status(i2c, status);
> > +
> > +	spacemit_i2c_handle_state(i2c);
> > +
> >   	return IRQ_HANDLED;
> >   }
> > @@ -467,6 +589,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> >   	unsigned long timeout;
> >   	int idx = 0, cnt = 0;
> 
> Why is the timeout a fixed constant for PIO, but a fairly
> precise calculation based on message length otherwise?
We have talked about here [1]

                - Troy

Link: https://lore.kernel.org/all/2ADE8BFFC8EF40BC+aNH0fplBawrkLp3Z@LT-Guozexi/ [1]
> 
> 					-Alex
> 
> > +	if (i2c->use_pio) {
> > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> > +		return;
> > +	}
> > +
> >   	for (; idx < i2c->msg_num; idx++)
> >   		cnt += (i2c->msgs + idx)->len + 1;
> > @@ -479,11 +606,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> >   	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
> >   }
> > -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> > +static inline int
> > +spacemit_i2c_xfer_common(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool use_pio)
> >   {
> >   	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> >   	int ret;
> > +	i2c->use_pio = use_pio;
> > +
> >   	i2c->msgs = msgs;
> >   	i2c->msg_num = num;
> > @@ -511,6 +641,16 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> >   	return ret < 0 ? ret : num;
> >   }
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
> >   static u32 spacemit_i2c_func(struct i2c_adapter *adap)
> >   {
> >   	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> > @@ -518,6 +658,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
> >   static const struct i2c_algorithm spacemit_i2c_algo = {
> >   	.xfer = spacemit_i2c_xfer,
> > +	.xfer_atomic = spacemit_i2c_pio_xfer_atomic,
> >   	.functionality = spacemit_i2c_func,
> >   };
> > 
> > ---
> > base-commit: bc574b64121525b24d52e9bab747184181c808dc
> > change-id: 20250814-k1-i2c-atomic-f1a90cd34364
> > 
> > Best regards,
> 
> 

