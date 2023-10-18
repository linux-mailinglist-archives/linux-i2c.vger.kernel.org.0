Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C567CD2D6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 06:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjJREZE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 00:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjJREZE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 00:25:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA15FA
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 21:25:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B19C433C8;
        Wed, 18 Oct 2023 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697603101;
        bh=/qP0IrxXUy1ZXC0N76xgRS7Le0GbI4MLpH06dSj40+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HxdlemX9lNbWNwfvfwc1DXhzJwXPyM2wS3A94dwb7uKvr50n81dkY6LNKrAzMKqD5
         zU2Dw+g8NxkgPe5TpDeFH5a4X6EmbMUyHhci+qLsheZMlpghY4JHJlJgmw8DCrS07b
         QnbjaDYXwkaKVB4hGAuEf19EUU0P3KgG2jrBEXnl8HbGb9xKzhvnb/jlicUCK/PgZZ
         d/VAZSdYOHWLVAPiKhMasGmxLySKQyq3mUWG5X2F61geNPVKEN+QD0Eyoyh613n+9m
         n4Eq6u7C+KQiTw/dj3O9ArElEE6QUdJFB9vg47iXZ5FMkPAwGcwvlgaVSH509SAfnJ
         BnMQbFVwLuXQQ==
Date:   Wed, 18 Oct 2023 06:24:56 +0200
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
Subject: Re: [PATCH v6 1/1] i2c: lpi2c: cache peripheral clock rate
Message-ID: <20231018042456.2i7rq46leyoizteb@zenone.zhora.eu>
References: <20231017135436.1241650-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017135436.1241650-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Tue, Oct 17, 2023 at 03:54:36PM +0200, Alexander Stein wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> One of the reasons to do it is to save some CPU cycles on cpu_freq_get()

do what and how did you do it?

> under mutex. The second reason if the (false-positive) lockdep splat caused
> by the recursive feature of the "prepare_lock" (one clock instance is I2C
> peripheral clock and another is pcf85063 RTC as clock provider):

...

> +	/*
> +	 * Lock the clock rate to avoid rate change between clk_get_rate() and
> +	 * atomic_set()
> +	 */
> +	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't lock I2C peripheral clock rate\n");
> +		return ret;

return dev_err_probe() ?

> +	}
> +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx->clks[0].clk));
> +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> +	if (!atomic_read(&lpi2c_imx->rate_per)) {
> +		dev_err(&pdev->dev, "can't get I2C peripheral clock rate\n");

return dev_err_probe() ?

> +		return -EINVAL;
> +	}
