Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1FD44C34A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 15:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhKJOsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 09:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhKJOsg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 09:48:36 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4D5C061764;
        Wed, 10 Nov 2021 06:45:49 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id de30so2726628qkb.0;
        Wed, 10 Nov 2021 06:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=+rwfv3ywZ/R+q/1fQCq123/75gGQWBrg5o7p31TVHe8=;
        b=UExFksNK78Oo+QtJrsV2xeoaHmcKXnbzLZNMaXcdcHCBHelHt2RmGdmsUJI/qk3JLP
         nQy7/ZzkVy85sKrXovPAroz7emnzJSp4y8/SLyJsOkysj+SU1aHX557AfO6xt0xaU3Yg
         tiDimHhKA1sE87JhZifNPC9GCaR6JTnVnSIWRYa55M/PjV3C8wfkg0S76LSLZ2xJ9Kki
         k2sPnlpuKz7uWeAMo0ZR3iXyV80LCOnKXsI6qHNLPXcZbSVkiIISkKWOtVizB/YR0Edj
         FvQ6EJcDOTpv+MsFOxVPNBZuU7d/3cx3SLFRZYeHiFWugbLi6jM9YRnuo/2byftazIf+
         jD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=+rwfv3ywZ/R+q/1fQCq123/75gGQWBrg5o7p31TVHe8=;
        b=lNymw55MOp3RLUtnUZjDMVzK5uQyMn11hhG1LGBHnnpkPnWZ6WCdQCLKYSdS/0G6n8
         H+FoFs6TmPbJYXR9+Mpt7Q39b8prlJvT0oAOcx6qOPGSYOpF3BqBr+/2P0ahyyEt83Fq
         zyXTPsNUgFHQef9yRoh6Fla24qhk0KeftFUyhjE+KdN7BFSNjMRIkx16iUvkAd6HXOqH
         b6VRmve8FWWKohFwCloDC/Nat/AR5UKZocWOTzEEHpFhNXlA2Fh3mu33mpHYD51DA6xz
         yFC8LaTidqm3dESpSz86NRKIo4BtjJm+rCGdofaz6V8OfmXePlqkh1wDvsjTwO2ZODdm
         WB/g==
X-Gm-Message-State: AOAM533r9FjjuQEOrx0RQ7QP6GMt4it35of992BlWoyRwc8dGxSrVPRy
        PMOJAn77YtVrzTWxzSy50hGGQ4EZCg==
X-Google-Smtp-Source: ABdhPJxO3vScwJZ6FmxtI4ia+zWaF+xCYNjLu2UbW5A0IlK8pIsLqf01uw3X3H7C37o2QIiljFzPow==
X-Received: by 2002:a05:620a:2909:: with SMTP id m9mr218492qkp.496.1636555548217;
        Wed, 10 Nov 2021 06:45:48 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id t9sm52210qtw.37.2021.11.10.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 06:45:47 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:9036:4935:b469:a78b])
        by serve.minyard.net (Postfix) with ESMTPSA id 9F01818000C;
        Wed, 10 Nov 2021 14:45:46 +0000 (UTC)
Date:   Wed, 10 Nov 2021 08:45:45 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 3/3] i2c:imx: Use an hrtimer, not a timer, for checking
 for bus idle
Message-ID: <20211110144545.GF4667@minyard.net>
Reply-To: minyard@acm.org
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-4-minyard@acm.org>
 <20211110090338.GE12195@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110090338.GE12195@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 10:03:38AM +0100, Oleksij Rempel wrote:
> On Mon, Oct 04, 2021 at 07:32:16PM -0500, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > The timer is too slow and significantly reduces performance.  Use an
> > hrtimer to get things working faster.
> > 
> > Signed-off-by: Corey Minyard <minyard@acm.org>
> > Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> > Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> 
> Do we need to keep this change history? If no, please merge it to the
> first patch.

Yeah, I can do that.  It make sense.

Thanks,

-corey

> 
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 26a04dc0590b..4b0e9d1784dd 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -38,7 +38,7 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/spinlock.h>
> > -#include <linux/timer.h>
> > +#include <linux/hrtimer.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> > @@ -53,6 +53,8 @@
> >  /* This will be the driver name the kernel reports */
> >  #define DRIVER_NAME "imx-i2c"
> >  
> > +#define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
> > +
> >  /*
> >   * Enable DMA if transfer byte size is bigger than this threshold.
> >   * As the hardware request, it must bigger than 4 bytes.\
> > @@ -214,8 +216,8 @@ struct imx_i2c_struct {
> >  	enum i2c_slave_event last_slave_event;
> >  
> >  	/* For checking slave events. */
> > -	spinlock_t	  slave_lock;
> > -	struct timer_list slave_timer;
> > +	spinlock_t     slave_lock;
> > +	struct hrtimer slave_timer;
> >  };
> >  
> >  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> > @@ -783,13 +785,16 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
> >  	}
> >  
> >  out:
> > -	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
> > +	hrtimer_try_to_cancel(&i2c_imx->slave_timer);
> > +	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
> > +	hrtimer_restart(&i2c_imx->slave_timer);
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static void i2c_imx_slave_timeout(struct timer_list *t)
> > +static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
> >  {
> > -	struct imx_i2c_struct *i2c_imx = from_timer(i2c_imx, t, slave_timer);
> > +	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
> > +						      slave_timer);
> >  	unsigned int ctl, status;
> >  	unsigned long flags;
> >  
> > @@ -798,6 +803,7 @@ static void i2c_imx_slave_timeout(struct timer_list *t)
> >  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> >  	i2c_imx_slave_handle(i2c_imx, status, ctl);
> >  	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> > +	return HRTIMER_NORESTART;
> >  }
> >  
> >  static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
> > @@ -1423,7 +1429,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	spin_lock_init(&i2c_imx->slave_lock);
> > -	timer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, 0);
> > +	hrtimer_init(&i2c_imx->slave_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > +	i2c_imx->slave_timer.function = i2c_imx_slave_timeout;
> >  
> >  	match = device_get_match_data(&pdev->dev);
> >  	if (match)
> > @@ -1538,7 +1545,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	del_timer_sync(&i2c_imx->slave_timer);
> > +	hrtimer_cancel(&i2c_imx->slave_timer);
> >  
> >  	/* remove adapter */
> >  	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
> > -- 
> > 2.25.1
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
