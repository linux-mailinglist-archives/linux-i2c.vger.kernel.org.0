Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F033F72F0CC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 02:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjFNAI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 20:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjFNAI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 20:08:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325A61AD;
        Tue, 13 Jun 2023 17:08:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9AB6262DA6;
        Wed, 14 Jun 2023 00:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F9BC433C8;
        Wed, 14 Jun 2023 00:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686701335;
        bh=XVcCLcjgh55HgAnQRCWkPHl4rRjmtMsm/qZTPHVmnBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IPP4+tOzUEYHR/mpDuoyZbwNHSpgN2cNlnywQObuJKAna3GdD5z2sqYDPVCsBKfJp
         0H47dIdciBIv4CJIxy5EoYAnr9wBjfi3A7McQf+kFHfg3ivcpMSK2fQXm4bKCpkVmS
         ONYPs3T0rMraQ3E5nSS0vpG7fudbpTTCdHMGG4DCJKobCoLGXKlRtK4MRgdY+7hVYs
         GTOoIZdEtkWlsKmRBPHC7m54ixovwBNJUrRE3RfcabOUz7fJlZJHQhV1uVJHpXsUd/
         vfMKR6F0Xk+u0K5ZJmEXng+4+884IKNiF2FObt/4LvFj6S8cqKcQeeS8wpwA2PoAvx
         pU7xkqM89xThw==
Date:   Wed, 14 Jun 2023 02:08:41 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: directly return ISR when detect a NACK
Message-ID: <20230614000841.frvf4n5zgh5eihmq@intel.intel>
References: <20230524024002.1790405-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524024002.1790405-1-carlos.song@nxp.com>
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

On Wed, May 24, 2023 at 10:40:02AM +0800, carlos.song@nxp.com wrote:
> From: Gao Pan <pandy.gao@nxp.com>
> 
> A NACK flag in ISR means i2c bus error. In such codition,
> there is no need to do read/write operation. It's better
> to return ISR directly and then stop i2c transfer.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

looks good to me, just a little note.

> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 1af0a637d7f1..11240bf8e8e2 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -514,15 +514,17 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
>  	temp = readl(lpi2c_imx->base + LPI2C_MSR);
>  	temp &= enabled;
>  
> +	if (temp & MSR_NDF) {
> +		complete(&lpi2c_imx->complete);
> +		goto ret;
> +	}
> +
>  	if (temp & MSR_RDF)

else if () and remove goto and brackets. You have used the
"else if" below and we can keep it consistent.

This way the commit log should be a bit different as we
decide to check exclusively using else if's for the active bits.
This way we also stop processing the MSR register if a NACK is
received.

With the above I can give you a conditional r-b: are you able to
pull Dong into this review as Wolfram asked?

Thank you,
Andi

>  		lpi2c_imx_read_rxfifo(lpi2c_imx);
> -
> -	if (temp & MSR_TDF)
> +	else if (temp & MSR_TDF)
>  		lpi2c_imx_write_txfifo(lpi2c_imx);
>  
> -	if (temp & MSR_NDF)
> -		complete(&lpi2c_imx->complete);
> -
> +ret:
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.34.1
> 
