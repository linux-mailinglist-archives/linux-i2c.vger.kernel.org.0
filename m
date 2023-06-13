Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43AD72F052
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 01:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbjFMXll (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 19:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241427AbjFMXkR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 19:40:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2372E2130;
        Tue, 13 Jun 2023 16:39:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEECA6316C;
        Tue, 13 Jun 2023 23:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F48C433CC;
        Tue, 13 Jun 2023 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699587;
        bh=AMr6Ad/aGcpnOx8XIK3BvlyamRbYLVRlaFZmuhNVlOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jSY5N7QnRY8jLkiXn0fbSTrPHy1hrDFr+1hV4CVVXidkrnRCSEojOgQDZiXKByVbZ
         ic3biLuwlRxbgA6WZbauFvyeVPv9ZmVdZjz+kl5ENAEUWuTpav+yEnemnqc4mn/8/2
         9v9UaAKyT4I4oyTFquwz6hVWm5KI/aEe74olRUPSB4Q+aDr/x1p84xqtQQ3mdPKjHW
         WEDGXOI7uQ62ybGXKn/AerQF5+MA1iuH4O+bWnd3ftgKgoO+2ksOiz4RYNQUGS6Duy
         dkjz73t7ANX8ez6pykjTGgxKhFmWV5USRJzFkvcq/e+m+FPfl7Jh6gY9EyJw1sovYm
         afhKtlhbo9yWA==
Date:   Wed, 14 Jun 2023 01:39:44 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: add debug message when i2c peripheral
 clk doesn't work
Message-ID: <20230613233944.673syh3cjykvygfl@intel.intel>
References: <20230529072316.3605989-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529072316.3605989-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, May 29, 2023 at 03:23:16PM +0800, carlos.song@nxp.com wrote:
> From: Gao Pan <pandy.gao@nxp.com>
> 
> Add debug message when i2c peripheral clk rate is 0, then
> directly return -EINVAL.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 11240bf8e8e2..62111fe9f207 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -209,6 +209,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  	lpi2c_imx_set_mode(lpi2c_imx);
>  
>  	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> +	if (!clk_rate) {
> +		dev_dbg(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
> +		return -EINVAL;
> +	}

should this rather be a dev_err?

And, BTW, did you actually hit this?

Andi

> +
>  	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
>  		filt = 0;
>  	else
> -- 
> 2.34.1
> 
