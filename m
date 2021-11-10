Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4959E44BD8B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 10:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhKJJGb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 04:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhKJJGa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 04:06:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9871AC061764
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 01:03:43 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjW7-000290-Em; Wed, 10 Nov 2021 10:03:39 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mkjW6-0001Zp-F1; Wed, 10 Nov 2021 10:03:38 +0100
Date:   Wed, 10 Nov 2021 10:03:38 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     minyard@acm.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 3/3] i2c:imx: Use an hrtimer, not a timer, for checking
 for bus idle
Message-ID: <20211110090338.GE12195@pengutronix.de>
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-4-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005003216.2670632-4-minyard@acm.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:59:29 up 265 days, 12:23, 138 users,  load average: 0.22, 0.17,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 04, 2021 at 07:32:16PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> The timer is too slow and significantly reduces performance.  Use an
> hrtimer to get things working faster.
> 
> Signed-off-by: Corey Minyard <minyard@acm.org>
> Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>

Do we need to keep this change history? If no, please merge it to the
first patch.

> ---
>  drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 26a04dc0590b..4b0e9d1784dd 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -38,7 +38,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/spinlock.h>
> -#include <linux/timer.h>
> +#include <linux/hrtimer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -53,6 +53,8 @@
>  /* This will be the driver name the kernel reports */
>  #define DRIVER_NAME "imx-i2c"
>  
> +#define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
> +
>  /*
>   * Enable DMA if transfer byte size is bigger than this threshold.
>   * As the hardware request, it must bigger than 4 bytes.\
> @@ -214,8 +216,8 @@ struct imx_i2c_struct {
>  	enum i2c_slave_event last_slave_event;
>  
>  	/* For checking slave events. */
> -	spinlock_t	  slave_lock;
> -	struct timer_list slave_timer;
> +	spinlock_t     slave_lock;
> +	struct hrtimer slave_timer;
>  };
>  
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> @@ -783,13 +785,16 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
>  	}
>  
>  out:
> -	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
> +	hrtimer_try_to_cancel(&i2c_imx->slave_timer);
> +	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
> +	hrtimer_restart(&i2c_imx->slave_timer);
>  	return IRQ_HANDLED;
>  }
>  
> -static void i2c_imx_slave_timeout(struct timer_list *t)
> +static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
>  {
> -	struct imx_i2c_struct *i2c_imx = from_timer(i2c_imx, t, slave_timer);
> +	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
> +						      slave_timer);
>  	unsigned int ctl, status;
>  	unsigned long flags;
>  
> @@ -798,6 +803,7 @@ static void i2c_imx_slave_timeout(struct timer_list *t)
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	i2c_imx_slave_handle(i2c_imx, status, ctl);
>  	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> +	return HRTIMER_NORESTART;
>  }
>  
>  static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
> @@ -1423,7 +1429,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	spin_lock_init(&i2c_imx->slave_lock);
> -	timer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, 0);
> +	hrtimer_init(&i2c_imx->slave_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> +	i2c_imx->slave_timer.function = i2c_imx_slave_timeout;
>  
>  	match = device_get_match_data(&pdev->dev);
>  	if (match)
> @@ -1538,7 +1545,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	del_timer_sync(&i2c_imx->slave_timer);
> +	hrtimer_cancel(&i2c_imx->slave_timer);
>  
>  	/* remove adapter */
>  	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
> -- 
> 2.25.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
