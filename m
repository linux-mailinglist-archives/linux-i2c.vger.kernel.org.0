Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3461C3D0D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 16:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgEDObK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 10:31:10 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45507 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgEDObJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 10:31:09 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 044EUd7w023390;
        Mon, 4 May 2020 23:30:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 044EUd7w023390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588602640;
        bh=0JMCbgyAmGlhpQ7hxiz18kOsUjzg30bD8HcBbpAb5x0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G5Rd22fqKWFQr8izYGGP51A/o4qstjc9zuugWqQ6N2nOhERP4siYnlHcZ03YXdo2z
         /EyBKvshpF+iDoLuRuHli4tDLlLtidHvoVv7fBp3DgUkSNOl3uXiyVPxUhpwIxGICY
         Sbjt19/Ni4AF63wUwu0JgTk00g6wYk1YNGjgAVmQsDiZWGLSpazr0Q3BbYmz7/XxH1
         JGmSMy21tNkd+3i581x5dN41yEpbIJRJr2ojQdK3a6yFYbg85gNq69nCymfpuZ6Nzc
         xLYN3iZmDmBstMX5BoILgp4mTjxf07hfKVdZpGUlR9akL7EwG8bRmnnpm++aa8Y/lc
         x0khQBJA/tS7Q==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id a7so6660071uak.2;
        Mon, 04 May 2020 07:30:40 -0700 (PDT)
X-Gm-Message-State: AGi0Puapq50bF75RV6lR/wdDj76NNtVZ4ywj3C4ODtjXfaIyfHki5Qta
        7BQZNUdl6sXEsf/GGqg5FDqzgP1l/uPpfikuuEM=
X-Google-Smtp-Source: APiQypKoRtxT5WUefMCSz+nDLJ7ma5aTrMA6HlGAiXM9vGi0yv8JY3GHqUc1DdU+MwHJn6k8kWjKX9XTaakvqPONu6Y=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr11730734uad.25.1588602638948;
 Mon, 04 May 2020 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200503120847.13528-1-aishwaryarj100@gmail.com> <20200504114408.9128-1-aishwaryarj100@gmail.com>
In-Reply-To: <20200504114408.9128-1-aishwaryarj100@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 4 May 2020 23:30:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASuDxyvfh+cw1TEq_tTpQmdx+d99yMfnQ34wRSiTmJeLA@mail.gmail.com>
Message-ID: <CAK7LNASuDxyvfh+cw1TEq_tTpQmdx+d99yMfnQ34wRSiTmJeLA@mail.gmail.com>
Subject: Re: [PATCH] i2c: drivers: Remove superfluous error message
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 4, 2020 at 8:44 PM Aishwarya Ramakrishnan
<aishwaryarj100@gmail.com> wrote:
>
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.
>
> Suggested by Coccinelle.
>
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
> ---
>  drivers/i2c/busses/i2c-altera.c   | 4 +---
>  drivers/i2c/busses/i2c-cht-wc.c   | 4 +---
>  drivers/i2c/busses/i2c-img-scb.c  | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c    | 4 +---
>  drivers/i2c/busses/i2c-uniphier.c | 4 +---


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


I see more drivers with the similar pattern, though.






>  5 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index f5c00f903df3..af6985f0ae63 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -395,10 +395,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(idev->base);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "missing interrupt resource\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(idev->i2c_clk)) {
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 35e55feda763..343ae5754e6e 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>         int ret, reg, irq;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "Error missing irq resource\n");
> +       if (irq < 0)
>                 return -EINVAL;
> -       }
>
>         adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
>         if (!adap)
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 422097a31c95..2f6de763816a 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c->base);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "can't get irq number\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
>         if (IS_ERR(i2c->sys_clk)) {
> diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
> index 13b0c12e2dba..43dc9b7043e4 100644
> --- a/drivers/i2c/busses/i2c-lpc2k.c
> +++ b/drivers/i2c/busses/i2c-lpc2k.c
> @@ -362,10 +362,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c->base);
>
>         i2c->irq = platform_get_irq(pdev, 0);
> -       if (i2c->irq < 0) {
> -               dev_err(&pdev->dev, "can't get interrupt resource\n");
> +       if (i2c->irq < 0)
>                 return i2c->irq;
> -       }
>
>         init_waitqueue_head(&i2c->wait);
>
> diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
> index 668b1fa2b0ef..ee00a44bf4c7 100644
> --- a/drivers/i2c/busses/i2c-uniphier.c
> +++ b/drivers/i2c/busses/i2c-uniphier.c
> @@ -324,10 +324,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->membase);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(dev, "failed to get IRQ number\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
>                 bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
