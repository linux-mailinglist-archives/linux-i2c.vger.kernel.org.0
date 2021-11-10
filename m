Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6791A44BD7B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 09:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKJJBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 04:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhKJJBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 04:01:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B86C061764
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 00:59:00 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjRZ-0001aH-DR; Wed, 10 Nov 2021 09:58:57 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjRZ-0000EE-1A; Wed, 10 Nov 2021 09:58:57 +0100
Date:   Wed, 10 Nov 2021 09:58:57 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     minyard@acm.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 2/3] i2c:imx: Add an extra read at the end of an I2C
 slave read
Message-ID: <20211110085856.GD12195@pengutronix.de>
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-3-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005003216.2670632-3-minyard@acm.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:58:34 up 265 days, 12:22, 128 users,  load average: 0.16, 0.15,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 04, 2021 at 07:32:15PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> The I2C slave interface expects that the driver will read ahead one
> byte.  The IMX driver/device doesn't do this, but simulate it so that
> read operations get their index set correctly.
> 
> Signed-off-by: Corey Minyard <minyard@acm.org>
> Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>  drivers/i2c/busses/i2c-imx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 97369fe48b30..26a04dc0590b 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -769,6 +769,15 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
>  		ctl &= ~I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
>  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +
> +		/*
> +		 * The i2c slave interface requires one extra dummy
> +		 * read at the end to keep things in line.  See the
> +		 * I2C slave docs for details.
> +		 */
> +		i2c_imx_slave_event(i2c_imx,
> +				    I2C_SLAVE_READ_PROCESSED, &value);
> +
>  		i2c_imx_slave_finish_op(i2c_imx);
>  		return IRQ_HANDLED;
>  	}
> -- 
> 2.25.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
