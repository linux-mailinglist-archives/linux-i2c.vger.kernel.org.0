Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4157E6113
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 00:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjKHXiQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 18:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjKHXiP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 18:38:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CF325A3
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 15:38:13 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F853C433C8;
        Wed,  8 Nov 2023 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699486693;
        bh=uvL2MnYVp0ebYGPTyQbPvwSG463QIb7Nm57fVszG2AE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=avY5NSye8tE6uhdAQMjs34rdgPofZL3GKfJI5STkhRt8TZTBWAAKmiNCGyoDgxB83
         wFu8+N1lhqSVjrHSisg1jnzaqNz4ZYZVgFxhb82wPmnfljRwOb1PSF60fss1d1ru3R
         mmDDfk/3uiIR0o4DXxbDH9ETd7NH8QVdr5BMjIGOOEYJ88MhMBon8o1lvDu2mJ3GOI
         T59cKx17+JRgm6RkC3e6Bud3vu4LsM0aIs9Ze0cEQWPPv5sr0FNFR9aJkacpwxZZFM
         UT3hfXUGdhlbOyTrU/Z/ZjAJ7QMF+/g27SFLfg+xZf12gJa97CLoduSqfCYFp5u9la
         4/hSvMnUuZPmw==
Date:   Thu, 9 Nov 2023 00:38:09 +0100
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
Message-ID: <20231108233809.u3nvxlttmts6tj2m@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Instead of repeatedly calling clk_get_rate for each transfer, register
> a clock notifier to update the cached divider value each time the clock
> rate actually changes.
> There is also a lockdep splat if a I2C based clock provider needs to
> access the i2c bus while in recalc_rate(). "prepare_lock" is about to
> be locked recursively.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")

What's the exact fix here? Is it the lockdep warning? Is it
actually causing a real deadlock?

> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v7:
> * Use dev_err_probe
> * Reworked/Shortened the commit message
>  It is not about saving CPU cycles, but to avoid locking the clk subsystem
>  upon each transfer.
> 
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 678b30e90492a..3070e605fd8ff 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -5,6 +5,7 @@
>   * Copyright 2016 Freescale Semiconductor, Inc.
>   */
>  
> +#include <linux/atomic.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> @@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
>  	struct completion	complete;
> +	struct notifier_block	clk_change_nb;
> +	atomic_t		rate_per;
>  	unsigned int		msglen;
>  	unsigned int		delivered;
>  	unsigned int		block_data;
> @@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
>  	} while (1);
>  }
>  
> +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct clk_notifier_data *ndata = data;
> +	struct lpi2c_imx_struct *lpi2c_imx = container_of(nb,
> +							  struct lpi2c_imx_struct,
> +							  clk_change_nb);
> +
> +	if (action & POST_RATE_CHANGE)
> +		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
> +
> +	return NOTIFY_OK;
> +}
> +
>  /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
>  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  {
> @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  
>  	lpi2c_imx_set_mode(lpi2c_imx);
>  
> -	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> +	clk_rate = atomic_read(&lpi2c_imx->rate_per);
>  	if (!clk_rate)
>  		return -EINVAL;

Doesn't seem like EINVAL, defined as "Invalid argument", is the
correct number here. As we are failing to read the clock rate, do
you think EIO is better?

>  
> @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
> +	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> +					 &lpi2c_imx->clk_change_nb);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't register peripheral clock notifier\n");

can't we fall back to how things were instead of failing the
probe? But I'm not sure it would remove the lockdep warning,
though. I can live with it.

> +	/*
> +	 * Lock the clock rate to avoid rate change between clk_get_rate() and
> +	 * atomic_set()
> +	 */
> +	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't lock I2C peripheral clock rate\n");
> +
> +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx->clks[0].clk));
> +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> +	if (!atomic_read(&lpi2c_imx->rate_per))
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "can't get I2C peripheral clock rate\n");
> +

Not a bad patch, would be nice if all the above was provided by
the library so that other drivers can use it.

Andi

>  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
> -- 
> 2.34.1
> 
