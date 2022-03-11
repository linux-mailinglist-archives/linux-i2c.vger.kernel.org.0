Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018BD4D5E09
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 10:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbiCKJFF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 04:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiCKJFE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 04:05:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F761BA91E
        for <linux-i2c@vger.kernel.org>; Fri, 11 Mar 2022 01:04:01 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nSb9e-0006HK-2F; Fri, 11 Mar 2022 10:01:46 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nSb9c-0003GS-FT; Fri, 11 Mar 2022 10:01:44 +0100
Date:   Fri, 11 Mar 2022 10:01:44 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Alifer Moraes <alifer.m@variscite.com>
Cc:     linux-kernel@vger.kernel.org, pierluigi.p@variscite.com,
        Fugang Duan <B38611@freescale.com>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, gaopan <b54642@freescale.com>,
        linux@rempel-privat.de, eran.m@variscite.com,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Vipul Kumar <vipul_kumar@mentor.com>, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH] i2c: imx: add irqf_no_suspend
Message-ID: <20220311090144.GB9910@pengutronix.de>
References: <20220307143630.28697-1-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307143630.28697-1-alifer.m@variscite.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:59:39 up 90 days, 17:45, 82 users,  load average: 0.16, 0.17,
 0.11
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
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

On Mon, Mar 07, 2022 at 11:36:30AM -0300, Alifer Moraes wrote:
> From: gaopan <b54642@freescale.com>
> 
> The i2c irq is masked when pcie starts a i2c transfer process
> during noirq suspend stage. As a result, i2c transfer fails.
> To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.
> 
> Signed-off-by: Gao Pan <b54642@freescale.com>
> Signed-off-by: Fugang Duan <B38611@freescale.com>
> Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Thank you!

> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 27f969b3dc07..fcc09a1e7f44 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1478,7 +1478,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>  
>  	/* Request IRQ */
> -	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> +	ret = request_threaded_irq(irq, i2c_imx_isr, NULL,
> +				   IRQF_SHARED | IRQF_NO_SUSPEND,
>  				   pdev->name, i2c_imx);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> -- 
> 2.25.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
