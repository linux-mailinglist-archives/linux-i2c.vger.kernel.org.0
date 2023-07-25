Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6247762792
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 01:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjGYXzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 19:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGYXzR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 19:55:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641E0E7;
        Tue, 25 Jul 2023 16:55:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 028A660F8A;
        Tue, 25 Jul 2023 23:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C2CC433C7;
        Tue, 25 Jul 2023 23:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690329315;
        bh=LaWGO6FB51BoI4x0QvDk+gLLZfsA9FHjkVjMztqhaeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KzOGvR8VoaUt/GJ6o7tu6QMZ8nY3rZDbM55d7kFUMQ7ypch0td9RTh9EM4aKuPgYq
         4eCKXJggIQEN4Vum1R+hpD8KvcaFG8iLkW8SMpFwv+/Pd3goEmQkaJ0CdhWF5KRpVI
         cz0m0BxdOjqv5LkaI41z5k+NmK4jshwHXedo4XzCxOtzmbNOzL+smiEj6gMIgMkJgt
         AznnAqJGeKIzWBsMXogcU+qSE9aSf4hGgsoSkhTABaWytqBNsVHooyRjhBI1kGoLGM
         48S+6P+7zYCY+RzMZDzGp1sFQlpOeUzDwhcB23sY3Dezp70I80Y3MD2r5nGocxV/W+
         LlRlgJ0EyEU+A==
Date:   Wed, 26 Jul 2023 01:55:11 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: imx-lpi2c: directly return ISR when detect a
 NACK
Message-ID: <20230725235511.lt62ubfw7geu5cfu@intel.intel>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724105546.1964059-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Carlos,

On Mon, Jul 24, 2023 at 06:55:44PM +0800, carlos.song@nxp.com wrote:
> From: Gao Pan <pandy.gao@nxp.com>
> 
> A NACK flag in ISR means i2c bus error. In such codition,
> there is no need to do read/write operation. It's better
> to return ISR directly and then stop i2c transfer.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index c3287c887c6f..158de0b7f030 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -514,15 +514,14 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
>  	temp = readl(lpi2c_imx->base + LPI2C_MSR);
>  	temp &= enabled;
>  
> -	if (temp & MSR_RDF)
> +	if (temp & MSR_NDF) {
> +		complete(&lpi2c_imx->complete);
> +		return IRQ_HANDLED;

you can actually remove the return here

	if (temp & MSR_NDF)
		complete();
	else if (temp & MSR_RDF)
		exfifo();
	else if (temp & MSR_TDF)
		txfifo();

	return IRQ_HANDLED;


BTW, the logic here is changing, as well and it's not described
in the commit log. This patch is not only stopping when a nack is
received (MSR_NDF), but it's also making mutually exclusive
read/write (which I guess are MSR_RDF and MSR_TDF).

Is this what you want? If so, can you please describe it in the
commit log or add a comment describing that the three states are
all mutually exclusive.

Thanks,
Andi


> +	} else if (temp & MSR_RDF)
>  		lpi2c_imx_read_rxfifo(lpi2c_imx);
> -
> -	if (temp & MSR_TDF)
> +	else if (temp & MSR_TDF)
>  		lpi2c_imx_write_txfifo(lpi2c_imx);
>  
> -	if (temp & MSR_NDF)
> -		complete(&lpi2c_imx->complete);
> -
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.34.1
> 
