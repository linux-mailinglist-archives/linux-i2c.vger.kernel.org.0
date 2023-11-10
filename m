Return-Path: <linux-i2c+bounces-7-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C57E7EFA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2861D2816DC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC073C684;
	Fri, 10 Nov 2023 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2BgNnjo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68F3B79D
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA8733F95
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 04:27:25 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B846C433C7;
	Fri, 10 Nov 2023 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699619245;
	bh=TBjfM+0v5vP4+EpCJ/0NcmUBT8x+HTYiMxO2dAn7jRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2BgNnjo/5n48ON5Pvkk/wZ5ZQrSDKLJVregVOrVHq5fyZLC0j3ryb4xD22MXJnu3
	 2tqPSUMsFOXPvEXd8v4kDY/IoaqCwGr5RhwgyQu1b+821KKOYpMPI/zRWsKIqe0iOR
	 JUHJCar5vwEx4TzlOLLijSHlSzkrJku3+maQffT1Ys1zsKQas6VzdYAT/92AOw/kzH
	 loz1KtkkPcbf+E4lDHwxO58JLDj70cb9eK5nYXlrlqWjnS8GN6mM3vCrsBGEpyUjCD
	 PKke8V9gmd+h1NYeik0Td4qIXLsEBFkjrwQTkd8BIKdSHaiDqx5FsbV84oMAhbQ1mE
	 xF839Qk0U41Ow==
Date: Fri, 10 Nov 2023 13:27:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <20231110122720.cyxtnpj5k6bip3ok@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231108233809.u3nvxlttmts6tj2m@zenone.zhora.eu>
 <3597042.R56niFO833@steina-w>
 <20231109091046.4hrvxr7g5imfrykq@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109091046.4hrvxr7g5imfrykq@zenone.zhora.eu>

Alexander,

if you...

On Thu, Nov 09, 2023 at 10:10:46AM +0100, Andi Shyti wrote:
> On Thu, Nov 09, 2023 at 08:54:51AM +0100, Alexander Stein wrote:
> > Am Donnerstag, 9. November 2023, 00:38:09 CET schrieb Andi Shyti:
> > > On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > > > Instead of repeatedly calling clk_get_rate for each transfer, register
> > > > a clock notifier to update the cached divider value each time the clock
> > > > rate actually changes.
> > > > There is also a lockdep splat if a I2C based clock provider needs to
> > > > access the i2c bus while in recalc_rate(). "prepare_lock" is about to
> > > > be locked recursively.
> > > > 
> > > > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > > 
> > > What's the exact fix here? Is it the lockdep warning? Is it
> > > actually causing a real deadlock?
> > 
> > We've seen actual deadlocks on our imx8qxp based hardware using a downstream 
> > kernel, so we have implemented as similar fix [1]. This happened using 
> > tlv320aic32x4 audio codec.
> > The backtrace is similar, a i2c based clock provider is trying t issue an i2c 
> > transfer while adding the clock, thus 'prepare_lock' is already locked.
> > Lockdep raises an error both for downstream kernel as well as mainline, both 
> > for tlv320aic32x4 or pcf85063.
> 
> yes, if the clock is using the same controller then it's likely
> that you might end up in a deadlock. This is why I like this
> patch and I believe this shouild go in the library at some point.
> 
> But the deadlock is not mentioned in the commit log and lockdep
> doesn't always mean deadlock.

... improve the commit message, reporting the real deadlock case
instead of a lockdep warning and...

[...]

> > > > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > > > *lpi2c_imx)> 
> > > >  	lpi2c_imx_set_mode(lpi2c_imx);
> > > > 
> > > > -	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> > > > +	clk_rate = atomic_read(&lpi2c_imx->rate_per);
> > > > 
> > > >  	if (!clk_rate)
> > > >  	
> > > >  		return -EINVAL;
> > > 
> > > Doesn't seem like EINVAL, defined as "Invalid argument", is the
> > > correct number here. As we are failing to read the clock rate, do
> > > you think EIO is better?
> > 
> > Well, this is already the current error code. In both the old and new code I 
> > would consider this error case as 'no clock rate provided' rather than failing 
> > to read. I would reject EIO as there is no IO transfer for retrieving the 
> > clock rate.
> 
> It's definitely not EINVAL as we are failing not because of
> invalid arguments. I thought of EIO because at some point the
> clock rate has been retrieved (or set, thus i/o) and "rate_per"
> updated accordingly. But I agree that's not the perfect value
> either.
> 
> I couldn't think of a better error value, though.

... find a more appropriate error number, I will ack this patch.

If the deadlock you mentioned is a warning from the lockdep, then
please remove the "Fixes:" tag.

Andi

