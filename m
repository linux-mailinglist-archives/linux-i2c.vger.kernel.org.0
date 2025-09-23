Return-Path: <linux-i2c+bounces-13107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64AB93BFB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 02:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D871744437F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 00:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D33166F1A;
	Tue, 23 Sep 2025 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="iCrjq/+9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE6A224F6;
	Tue, 23 Sep 2025 00:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758588646; cv=none; b=Kv5awKQ/1qKWxu4Oqg7jinbffQBMHGfuJT7lZIPVhaZweYYhskQXnI4eGQxaK+VEHu0pYZYwXiiR2dRHTS45Y/nEw5wGW/NpZhMGxYL8otB6gRGa5g12YcWduj6VPA3nKLEt+IrocJi7TiuJ9PuUaZgtkmC2zPG/ajIUOeTU0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758588646; c=relaxed/simple;
	bh=LCwEqpkTuEVze3sLu+XZf3pH49qzeaOjnCZP7rLlPlM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeOwR7IxHvZtg1qPqhOHICmC4I9342DvSGJQUqfeciBUuFM0GeaubK+B1ck8chGG2F0WHMpUvdGqSvfyull26Rpt5DVKUz0dai5YNF0QGvn4SNw2QJu2ZG/9TkrmZXLlccpU6HD3gYBHUYShMfBY9sXjhl+Iq6b4cs91QQlguiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=iCrjq/+9; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588572;
	bh=tVo0Mj6EIacICU8Zva+Nvkjbbh1bFJr07yTobLy1i8s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=iCrjq/+94WB8ZK2DA45Ss5J6kidmAsVrx81XOnHYGgkCU2caZeelIG3spxrz+xRAJ
	 1OHe2ZlsQfwbbeXpUurQj1AGiT3qWmm6UrZ1opwhlyPvV8lDr+HBSAYcTeTd6kohqf
	 9S4Ckpkut+CHwcRHQw3Z+cZ9XD0eLHn9iW9VFbCw=
X-QQ-mid: esmtpsz17t1758588565t349df697
X-QQ-Originating-IP: 5SFyfcmSsoOR4HcPrenmCrCBMq375FcJCu0OZG3kW9Y=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:49:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15703022042497834592
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:49:23 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 5/6] i2c: spacemit: ensure SDA is released after bus reset
Message-ID: <88C40EE66EF5519F+aNHukycHdAifY9du@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
 <aNG36jhaWN-mtgMm@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG36jhaWN-mtgMm@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N5P8YjqDjrfy/hQiz0Myj1FjXNUs8PdgUUuMq2jBhf97aXpLGTodLUHP
	pMa1rca5Xo/wgi8RbUbAez5R+GDOy4zxjWc11Ncl4IFEygZMM3CYwj513HobTOAFFL3tYH/
	OE2tWRNIlEU9H6jGnQAzcJmLNWgU25UB2GgBu4YpGsZQtu4X/PEJfEjNc7umaIuQgokJ7TI
	HoZZCWoGZjDMEqTCFa94OBponCuU55Q8pHOhU7xvFAU22qwEig5R72CT+ld0GUbeA54HS7X
	YnqiC7Pjs3iN6i1av0sWohuLFhbWRJnT0+ME+RgBAQ5dzqnZu3hRKwQMb3AWa3tjEiHiMA0
	apKO/FNz0kB1JmnGyJYG+Ng5K7aEIwObIJxUr5ynegttYiFKQFHQVEVvorLNEWMvD3QQA2x
	+StohkJJZzGascFW495smxtmLxGTiEh2Y0O+3NzpJrDWPiOMv7ZCi/gUokb5LACcacXTTTq
	7q22oo1pf9lM9AYlVsW31KR7TaVnTRO2P/vbnqAx57COgAMw+WyPQFqbH5S0fVV2/gW3z5u
	m32evAqZbX5qk4lfmO8kKsfvkFtdnQSI9pqDew912U0c8yXPFdSwy0mdM8sho9U87FWjX3h
	c33TKyKCln8EBRaVcasF7RKC3CDb+mzRw5OWLWtEG0ekdurKBMvp7vVnE0N7uMM8dCihduQ
	6J0HCXWV1ko9XfLk7GoY9UWs07fMn5/Ah7pQ9ij6PHoCnyagHLclSM9TaUbkfnmqSZglLGj
	/NZ22T+BtZyFXVRkp9uoiEa7H4YyT2d8C2KOybpCpbHjDTek+mYJ7ZuOkCgeZvJD5suh3dN
	hTN8HMd922vQR5aWi4eHIjZa/5P6B0rlik7CbKgtpHCUfnrboucWhDEpVAklmuT5Klvh6+h
	0+gmXbWkP8lu7uuzcGHbNAsleNMh3pDPtwgxxOOuMW1UlESNj7W3tnHhpnVTS7kYYBem4LL
	3FFG62rQWgcO/Sgik4i2GbTmXo7mlUvxagSlGHoFhzjAcBfdteaG6fYGnQULZTa/lqzzxvN
	bAoWgukePspXIAfkVangPSwOLh6R0YBBuS2BbzQIfdaOPK/x8jaMqR6VcLGaV534Cd+swGK
	ysYIEJ5Mg0SGYU7rZEr4G5FckHxG1o6HaWGvWovcQX8
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 10:56:10PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > After performing a conditional bus reset, the controller must ensure
> > that the SDA line is actually released.
> > 
> > Previously, the reset routine only performed a single check,
> > which could leave the bus in a locked state in some situations.
> > 
> > This patch introduces a loop that toggles the reset cycle and issues
> > a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> > SDA after each attempt. If SDA is released before the maximum count,
> > the function returns early. Otherwise, a warning is emitted.
> > 
> > This change improves bus recovery reliability.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 4d78ee7b6929ee43771e500d4f85d9e55e68b221..d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
> >   */
> >  
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/i2c.h>
> >   #include <linux/iopoll.h>
> > @@ -26,7 +27,8 @@
> >  #define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
> >  /* Bit 9 is reserved */
> >  #define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
> > -/* Bits 11-12 are reserved */
> > +#define SPACEMIT_CR_RSTREQ	 BIT(11)	/* i2c bus reset request */
> > +/* Bit 12 is reserved */
> >  #define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
> >  #define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
> >  /* Bits 15-17 are reserved */
> > @@ -78,6 +80,7 @@
> >  					SPACEMIT_SR_ALD)
> >  
> >  #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> > +#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)	/* bypass the SDA glitch fix */
> 
> The comment here seems wrong, datasheet says "The cycles of SCL during 
> bus reset."
Yes, that's my mistake.
I'll fix it.

> 
> >  /* SPACEMIT_IBMR register fields */
> >  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> > @@ -91,6 +94,8 @@
> >  
> >  #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
> >  
> > +#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> > +
> >  enum spacemit_i2c_state {
> >  	SPACEMIT_STATE_IDLE,
> >  	SPACEMIT_STATE_START,
> > @@ -163,6 +168,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
> >  static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  {
> >  	u32 status;
> > +	u8 clk_cnt;
> >  
> >  	/* if bus is locked, reset unit. 0: locked */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> > @@ -172,6 +178,21 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  	spacemit_i2c_reset(i2c);
> >  	usleep_range(10, 20);
> >  
> > +	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
> > +		status = readl(i2c->base + SPACEMIT_IBMR);
> > +		if (status & SPACEMIT_BMR_SDA)
> > +			break;
> 
> What about just adding the return here instead of checking clk_cnt 
> below?
> 
See below.
> > +
> > +		/* There's nothing left to save here, we are about to exit */
> > +		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
> > +		       i2c->base + SPACEMIT_IRCR);
> > +		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> > +		usleep_range(20, 30);
> > +	}
> > +
> > +	if (clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX)
> > +		return;
> > +
> >  	/* check sda again here */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> >  	if (!(status & SPACEMIT_BMR_SDA))
> 
> Once we have exited the loop, I am not sure we should check SDA once 
> more, maybe just display the error message directly.
I'll double check it.
If it's unnecessary, I'll just return directly.

                - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

