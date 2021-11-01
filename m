Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D6D441F34
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 18:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhKAR3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 13:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhKAR3n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 13:29:43 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517EAC061714;
        Mon,  1 Nov 2021 10:27:10 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j1so9297452qtq.11;
        Mon, 01 Nov 2021 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Wxgz95yQyXJnxm6JHtyjO5RNM3gtThxljplW0b6MjM=;
        b=VioXlBAd8mgWoWl4LtsE3F3H9hKnG7hhjqy1A9n5SsCe+AZ+ZM1Iz0F2wIbhs36Uql
         rOspuwV35OckZcPoFzgVOhAVKNySDLmX2VazOohB0gdkcFrZJrpKF2HH6lIKXO4g3n4w
         uNnOk2rAw/0G/+HDQvjNOssqxMnMkxrC5DtBDek19mh6oNdF71VesTlynb/Y1+n6pLZv
         uulh3ZdThdOmGVQ0+mI6mBwCOFIR/i/pPHJxpqs850Rtg257fDnjjK88U1delvZTi5WR
         lroYhwccmYuCJdFXF/6HzqtXhkokfxxHSHo2iz8vT5AIFZoXR5Ry4XAFYe4vyskIN2+4
         ElLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=/Wxgz95yQyXJnxm6JHtyjO5RNM3gtThxljplW0b6MjM=;
        b=qP4JHfwodu39yufKECkE44aLeudK/IMlFeuwZT+v7lOI5DwsRAe2V2DDmOAQNAXPYU
         Rk1PqoVs2eYC3zj+Jo4TnHy2HDT4sLxRjwOvjEv/AiYOSdfd7MSpGTyQZwO7K8Bfqh03
         x2aA0qXPOpJ5riHTkEDOGVIAxtDQdoWvqg3CpWLY2mI0YG1GpS0AjY8Q3nOLZ5x1ObuA
         J6b9QO8I65v/JtGql/momHVzutKegrnnE578/htSdFwNC0fL0j+pVEbeqVk8UACtiwPV
         IDSyF8VdXjY7iKZ5yLwO08HSwvVDJvO7qNYLcUK2WfkPKt/YH2RRb23JyQ1j8Owuwe69
         XKXQ==
X-Gm-Message-State: AOAM530ZZmioeUY9prrRat1oBSvbiev/+eHbdaIvrTGvYXYfe7TPAkG2
        P3Az5t1orsvl/JoGf3OXQg==
X-Google-Smtp-Source: ABdhPJwQT+Eq/MkVmZUn56IaAtf7MNPK+P0vuUGtqS4rD1ZhHp4rWsGKN8eIpvQf/cgYuBTHXsrGgw==
X-Received: by 2002:ac8:3b4a:: with SMTP id r10mr31342333qtf.53.1635787629025;
        Mon, 01 Nov 2021 10:27:09 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id l1sm11120483qkp.65.2021.11.01.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:27:08 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:cfe:2000:592b:61b1])
        by serve.minyard.net (Postfix) with ESMTPSA id 3C7191800BA;
        Mon,  1 Nov 2021 17:27:07 +0000 (UTC)
Date:   Mon, 1 Nov 2021 12:27:06 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/3] i2c:imx: Add timer for handling the stop condition
Message-ID: <20211101172706.GC4698@minyard.net>
Reply-To: minyard@acm.org
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-2-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005003216.2670632-2-minyard@acm.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 04, 2021 at 07:32:14PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>

Any comments for this patch series?

-corey

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
