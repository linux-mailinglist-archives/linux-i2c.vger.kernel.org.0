Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9542299BE
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 16:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732524AbgGVOFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 10:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgGVOFg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 10:05:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A748C0619DC;
        Wed, 22 Jul 2020 07:05:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a24so1326697pfc.10;
        Wed, 22 Jul 2020 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Vm4eI7tU1mxf2xSFDL8ig5nx8spemFwAvSMXbd7TsHg=;
        b=AWpqtCRSTs88mdbPs/KqJ9vAc3YDGmAU8mGbg7ubz4rOFoXVGQdlmQAtDABGgD9crL
         aoAOFcdnKjomzLggFX6hzTo6tpuzwLVGFbGy9/La7QdGbx4z1o0XiSR21eWKXTlk7q0g
         TuZVAHz6BQrtxw8+X6iiD9zSSVyitj/xnTjSJE1APEySu6IHNXlr77jf8SH0I8k9M/qt
         d5l2gmWp4/v0kC+gggSfTcsb060DZ6KzqxDJf1CaEwGTKg693NW0Qh37P0qLvco9knq4
         a27FyNVK7PhL3XyvRAXfI2O70zsjOnXPCCi5DedcKEZDolGL6jObNZ9i3PBwEO/hmN+S
         PLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Vm4eI7tU1mxf2xSFDL8ig5nx8spemFwAvSMXbd7TsHg=;
        b=pP3bYcHMXq2SNrc/VB45+sL84GPLPBjBR+qNZc9xQ7MovPY1B1QmTOcv0cvp+rTPse
         omyHmgA6PKoa6KoFfyxO9UZMPfunfjy/DbMJYjY5WO/7Z5eBP3J3UsVqqT2TkuVmSJDG
         np5pqNSNlXm2GXnQrHYXUuxcFMy/myXPGDl3UxbbxhR1YRVNQ/+PHhvkHN3tADUmfflK
         Sz+G8dsrripsb/kU1hn26nEm6g4VOapEWsFS2bzeecCsx5quL3vQxMS3dwigPxfqfu8l
         jRgeo6g17dyhN6Zy+hTHI0+FZkOdnm8LujBIUmTiH1115LeOD1/y+8qJp+PP1Sr/6e9H
         PFeQ==
X-Gm-Message-State: AOAM533cWB5l0tMnnLdy3FIKi4LCyZxRFC5rH7hH8oVpI5aSyjrapkXR
        yDOBWl32vxeHu9W5Myl+kdg=
X-Google-Smtp-Source: ABdhPJwyW5quQqQ+hM6dR6g2x849FsTMXORApoSb8wSfZRCEOy011L9/Af7GHfVKxCk+tl7K/pDaHw==
X-Received: by 2002:a62:e30f:: with SMTP id g15mr27934506pfh.203.1595426735032;
        Wed, 22 Jul 2020 07:05:35 -0700 (PDT)
Received: from localhost ([89.208.244.139])
        by smtp.gmail.com with ESMTPSA id m16sm24726566pfd.101.2020.07.22.07.05.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 07:05:34 -0700 (PDT)
Date:   Wed, 22 Jul 2020 22:05:27 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] i2c: busses: convert to
 devm_platform_request_irq()
Message-ID: <20200722140527.GB8725@nuc8i5>
References: <20200717161158.11516-1-zhengdejin5@gmail.com>
 <3228833.Xz71LAOI96@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3228833.Xz71LAOI96@diego>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 17, 2020 at 09:11:52PM +0200, Heiko Stübner wrote:
> Am Freitag, 17. Juli 2020, 18:11:58 CEST schrieb Dejin Zheng:
> > Use devm_platform_request_irq() to simplify code, and it contains
> > platform_get_irq() and devm_request_irq().
> > 
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Michal Simek <michal.simek@xilinx.com>
> 
> 
> Rockchip part (i2c-rk3x):
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
Heiko, Thanks a lot.

BR,
Dejin
> > diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> > index 8e3cc85d1921..1f0ac69c5774 100644
> > --- a/drivers/i2c/busses/i2c-rk3x.c
> > +++ b/drivers/i2c/busses/i2c-rk3x.c
> > @@ -1227,7 +1227,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> >  	int ret = 0;
> >  	int bus_nr;
> >  	u32 value;
> > -	int irq;
> >  	unsigned long clk_rate;
> >  
> >  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct rk3x_i2c), GFP_KERNEL);
> > @@ -1289,17 +1288,10 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > -	/* IRQ setup */
> > -	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0)
> > -		return irq;
> > -
> > -	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
> > -			       0, dev_name(&pdev->dev), i2c);
> > -	if (ret < 0) {
> > -		dev_err(&pdev->dev, "cannot request IRQ\n");
> > +	ret = devm_platform_request_irq(pdev, 0, NULL, rk3x_i2c_irq,
> > +					0, dev_name(&pdev->dev), i2c);
> > +	if (ret < 0)
> >  		return ret;
> > -	}
> >  
> >  	platform_set_drvdata(pdev, i2c);
> >  
> 
> 
> 
> 
