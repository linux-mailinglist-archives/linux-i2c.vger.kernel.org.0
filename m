Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5201E43B0
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbgE0NbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730207AbgE0NbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 09:31:18 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9449BC08C5C1;
        Wed, 27 May 2020 06:31:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so11750024pgv.8;
        Wed, 27 May 2020 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7UTCqkxw0E37ZcBKPLbqUR2FGWZfkP4x8wzUp0dtX/k=;
        b=mNi677aeVfuSkx3f4deL/wnpijuZIzMsoVJWy5PShY7ns358wJ1GPJNbaVn57opoAA
         O+5RWhEWaK87ucSC24X+AZnOWh2G4etnlDd+wpCLu4hu/TlwiAiZO1pDSGxeEI86fnLv
         457ZunE4EkQPoK7e1AIPdlDvBaD09EltUWyPo09idX7ZsOHssLtjt1+EoQnxknff8BdK
         Y07N6In5JMLvsbe/mTNFgY57PzSgiscV8wQJlzI9luqAJkpsBMSNQwl/PqHzhIvbLcJv
         TL2N535JvGFddEk/o9+yP6JXfOBJzgY2pofYk+FORPYAHgJsuuOqqMi3IJQR3E8jOnpp
         xodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7UTCqkxw0E37ZcBKPLbqUR2FGWZfkP4x8wzUp0dtX/k=;
        b=ZjMucQ6GhK/oK71737n3+5H5c7RMnJzlEx1U9IKQQMW0JZ05m04Wel9lIRC1s+8+o/
         yDTX6MECwZhhUnZ40/YXoNQVK5zBJjQFnGlH/utaLNE8gn4/Mfnttp+wpz/ysOlp+Fpg
         1I/LSyEr6p5I0jjolPzkj2MCS1n6sJ+TyhLfSuWZrVFmgbtOGqnGl6dSINwn9ZE9wQOP
         GIeJriMRTgMa0QFvjcLJbEAulxTRIGALUc8WyGMbdr1QghJ+lMrnVtisV8ycHBVVjDOY
         G/JpN2fDbEBFmk/Y9+P3fSINSfgLlbvNkc2nX21dzSZKEplvB+d3mkfIrBlLFYgeFljX
         ySaw==
X-Gm-Message-State: AOAM530V+vb07ZZ/qZ5+aKZ8CDiZ2FZe1E+NjV94cakYB8zUQKqTRfwk
        yGjV8NcJgu9WWH+Fik3Ujng=
X-Google-Smtp-Source: ABdhPJz5yLFPNCHcVWcWDooYr0nX5RkE2SOQd0yC+BEF25FOjka4n4MH0U+L8/94UrIJumh01jJ9+g==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr4033851pfo.308.1590586277744;
        Wed, 27 May 2020 06:31:17 -0700 (PDT)
Received: from localhost ([144.34.194.82])
        by smtp.gmail.com with ESMTPSA id z8sm2099093pgc.80.2020.05.27.06.31.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 06:31:17 -0700 (PDT)
Date:   Wed, 27 May 2020 21:31:12 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200527133112.GC7143@nuc8i5>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523145157.16257-2-zhengdejin5@gmail.com>
 <c280f421-fadf-41ab-3227-6377906f2a1c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c280f421-fadf-41ab-3227-6377906f2a1c@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 26, 2020 at 08:11:22PM +0300, Grygorii Strashko wrote:
> 
> 
> On 23/05/2020 17:51, Dejin Zheng wrote:
> > It will call devm_request_irq() after platform_get_irq() function
> > in many drivers, sometimes, it is not right for the error handling
> > of these two functions in some drivers. so provide this function
> > to simplify the driver.
> > 
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> > v1 -> v2:
> > 	- The patch content has not changed. just resend it by this discussion:
> > 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> > 
> >   drivers/base/platform.c         | 33 +++++++++++++++++++++++++++++++++
> >   include/linux/platform_device.h |  4 ++++
> >   2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index c0d0a5490ac6..1d2fd1ea3bc5 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -275,6 +275,39 @@ int platform_irq_count(struct platform_device *dev)
> >   }
> >   EXPORT_SYMBOL_GPL(platform_irq_count);
> > +/**
> > + * devm_platform_request_irq - get an irq and allocate an interrupt
> > + *				line for a managed device
> > + * @pdev: platform device
> > + * @num: IRQ number index
> > + * @irq: get an IRQ for a device if irq != NULL
> > + * @handler: function to be called when the IRQ occurs
> > + * @irqflags: interrupt type flags
> > + * @devname: an ascii name for the claiming device, dev_name(dev) if NULL
> > + * @dev_id: a cookie passed back to the handler function
> > + *
> > + * Return: zero on success, negative error number on failure.
> > + */
> > +int devm_platform_request_irq(struct platform_device *pdev, unsigned int num,
> > +		unsigned int *irq, irq_handler_t handler,
> > +		unsigned long irqflags, const char *devname, void *dev_id)
> > +{
> > +	int tmp_irq, ret;
> > +
> > +	tmp_irq = platform_get_irq(pdev, num);
> > +	if (tmp_irq < 0)
> > +		return tmp_irq;
> > +
> > +	ret = devm_request_irq(&pdev->dev, tmp_irq, handler, irqflags,
> > +				devname, dev_id);
> > +	if (ret < 0)
> > +		dev_err(&pdev->dev, "can't request IRQ\n");
> > +	else if (irq != NULL)
> > +		*irq = tmp_irq;
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_platform_request_irq);
> > +
> >   /**
> >    * platform_get_resource_byname - get a resource for a device by name
> >    * @dev: platform device
> > diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> > index 77a2aada106d..d94652deea5c 100644
> > --- a/include/linux/platform_device.h
> > +++ b/include/linux/platform_device.h
> > @@ -11,6 +11,7 @@
> >   #define _PLATFORM_DEVICE_H_
> >   #include <linux/device.h>
> > +#include <linux/interrupt.h>
> >   #define PLATFORM_DEVID_NONE	(-1)
> >   #define PLATFORM_DEVID_AUTO	(-2)
> > @@ -70,6 +71,9 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
> >   extern int platform_get_irq(struct platform_device *, unsigned int);
> >   extern int platform_get_irq_optional(struct platform_device *, unsigned int);
> >   extern int platform_irq_count(struct platform_device *);
> > +extern int devm_platform_request_irq(struct platform_device *pdev,
> > +		unsigned int num, unsigned int *irq, irq_handler_t handler,
> > +		unsigned long irqflags, const char *devname, void *dev_id);
> 
> 
> it has to be documented in devres.rst
>
Grygorii, Thnaks! I will add it in patch v3.

BTW, the Gmail will prevent me sending messages to a large number of
recipients, So I reduced some recipients, but still retained i2c and
linux kernel mail list. sorry!

BR,
Dejin

> >   extern struct resource *platform_get_resource_byname(struct platform_device *,
> >   						     unsigned int,
> >   						     const char *);
> > 
> 
> 
> 
> -- 
> Best regards,
> grygorii
