Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81821753BB5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jul 2023 15:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbjGNNXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jul 2023 09:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbjGNNXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jul 2023 09:23:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1DC10EA
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 06:23:04 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qKIkv-0004wV-TP; Fri, 14 Jul 2023 15:22:45 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qKIkt-0002No-Rt; Fri, 14 Jul 2023 15:22:43 +0200
Date:   Fri, 14 Jul 2023 15:22:43 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Mans Rullgard <mans@mansr.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] i2c: imx: add support for I2C_M_STOP flag
Message-ID: <20230714132243.GB18077@pengutronix.de>
References: <20230706125729.17335-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230706125729.17335-1-mans@mansr.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mans,

Thank you for you patch.

On Thu, Jul 06, 2023 at 01:57:29PM +0100, Mans Rullgard wrote:
> Add support for the I2C_M_STOP flag to the i2c-imx driver.  This allows
> devices requiring a stop between messages to work with this controller.

Can you please add more description to the commit message. For example
which i2c client drivers need this functionality and what HW (imx SoC variant)
was tested with this patch.

> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 42189a5f2905..f59d086688ff 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1262,10 +1262,17 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  
>  	/* read/write data */
>  	for (i = 0; i < num; i++) {
> -		if (i == num - 1)
> -			is_lastmsg = true;
> +		if (is_lastmsg) {
> +			/* previous message had I2C_M_STOP flag set */
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +			temp |= I2CR_MSTA;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +			result = i2c_imx_bus_busy(i2c_imx, 1, atomic);
> +			if (result)
> +				goto fail0;
> +		}
>  
> -		if (i) {
> +		if (i && !is_lastmsg) {
>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"<%s> repeated start\n", __func__);
>  			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> @@ -1275,6 +1282,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			if (result)
>  				goto fail0;
>  		}

Here some issues should be fixed:
- Reusing is_lastmsg to signal STOP signal for not last msg is
  confusing. May be is_stopped will be OK.
- Please combine if statements for I2CR_MSTA and I2CR_RSTA case. One of
  both should be used on not first message. I2CR_MSTA if I2CR_MSTA was
  cleared on previous round, or I2CR_RSTA if I2CR_MSTA was not cleared
  before.

In current implementation this patch will fail to set Repeated Start
condition if first message was with the I2C_M_STOP flag, but other
messages do not have this flag. For example:
When Message 1 finishes with the I2C_M_STOP flag, it will clear the
I2CR_MSTA flag, which changes the mode to Slave mode.

Message 2, not having an I2C_M_STOP flag, will simply set the I2CR_MSTA
flag again, starting a new transaction with a new Start condition, not
requiring a Repeated Start (I2CR_RSTA).

However, by Message 3, the issue arises. Since Message 2 does not clear
I2CR_MSTA (as it lacks the I2C_M_STOP flag), setting I2CR_MSTA again in
Message 3 will have no effect because it's already set. But the problem
here is that the "is_lastmsg" flag is still true from Message 1, which
causes the driver to skip setting the I2CR_RSTA flag. Therefore, a
Repeated Start condition is not generated between Message 2 and 3, which
is a problematic behavior if the device expects a Repeated Start
condition between the two messages.


> +		if (i == num - 1 || (msgs[i].flags & I2C_M_STOP))
> +			is_lastmsg = true;
> +
>  		dev_dbg(&i2c_imx->adapter.dev,
>  			"<%s> transfer message: %d\n", __func__, i);
>  		/* write/read data */
> @@ -1304,6 +1315,13 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
>  			else
>  				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
> +
> +			if (msgs[i].flags & I2C_M_STOP) {
> +				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +				temp &= ~I2CR_MSTA;
> +				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +				i2c_imx_bus_busy(i2c_imx, 0, atomic);
> +			}
>  		}
>  		if (result)
>  			goto fail0;
> @@ -1425,7 +1443,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>  
>  static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL
> +	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_SMBUS_EMUL
>  		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>  }
>  
> -- 
> 2.41.0

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
