Return-Path: <linux-i2c+bounces-13221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4162BBA58C7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 06:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44902A5005
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 04:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD3A2264D6;
	Sat, 27 Sep 2025 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="N3xrlTI7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1759A18FDBD;
	Sat, 27 Sep 2025 04:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758946044; cv=none; b=u1Zf5dGhluWg3vnxS8XewuyfGLBGqqUutMyTMQG4m/A/iUD5NRz8n4psOrpja8Aknweo+Ly+q5vysoKuYn13rNWl7MXJcfWflGVJ8GP1nFA5rZRbEyOwqi7CsWE9y5lbz7ZnhxWrAChdxZcChxfXcYEV7cqiuMLJ7HOdDhRMUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758946044; c=relaxed/simple;
	bh=aLkHx4k3P4OgRYh0loe9tQqAbYEDPQInhm/r203f2Qc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffH5SsHPStleoWxZFc4uq2qECavdJQbY9E/uwhOXO1V18MKQdTsbLRuGpw1uMe+WTAGOpAOdz+LKL/osBsF6BxD7c2kfkvyLIrykOjkd8D67tJSID460lTlU+QNsZHRhzvyaPRVzALqgEER6YTZ/MzXKfAn0ELIxMX8TUEPgzcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=N3xrlTI7; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758945958;
	bh=1cA0Twd5aoWkSdpWmk4AkKgqoVl4RWYZ2+yNa24hIj8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=N3xrlTI7XgVnT30oUE78V5S/PTBe3kUFFDQr9c5atMxl0zoGpEZCD9k55bHfIeiN8
	 SdlVU/hmQLd/rxwhESt8ux6STsdTfyczzUgLbikL67AbKj5qa3kA/6WYHOsmT8LVjW
	 vleifV8/Ig6V3568VPKVMOg/xTd1lptsPDsAajhg=
X-QQ-mid: zesmtpip4t1758945951t5ad2eb81
X-QQ-Originating-IP: zqIHBn+nBguhXZ9TRxudpZn6Jb2l/o938Fjr57xEmcY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 12:05:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11693667648508525757
EX-QQ-RecipientCnt: 9
Date: Sat, 27 Sep 2025 12:05:50 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <F3CBA41FF1849DD5+aNdint66DRw4AcZK@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <aNbDkn9AC4FFx-Zc@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNbDkn9AC4FFx-Zc@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MgQY1K25Ph0m8TgChpmhmRlSJRINu7fuTLeiY5CDXSnrgub8dw4qBJyp
	qWI48vVAqj3/VmStXURHWd+6saUMG/NCYrxXlRxJ/aXDyW62IDGb/la9O3fpBOmifSxqc2f
	U1UoW5mGKaS8rb660eQKNVlM/W1hYT2q4VL2GWVUsvcmeI2wGtCLuHwPuJHjXecI+3GlDlS
	iC+iGu3Q4uh6GT/UaMoUEyy0osAVUQn9sXFBIuSnZKrO33QTsOsrRlt+4WT8cMTxZSRvmWS
	7gXZ7UlrdgxCwgQISwFBAfhJhVPeTaI4dUfD775rdZFGzpC5tFZOzuqRAAryekRtJeVMrk8
	C/ZtSYaScncvWefTG8hdGQtxJD7oM5yElnKbjQnNAIbXkKuW3XVGN9gWZUd1cKOk3Yvl6f7
	I9YDVImGmk4PjjxsA20vlAnGWqJXl2UbAztr1OHFeBMA4+pl8/ekdF1H8vyibFF7PUSt+2A
	KaeH5FZmH0dc2qapcQrQvSMFykj48HfYw4vrOfqMNgPPhlD7wl93uQfDkn2EEK+a8VQC678
	OIPhKJVk5nJmJ7qnfwp2zLBSux9tmzdeIe9O//KqgFjSYJUIBEAUNe7wR9UyBhOA4EJ1/Pp
	PXltJN1Sj270ArO3WQZ3rVzr9VpF5Bwn1zoBQopdGoEKHXPrHQehU3ql+JMMLO7ZIct1eb0
	JarCBY0qc3IKYvxoVSjaaFRMnjQgydoKp2qC+KI62edHknYnCaIE9XezIFGwKVqBdEaag68
	BxRCMOWyteQ/hvPOQkJTB/eCiXN7RWJBrd60AFiovu1Mbq00AyIYgh3bn3W0FaQ5tbswueg
	2A7rLWyfoyM4NcScTnGPNdFSwwIM+4vSPee/Ewc44vVIECHgib/khQTYV+spIU4GngclwO/
	GGvE1NxqZePm1HT1tGwbZSzdgx8Jul/8osrm4UeRRDgEiEGCYmrUxzHNNc8IamxV64X/u6x
	V2z9cwA54s3i6YhisTmkioeHYaem4Dqfw5Xu/FP5MgvsRp74euPjcLSsiG8o2rFMJ8p/Msv
	7gE/UYJ0vZgqnRCP+W0878JBC+bPzRdtUCiyQeKBQBQKNuDuHnGzww9abgSMhk024k/2rvN
	g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Fri, Sep 26, 2025 at 06:47:14PM +0200, Aurelien Jarno wrote:
> Hi Troy,
> 
> On 2025-09-25 10:02, Troy Mitchell wrote:
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
> 
> [snip]
> 
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
> This needs to be readl_poll_timeout_atomic(), like you changed in 
> spacemit_i2c_wait_bus_idle().
Yes, nice catch!
That's my mistake... I forgot this.
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
> 
> [snip]
> 
> > @@ -479,15 +578,21 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
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
> > -	spacemit_i2c_calc_timeout(i2c);
> > +	if (!i2c->is_pio)
> > +		spacemit_i2c_calc_timeout(i2c);
> > +	else
> > +		i2c->adapt.timeout = SPACEMIT_WAIT_TIMEOUT;
> 
> Thanks for fixing that, however i2c->adapt.timeout needs to be in 
> jiffies, so you want to use msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT).
Thanks for pointing this out!

                - Troy
> 
> >  	spacemit_i2c_init(i2c);
> >  
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

