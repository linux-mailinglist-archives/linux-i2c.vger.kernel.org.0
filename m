Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF7B16B6DD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 01:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgBYAtg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 19:49:36 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35978 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgBYAtg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 19:49:36 -0500
Received: by mail-qk1-f194.google.com with SMTP id f3so7544293qkh.3
        for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2020 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1me14CbOFz1Di0TNO9KaSIXWFLOm9F2YEhCoAqOTtU=;
        b=WLRtR/yeVWtjh/WALXkdzPpXOlHESKlN1nc9Ljn3GpLnJnQ9WZke/t/h1JzN8x4WVV
         quUAiwX3nwaIBYJL39XpuPfoFQXTBYTWQIeHPPHYZ2l7DYeKf2EB52qAsEwAWFri4fNl
         3IpiSi1e/Gg+fUydULeJcgNkGjt+nFHU+PjlMdUxi/ECn+Mlx3cdlcQutD5J3LNICuyK
         yMB0g9HKEZAv2m5yqRK1D28DEQ+y8ysfvp5ApLc2lrDHT6r2ykiUmaaT3XhIwPxYlkw+
         vvW+addn7+D9l6jR8aFhcXNiRFPrwm+iRp4a+LPinxQo7sngrpiJJ+1eaIRodA/AXtS9
         hLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1me14CbOFz1Di0TNO9KaSIXWFLOm9F2YEhCoAqOTtU=;
        b=XXBy/WcjiWd0MOZ8eiM46wrO9C3V/2P0O8+J95R67C2OQ1WH+x10Q2RQIZyLh7/rwn
         Rjf7au3hY4GOcPwPTDH6W/f2NpWX1R9it2T0BwY0T6X08xrk/HvGcsWcyKsLReCeYNSD
         kRlskdSyLy7Nz0c5obgGpwoKsSuYrPIB50FgCd6lcqyVbWOr+aHVPdBI0F+Ptew+xf+N
         MXMGJp7XFs9mANWNvumrv2jYvyY1Q+Sg1bxj9iaFV+Buc6HXH2hvKyGcDuxoLuY9boOA
         HHaQcGxDrN870io1yvK10P9lgeGWCZ5Xxb4I8gxXuxVf1ddtSYCLd8ZluSCM/ptqH02h
         XleQ==
X-Gm-Message-State: APjAAAVW6AlrURlpOmzHtJ+QJ/SjTXp3nS2f9rkcTcGPl6V4SDJaB7py
        Zq/DotLbfC8PyIICEKdSb1u6/qMy2UIxf/PAyF0=
X-Google-Smtp-Source: APXvYqyQFMfmmFCsT0Oyaity1keMUd1xphGAalGGwOMe2I9EkhTEIyUA1DTfNuQpvD73hymDxVFHOgrmCHy7yRcN7yw=
X-Received: by 2002:a05:620a:22cd:: with SMTP id o13mr50613670qki.170.1582591775625;
 Mon, 24 Feb 2020 16:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-31-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-31-andriy.shevchenko@linux.intel.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 25 Feb 2020 08:49:24 +0800
Message-ID: <CADBw62reMCohyi-HHbyXpUdBB-ZsN8newHgUyy_cJ3vnfS1W2A@mail.gmail.com>
Subject: Re: [PATCH v1 31/40] i2c: spdr: Use generic definitions for bus frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Feb 24, 2020 at 11:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Can you fix the typo in the subject line by changing 'spdr' to 'sprd'?
Otherwise looks good to me. Thanks.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/i2c/busses/i2c-sprd.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index b432e7580458..4eb3ad1e5ab5 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -337,9 +337,9 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>         writel(div1, i2c_dev->base + ADDR_DVD1);
>
>         /* Start hold timing = hold time(us) * source clock */
> -       if (freq == 400000)
> +       if (freq == I2C_FAST_MODE_FREQ)
>                 writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -       else if (freq == 100000)
> +       else if (freq == I2C_STANDARD_MODE_FREQ)
>                 writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
>  }
>
> @@ -502,7 +502,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>         snprintf(i2c_dev->adap.name, sizeof(i2c_dev->adap.name),
>                  "%s", "sprd-i2c");
>
> -       i2c_dev->bus_freq = 100000;
> +       i2c_dev->bus_freq = I2C_STANDARD_MODE_FREQ;
>         i2c_dev->adap.owner = THIS_MODULE;
>         i2c_dev->dev = dev;
>         i2c_dev->adap.retries = 3;
> @@ -516,7 +516,8 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>                 i2c_dev->bus_freq = prop;
>
>         /* We only support 100k and 400k now, otherwise will return error. */
> -       if (i2c_dev->bus_freq != 100000 && i2c_dev->bus_freq != 400000)
> +       if (i2c_dev->bus_freq != I2C_STANDARD_MODE_FREQ &&
> +           i2c_dev->bus_freq != I2C_FAST_MODE_FREQ)
>                 return -EINVAL;
>
>         ret = sprd_i2c_clk_init(i2c_dev);
> --
> 2.25.0
>
