Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF3B728B91
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 01:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbjFHXKq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 19:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjFHXKp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 19:10:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA84D2D7F
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 16:10:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 915A661F4E
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 23:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFF1C433D2;
        Thu,  8 Jun 2023 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686265844;
        bh=fpIMMSriP/UCuOJyCkT+S5TImy4gw54+qLblhtXgX6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jNEs/C5SOj3X6IMSsVncsAqEShA1M7+OPz82IQ/tjuddpnwxDsMBIBPkS04xr7k9K
         o0SByL8IORvMXahqpZU7p9WXs73OlQfLav42qcy/qnIM153aNlhku5siNsxt4YbwKs
         LjUMmL8mwARMGMF5liPoHoAU4IYLSLbFYKTkXrB8xaI0RIKYu/hD7N0KiJmuf6vCrF
         zJuh4/1ruL9cY597yCvcW0u+jui0rVdT5feek5bVog1P4Fv2htRF7sJ7CPo0pU2Qhb
         ad95JjUBxd+5KJ1Yv5jaw5HSCAnlRS2pe2K5E4zoKCLqMQJp2QeYre7tfxRNT735Zp
         DABWnDagU2D7w==
Date:   Fri, 9 Jun 2023 01:10:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: hix5hd2: Make sure clk is disabled in remove
Message-ID: <20230608231035.ppfzyuegkk5ysjau@intel.intel>
References: <20230608225513.1151574-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608225513.1151574-1-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexey,

are you still around? Your patch looks good, just two things...

On Fri, Jun 09, 2023 at 12:55:13AM +0200, Andi Shyti wrote:
> From: Alexey Khoroshilov <khoroshilov@ispras.ru>
> 
> pm_runtime_set_suspended() does not lead to call of suspend callback,
> so clk may be left undisabled in hix5hd2_i2c_remove().
> 
> By the way, the patch adds error handling for clk_prepare_enable().

could you please put this in a separate patch?

> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

if you're taking this, feel free to drop my SoB...

> ---
> Hi,
> 
> Look what I fished from the far December 2017 :)
> 
> It looked better to respin it rather than replying to such an old
> mail.
> 
> I haven't made any modification to the patch exept for a little
> rebase conflict. Here's a full changelog, anyway.
> 
> Changelog
> =========
> v1 -> v2:
>  - Fished this out from the muddy pond.
>  - Added my SoB
>  - Fixed rebase conflict

... but please keep the changelog.

> Andi
> 
>  drivers/i2c/busses/i2c-hix5hd2.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
> index 0e34cbaca22dc..ec775ffefa9fc 100644
> --- a/drivers/i2c/busses/i2c-hix5hd2.c
> +++ b/drivers/i2c/busses/i2c-hix5hd2.c
> @@ -421,7 +421,11 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "cannot get clock\n");
>  		return PTR_ERR(priv->clk);
>  	}
> -	clk_prepare_enable(priv->clk);
> +	ret = clk_prepare_enable(priv->clk);

please use devm_clk_get_enabled();

Thanks,
Andi

> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot enable clock\n");
> +		return ret;
> +	}
>  
>  	strscpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
>  	priv->dev = &pdev->dev;
> @@ -469,8 +473,10 @@ static int hix5hd2_i2c_remove(struct platform_device *pdev)
>  	struct hix5hd2_i2c_priv *priv = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&priv->adap);
> -	pm_runtime_disable(priv->dev);
> -	pm_runtime_set_suspended(priv->dev);
> +
> +	/* Make sure priv->clk is disabled */
> +	pm_runtime_force_suspend(priv->dev);
> +
>  	clk_disable_unprepare(priv->clk);
>  
>  	return 0;
> -- 
> 2.40.1
> 
