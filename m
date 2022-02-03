Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAAD4A8A12
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 18:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbiBCRaS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 12:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiBCRaS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 12:30:18 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4FEC061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 09:30:17 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id g15-20020a17090a67cf00b001b7d5b6bedaso3664264pjm.4
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 09:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ubQN3wjQNVLjjePaYSI2WRjv53pEkY7beAQaoVtELnQ=;
        b=XgMXehI79YLPzhpQ0L4nQ9bh4HIH+wL5e8DZ9tRWgsD7ZdG7Oi/1ytQF0HiKW2Npk4
         5qPpH15HzTLYSPYe1X8FFrItBoQwaMdgoWVeo22WsCDSaHxH8Oy1HZkGyUTOxMqw3Zqj
         Jt2nxbkkh26tgKFvve+Kug9kiEse4zwl5jjFHITiCSPWQAjYS/VyYUnNqEHEO1kt9u48
         G/riwlhEqkSAy8MkarsTaJR3s5iNJ82mwSadXmaTQDGsMLCLA/qGABBkyvPHkB4if5O7
         do6RO+gM5Drep7wJPcMlE4fdkSfL3Q2PNbav0rHYC+vVC8inCKcj8kwD7gLyfbUW8i/c
         JBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ubQN3wjQNVLjjePaYSI2WRjv53pEkY7beAQaoVtELnQ=;
        b=61jHtag7yGZBR+X/wffMMnn7hXQdpgQUngQoVJ2zU1GPE+ZDGsk95cTfPE9MhgDoH5
         Zz+HdBjoHiN3KLi9Chl8p+Cc34okpcnml4tGOyks9XWyLJHYOQY1jwDhfCH4kreCWf/8
         KeEu03erdzGmfULf/qvlEhEEampNc/A3EfyyRvArBh5nWeMU3vL/l0L38cqhJmkbqFQJ
         /ZWzN4444ej4AIT7nWBjuMi//zHpQiHL/1RsC0uJyON26DzfK5ryxtRBDJfUeWrZ+GmP
         hs4/mjxP7ccbCek/RlneKhgqjEfhtwLqPZvwKCFIUdT7+aZMMqDnw/qkd76xzhmg5RC7
         5RJA==
X-Gm-Message-State: AOAM5330xm1x0UrKATsx59pmaLf8MYNdZiP2YqjGB3pnpaeti76YwDmv
        8/XrrHXZmDl0dppwGrZdmeeCYhzUtrk/nBlL5LNNfQ==
X-Google-Smtp-Source: ABdhPJx4fMOA4lvPnokj6mw+jmqdTV14zXsuuGpt4s+xPW/MM3ZVOBdSUw/RyxPWeMYRjnkTb428j+jrvkatk8PJ0Bk=
X-Received: by 2002:a17:903:249:: with SMTP id j9mr36454044plh.95.1643909416604;
 Thu, 03 Feb 2022 09:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 3 Feb 2022 18:29:40 +0100
Message-ID: <CAMZdPi_mNzg4ET7FvMeNLiQxVJj7XU1DSxjSQ2CHLBvKu2XZzA@mail.gmail.com>
Subject: Re: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after
 registration of adapters
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vladimir,

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change is wanted to postpone initialization of busses on CCI controller
> by cci_init() and cci_reset() till adapters are registered, the later is
> needed for adding I2C bus devices and get correspondent vbus regulators.

This is odd, I don't think it's a good idea to register an adapter
which is not yet initialized. Could you elaborate on why you need to
do this, if you can't access the controller without this regulator
enabled, maybe it is more than vbus supply, and, in that case, it
should be enabled from your probe function.

Regards,
Loic





>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index cf54f1cb4c57..eebf9603d3d1 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -630,14 +630,6 @@ static int cci_probe(struct platform_device *pdev)
>         val = readl(cci->base + CCI_HW_VERSION);
>         dev_dbg(dev, "CCI HW version = 0x%08x", val);
>
> -       ret = cci_reset(cci);
> -       if (ret < 0)
> -               goto error;
> -
> -       ret = cci_init(cci);
> -       if (ret < 0)
> -               goto error;
> -
>         for (i = 0; i < cci->data->num_masters; i++) {
>                 if (!cci->master[i].cci)
>                         continue;
> @@ -649,6 +641,14 @@ static int cci_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       ret = cci_reset(cci);
> +       if (ret < 0)
> +               goto error_i2c;
> +
> +       ret = cci_init(cci);
> +       if (ret < 0)
> +               goto error_i2c;
> +
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>         pm_runtime_use_autosuspend(dev);
>         pm_runtime_set_active(dev);
> @@ -663,7 +663,6 @@ static int cci_probe(struct platform_device *pdev)
>                         of_node_put(cci->master[i].adap.dev.of_node);
>                 }
>         }
> -error:
>         disable_irq(cci->irq);
>  disable_clocks:
>         cci_disable_clocks(cci);
> --
> 2.33.0
>
