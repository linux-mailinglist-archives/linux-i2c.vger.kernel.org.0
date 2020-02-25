Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3252116BBAA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 09:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgBYISI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 03:18:08 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54815 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbgBYISI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 03:18:08 -0500
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1j6VPq-00010n-7U; Tue, 25 Feb 2020 09:18:06 +0100
Subject: Re: [PATCH v1 18/40] i2c: imx: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-18-andriy.shevchenko@linux.intel.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <b4a843bf-8beb-608b-a532-0d3de50c63cd@pengutronix.de>
Date:   Tue, 25 Feb 2020 09:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-18-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:13da
X-SA-Exim-Mail-From: o.rempel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 24.02.20 16:15, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Oleksij Rempel <linux@rempel-privat.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>   drivers/i2c/busses/i2c-imx.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a3b61336fe55..f5ed0f38904c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -49,9 +49,6 @@
>   /* This will be the driver name the kernel reports */
>   #define DRIVER_NAME "imx-i2c"
>   
> -/* Default value */
> -#define IMX_I2C_BIT_RATE	100000	/* 100kHz */
> -
>   /*
>    * Enable DMA if transfer byte size is bigger than this threshold.
>    * As the hardware request, it must bigger than 4 bytes.\
> @@ -1139,7 +1136,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>   		goto rpm_disable;
>   
>   	/* Set up clock divider */
> -	i2c_imx->bitrate = IMX_I2C_BIT_RATE;
> +	i2c_imx->bitrate = I2C_STANDARD_MODE_FREQ;
>   	ret = of_property_read_u32(pdev->dev.of_node,
>   				   "clock-frequency", &i2c_imx->bitrate);
>   	if (ret < 0 && pdata && pdata->bitrate)
> 

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
