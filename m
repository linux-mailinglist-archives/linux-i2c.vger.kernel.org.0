Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122351A83CF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 17:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440960AbgDNPu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 11:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440940AbgDNPuy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 11:50:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32978C061A0C;
        Tue, 14 Apr 2020 08:50:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so71927plk.10;
        Tue, 14 Apr 2020 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rK/DPIM+PhgG+NfPlZb4h26D9g6G4NEcuKatIA25nFY=;
        b=ZN8YL00KrvwjNN3o0Xy3OYzoXWH1ftglb4xlWG+XR24Hu36aMx8fKU+n1W20hDE5Wt
         QIHdlVbk6m2mAECJEw/vNTg3Hr+bbac5+SC+prvlwGRD/Vq0K4S0VFsMeT3nZiGrM91i
         NX5BzTugQSYS0gfQB82n3YslO9KrfT1Us6IAgbxNy76HpOr7Bu3M1rFTW2PkbSUfkJ/q
         ES53E9aqQk6qR9yxdwmGbqPKYRSgxkSEVc9441DB/0K4aO5aTZFvPvhGZ6tMzbZMRf/L
         RnBwq/Eo3HcVwq+w7766Q04U2xGnKgUVnDiSTvkHd9nyakXKEA/o8vtWpxZVU3Z5XSGN
         8Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rK/DPIM+PhgG+NfPlZb4h26D9g6G4NEcuKatIA25nFY=;
        b=mwb8R75SYejB+yXgJwX90WBMnNa+Nfl6cfx/CStPFUNCgbDQ2sIb05oTUIhF34SsuD
         si8BZHrDNRUVTy570pmE495Y+lNDywezJUpp3niefQdPF4NEskms2fxb9qsIL9+W2kj+
         InGc7Eq/cGQF1Gau0S1UQptN1C6QgeZCbGMeiMihk4KaL5/wcKNZyQAV6AX6/qKvV6VP
         dKjg08wSBu/yomXiIRtQta1sCEAScJlOfkhJsUoJuWpu/DTiNoT75n3lj7DP1Yie2Q5c
         BnVnquTj1GOKK4vkuR/AZDHSMqm4T9yWL8mUxxEyQl8WUjVQKIayu+ryM7HNxS6OkdTI
         /7HA==
X-Gm-Message-State: AGi0PuaYNDAZ+GJyUWZ9R3ddsSQMzU1yzw1/6+tY/2FBihSj1VwbLbwg
        fJmrq8+0MluHbJy+uEfp74aG1/tC1dQ=
X-Google-Smtp-Source: APiQypJ8sq0yjFOz+/bjuysuvDFYXmdVvFhPRmvIehfWCguLKKoJ/AO1mQz/MkEbdD4c2bz0v9CBrQ==
X-Received: by 2002:a17:902:8e84:: with SMTP id bg4mr558607plb.50.1586879453605;
        Tue, 14 Apr 2020 08:50:53 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id c15sm10273561pgk.66.2020.04.14.08.50.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 08:50:53 -0700 (PDT)
Date:   Tue, 14 Apr 2020 23:50:47 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linus.walleij@linaro.org, patrice.chotard@st.com, info@metux.net,
        allison@lohutok.net, nehal-bakulchandra.shah@amd.com,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200414155047.GA10848@nuc8i5>
References: <20200414142650.29359-1-zhengdejin5@gmail.com>
 <20200414143837.GV34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414143837.GV34613@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 14, 2020 at 05:38:37PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 10:26:50PM +0800, Dejin Zheng wrote:
> > it will print an error message by itself when platform_get_irq()
> > goes wrong. so don't need dev_err() in here again.
> 
> In the future, please use something like this
> 	scripts/get_maintainer.pl --git --git-min-percent=67
> when retrieve Cc list for the mail.
>
Andy, Thank you for reminding me again, if I used it, There are only two
email addresses. 

scripts/get_maintainer.pl --git --git-min-percent=67 v1-0001-i2c-img-scb-remove-duplicate-dev_err.patch
linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS)
linux-kernel@vger.kernel.org (open list)

> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
Thanks very much for your review.

BR,
Dejin

> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-img-scb.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> > index 422097a31c95..2f6de763816a 100644
> > --- a/drivers/i2c/busses/i2c-img-scb.c
> > +++ b/drivers/i2c/busses/i2c-img-scb.c
> > @@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
> >  		return PTR_ERR(i2c->base);
> >  
> >  	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0) {
> > -		dev_err(&pdev->dev, "can't get irq number\n");
> > +	if (irq < 0)
> >  		return irq;
> > -	}
> >  
> >  	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
> >  	if (IS_ERR(i2c->sys_clk)) {
> > -- 
> > 2.25.0
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
