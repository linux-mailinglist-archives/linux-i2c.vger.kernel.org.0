Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B5B1DF801
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 17:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731279AbgEWP0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 11:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728296AbgEWP0P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 11:26:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D887C05BD43;
        Sat, 23 May 2020 08:26:15 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k22so5604062pls.10;
        Sat, 23 May 2020 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KgjVm8tWrHa37c7kZd2xI4RfUCePad/gFc7yFWmFOeo=;
        b=qRp2WrRI7lTHyjyrKoOw0vtjWIS1Wpqixj4kqYTU9NPDPyM4XfU9gTPZLx8m18/5Y/
         ezstjLMPlWpW2zBH4o876C/MwC9gv6f4l+SXLNeyB/HBA9mRuQdj+QclUZZZZm6251YN
         muvkiu4W8PVtlPky9I8CHobq1pN6/OKdExAPCQqIZoADSrxIm6tw1J4EKhEJTZ1IL2Gs
         cUYOLRjqW7dzWkEDOiJeugBp/R0rcfYIUYvVglV5sDAenr+O3MPW/Ma5AMYGujPjppza
         whndtOg/uxf3ZXBU2CiyCUSGvXny/aMgPt0+MpbWlYPcW5TZc6rl7ZoVonAUcuSUOfnl
         ZXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KgjVm8tWrHa37c7kZd2xI4RfUCePad/gFc7yFWmFOeo=;
        b=HyZfMPs7KN3jH33ROcosKBwJdvjPLvq/vVVydBPd9zk2ju+4F06uKd1+iIjrSoJDH6
         LJAF0iifjTjtmEjx1nei1RNlA2Nk4TWZzfjfmpHpXmlGDVIxAeRX6wJWthMWKWkdqZ5e
         Yy4LqG1V7q+molQBmlTKqL4QcKSnDU4LSXIYvRymWEJSJl5IYuE9wFXcot7FeWUVf7Ad
         92IgVONv7ue8gUPZEGE1ohX/msf0SvgLoll0BdLspQFEEGL5L4QMIVnC12+y92PVRNx6
         7kQf/jhC9GySFvzWaAMXmQayP0JCJYlhbHKHKAoVftE4cY31Iixq7qNPgwQoa59bWe9y
         vEiw==
X-Gm-Message-State: AOAM53392W4MNIseP8BvjdmA6KzKtp9SQ6IyOIpmvX3CZMR3cWTDzcpQ
        jrSWRjg6CkxYZiEO59INFNU=
X-Google-Smtp-Source: ABdhPJyuV1SWeEQ47sCuTBHZRBDuiROJLFo3l4hPkxjqjiWEGXQ/b+oFdKfDHSK4oG6HK2anU11qQQ==
X-Received: by 2002:a17:902:d218:: with SMTP id t24mr6083900ply.292.1590247574769;
        Sat, 23 May 2020 08:26:14 -0700 (PDT)
Received: from localhost (176.122.159.134.16clouds.com. [176.122.159.134])
        by smtp.gmail.com with ESMTPSA id cx11sm9485604pjb.36.2020.05.23.08.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2020 08:26:14 -0700 (PDT)
Date:   Sat, 23 May 2020 23:26:10 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     wsa@the-dreams.de, harinik@xilinx.com, soren.brinkmann@xilinx.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
Message-ID: <20200523152610.GA16405@nuc8i5>
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
 <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 01:24:57PM +0200, Michal Simek wrote:
> On 20. 05. 20 16:48, Dejin Zheng wrote:
> > The driver initialization should be end immediately after found
> > the platform_get_irq() function return an error.
> > 
> > Fixes: df8eb5691c48d3b0 ("i2c: Add driver for Cadence I2C controller")
> 
> I wouldn't really consider this as bug. Driver is likely not failing
> when irq is not defined. It should just fail later on when
> devm_request_irq is called.
> Or is there any other issue with it?
> 
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> > v1 -> v2:
> > 	- add Fixes tag.
> > 
> >  drivers/i2c/busses/i2c-cadence.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> > index 89d58f7d2a25..0e8debe32cea 100644
> > --- a/drivers/i2c/busses/i2c-cadence.c
> > +++ b/drivers/i2c/busses/i2c-cadence.c
> > @@ -912,6 +912,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
> >  		return PTR_ERR(id->membase);
> >  
> >  	id->irq = platform_get_irq(pdev, 0);
> > +	if (id->irq < 0)
> > +		return id->irq;
> >  
> >  	id->adap.owner = THIS_MODULE;
> >  	id->adap.dev.of_node = pdev->dev.of_node;
> > 
> 
> The change is valid but the question is if make sense to do it in this
> way. Some drivers are using devm_request_irq to do do job.
> 
> For example:
>  	id->irq = platform_get_irq(pdev, 0);
>         ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
>                                   DRIVER_NAME, id);
>         if (ret)
> 		return ret;
> 
> But I am also fine with solution above where you fail in quickest way.
> 
> Without that Fixed tag
> Acked-by: Michal Simek <michal.simek@xilinx.com>
>

Michal, Thanks very much for review my patch, As you said, maybe the
better way is provide a function like the devm_platform_get_and_ioremap_resource().
So I resend a patch of I gave up before, It's here now:
https://patchwork.ozlabs.org/project/linux-i2c/patch/20200523145157.16257-3-zhengdejin5@gmail.com/

Abandon this patch and Thanks again!

BR,
Dejin

> Thanks,
> Michal
