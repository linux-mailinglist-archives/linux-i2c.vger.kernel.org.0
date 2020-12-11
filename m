Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A796E2D7488
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 12:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390272AbgLKLT1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 11 Dec 2020 06:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727637AbgLKLTR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Dec 2020 06:19:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F259FC0613CF
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 03:18:36 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kngRO-0002gK-Bp; Fri, 11 Dec 2020 12:18:26 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kngRL-0001Zt-OF; Fri, 11 Dec 2020 12:18:23 +0100
Date:   Fri, 11 Dec 2020 12:18:23 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: imx: fix reference leak when
 pm_runtime_get_sync fails
Message-ID: <20201211111823.otsogwtwfzow627z@pengutronix.de>
References: <20201201092924.112461-1-miaoqinglang@huawei.com>
 <20201201093141.113135-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201201093141.113135-1-miaoqinglang@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:14:46 up 9 days,  1:21, 24 users,  load average: 0.00, 0.05, 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 05:31:41PM +0800, Qinglang Miao wrote:
> In i2c_imx_xfer() and i2c_imx_remove(), the pm reference count
> is not expected to be incremented on return.
> 
> However, pm_runtime_get_sync will increment pm reference count
> even failed. Forgetting to putting operation will result in a
> reference leak here.
> 
> Replace it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Fixes: 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Thank you!

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>  drivers/i2c/busses/i2c-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index c98529c76..93d2069da 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1008,7 +1008,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
>  	int result;
>  
> -	result = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> +	result = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
>  	if (result < 0)
>  		return result;
>  
> @@ -1252,7 +1252,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
>  	int irq, ret;
>  
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.23.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
