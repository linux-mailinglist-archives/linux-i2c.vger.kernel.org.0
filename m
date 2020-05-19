Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D171D9897
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 15:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgESNxM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 09:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgESNxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 09:53:12 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257FDC08C5C0;
        Tue, 19 May 2020 06:53:12 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d10so70186pgn.4;
        Tue, 19 May 2020 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NWtV2zmVO4n9CdPb/uqwMJhnY2pzIV0xOL5In4VvDGw=;
        b=aZO14iWd+ay8rcl00Vn9yWGhdnr4w7Bh1P3ku0+WDHbo6LXo5vKqmPdhrSiB0EMbtk
         2hVmjmqTierOxRQpBiVPaNMBiHtNlgGY+R6v0JRO7DUhYIxPU/lIwdL+b4LNAbaM76Z5
         nIu9icY6gccfX+Tw0b772pEnUatneCyS7tfcbUOywr3P7AI/RtviVAQALmEMw9DaZ5AR
         H8Ok7QfusUn7srO8ybpdNhH5Bjg96gcecWUUYg9CySBo6JbqreNkjO6kaOjA128h6B1+
         4BSS1UrPktVq6EFBqNynsuGPtedDHowifuJ9Dt6yqqjd8brH5CGOgdgoFIEQYSWsJNQ6
         pRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NWtV2zmVO4n9CdPb/uqwMJhnY2pzIV0xOL5In4VvDGw=;
        b=NiJ/1BsWteOQfC+iwJqtBKkM3gIEVPwvAiU4vbM4xyKw7x8FkYwI0BAC/bAio2WmJZ
         xsLrcqXYBWF6R+CT/IucsdTFEYAf3qNzdrKwtGHLhXEdFeIVTKIfm4YV1rREAAdmfr43
         FLhYo4Klk1l58gtJayXZFzYnv9Zxm/o+sfm1GEhhFyWEiNjJDfOTjmb4FlzKrC9B6nVO
         LOTxT3iOXiwmp3eHouZ81iB8qjLkLxg+blHsusmrW0KtJeSVH9hXRwuo/KzdArtEOAQ0
         SG3yO6Juh20bL7n8JV4zxHNzOnYsg16aZI2L2HttTGnowel4xWWRy2VfgN5FLTuxK9ZI
         RAeQ==
X-Gm-Message-State: AOAM530u6DFgtbz+oXXr7Br8+JCTLF2BuggxNmJQuygOPx3AO5jYrWtY
        0zo9y7kOm7v4qZiPghS3loKcQXz0
X-Google-Smtp-Source: ABdhPJyOGow9Pv3VRrRNNhBZjWcxQIUrFp5noO3UFGozI1bq/2r9qoF6a0pD7qQ5jvJKSmmoP+vzxg==
X-Received: by 2002:aa7:8a92:: with SMTP id a18mr22281757pfc.0.1589896391568;
        Tue, 19 May 2020 06:53:11 -0700 (PDT)
Received: from localhost ([176.122.159.242])
        by smtp.gmail.com with ESMTPSA id z18sm10213447pgi.68.2020.05.19.06.53.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 06:53:10 -0700 (PDT)
Date:   Tue, 19 May 2020 21:53:06 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     gregkh@linuxfoundation.org, wsa+renesas@sang-engineering.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: busses: convert to
 devm_platform_request_irq()
Message-ID: <20200519135306.GA1647@nuc8i5>
References: <20200518155304.28639-1-zhengdejin5@gmail.com>
 <20200518155304.28639-3-zhengdejin5@gmail.com>
 <c4f33036-1a88-1d75-c4ce-3024d2bf9bb1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f33036-1a88-1d75-c4ce-3024d2bf9bb1@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 18, 2020 at 08:34:01PM +0300, Grygorii Strashko wrote:
> 
> 
> On 18/05/2020 18:53, Dejin Zheng wrote:
> > Use devm_platform_request_irq() to simplify code, and it contains
> > platform_get_irq() and devm_request_irq().
> > 
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++-------------
> >   drivers/i2c/busses/i2c-cadence.c   | 10 +++-------
> >   drivers/i2c/busses/i2c-digicolor.c | 10 +++-------
> >   drivers/i2c/busses/i2c-emev2.c     |  5 ++---
> >   drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
> >   drivers/i2c/busses/i2c-meson.c     | 13 ++++---------
> >   drivers/i2c/busses/i2c-mxs.c       |  9 +++------
> >   drivers/i2c/busses/i2c-pnx.c       |  9 ++-------
> >   drivers/i2c/busses/i2c-rcar.c      |  9 +++------
> >   drivers/i2c/busses/i2c-rk3x.c      | 14 +++-----------
> >   drivers/i2c/busses/i2c-sirf.c      | 10 ++--------
> >   drivers/i2c/busses/i2c-stu300.c    |  4 ++--
> >   drivers/i2c/busses/i2c-synquacer.c | 12 +++---------
> >   13 files changed, 35 insertions(+), 91 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> > index ed5e1275ae46..f45acb47552a 100644
> > --- a/drivers/i2c/busses/i2c-bcm-kona.c
> > +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> > @@ -818,20 +818,10 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
> >   	       ISR_NOACK_MASK,
> >   	       dev->base + ISR_OFFSET);
> > -	/* Get the interrupt number */
> > -	dev->irq = platform_get_irq(pdev, 0);
> > -	if (dev->irq < 0) {
> > -		rc = dev->irq;
> > -		goto probe_disable_clk;
> > -	}
> > -
> > -	/* register the ISR handler */
> > -	rc = devm_request_irq(&pdev->dev, dev->irq, bcm_kona_i2c_isr,
> > -			      IRQF_SHARED, pdev->name, dev);
> > -	if (rc) {
> > -		dev_err(dev->device, "failed to request irq %i\n", dev->irq);
> > +	rc = devm_platform_request_irq(pdev, 0, &dev->irq, bcm_kona_i2c_isr,
> > +					IRQF_SHARED, pdev->name, dev);
> > +	if (rc)
> >   		goto probe_disable_clk;
> > -	}
> >   	/* Enable the controller but leave it idle */
> >   	bcm_kona_i2c_send_cmd_to_ctrl(dev, BCM_CMD_NOACTION);
> > diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> > index 4b72398af505..9ffae4d231dc 100644
> > --- a/drivers/i2c/busses/i2c-cadence.c
> > +++ b/drivers/i2c/busses/i2c-cadence.c
> > @@ -1204,8 +1204,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
> >   	if (IS_ERR(id->membase))
> >   		return PTR_ERR(id->membase);
> > -	id->irq = platform_get_irq(pdev, 0);
> > -
> 
> 
> In many cases It is two strictly different steps
> 1) Request resource, including IRQ mapping and differed probe handling.
>    It should be done as early as possible to avoid unnecessary initialization steps
>    when resource (irq) is not ready,  and so avoid boot time increasing.
> 2) Actually request and enable IRQ, which, in many case, should be done late in probe
>    when driver and HW are actually ready to handle IRQs.
> 
> here, for example, between this point
> 
> >   	id->adap.owner = THIS_MODULE;
> >   	id->adap.dev.of_node = pdev->dev.of_node;
> >   	id->adap.algo = &cdns_i2c_algo;
> > @@ -1256,12 +1254,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
> >   		goto err_clk_dis;
> >   	}
> > -	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
> > -				 DRIVER_NAME, id);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
> 
> and this point the following happens:
>  - devm_clk_get() can fail and cause probe defer
>  - clk_prepare_enable()
>  - pm_runtime_.. - pm init
>  - cdns_i2c_.. - hw int
> 
> > +	ret = devm_platform_request_irq(pdev, 0, &id->irq, cdns_i2c_isr, 0,
> > +					DRIVER_NAME, id);
> 
> and now platform_get_irq(), which can fail due to IRQ controller not ready,
> and all above has to be reverted.
> 
> > +	if (ret)
> >   		goto err_clk_dis;
> > -	}
> [...]
> 
> A bit risky optimization, especially for bulk changes.
>
Grygorii, Thanks for your comments, you are right, abandon these two patches.

BTW, The gmail will prevent me sending messages to many recipients, so
remove some recipients. and still sending to i2c and kernel mail list.

BR,
Dejin

> -- 
> Best regards,
> grygorii
