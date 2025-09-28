Return-Path: <linux-i2c+bounces-13257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CBBA6553
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 03:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7899D17ACD0
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 01:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95AD225A3B;
	Sun, 28 Sep 2025 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Y81h5qTL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBB21C195;
	Sun, 28 Sep 2025 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759022337; cv=none; b=ZP/laWNr71Vo+NHdgd+BBi6dLOImdYp8KPd2vyF04AuC9+1JACl8vsyD+MWE5YV80BiqaL6kNKICfCd7VOUDA95nhrbIMmgx86n2F7Oh2NHqtF5mD7xFdE3PmmZWtGWmpoFIP5Wpxkszl3Z7fFZ/YF+3YI0Umt2x3/49H1qWScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759022337; c=relaxed/simple;
	bh=OZeV1OlEHzn9rTsPVLrXntOAtHPGHiYv+Se7Jz5fOko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyn9hNIURaGkqTFBO3zDb+piqquErn/5pQEva1rpOeHh3Kv99Vq6GGe+qkSgfzF5zzKs3jfBR2nhO9DCU1UAvf0hv8n+0VN/ZUPBMkBvbXj9GfHD5xF+1JEnS7ZXRum/eIdDkVulMQ5S4ZDeENYhi9+WGyT1T9aAP7r4c7bI4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Y81h5qTL; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759022239;
	bh=B6/8CMm+MJcvdAtTm6O0/Hl6/1zKACnAs1iFhf8nxzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Y81h5qTLmiyHctY+kJ2pKGp07MpNZCxikItBr1V+YbcgaMqJIWjItTfRqVYuHexVh
	 5cfkMf3x6aw7Okv8y3mxA4LtNqUvaAAfCgqg3zTum9GDr/9fR8Ls/YFlE4iV8tRFEa
	 BIdlgDWqa89wmwIiDvi46qBSz2NsFVcjrwUdBVAI=
X-QQ-mid: esmtpsz10t1759022232t18daf930
X-QQ-Originating-IP: 7mCsBPPhT/6CNqfzBJZ8k8NdCodLpvNQOBzcWQpT0/I=
Received: from = ( [14.123.252.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 09:17:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9224920852930177741
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 09:17:10 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250927105616-GYB1338789@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NaHbrSwv39g0eI/CANYtFpTvZcQ7R/6wnm18H5lcZOz4THf1K5Yvz6P3
	0X9iEwbjcXAy1wjfL4upkWqAgDjsOBqiO947oSC2mvTF6/YnAaCfSAbXCBYFreyeSotP3a9
	g+4QH0WT7nXHpgbcyhtuNgKpdU8FdLv4zoJP5kjTXrKZG3TjqFcwuv/xTAUJCfHhMld4iq2
	odOvVYCPTnkiTIFLVi6CbqGnRX49BJx70HxFQrbNcAHn8rLvoDcB8i2tvaSH+l90IDBaIKt
	djcZ4VCbwvafQxnohh/diU7Hs7NUZW7RFWZsI02tu1NXNMVIPW+V/gqdQ0THRg7PRHSwtnZ
	297O4k0JTxJWFHFkzS/KDDDDy7FuMq/k/AGYElR62TAkrXXRRZb9fjvHcI9eAnYWY5YnaUt
	LdpgzL3x3qAbq6z5l79ft201HoM4WN2/Fj+VAtLyKIjFUlpjRdklCbjn12ps8cFh2oNEN88
	ePrQeyNXgiD77OonaIsM7ayoj6DeV1C6ePea9KZb2gfV8Cb//pDwJn3E9YIHTKN5gXqVrsF
	waHLOewN5D+4fbEs2FIadG8GJwiCw+1vB/aHS1q8/TZUf7kpZw5LVXhLZOGTzIJg1sVSrWM
	FDFVAigwnBvxdNXCIVyEYs53dxPTE9WK0keCCxSeaWChT4wwKQjhJ/VcMIpfi8kci7rV89c
	RJbevWa8GpIsWDvCgBCX+bM72H0koLL9AkbrG7TGvvPvxKzwDZIf8jdezr3KPStw5oj9mp7
	C1QkUeRQn7YkdrlqA61ggJ/HmY4CqUYJOzr7/F9PZ6EcIoVUk/2fUiLO+4GC8OS8dA6w4cY
	P9mPhsL/dLiAGsaZsdKCVzzH6o8Bj/YNRwO8lpjuV8yKnQPKzO+sgByDl+NbitLv2Euo14x
	LTm7UmaOqjW7+MoJ65+qTxsaPT8wbYH9dmvnAPJMiVijKhWpv6pD6gt7LWwAdb47t2EtBCT
	Cb6lkJxSq7VQR6NbcjbhNFxTEHKYswCNQWZJ1BjqR78P/1xaebgLwa0AAoiulV3miVQX9Vz
	O77V8gXkf4Y64/WUwzDgnNA4345AX/nwrXiMs6Tg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Sat, Sep 27, 2025 at 06:56:16PM +0800, Yixun Lan wrote:
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
> ..
> >  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> >  {
> >  	unsigned long time_left;
> > @@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> >  
> >  		reinit_completion(&i2c->complete);
> >  
> > -		spacemit_i2c_start(i2c);
> > +		if (i2c->is_pio) {
> > +			/* We disable the interrupt to avoid unintended spurious triggers. */
> the comment is suspicious, and seems wrong..
> > +			disable_irq(i2c->irq);
> > +
> I guess this doesn't disable interrupt in the hardware layer, it will still
> fire interrupt once enabled, so instead of calling disable_irq(), why not
> dealing with ISR setting of the controller? I mean those "IE bits"(interrupt
> enableing) of ICR REGISTER, disabling them should prevent the interrupt
> triggered?
For example, take MSD (master stop detect).
If we disable this interrupt, even the interrupt status bit will never be triggered.
Then how are we supposed to know when the transfer has completed?
That’s why we disable the global interrupt here, but still keep the pending bit.

> 
> > +			/*
> > +			 * The K1 I2C controller has a quirk:
> > +			 * when doing PIO transfers, the status register must be cleared
> > +			 * of all other bits before issuing a START.
> > +			 * Failing to do so will prevent the transfer from working properly.
> > +			 */
> > +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> this also doesn't seem correct to me, the irq status bit should be cleared once
> interrupt occur,
> not dealing it here before sending msg, this seems a
> wrong procedure
I'll double check it, as I recall that if it’s not cleared here,
the second message will inevitably fail.

                - Troy
> 
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
> > @@ -341,6 +417,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
> 
> -- 
> Yixun Lan (dlan)
> 

