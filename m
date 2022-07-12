Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18376571500
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 10:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiGLIr0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 04:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiGLIr0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 04:47:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5F1A5E7C
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 01:47:24 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oBBY6-0005u2-Je; Tue, 12 Jul 2022 10:47:18 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oBBY5-0004dk-0b; Tue, 12 Jul 2022 10:47:17 +0200
Date:   Tue, 12 Jul 2022 10:47:16 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712082415.319738-1-francesco.dolcini@toradex.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Francesco,

On 22-07-12, Francesco Dolcini wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> Set the i2c_adapter retries field to a sensible value. This allows
> the i2c core to retry master_xfer()/master_xfer_atomic() when it
> returns -EAGAIN. Currently the i2c-imx driver returns -EAGAIN only
> on Tx arbitration failure (I2SR_IAL).
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index e9e2db68b9fb..26738e713c94 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -54,6 +54,7 @@
>  #define DRIVER_NAME "imx-i2c"
>  
>  #define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
> +#define I2C_IMX_MAX_RETRIES 3     /* Retries on arbitration loss */

Just one question: Why 3 and should we document this within the commit
message?

Regards,
  Marco

>  /*
>   * Enable DMA if transfer byte size is bigger than this threshold.
> @@ -1477,6 +1478,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	i2c_imx->adapter.dev.parent	= &pdev->dev;
>  	i2c_imx->adapter.nr		= pdev->id;
>  	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
> +	i2c_imx->adapter.retries	= I2C_IMX_MAX_RETRIES;
>  	i2c_imx->base			= base;
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>  
> -- 
> 2.25.1
> 
> 
> 
