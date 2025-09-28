Return-Path: <linux-i2c+bounces-13263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB14BA6AA3
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 10:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06EF53B8DBD
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 08:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64BA29AB05;
	Sun, 28 Sep 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tCqGingi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0E22D7B1;
	Sun, 28 Sep 2025 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047073; cv=none; b=roYP0ABZXYZm+YOQzst7EtNhvVZP7nPcYzXCqUUa3ujyReV9ChhVNq+Zw3PTWbHPoImvwxpy1/xOQ5ZJM8ZDZ1FedJdJdXqon+z0CNDdY4DKdT+Ckve2BhgcuH7IWupZElrsfQifX67c/5X5HJi2HkZyth8axtRU7xaB/iBmbZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047073; c=relaxed/simple;
	bh=pJa/2gmAseTdHYEOAFYTCKye1ReYV0I8NYTDjli2hfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5fWbcWogYAMCuSviFXKoy3Wchhfxz2orlsOBo4wDuyqEIpftPWveeh0ZBkumhSlXm3/ceLiex6k7a7q1dJUMKtqkd3lNs9xYlH0TKsRp1s/I24Mu8S39ZMbteRjplS/ofipB/DRBvfK1VrJ9WzXd5Y9O+GY6Yf1+8Ys0MltYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tCqGingi; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759046992;
	bh=huo9g+Dr1a8I2hAxfoJIzoriLtdykMFTIJMj79fdbiE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tCqGingivlTYf0T5kr3g8zWt179L0R4t59eJ/4fc5fEMcbWzFHlDMsYqfEmXuuP8j
	 WY73ufrKa/n8FK4l9bftocHNnuWSVP8B2jf1iBYq2QzNebzvSUyEzUnzQ2bQN62C+o
	 jkgQOOv1vm3CbtnGEtFGiB/ZLyxt2+gXWrNMJs78=
X-QQ-mid: zesmtpgz5t1759046985tda2350a8
X-QQ-Originating-IP: MjDykqLXBetnV6yJVyKRwtAmStF97JtuaaEOhxjiPvs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 16:09:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 457754706677137024
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 16:09:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
 <20250928025400-GYB1330052@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928025400-GYB1330052@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NtleUPfB2I+Mo5kanMnXKtmbbVqazyTIsQcMbVHAE4L7IoEjYym5wuSp
	C1IHzSHM+xNHSmKc6/Gfp23o9dSBRacnbMLsPxwgS3Aszze/giAYr0/DmZF08cCFAH8HCyY
	K0zvcPp1UN310gh6e65TwS9xQD0K2y3jDhVC9GrLgqV0oHBBAijmEm/SzD8hDC+7EJgyGgV
	TSPyRIrv7y88JxCS/jZ7dDJ/iNI+BOS5Ec/9Mltg9Lm0TrVFcRKtium1Waz9BDKwvEWq38F
	FwUEYncFBK6DVWCwiHoC7PRbSU73W7igSwIhTvA/RGr75amWD+nqbNc8bfiF4vIhUTJSFGy
	AlFRPfwuyGTJ1zlTzCBQ5sNmSpbjylHG+6l2kDZ6F6defUPEZXtCNP3zzwXllWR+57rKTQ3
	KjPnt9GHFGY9WWrqP+b0STtigyZzzzj/P7R1vt8F/DVY9izDuGz7tLcsGWvmu0IXciPbnhL
	lZg6z1ZgpYho09CjSc9Bf8Vk+6ftQ5uzHZ9B3nlFF7JLcPNVf11vc/r/T3IQ76FLh7S55yE
	6kMDUXpjEnvqPP9dqM9Dstx66hIcLAuLZtEaiLFqXZQWlF/8mQW69JRA+Mc/F2oHkcg6A2V
	KzjhqkND89MGjxuCkF/KoWM4JC/FDnwZciY0iQGi2Toogwzw7f2ECi+QuupniYZCKEx+svc
	EXzVyJWToWYqYScKJlPJF4E7I4szOwfBc0r+a+fOIVgg4ZJ1VaAphuR0LquLtJum8vHao3J
	hf/AHUQDD85LTrRseZOZu1L2qt5i0BMlQuxq7PHUTVC/VOL9/W0VWnqT9gb+Y/p5F9d9GkI
	xqQc6/UpcfyfTBcqgiDWLG+Vb/tdHLOJujAqLi8ei/SNSKvL4PsL26WvXM5PlR15fN/Ksik
	bEwy8owMtVlcz67BOwEYN0BZTAITGlIb1YVTa5Q8RTAItTeUEaivklLbV872b7sT2VNE1TS
	NVB993U/uk/bXM2+3CWBKTz7Af8tooHE4YvR2PT2mC9IgVCkmvF0nkAsuj+S1zpdjinFXrY
	1XbFj90SPKt14Ts0UKFbjmSm1ZRlteC2mXwOXRnUqOsz49ZvH3R5vH7oQI7jEafGM+jBQM2
	5ZVWUjFb4/rIPAOGw846SDN9b8c96a8+Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 10:54:00AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 09:17 Sun 28 Sep     , Troy Mitchell wrote:
> > On Sat, Sep 27, 2025 at 06:56:16PM +0800, Yixun Lan wrote:
> > > On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > > enabling the use of I2C with interrupts disabled.
> > > > 
> > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 140 insertions(+), 24 deletions(-)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > > > index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> > > > --- a/drivers/i2c/busses/i2c-k1.c
> > > > +++ b/drivers/i2c/busses/i2c-k1.c
> > > > @@ -97,6 +97,9 @@
> > > >  
> > > ..
> > > >  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > > >  {
> > > >  	unsigned long time_left;
> > > > @@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> > > >  
> > > >  		reinit_completion(&i2c->complete);
> > > >  
> > > > -		spacemit_i2c_start(i2c);
> > > > +		if (i2c->is_pio) {
> > > > +			/* We disable the interrupt to avoid unintended spurious triggers. */
> > > the comment is suspicious, and seems wrong..
> > > > +			disable_irq(i2c->irq);
> > > > +
> > > I guess this doesn't disable interrupt in the hardware layer, it will still
> > > fire interrupt once enabled, so instead of calling disable_irq(), why not
> > > dealing with ISR setting of the controller? I mean those "IE bits"(interrupt
> > > enableing) of ICR REGISTER, disabling them should prevent the interrupt
> > > triggered?
> > For example, take MSD (master stop detect).
> > If we disable this interrupt, even the interrupt status bit will never be triggered.
> No, this is not something I understand..
> > Then how are we supposed to know when the transfer has completed?
> > That’s why we disable the global interrupt here, but still keep the pending bit.
> checking 18.1.4.1 ICR REGISTER, there is Master Stop Deteced Enable - MSDE (Bit[26]) and
> Master Stop Deteced Interrupt Enable - MSDIE (BIT[25])
> you can disable MSDIE but still enable MSDE, and check status of MSD (BIT[26]) of ISR REGISTER?
> it should still work with interrupt disabled, otherwise I'd consider the hardware is broken.

Okay..maybe I misunderstood before.
I'll remove disable/enable the controller IRQ around PIO transfers.

BTW, the K1 I2C patch [1] for ILCR as the SCL clock hasn't gotten
any replies in ages. Could you take a look?

Link:
https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/ [1]
> 
> -- 
> Yixun Lan (dlan)
> 

