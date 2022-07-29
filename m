Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7835584AC0
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jul 2022 06:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbiG2E3c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jul 2022 00:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiG2E3c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jul 2022 00:29:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585C277A74
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jul 2022 21:29:31 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oHHcp-00024n-Cr; Fri, 29 Jul 2022 06:29:23 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oHHco-0002nN-7x; Fri, 29 Jul 2022 06:29:22 +0200
Date:   Fri, 29 Jul 2022 06:29:22 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Make sure to unregister adapter on remove()
Message-ID: <20220729042922.GD30201@pengutronix.de>
References: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

thank you for your work.

On Wed, Jul 20, 2022 at 05:09:33PM +0200, Uwe Kleine-König wrote:
> If for whatever reasons pm_runtime_resume_and_get() fails and .remove() is
> exited early, the i2c adapter stays around and the irq still calls its
> handler, while the driver data and the register mapping go away. So if
> later the i2c adapter is accessed or the irq triggers this results in
> havoc accessing freed memory and unmapped registers.
> 
> So unregister the software resources even if resume failed, and only skip
> the hardware access in that case.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Can you please add Fixes tag. I assume this patch can got to stable
kernel version too.

Otherwise:
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>  drivers/i2c/busses/i2c-imx.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index e9e2db68b9fb..7395560c13d0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1572,9 +1572,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
>  	int irq, ret;
>  
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0)
> -		return ret;
> +	ret = pm_runtime_get_sync(&pdev->dev);
>  
>  	hrtimer_cancel(&i2c_imx->slave_timer);
>  
> @@ -1585,17 +1583,21 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	if (i2c_imx->dma)
>  		i2c_imx_dma_free(i2c_imx);
>  
> -	/* setup chip registers to defaults */
> -	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> -	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
> -	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
> -	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
> +	if (ret == 0) {
> +		/* setup chip registers to defaults */
> +		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> +		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
> +		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
> +		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
> +		clk_disable(i2c_imx->clk);
> +	}
>  
>  	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq >= 0)
>  		free_irq(irq, i2c_imx);
> -	clk_disable_unprepare(i2c_imx->clk);
> +
> +	clk_unprepare(i2c_imx->clk);
>  
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> 
> base-commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
> -- 
> 2.36.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
