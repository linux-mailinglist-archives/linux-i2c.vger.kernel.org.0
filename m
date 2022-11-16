Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2CF62B5E4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 10:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiKPJDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 04:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238832AbiKPJDN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 04:03:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A227411C2B
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 01:02:35 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ovEJV-0000py-NE; Wed, 16 Nov 2022 10:02:33 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ovEJU-0006vu-KQ; Wed, 16 Nov 2022 10:02:32 +0100
Date:   Wed, 16 Nov 2022 10:02:32 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-i2c@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
        kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set
Message-ID: <20221116090232.GA12278@pengutronix.de>
References: <20221109235902.468723-1-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221109235902.468723-1-andrew@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 10, 2022 at 12:59:02AM +0100, Andrew Lunn wrote:
> Recent changes to the DMA code has resulting in the IMX driver failing
> I2C transfers when the buffer has been vmalloc. Only perform DMA
> transfers if the message has the I2C_M_DMA_SAFE flag set, indicating
> the client is providing a buffer which is DMA safe.
> 
> This is a minimal fix for stable. The I2C core provides helpers to
> allocate a bounce buffer. For a fuller fix the master should make use
> of these helpers.
> 
> Fixes: 4544b9f25e70 ("dma-mapping: Add vmap checks to dma_map_single()")
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>  drivers/i2c/busses/i2c-imx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3082183bd66a..fc70920c4dda 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1132,7 +1132,8 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	int i, result;
>  	unsigned int temp;
>  	int block_data = msgs->flags & I2C_M_RECV_LEN;
> -	int use_dma = i2c_imx->dma && msgs->len >= DMA_THRESHOLD && !block_data;
> +	int use_dma = i2c_imx->dma && msgs->flags & I2C_M_DMA_SAFE &&
> +		msgs->len >= DMA_THRESHOLD && !block_data;
>  
>  	dev_dbg(&i2c_imx->adapter.dev,
>  		"<%s> write slave address: addr=0x%x\n",
> @@ -1298,7 +1299,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
>  		} else {
>  			if (!atomic &&
> -			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
> +			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
> +				msgs[i].flags & I2C_M_DMA_SAFE)
>  				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
>  			else
>  				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
> -- 
> 2.37.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
