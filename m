Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302513B42DB
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 14:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhFYMIe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 08:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhFYMId (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Jun 2021 08:08:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20173C061574
        for <linux-i2c@vger.kernel.org>; Fri, 25 Jun 2021 05:06:13 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lwkav-00082P-Tq; Fri, 25 Jun 2021 14:06:01 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lwkav-0007Xd-3u; Fri, 25 Jun 2021 14:06:01 +0200
Date:   Fri, 25 Jun 2021 14:06:01 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: imx: : use proper DMAENGINE API for termination
Message-ID: <20210625120601.vmwn4ct7mrnusijb@pengutronix.de>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-3-wsa+renesas@sang-engineering.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:03:03 up 205 days,  2:09, 48 users,  load average: 0.18, 0.21,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

On Wed, Jun 23, 2021 at 11:59:36AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de

Thank you!

> ---
>  drivers/i2c/busses/i2c-imx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index dc5ca71906db..b224e82924d2 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -423,7 +423,7 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
>  	return 0;
>  
>  err_submit:
> -	dmaengine_terminate_all(dma->chan_using);
> +	dmaengine_terminate_sync(dma->chan_using);
>  err_desc:
>  	dma_unmap_single(chan_dev, dma->dma_buf,
>  			dma->dma_len, dma->dma_data_dir);
> @@ -899,7 +899,7 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
>  				&i2c_imx->dma->cmd_complete,
>  				msecs_to_jiffies(DMA_TIMEOUT));
>  	if (time_left == 0) {
> -		dmaengine_terminate_all(dma->chan_using);
> +		dmaengine_terminate_sync(dma->chan_using);
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -954,7 +954,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  				&i2c_imx->dma->cmd_complete,
>  				msecs_to_jiffies(DMA_TIMEOUT));
>  	if (time_left == 0) {
> -		dmaengine_terminate_all(dma->chan_using);
> +		dmaengine_terminate_sync(dma->chan_using);
>  		return -ETIMEDOUT;
>  	}
>  
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
