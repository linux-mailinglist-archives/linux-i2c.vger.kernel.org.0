Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4C3354D77
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 09:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbhDFHMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 03:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbhDFHMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 03:12:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C92C06175F
        for <linux-i2c@vger.kernel.org>; Tue,  6 Apr 2021 00:12:24 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lTfsj-0005GZ-VY; Tue, 06 Apr 2021 09:12:13 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lTfsj-00040C-1f; Tue, 06 Apr 2021 09:12:13 +0200
Date:   Tue, 6 Apr 2021 09:12:13 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4.1 5/6] i2c: imx: Simplify using
 devm_clk_get_enableded()
Message-ID: <20210406071213.dxwucpggq6m7hfxi@pengutronix.de>
References: <20210330181755.204339-6-u.kleine-koenig@pengutronix.de>
 <20210406064618.24194-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406064618.24194-1-uwe@kleine-koenig.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:08:48 up 124 days, 21:15, 44 users,  load average: 0.07, 0.04,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 06, 2021 at 08:46:18AM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Enthusiastically Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

I hope devm_clk_get_enabled() will go mainline, it reduces dramatically
code and makes my life a lot better ;)

> ---
>  drivers/i2c/busses/i2c-imx.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b80fdc1f0092..d6594358cf83 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>  
>  	/* Get I2C clock */
> -	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c_imx->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_imx->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
> -				     "can't get I2C clock\n");
> -
> -	ret = clk_prepare_enable(i2c_imx->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "can't enable I2C clock, ret=%d\n", ret);
> -		return ret;
> -	}
> +				     "can't get prepared I2C clock\n");
>  
>  	/* Init queue */
>  	init_waitqueue_head(&i2c_imx->queue);
> @@ -1487,7 +1481,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	clk_disable_unprepare(i2c_imx->clk);
>  	return ret;
>  }
>  
> @@ -1517,7 +1510,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq >= 0)
>  		free_irq(irq, i2c_imx);
> -	clk_disable_unprepare(i2c_imx->clk);
>  
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -- 
> 2.30.2
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
