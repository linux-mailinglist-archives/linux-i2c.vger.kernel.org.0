Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402427E4A7A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 22:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbjKGVU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Nov 2023 16:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbjKGVUz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Nov 2023 16:20:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295A7A3
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 13:20:53 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9E7C433C8;
        Tue,  7 Nov 2023 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699392052;
        bh=W4Vcs4W/QfgDu1Xzrorr5cB8wMT6B6DnEaw8yq6P+ck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tdcKygywjnc8prB4lfa3U4LeXqjjLqtJn2Rk2aorrM6UeK4ZvAYEyY1bDvcXMPInf
         rWgcNFQLpT+UFLZEvHi6Z1Ur5rw7hxrHyohgYtZ2DZNbnuHoEoanE3OOtqOaf5tvKI
         z6cHNvfknFIOZbQxtfvpJ0UepkH6Qm2U9LZTDqXIzFW80cmCfCtZ8WxynT23WfeDjB
         P6okGlZrXUnoAo87M8H2pnu+bWIGxdIgDyX4/wR4yQomyvq01/cZatad85RH7ShN7Y
         QHx9QlHSxonbkRkRJrbPAtDOTWSkbLjsMO0At0tS25htiHPQrN28NxqN2Lkg+zbIKH
         HYWO1xdCAuLEw==
Date:   Tue, 7 Nov 2023 22:20:49 +0100
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
Message-ID: <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

is it my mail client not working or is is your patch that has
gone through something terribly bad?

Andi

On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> * CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
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
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
> -- 
> 2.34.1
> 
