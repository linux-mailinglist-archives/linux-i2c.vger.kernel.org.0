Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F260E6B9011
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 11:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCNKcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 06:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjCNKcS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 06:32:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C2D95445
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 03:31:19 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pc1vq-0005Jf-7n; Tue, 14 Mar 2023 11:31:02 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pc1vp-000350-Bg; Tue, 14 Mar 2023 11:31:01 +0100
Date:   Tue, 14 Mar 2023 11:31:01 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: Simplify using devm_clk_get_enabled()
Message-ID: <20230314103101.GB28733@pengutronix.de>
References: <20230313183349.2774002-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313183349.2774002-1-u.kleine-koenig@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 13, 2023 at 07:33:49PM +0100, Uwe Kleine-König wrote:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

> ---
>  drivers/i2c/busses/i2c-imx.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cf5bacf3a488..42189a5f2905 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1482,17 +1482,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>  
>  	/* Get I2C clock */
> -	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c_imx->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_imx->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
>  				     "can't get I2C clock\n");
>  
> -	ret = clk_prepare_enable(i2c_imx->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "can't enable I2C clock, ret=%d\n", ret);
> -		return ret;
> -	}
> -
>  	/* Init queue */
>  	init_waitqueue_head(&i2c_imx->queue);
>  
> @@ -1564,7 +1558,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	clk_disable_unprepare(i2c_imx->clk);
>  	return ret;
>  }
>  
> @@ -1590,7 +1583,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
>  		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
>  		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
> -		clk_disable(i2c_imx->clk);
>  	}
>  
>  	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
> @@ -1598,8 +1590,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	if (irq >= 0)
>  		free_irq(irq, i2c_imx);
>  
> -	clk_unprepare(i2c_imx->clk);
> -
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> 
> base-commit: eeac8ede17557680855031c6f305ece2378af326
> -- 
> 2.39.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
