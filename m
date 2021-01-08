Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B912EEE50
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 09:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbhAHIGG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 03:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbhAHIGG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 03:06:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BDFC0612F6
        for <linux-i2c@vger.kernel.org>; Fri,  8 Jan 2021 00:05:25 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kxmlu-0006oW-To; Fri, 08 Jan 2021 09:05:22 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kxmlt-0006pP-L0; Fri, 08 Jan 2021 09:05:21 +0100
Date:   Fri, 8 Jan 2021 09:05:21 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Kevin Paul Herbert <kph@platinasystems.com>
Cc:     biwen.li@nxp.com, leoyang.li@nxp.com, linux@rempel-privat.de,
        kernel@pengutronix.de, wsa@the-dreams.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        xiaobo.xie@nxp.com, linux-arm-kernel@lists.infradead.org,
        biwen.li@oss.nxp.com
Subject: Re: [PATCH] i2c-imx.c: Synthesize end of transaction events without
 idle interrupts
Message-ID: <20210108080521.dzm2gczd3d2ygb5y@pengutronix.de>
References: <20201222194850.2274527-1-kph@platinasystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201222194850.2274527-1-kph@platinasystems.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:02:14 up 36 days, 22:08, 26 users,  load average: 0.14, 0.05,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kevin Paul,

On Tue, Dec 22, 2020 at 11:48:50AM -0800, Kevin Paul Herbert wrote:
> Only the Layerscape SoCs have interrupts on bus idle, which facilitate
> sending events which complete slave bus transactions.
> 
> Add support for synthesizing missing events. If we see a master request,
> or a newly addressed slave request, if the last event sent to the backend
> was I2C_SLAVE_READ_REQUESTED, send the backend a I2C_SLAVE_READ_PROCESSED
> followed by I2C_SLAVE_STOP. For all other events, send an I2C_SLAVE_STOP.
> 
> Signed-off-by: Kevin Paul Herbert <kph@platinasystems.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 59 +++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b444fbf1a262..b3e2a6a7fc19 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -209,6 +209,7 @@ struct imx_i2c_struct {
>  
>  	struct imx_i2c_dma	*dma;
>  	struct i2c_client	*slave;
> +	enum i2c_slave_event last_slave_event;
>  };
>  
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> @@ -662,6 +663,36 @@ static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
>  	}
>  }
>  
> +static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
> +				enum i2c_slave_event event, u8 *val)
> +{
> +	i2c_slave_event(i2c_imx->slave, event, val);
> +	i2c_imx->last_slave_event = event;
> +}
> +
> +static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
> +{
> +	u8 val;
> +
> +	while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
> +		switch (i2c_imx->last_slave_event) {
> +		case I2C_SLAVE_READ_REQUESTED:
> +			i2c_imx_slave_event(i2c_imx, I2C_SLAVE_READ_PROCESSED,
> +					    &val);
> +			break;
> +
> +		case I2C_SLAVE_WRITE_REQUESTED:
> +		case I2C_SLAVE_READ_PROCESSED:
> +		case I2C_SLAVE_WRITE_RECEIVED:
> +			i2c_imx_slave_event(i2c_imx, I2C_SLAVE_STOP, &val);
> +			break;
> +
> +		case I2C_SLAVE_STOP:
> +			break;
> +		}
> +	}
> +}

Is it really working code?

The i2c_imx_slave_finish_op() is a waiting busy loop withing an IRQ! And
it is waiting for an event, which is updated in the same IRQ callback.
Or am i missing some thing?

Regards,
Oleksij

>  static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  				     unsigned int status, unsigned int ctl)
>  {
> @@ -674,9 +705,11 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  	}
>  
>  	if (status & I2SR_IAAS) { /* Addressed as a slave */
> +		i2c_imx_slave_finish_op(i2c_imx);
>  		if (status & I2SR_SRW) { /* Master wants to read from us*/
>  			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> -			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +			i2c_imx_slave_event(i2c_imx,
> +					    I2C_SLAVE_READ_REQUESTED, &value);
>  
>  			/* Slave transmit */
>  			ctl |= I2CR_MTX;
> @@ -686,7 +719,8 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
>  		} else { /* Master wants to write to us */
>  			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> -			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_REQUESTED, &value);
> +			i2c_imx_slave_event(i2c_imx,
> +					    I2C_SLAVE_WRITE_REQUESTED, &value);
>  
>  			/* Slave receive */
>  			ctl &= ~I2CR_MTX;
> @@ -697,17 +731,20 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
>  		if (status & I2SR_IBB) { /* No STOP signal detected */
>  			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> -			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
> +			i2c_imx_slave_event(i2c_imx,
> +					    I2C_SLAVE_WRITE_RECEIVED, &value);
>  		} else { /* STOP signal is detected */
>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"STOP signal detected");
> -			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> +			i2c_imx_slave_event(i2c_imx,
> +					    I2C_SLAVE_STOP, &value);
>  		}
>  	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
>  		ctl |= I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
>  
> -		i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED, &value);
> +		i2c_imx_slave_event(i2c_imx,
> +				    I2C_SLAVE_READ_PROCESSED, &value);
>  
>  		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
>  	} else { /* Transmit mode received NAK */
> @@ -748,6 +785,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
>  		return -EBUSY;
>  
>  	i2c_imx->slave = client;
> +	i2c_imx->last_slave_event = I2C_SLAVE_STOP;
>  
>  	/* Resume */
>  	ret = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> @@ -800,10 +838,17 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +
>  	if (status & I2SR_IIF) {
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
> -		if (i2c_imx->slave && !(ctl & I2CR_MSTA))
> -			return i2c_imx_slave_isr(i2c_imx, status, ctl);
> +		if (i2c_imx->slave) {
> +			if (!(ctl & I2CR_MSTA)) {
> +				return i2c_imx_slave_isr(i2c_imx, status, ctl);
> +			} else if (i2c_imx->last_slave_event !=
> +				   I2C_SLAVE_STOP) {
> +				i2c_imx_slave_finish_op(i2c_imx);
> +			}
> +		}
>  		return i2c_imx_master_isr(i2c_imx, status);
>  	}
>  
> -- 
> 2.25.1
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
