Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBEB716CCB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 20:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjE3Sum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 14:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjE3Sul (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 14:50:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615B0C9;
        Tue, 30 May 2023 11:50:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0729628AE;
        Tue, 30 May 2023 18:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6ABBC4339B;
        Tue, 30 May 2023 18:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685472639;
        bh=IZndPRsXdrvOnJb0ewXcTHzPGDycIf5ne3eEnx8Ld9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SobdW6evDpNp5XKzU2RTYcxgG6l3SzTGzHCt5xrkeFknfGnlWzrVbG7cP1lPwqiaP
         0FfyQurrDzUSnsieubT4XEnyDT97hyJQtHJCkBqJnG0CujgiOkILFbSLR7zDNG2zfY
         T0hRclOsh62yzX4bY8+RHhL+htMASIgNqijM8KK+6H5Ht8sJdg5Dv6cDj1Ps1Pey0s
         oVJeNXw6Y551qe82DQGWsaSS1fwR6MjgToppxj6pwlWvbH7FwDh/O6iZVWx7bZhddo
         NXJlP8NoZygP29UsklAodVhproIJN3PrDjO2Fv1p9/2bdMZGxOAU7sWK64Gi/PyPsy
         8Ln+mS7SaCOWw==
Date:   Tue, 30 May 2023 20:50:36 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: fix type char overflow issue when
 calculating the clock cycle
Message-ID: <20230530185036.ggep3pv7booqtb6b@intel.intel>
References: <20230529080251.3614380-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529080251.3614380-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 29, 2023 at 04:02:51PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Claim clkhi and clklo as integer type to avoid possible calculation
> errors caused by data overflow.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 40a4420d4c12..7dd33564cbe1 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -211,8 +211,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
>  /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
>  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  {
> -	u8 prescale, filt, sethold, clkhi, clklo, datavd;
> -	unsigned int clk_rate, clk_cycle;
> +	u8 prescale, filt, sethold, datavd;
> +	unsigned int clk_rate, clk_cycle, clkhi, clklo;

looks OK.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

there is, though, another part I would take care of, this bit:

	clklo = clk_cycle - clkhi;
	if (clklo < 64)
		break;

It might be unlikely, but if "clk_cycle > clkhi" then all the
calculation. Do you mind adding a check:

	if (unlikely(clk_cycle > clkhi))
		break;

Andi

>  	enum lpi2c_imx_pincfg pincfg;
>  	unsigned int temp;
>  
> -- 
> 2.34.1
> 
