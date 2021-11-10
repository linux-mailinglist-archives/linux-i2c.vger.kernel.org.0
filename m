Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8C444BD79
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 09:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhKJJBJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 04:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhKJJBI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 04:01:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95065C061764
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 00:58:21 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjQw-0001VB-80; Wed, 10 Nov 2021 09:58:18 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjQu-0000C3-RN; Wed, 10 Nov 2021 09:58:16 +0100
Date:   Wed, 10 Nov 2021 09:58:16 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     minyard@acm.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/3] i2c:imx: Add timer for handling the stop condition
Message-ID: <20211110085816.GC12195@pengutronix.de>
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-2-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005003216.2670632-2-minyard@acm.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:57:25 up 265 days, 12:21, 128 users,  load average: 0.17, 0.16,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 04, 2021 at 07:32:14PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Most IMX I2C interfaces don't generate an interrupt on a stop condition,
> so it won't generate a timely stop event on a slave mode transfer.
> Some users, like IPMB, need a timely stop event to work properly.
> 
> So, add a timer and add the proper handling to generate a stop event in
> slave mode if the interface goes idle.
> 
> Signed-off-by: Corey Minyard <minyard@acm.org>
> Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

> ---
>  drivers/i2c/busses/i2c-imx.c | 78 +++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3576b63a6c03..97369fe48b30 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -37,6 +37,8 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/spinlock.h>
> +#include <linux/timer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -210,6 +212,10 @@ struct imx_i2c_struct {
>  	struct imx_i2c_dma	*dma;
>  	struct i2c_client	*slave;
>  	enum i2c_slave_event last_slave_event;
> +
> +	/* For checking slave events. */
> +	spinlock_t	  slave_lock;
> +	struct timer_list slave_timer;
>  };
>  
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> @@ -680,7 +686,7 @@ static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
>  
>  static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
>  {
> -	u8 val;
> +	u8 val = 0;
>  
>  	while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
>  		switch (i2c_imx->last_slave_event) {
> @@ -701,10 +707,11 @@ static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
>  	}
>  }
>  
> -static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
> -				     unsigned int status, unsigned int ctl)
> +/* Returns true if the timer should be restarted, false if not. */
> +static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
> +					unsigned int status, unsigned int ctl)
>  {
> -	u8 value;
> +	u8 value = 0;
>  
>  	if (status & I2SR_IAL) { /* Arbitration lost */
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> @@ -712,6 +719,16 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  			return IRQ_HANDLED;
>  	}
>  
> +	if (!(status & I2SR_IBB)) {
> +		/* No master on the bus, that could mean a stop condition. */
> +		i2c_imx_slave_finish_op(i2c_imx);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (!(status & I2SR_ICF))
> +		/* Data transfer still in progress, ignore this. */
> +		goto out;
> +
>  	if (status & I2SR_IAAS) { /* Addressed as a slave */
>  		i2c_imx_slave_finish_op(i2c_imx);
>  		if (status & I2SR_SRW) { /* Master wants to read from us*/
> @@ -737,16 +754,9 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
>  		}
>  	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
> -		if (status & I2SR_IBB) { /* No STOP signal detected */
> -			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> -			i2c_imx_slave_event(i2c_imx,
> -					    I2C_SLAVE_WRITE_RECEIVED, &value);
> -		} else { /* STOP signal is detected */
> -			dev_dbg(&i2c_imx->adapter.dev,
> -				"STOP signal detected");
> -			i2c_imx_slave_event(i2c_imx,
> -					    I2C_SLAVE_STOP, &value);
> -		}
> +		value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		i2c_imx_slave_event(i2c_imx,
> +				    I2C_SLAVE_WRITE_RECEIVED, &value);
>  	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
>  		ctl |= I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> @@ -755,15 +765,32 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
>  				    I2C_SLAVE_READ_PROCESSED, &value);
>  
>  		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> -	} else { /* Transmit mode received NAK */
> +	} else { /* Transmit mode received NAK, operation is done */
>  		ctl &= ~I2CR_MTX;
>  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
>  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		i2c_imx_slave_finish_op(i2c_imx);
> +		return IRQ_HANDLED;
>  	}
>  
> +out:
> +	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
>  	return IRQ_HANDLED;
>  }
>  
> +static void i2c_imx_slave_timeout(struct timer_list *t)
> +{
> +	struct imx_i2c_struct *i2c_imx = from_timer(i2c_imx, t, slave_timer);
> +	unsigned int ctl, status;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> +	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +	i2c_imx_slave_handle(i2c_imx, status, ctl);
> +	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> +}
> +
>  static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
>  {
>  	int temp;
> @@ -843,7 +870,9 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  {
>  	struct imx_i2c_struct *i2c_imx = dev_id;
>  	unsigned int ctl, status;
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  
> @@ -851,14 +880,20 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
>  		if (i2c_imx->slave) {
>  			if (!(ctl & I2CR_MSTA)) {
> -				return i2c_imx_slave_isr(i2c_imx, status, ctl);
> -			} else if (i2c_imx->last_slave_event !=
> -				   I2C_SLAVE_STOP) {
> -				i2c_imx_slave_finish_op(i2c_imx);
> +				irqreturn_t ret;
> +
> +				ret = i2c_imx_slave_handle(i2c_imx,
> +							   status, ctl);
> +				spin_unlock_irqrestore(&i2c_imx->slave_lock,
> +						       flags);
> +				return ret;
>  			}
> +			i2c_imx_slave_finish_op(i2c_imx);
>  		}
> +		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>  		return i2c_imx_master_isr(i2c_imx, status);
>  	}
> +	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>  
>  	return IRQ_NONE;
>  }
> @@ -1378,6 +1413,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (!i2c_imx)
>  		return -ENOMEM;
>  
> +	spin_lock_init(&i2c_imx->slave_lock);
> +	timer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, 0);
> +
>  	match = device_get_match_data(&pdev->dev);
>  	if (match)
>  		i2c_imx->hwdata = match;
> @@ -1491,6 +1529,8 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	del_timer_sync(&i2c_imx->slave_timer);
> +
>  	/* remove adapter */
>  	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
>  	i2c_del_adapter(&i2c_imx->adapter);
> -- 
> 2.25.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
