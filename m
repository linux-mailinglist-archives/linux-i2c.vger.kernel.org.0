Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152C246FA85
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 06:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbhLJF6G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 00:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbhLJF6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 00:58:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57557C061746
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 21:54:28 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1mvYrQ-0003Bq-Le; Fri, 10 Dec 2021 06:54:24 +0100
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH] drivers/i2c/busses/i2c-imx.c: Use with resource
 management to register interrupts
To:     lizhe <sensor1010@163.com>, linux@rempel-privat.de,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20211210025701.7316-1-sensor1010@163.com>
Message-ID: <0e71319e-226f-286a-cfd9-b6b94ffba2d8@pengutronix.de>
Date:   Fri, 10 Dec 2021 06:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210025701.7316-1-sensor1010@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello lizhe,

On 10.12.21 03:57, lizhe wrote:
> In the probe function, used devm_request_threaded_irq instead of
> request_threaded_irq, make full use of the resource management
> function provided by the kernel

See e50e4f0b85be ("i2c: imx: Fix external abort on interrupt in exit paths")
for why this isn't a safe thing to do here. Given that this is the third time,
I think, this was suggested, you may want to instead patch in a comment
explaining why we _don't_ use devm_request_threaded_irq here..

Cheers,
Ahmad

> 
> Signed-off-by: lizhe <sensor1010@163.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3576b63a6c03..3e99827b2720 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1426,7 +1426,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>  
>  	/* Request IRQ */
> -	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> +	ret = devm_request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
>  				   pdev->name, i2c_imx);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> @@ -1472,7 +1472,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  
>  clk_notifier_unregister:
>  	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
> -	free_irq(irq, i2c_imx);
>  rpm_disable:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
