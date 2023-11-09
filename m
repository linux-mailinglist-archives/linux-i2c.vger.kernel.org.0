Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE467E6651
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 10:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjKIJKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 04:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbjKIJKy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 04:10:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7034F210A
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 01:10:51 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0395C433C8;
        Thu,  9 Nov 2023 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699521051;
        bh=7U7PWgCvHIPjShUaspWfK1AyHapZpXmCD1A+goqKk/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6PYbn4MPFXHbs9ScFJCWc2uizxbRxhSP0umM4+ihm/jTDzN7HskNVi+oeIzI9+Ex
         tkNqXzlWYkVV6U3B7s+OX2bmkPzLkrXiVzv40snyEKA2NHpB7XE4aJLGCSRfNFrnxA
         Hafg2MYtgx+j6jqvBFbit9Ljhn4VQLSskS7nYUHJYqCqCIAdhLNtJhRZf3tyXuL1Gm
         hUOdN5wS0AsBTVh4ctpoe/aMD/NB2F9fo7FMia9aEGkyiFPxP+akLn5kOINOlNJMCo
         5UIJLbEfna8zeFmPVQqCvKoh+j32LSkIKxd3bk35F1Y1NKxkNyRbNR1N5vE/TgV1ob
         qkIWv8Mn8/5rw==
Date:   Thu, 9 Nov 2023 10:10:46 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <20231109091046.4hrvxr7g5imfrykq@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231108233809.u3nvxlttmts6tj2m@zenone.zhora.eu>
 <3597042.R56niFO833@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3597042.R56niFO833@steina-w>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Thu, Nov 09, 2023 at 08:54:51AM +0100, Alexander Stein wrote:
> Am Donnerstag, 9. November 2023, 00:38:09 CET schrieb Andi Shyti:
> > On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > > Instead of repeatedly calling clk_get_rate for each transfer, register
> > > a clock notifier to update the cached divider value each time the clock
> > > rate actually changes.
> > > There is also a lockdep splat if a I2C based clock provider needs to
> > > access the i2c bus while in recalc_rate(). "prepare_lock" is about to
> > > be locked recursively.
> > > 
> > > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > 
> > What's the exact fix here? Is it the lockdep warning? Is it
> > actually causing a real deadlock?
> 
> We've seen actual deadlocks on our imx8qxp based hardware using a downstream 
> kernel, so we have implemented as similar fix [1]. This happened using 
> tlv320aic32x4 audio codec.
> The backtrace is similar, a i2c based clock provider is trying t issue an i2c 
> transfer while adding the clock, thus 'prepare_lock' is already locked.
> Lockdep raises an error both for downstream kernel as well as mainline, both 
> for tlv320aic32x4 or pcf85063.

yes, if the clock is using the same controller then it's likely
that you might end up in a deadlock. This is why I like this
patch and I believe this shouild go in the library at some point.

But the deadlock is not mentioned in the commit log and lockdep
doesn't always mean deadlock.

> [1] https://github.com/tq-systems/linux-tqmaxx/commit/
> b0339ff83a979f2ea066012b9209ea7c54f2b4e7
> 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > Changes in v7:
> > > * Use dev_err_probe
> > > * Reworked/Shortened the commit message
> > > 
> > >  It is not about saving CPU cycles, but to avoid locking the clk subsystem
> > >  upon each transfer.
> > >  
> > >  drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
> > >  1 file changed, 39 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 678b30e90492a..3070e605fd8ff
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > @@ -5,6 +5,7 @@
> > > 
> > >   * Copyright 2016 Freescale Semiconductor, Inc.
> > >   */
> > > 
> > > +#include <linux/atomic.h>
> > > 
> > >  #include <linux/clk.h>
> > >  #include <linux/completion.h>
> > >  #include <linux/delay.h>
> > > 
> > > @@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
> > > 
> > >  	__u8			*rx_buf;
> > >  	__u8			*tx_buf;
> > >  	struct completion	complete;
> > > 
> > > +	struct notifier_block	clk_change_nb;
> > > +	atomic_t		rate_per;
> > > 
> > >  	unsigned int		msglen;
> > >  	unsigned int		delivered;
> > >  	unsigned int		block_data;
> > > 
> > > @@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
> > > *lpi2c_imx)> 
> > >  	} while (1);
> > >  
> > >  }
> > > 
> > > +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> > > +				   unsigned long action, void *data)
> > > +{
> > > +	struct clk_notifier_data *ndata = data;
> > > +	struct lpi2c_imx_struct *lpi2c_imx = container_of(nb,
> > > +							  struct 
> lpi2c_imx_struct,
> > > +							  
> clk_change_nb);
> > > +
> > > +	if (action & POST_RATE_CHANGE)
> > > +		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
> > > +
> > > +	return NOTIFY_OK;
> > > +}
> > > +
> > > 
> > >  /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
> > >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> > >  {
> > > 
> > > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > > *lpi2c_imx)> 
> > >  	lpi2c_imx_set_mode(lpi2c_imx);
> > > 
> > > -	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> > > +	clk_rate = atomic_read(&lpi2c_imx->rate_per);
> > > 
> > >  	if (!clk_rate)
> > >  	
> > >  		return -EINVAL;
> > 
> > Doesn't seem like EINVAL, defined as "Invalid argument", is the
> > correct number here. As we are failing to read the clock rate, do
> > you think EIO is better?
> 
> Well, this is already the current error code. In both the old and new code I 
> would consider this error case as 'no clock rate provided' rather than failing 
> to read. I would reject EIO as there is no IO transfer for retrieving the 
> clock rate.

It's definitely not EINVAL as we are failing not because of
invalid arguments. I thought of EIO because at some point the
clock rate has been retrieved (or set, thus i/o) and "rate_per"
updated accordingly. But I agree that's not the perfect value
either.

I couldn't think of a better error value, though.

> > > @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device
> > > *pdev)> 
> > >  	if (ret)
> > >  	
> > >  		return ret;
> > > 
> > > +	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
> > > +	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> > > +					 &lpi2c_imx->clk_change_nb);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't register peripheral clock 
> notifier\n");
> > 
> > can't we fall back to how things were instead of failing the
> > probe? But I'm not sure it would remove the lockdep warning,
> > though. I can live with it.
> 
> I don't see a reason why you would want to continue if 
> devm_clk_notifier_register() failed. It's either ENOMEM, EINVAL (if you pass 
> NULL for clk or notifier block) or EEXIST if registered twice. So in reality 
> only ENOMEM is possible, but then things went south already.

why do you care? If ENOMEM has failed, then let the driver fail
on its own, don't be the one pulling the trigger.

But I'm not strong here: it's not completely wrong to bail out,
either.

Andi

> Best regards,
> Alexander
> 
> > > +	/*
> > > +	 * Lock the clock rate to avoid rate change between clk_get_rate() 
> and
> > > +	 * atomic_set()
> > > +	 */
> > > +	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't lock I2C peripheral clock 
> rate\n");
> > > +
> > > +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-
> >clks[0].clk));
> > > +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> > > +	if (!atomic_read(&lpi2c_imx->rate_per))
> > > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > > +				     "can't get I2C peripheral clock 
> rate\n");
> > > +
> > 
> > Not a bad patch, would be nice if all the above was provided by
> > the library so that other drivers can use it.
> > 
> > Andi
> > 
> > >  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> > >  	pm_runtime_use_autosuspend(&pdev->dev);
> > >  	pm_runtime_get_noresume(&pdev->dev);
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 
