Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2615C64E8C5
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 10:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiLPJpb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 04:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLPJpa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 04:45:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA1F2FBED
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 01:45:29 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p67HM-0000CN-6A; Fri, 16 Dec 2022 10:45:20 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p67HK-0006IN-VK; Fri, 16 Dec 2022 10:45:18 +0100
Date:   Fri, 16 Dec 2022 10:45:18 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216084511.2576786-1-primoz.fiser@norik.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Primoz,

On 22-12-16, Primoz Fiser wrote:
> By default, retries value is set to 0 (no retries). Set retries to more
> sensible value of 3 to allow i2c core to re-attempt transfer in case of
> i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).

apart the fact that the number of retries vary a lot and so the client
driver behaviour can vary a lot which is not good IMHO, why do you think
that 3 is a sufficient number?

If an arbitration loss happen, why do you think that retrying it 3 times
changes that?

Regards,
  Marco


> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cf5bacf3a488..6a5694cfe1cc 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1478,6 +1478,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	i2c_imx->adapter.dev.parent	= &pdev->dev;
>  	i2c_imx->adapter.nr		= pdev->id;
>  	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
> +	i2c_imx->adapter.retries	= 3;
>  	i2c_imx->base			= base;
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>  
> -- 
> 2.25.1
> 
> 
> 
