Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4563F442D2E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 12:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhKBLxf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 07:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBLxe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 07:53:34 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE54C061714;
        Tue,  2 Nov 2021 04:51:00 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id bi29so19301202qkb.5;
        Tue, 02 Nov 2021 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LJIjYhfvWq/XmxkSPhVuNgnT9R48OynbL5aet6ipzhY=;
        b=dfAB0y0GoTZd4vmgCa4lDJlj9Xy1PPZCyGEdK/aTMYNEkaHQo4KucqVGBLIuVG+PRs
         JGEUBY/3CgEHvt0J/ky8T5591KmJL8oUwcKVKttLnn92GjzZMjFohVOxeVTW199Z/YD7
         Mnd8So9zLY16X+TivrlW6J9HRAdeDgGOnYMeHrWLApOHH0rP/WASjQ9tV2Z7XhsIXMZa
         K0M0Bvns2d9xdDUcyFtUmZOAfV01E8LzRphK72ahfxPHlwgngv/wnSJi5wuA4F1bbDGM
         focD78n4Arr4N/winCvY1ri3EsDM9OG2WaHQ4N2pNhqoNP6Y/e/1p1nWzr+A9dsa85qT
         E2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=LJIjYhfvWq/XmxkSPhVuNgnT9R48OynbL5aet6ipzhY=;
        b=xg/IXkJwu9mFio3vAsm8ztbU18xaVXiG4TeCVcJi8/FIvSRdicwSY+rAbK3yiioO04
         mSLil3TYYUbwknlYTr8PuMh+iZdMr8wPAqznu+U6E4QzJKyHOWKgv2u1jvSAFYke3krK
         R7vpSfscdBJn4zevDVmSEkOvI0YaAXftR5eRuQVcf6LgprGOGePsomvPyKiM0ZAuq+Mt
         knwovQB6slkNfTcmklGLb5z+KbK34iU58BSmJ5RNEs2uwrRiIUM0az8R6xDTxtHPkp+x
         Hw4yQoWmBB+yuLB6ZLvwUZfodmqc8a6A8cD8jR7yk1N6vGccGhOmcWuqB5ePIuiRaCpC
         h7Fg==
X-Gm-Message-State: AOAM530dOuufcoJKrmbWuWxAjXW8AeiW+GQ4NEgv5BpLEVZeN4NkUWpj
        TZg5CIV+UgnRtcX58dhwjEJogjiFQQ==
X-Google-Smtp-Source: ABdhPJyAbjE94dVa8us1n3QC2fX9EDhr0MBywxIYHXAfN5NxraycqSOnTKvOPdJqmVl+6BY8ybsyEw==
X-Received: by 2002:a37:9e8d:: with SMTP id h135mr3424965qke.105.1635853859207;
        Tue, 02 Nov 2021 04:50:59 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id a3sm13558462qta.58.2021.11.02.04.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 04:50:58 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:b4e0:932d:f90c:fafb])
        by serve.minyard.net (Postfix) with ESMTPSA id B41A71800BA;
        Tue,  2 Nov 2021 11:50:57 +0000 (UTC)
Date:   Tue, 2 Nov 2021 06:50:56 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] i2c:imx: Use an hrtimer, not a timer, for checking
 for bus idle
Message-ID: <20211102115056.GI4667@minyard.net>
Reply-To: minyard@acm.org
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-4-minyard@acm.org>
 <20211102085806.hefnttaxm5srxbov@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102085806.hefnttaxm5srxbov@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 02, 2021 at 09:58:06AM +0100, Uwe Kleine-König wrote:
> On Mon, Oct 04, 2021 at 07:32:16PM -0500, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > The timer is too slow and significantly reduces performance.  Use an
> > hrtimer to get things working faster.
> > 
> > Signed-off-by: Corey Minyard <minyard@acm.org>
> > Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> > Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
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
> 
> This is unrelated to this patch, moreover it was introduced only in
> patch 1.

The second line is important for this patch, of course.  I assume you
mean the indention of the first line, which is just keeping things lined
up.

> 
> >  };
> >  
> >  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> > @@ -783,13 +785,16 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
> >  	}
> >  
> >  out:
> > -	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
> > +	hrtimer_try_to_cancel(&i2c_imx->slave_timer);
> 
> Don't you need to check the return value here?

Not really.  The possible return values are:

 *  *  0 when the timer was not active
 *  *  1 when the timer was active
 *  * -1 when the timer is currently executing the callback function and
 *    cannot be stopped

and if it returns 0 or 1, then everything is fine.  If it returns -1,
then the code will still work, though it may be redone (or already have
been done) by the timer function.  So it doesn't matter.

Maybe I should add a comment about this?

Thanks for reviewing.

-corey

> 
> > +	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
> > +	hrtimer_restart(&i2c_imx->slave_timer);
> >  	return IRQ_HANDLED;
> >  }
> >  
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


