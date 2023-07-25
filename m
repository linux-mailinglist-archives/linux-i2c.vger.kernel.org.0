Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFFD760C35
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 09:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjGYHns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 03:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjGYHnC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 03:43:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5131FFF
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jul 2023 00:42:46 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b734aea34aso74813801fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jul 2023 00:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270964; x=1690875764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VDb8jgUC9ta3I8kt68Yh0174dHxmUqpTcrrhK3onAlM=;
        b=pw41WtmcfkB2vTLCPj9lHHUKdMaiDM+LpxqHQ6IPpqQ+Vb9p/+opfYtbChmvFa/bRG
         vcG3sMEDeBb+mF8nQd4JEcHTdO7W4JktnXcmx8tKXhH2rQwt6r5HS9lPBY7c+aowEY7j
         iJg58U6yWSbAX+RwyuZmOTKAVvPsQegxfu3Ix5LLS/VmseOEQ8tU8w1obqbLx5PklUT0
         M8yTuG1x6/lUWl1k9l5NVSWu95KvTxGqA6n35dauCX2DX/y2Q5TZ0yfXZPNa5HG4sM+F
         V+1zGKvOBHtqU4j4qTRCDn5aOjWjyqPmQlMnJM4ZLi+KQ5dqBSfgwJ3u2Qq43W3HlMFG
         xKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270964; x=1690875764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDb8jgUC9ta3I8kt68Yh0174dHxmUqpTcrrhK3onAlM=;
        b=lN0iblzXq9sXNyo99FPSdP3aLk2RlzriX3uFZzs8BYqc9S/M9lCJ/1UXM/1SrXUfse
         DuQ+1fxQ30381YR8w9cyzMjHYY1FSVrqRI8n4rl335ww4/1t6rNyiHseutA1i0yf1nGE
         ewiK6N2Ip++luHKM0YWFnCym13S955zUu/KWC/R0ZpFS0B33XHoqilGWXnwkgBUUFzPi
         5D6uTWD7vxta8LKPWo/At30NDWGp60r6S+PnWX9WVJGxXuJsWu1NsCwK+tGuONOQ+wNK
         zWDjkWh+I5HVs6NlrS4Xz3SzH8C6S7Em1GzscHR5OamiTqE94XW1hfdjrqC1BO984z8h
         ehBQ==
X-Gm-Message-State: ABy/qLbxhBi4L7pnv7WZ4D4CRj4xJwtUEpYXJZIansXoN4azjMl8uwM/
        SOqj+cYwsq1oLtJm45NpQvO/9tppBwdqY11/8ls=
X-Google-Smtp-Source: APBJJlED6gT3Vv2LWmJLWrfJvEoRFztGf10vzrtGXzUqB7FsewtuoaySZCBdlfL/4HwMgGpWU14wVA==
X-Received: by 2002:a2e:95c8:0:b0:2b9:44c6:d13b with SMTP id y8-20020a2e95c8000000b002b944c6d13bmr7911085ljh.9.1690270964231;
        Tue, 25 Jul 2023 00:42:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a5d56c9000000b00313e2abfb8dsm15523196wrw.92.2023.07.25.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:42:43 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:42:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Clean up a call to request_irq()
Message-ID: <15af6cc9-93d8-4ad9-b406-041be1d3dd5a@kadam.mountain>
References: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
 <20230725073629.glwgv73guiqv2f7w@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725073629.glwgv73guiqv2f7w@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 25, 2023 at 09:36:29AM +0200, Uwe Kleine-König wrote:
> Hello Dan,
> 
> On Tue, Jul 25, 2023 at 09:50:55AM +0300, Dan Carpenter wrote:
> > This is passing a NULL thread to request_threaded_irq().  So it's not
> > really a threaded IRQ at all.  It's more readable to call request_irq()
> > instead.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 65128a73e8a3..c0cac5bcfdd1 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1506,8 +1506,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
> >  		goto rpm_disable;
> >  
> >  	/* Request IRQ */
> > -	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> > -				   pdev->name, i2c_imx);
> > +	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> >  		goto rpm_disable;
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> There are a few more drivers that could benefit from the same patch
> (i.e. 
> 	drivers/gpu/drm/bridge/samsung-dsim.c
> 	drivers/iio/magnetometer/bmc150_magn.c
> 	drivers/scsi/mpi3mr/mpi3mr_fw.c
> 	drivers/spi/spi-fsl-dspi.c
> as of today's next).
> 
> I assume you care for these, too?
> 

I had a couple more I was planning to send.  I was sending them slowly
to see if people wanted to make them into threaded IRQs instead of
officially making them unthreaded.

regards,
dan carpenter

