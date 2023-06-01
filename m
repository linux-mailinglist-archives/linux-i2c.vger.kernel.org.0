Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12E971A223
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 17:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbjFAPOV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 11:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbjFAPOS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 11:14:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0630218F
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 08:14:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9585361008
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 15:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23260C433D2;
        Thu,  1 Jun 2023 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685632456;
        bh=BWuqix3iYt6ItyW/yuJYXANq/UkAe3dLO3iaTH5bAos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIFSvxtK/eczcW/oiSWtq8/LRBF27fA/5p369wHLSDjrdsCCowQ+TgIodjhEInsgb
         3CbR5A4IX5hFfPSH3kZ76v4gehNEfnhM7IAS03bV/2jpofmUrfRFi18x5BsPR4BjiK
         Z6ztrFX7/aH5oDcgI7NZXPTWKIF0DFrk3oezAAkY3aheftezh35+UxYLy2cZ33/Ts5
         u7PYAhRiffx8dz3PX2sAhteAkiNkxRuTD1kfe25CdhMWg1CCmFGw8tE5MhtMXmZXv3
         yFRMHmPmDQJ9Co0M0xVXEwg4WyDlli2LVp4k3FzY2EgyZ/mrQ92yxcVcb44CG6ivEd
         blcAMD216b84g==
Date:   Thu, 1 Jun 2023 17:14:12 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Don't open-code DIV_ROUND_UP
Message-ID: <20230601151412.qfszgsl73q2jrr5l@intel.intel>
References: <20230601132532.2749426-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601132532.2749426-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Thu, Jun 01, 2023 at 03:25:32PM +0200, Uwe Kleine-König wrote:
> There is no change in the generated code (tested on an ARCH=arm
> allmodconfig build).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 1af0a637d7f1..ae6ce28d3330 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -217,7 +217,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  	for (prescale = 0; prescale <= 7; prescale++) {
>  		clk_cycle = clk_rate / ((1 << prescale) * lpi2c_imx->bitrate)
>  			    - 3 - (filt >> 1);
> -		clkhi = (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
> +		clkhi = DIV_ROUND_UP(clk_cycle, I2C_CLK_RATIO + 1);

you updated this at the end... looks good :)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

>  		clklo = clk_cycle - clkhi;
>  		if (clklo < 64)
>  			break;
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> -- 
> 2.39.2
> 
