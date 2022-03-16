Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8974DABB8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Mar 2022 08:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345472AbiCPHUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Mar 2022 03:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244761AbiCPHUJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Mar 2022 03:20:09 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815B025C77;
        Wed, 16 Mar 2022 00:18:50 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id q11so1066209pln.11;
        Wed, 16 Mar 2022 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xdhvbmTzm0m70Kh8djHXg3j+7HDaP8mLgVmfkawpDUw=;
        b=AUXiq0bUOyfp3CeeBU9HOHQpCcnAyJnqqyC/IoUYuzSerx3HvKX4cwsKsCOjW5886Z
         lrCMJr+7nkcCqu27vjye0Ptb298revmKMv8Qvc0SP+xIA0zhqxCEUjI+pXOXJCqmd8/c
         HgRt0/PccEWA8rpqJ0cPtsmXC756unVQnalWzuzK6q1ZFNDYqx9jeYmGUzel5au8hk6s
         2zVohMzlutx0fxTe53jbiT/ZHyKq7nEbAFGtiFiPH6222bP1oNxGK9QhVE71sl3VQ3SP
         mTHgVmee56KVxjYKRxvoub2Wv6Qz7FyYWBKWPUFrbU8SquiscrdA2Y+bnPSMs5E+7zQ6
         HIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xdhvbmTzm0m70Kh8djHXg3j+7HDaP8mLgVmfkawpDUw=;
        b=Z8NfeUkRtjC4f7hxqGcyyWwII1XjZOYoedh0NIucIxgVKaQKL7jzh6+L3NYOGbsGyy
         U6ezam9+FOBzh8FCqx7ndL/dOLTLWwnbqRk+FGfUJnvZSNOoCaKFNS5KKzmdQ01Yj17I
         vys8nI9ePcbswBONW9M1E8xSzPEx14jdsrkXuHhXafJeqaa25lsls1isqufttTXGtztJ
         XUt5B5SnqNJpIVJo7K49bBQ2mUbBO7lkgQSHbz0aE9vX6HogwkNpVY7T6xkkcIekmI1u
         LY4Xv0bUamFxnkGE10hC1v566cBit1HqOMpg4TZTrWHXe3pOodzWbj7LY4ttLvcvsyCa
         ZTMA==
X-Gm-Message-State: AOAM530bJxiq7CMGWnf9KPYp6cQ7zV5pzyzIr61Tr6Hkuv8Tb9btd90l
        UbQmWeYUedKF2MCeTMuN4+nemTrZWWZH9CYsPk4=
X-Google-Smtp-Source: ABdhPJxhR4+fA6qkGo4WfI+AZix+0vlMTHChLA58H+Yu+4uVT6YYg1QHaXoDI47KmY92On939mqJ4A==
X-Received: by 2002:a17:90b:1b4f:b0:1c5:4dc9:61c with SMTP id nv15-20020a17090b1b4f00b001c54dc9061cmr8721338pjb.161.1647415129972;
        Wed, 16 Mar 2022 00:18:49 -0700 (PDT)
Received: from VICKYMQLIN-NB1.localdomain ([159.226.95.33])
        by smtp.gmail.com with ESMTPSA id mw7-20020a17090b4d0700b001b8baf6b6f5sm1429373pjb.50.2022.03.16.00.18.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Mar 2022 00:18:49 -0700 (PDT)
Date:   Wed, 16 Mar 2022 15:18:41 +0800
From:   Miaoqian Lin <linmq006@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: Fix error handling in synquacer_i2c_probe
Message-ID: <20220316071841.GA43@VICKYMQLIN-NB1.localdomain>
References: <20220316064716.16587-1-linmq006@gmail.com>
 <CAHp75Veae=8Ev-xU3zbVYh=AxbAPFayZD3MeRSrAGNNZ8LMBPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Veae=8Ev-xU3zbVYh=AxbAPFayZD3MeRSrAGNNZ8LMBPg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andy Shevchenko

On Wed, Mar 16, 2022 at 09:04:06AM +0200, Andy Shevchenko wrote:
> 
> > In the error handling path, the clk_prepare_enable() function
> > call should be balanced by a corresponding 'clk_disable_unprepare()'
> > call, as already done in the remove function.
> 
> 
> It’s not good to mix devm approach with non-devm.
> 
Thanks for your review. I'm sorry, I don't quite understand. Could you please explain more? What functions are your referring to? Thanks. 

> 
> >
> > Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C
> > controller")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-synquacer.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-
> > synquacer.c
> > index e4026c5416b1..cd955224d629 100644
> > --- a/drivers/i2c/busses/i2c-synquacer.c
> > +++ b/drivers/i2c/busses/i2c-synquacer.c
> > @@ -569,22 +569,27 @@ static int synquacer_i2c_probe(struct
> > platform_device *pdev)
> >             i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE) {
> >                 dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
> >                         i2c->pclkrate);
> > -               return -EINVAL;
> > +               ret = -EINVAL;
> > +               goto err_disable_clk;
> >         }
> >
> >         i2c->base = devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(i2c->base))
> > -               return PTR_ERR(i2c->base);
> > +       if (IS_ERR(i2c->base)) {
> > +               ret = PTR_ERR(i2c->base);
> > +               goto err_disable_clk;
> > +       }
> >
> >         i2c->irq = platform_get_irq(pdev, 0);
> > -       if (i2c->irq < 0)
> > -               return i2c->irq;
> > +       if (i2c->irq < 0) {
> > +               ret = i2c->irq;
> > +               goto err_disable_clk;
> > +       }
> >
> >         ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
> >                                0, dev_name(&pdev->dev), i2c);
> >         if (ret < 0) {
> >                 dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
> > -               return ret;
> > +               goto err_disable_clk;
> >         }
> >
> >         i2c->state = STATE_IDLE;
> > @@ -607,7 +612,7 @@ static int synquacer_i2c_probe(struct platform_device
> > *pdev)
> >         ret = i2c_add_numbered_adapter(&i2c->adapter);
> >         if (ret) {
> >                 dev_err(&pdev->dev, "failed to add bus to i2c core\n");
> > -               return ret;
> > +               goto err_disable_clk;
> >         }
> >
> >         platform_set_drvdata(pdev, i2c);
> > @@ -616,6 +621,11 @@ static int synquacer_i2c_probe(struct platform_device
> > *pdev)
> >                  dev_name(&i2c->adapter.dev));
> >
> >         return 0;
> > +
> > +err_disable_clk:
> > +       if (!IS_ERR(i2c->pclk))
> > +               clk_disable_unprepare(i2c->pclk);
> > +       return ret;
> >  }
> >
> >  static int synquacer_i2c_remove(struct platform_device *pdev)
> > --
> > 2.17.1
> >
> >
> 
> -- 
> With Best Regards,
> Andy Shevchenko
