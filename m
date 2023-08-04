Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16AEF770BCF
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 00:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjHDWQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 18:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjHDWQs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 18:16:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA02E70;
        Fri,  4 Aug 2023 15:16:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95BD36214C;
        Fri,  4 Aug 2023 22:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FCCC433C8;
        Fri,  4 Aug 2023 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691187407;
        bh=9NEUHjzgwydFSD5D34Vrvotj+y+yjcALtoAOZonDWl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/vAsHXezSotQuLkvz4x5l/MAEV+A5suxP6ZrpyWQF3cO17axKMK1sQ6kJ8lgJJNF
         guw4VXQmpFebOJVxhcyaVCIAIke8gM4wUPU8bkBclt6I6UjreXwkNdTe8fFK8XaWdu
         u919lkcROgBG2tWZcdlRLFb07uYclFkhFQdOqSmpQ4DkVahFwx0uSSBOlzRCGrqX5T
         hPkx9vRpmFDFjgn4E7MCudgA4jLOBnYK4mcCuRqpa8r3OnUbYhrtRrt83gT/7bXGUg
         Gk1OeumSDB94PS+JttbRjJOr/rv/31EUnToxQBgUu7iR1DoyXxPp8wW0KAUCgeg5/7
         vhIN6TclfKGlw==
Date:   Sat, 5 Aug 2023 00:16:44 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Message-ID: <20230804221644.cqmoin6u22mxvouk@intel.intel>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
 <20230802095737.3957587-9-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802095737.3957587-9-liaochang1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 05:57:36PM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index c3287c887c6f..bfa788b3775b 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  		sizeof(lpi2c_imx->adapter.name));
>  
>  	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");

you cut on this because the line was going over 100 characters? :)

In theory you shouldn't change the print message when doing such
changes and you can still split it as:

		return dev_err_probe(&pdev->dev, ret,
				     "can't get I2C peripheral clock, ret=%d\n",
				     ret);

and you're even within the 80 characters.

Sorry, I missed it in the previous version, mind resending it?

Andi
