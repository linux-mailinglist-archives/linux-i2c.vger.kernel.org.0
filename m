Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80D31ACBB8
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 17:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410634AbgDPPvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 11:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2410539AbgDPPvF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 11:51:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2771BC061A0C;
        Thu, 16 Apr 2020 08:51:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so533077pjb.0;
        Thu, 16 Apr 2020 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xGcWxKE8xZiXHv4kbJrLQBtTyFPo8mQ6cVI9O81qpNs=;
        b=rFcQrxNZTTUm1PO04qUDHLFklpKcFeL/KFFyqL6JZxTPX0USZYU7mYRiZ2CaX3i2AY
         tF5kL4kn2uJGJhEG1+/Ufp5n1W2CYhwog6afuIBukXNjDFYJWipcFB8EtjYMWCuT66cm
         tJew0K0kmk6/K9+ExsIyeIB1p+J5WN9y3CDU9YisJr/FQupC2givtVTvL1ZjgdooiQDd
         BTekJc/ytldCQaakS0kOUVhbflZ5Q4YHQwrnhmEfbvYUieLkGUwR/tBgIzuEtSPwBrMk
         FNsSRIsa5LSPL6BHnvtJi8HrwJH2dca1PFH3PwfaU+lQBa/xg7iGqCS51KVdMHhkvs6p
         LqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xGcWxKE8xZiXHv4kbJrLQBtTyFPo8mQ6cVI9O81qpNs=;
        b=afqfxbzGO3PyB4lvp5lQAdZoZNhiuclndv0IFUIC6q/nvUuRVfvaO3yHOkzBJY/L6n
         iabdzMlpmtGaQvrkmZyENAlGeHbwYd1KyhX+aC4YhL88nO6XX21op2uJH7sirtX9VTKL
         UoSz19NUaOr14RHelm/E+se+QoeWA1/4veBDAOQvkH+8P3muh67qfF7sc/673YKKrsQ7
         7efjDQeFuKuep0dDQdFGIXEV6bKM8ZXkRnVGs+Erc6bLPREvzjJaTyo+PmVtiu/ZEksw
         ehtak3IeYpgIQiQIDVrZQnPS2bdDMpfyyoByDd/47+sRT6VPLLtpJ2cX+neP6R6upXjL
         N/hw==
X-Gm-Message-State: AGi0PubkKvnjZX8fc/7q3hjzvsEiFCGO4Zg5F+PW4rJOrNqU4G2ArHUa
        cIH9ZHKyCgdoH7gMOF0HdIWH+LxgVtjm4UZjvfo=
X-Google-Smtp-Source: APiQypKsU0PDkJF2BTo1Osb5YuZEoRRyeR0eZ1sFaOBvI9dvf7Q+7TrGUm7kQt4PmIul2QnO4QluHKrY09hj4Quvrh0=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr5787100pjb.143.1587052264379;
 Thu, 16 Apr 2020 08:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
In-Reply-To: <20200416152345.23077-1-zhengdejin5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Apr 2020 18:50:57 +0300
Message-ID: <CAHp75VdECDC5Tfx+OWBQG-i7p3P8c-RukA7peiJ70MX5uHqHKw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        krzysztof.adamski@nokia.com, Hans de Goede <hdegoede@redhat.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Vignesh R <vigneshr@ti.com>, Ard Biesheuvel <ardb@kernel.org>,
        gcherian@marvell.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alpawi@amazon.com,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 16, 2020 at 6:30 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.
>

All of them makes sense to me, thanks!

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
>         - add 19 similar changes by Markus's suggestion.
>         - Andy help me review patch v1 (i2c-img-scb.c), Thanks Andy.
>
>  drivers/i2c/busses/i2c-altera.c     | 4 +---
>  drivers/i2c/busses/i2c-axxia.c      | 4 +---
>  drivers/i2c/busses/i2c-bcm-kona.c   | 3 +--
>  drivers/i2c/busses/i2c-cht-wc.c     | 6 ++----
>  drivers/i2c/busses/i2c-img-scb.c    | 4 +---
>  drivers/i2c/busses/i2c-imx-lpi2c.c  | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c      | 4 +---
>  drivers/i2c/busses/i2c-meson.c      | 4 +---
>  drivers/i2c/busses/i2c-omap.c       | 4 +---
>  drivers/i2c/busses/i2c-owl.c        | 4 +---
>  drivers/i2c/busses/i2c-pnx.c        | 1 -
>  drivers/i2c/busses/i2c-pxa.c        | 4 +---
>  drivers/i2c/busses/i2c-qup.c        | 4 +---
>  drivers/i2c/busses/i2c-rk3x.c       | 4 +---
>  drivers/i2c/busses/i2c-sprd.c       | 4 +---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 +---
>  drivers/i2c/busses/i2c-synquacer.c  | 4 +---
>  drivers/i2c/busses/i2c-uniphier-f.c | 4 +---
>  drivers/i2c/busses/i2c-uniphier.c   | 4 +---
>  drivers/i2c/busses/i2c-xlp9xx.c     | 4 +---
>  20 files changed, 20 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 8f62ba10215d..d40d6691dbb9 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -393,10 +393,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
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
> diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
> index d45e2290c3f7..5294b73beca8 100644
> --- a/drivers/i2c/busses/i2c-axxia.c
> +++ b/drivers/i2c/busses/i2c-axxia.c
> @@ -746,10 +746,8 @@ static int axxia_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(base);
>
>         idev->irq = platform_get_irq(pdev, 0);
> -       if (idev->irq < 0) {
> -               dev_err(&pdev->dev, "missing interrupt resource\n");
> +       if (idev->irq < 0)
>                 return idev->irq;
> -       }
>
>         idev->i2c_clk = devm_clk_get(&pdev->dev, "i2c");
>         if (IS_ERR(idev->i2c_clk)) {
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index 3e63f706f66b..ed5e1275ae46 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -821,8 +821,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>         /* Get the interrupt number */
>         dev->irq = platform_get_irq(pdev, 0);
>         if (dev->irq < 0) {
> -               dev_err(dev->device, "no irq resource\n");
> -               rc = -ENODEV;
> +               rc = dev->irq;
>                 goto probe_disable_clk;
>         }
>
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 35e55feda763..f80d79e973cd 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>         int ret, reg, irq;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "Error missing irq resource\n");
> -               return -EINVAL;
> -       }
> +       if (irq < 0)
> +               return irq;
>
>         adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
>         if (!adap)
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index c937ea79300c..98a89301ed2a 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1342,10 +1342,8 @@ static int img_i2c_probe(struct platform_device *pdev)
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
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 94743ba581fe..9db6ccded5e9 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -551,10 +551,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>                 return PTR_ERR(lpi2c_imx->base);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "can't get irq number\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         lpi2c_imx->adapter.owner        = THIS_MODULE;
>         lpi2c_imx->adapter.algo         = &lpi2c_imx_algo;
> diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
> index 197cb64b2a42..4e30c5267142 100644
> --- a/drivers/i2c/busses/i2c-lpc2k.c
> +++ b/drivers/i2c/busses/i2c-lpc2k.c
> @@ -360,10 +360,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
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
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index b3bd869281d3..c5dec572fc48 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -426,10 +426,8 @@ static int meson_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c->regs);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "can't find IRQ\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         ret = devm_request_irq(&pdev->dev, irq, meson_i2c_irq, 0, NULL, i2c);
>         if (ret < 0) {
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 71b4637c86b7..175c590b93b7 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1365,10 +1365,8 @@ omap_i2c_probe(struct platform_device *pdev)
>         u16 minor, major;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "no irq resource?\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         omap = devm_kzalloc(&pdev->dev, sizeof(struct omap_i2c_dev), GFP_KERNEL);
>         if (!omap)
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index fba6efc1dca8..672f1f239bd6 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -407,10 +407,8 @@ static int owl_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c_dev->base);
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(dev, "failed to get IRQ number\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         if (of_property_read_u32(dev->of_node, "clock-frequency",
>                                  &i2c_dev->bus_freq))
> diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
> index 686c06f31625..5d7207c10f1d 100644
> --- a/drivers/i2c/busses/i2c-pnx.c
> +++ b/drivers/i2c/busses/i2c-pnx.c
> @@ -720,7 +720,6 @@ static int i2c_pnx_probe(struct platform_device *pdev)
>
>         alg_data->irq = platform_get_irq(pdev, 0);
>         if (alg_data->irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get IRQ from platform resource\n");
>                 ret = alg_data->irq;
>                 goto out_clock;
>         }
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 466e4f681d7a..37246cbbe14c 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -1267,10 +1267,8 @@ static int i2c_pxa_probe(struct platform_device *dev)
>                 return PTR_ERR(i2c->reg_base);
>
>         irq = platform_get_irq(dev, 0);
> -       if (irq < 0) {
> -               dev_err(&dev->dev, "no irq resource: %d\n", irq);
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         /* Default adapter num to device id; i2c_pxa_probe_dt can override. */
>         i2c->adap.nr = dev->id;
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 155dcde70fc9..0e3525fe613f 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1761,10 +1761,8 @@ static int qup_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(qup->base);
>
>         qup->irq = platform_get_irq(pdev, 0);
> -       if (qup->irq < 0) {
> -               dev_err(qup->dev, "No IRQ defined\n");
> +       if (qup->irq < 0)
>                 return qup->irq;
> -       }
>
>         if (has_acpi_companion(qup->dev)) {
>                 ret = device_property_read_u32(qup->dev,
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index fbe41c8cc126..bc698240c4aa 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1260,10 +1260,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>
>         /* IRQ setup */
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "cannot find rk3x IRQ\n");
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
>                                0, dev_name(&pdev->dev), i2c);
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 123a42bfe3b1..19cda6742423 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -492,10 +492,8 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c_dev->base);
>
>         i2c_dev->irq = platform_get_irq(pdev, 0);
> -       if (i2c_dev->irq < 0) {
> -               dev_err(&pdev->dev, "failed to get irq resource\n");
> +       if (i2c_dev->irq < 0)
>                 return i2c_dev->irq;
> -       }
>
>         i2c_set_adapdata(&i2c_dev->adap, i2c_dev);
>         init_completion(&i2c_dev->complete);
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> index 17c27f79029b..2f6f6468214d 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -236,10 +236,8 @@ static int p2wi_probe(struct platform_device *pdev)
>
>         strlcpy(p2wi->adapter.name, pdev->name, sizeof(p2wi->adapter.name));
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(dev, "failed to retrieve irq: %d\n", irq);
> +       if (irq < 0)
>                 return irq;
> -       }
>
>         p2wi->clk = devm_clk_get(dev, NULL);
>         if (IS_ERR(p2wi->clk)) {
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 8cc91a8da5a0..c9a3dba6a75d 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -578,10 +578,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(i2c->base);
>
>         i2c->irq = platform_get_irq(pdev, 0);
> -       if (i2c->irq < 0) {
> -               dev_err(&pdev->dev, "no IRQ resource found\n");
> +       if (i2c->irq < 0)
>                 return -ENODEV;
> -       }
>
>         ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
>                                0, dev_name(&pdev->dev), i2c);
> diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
> index 2b258d54d68c..cb4666c54a23 100644
> --- a/drivers/i2c/busses/i2c-uniphier-f.c
> +++ b/drivers/i2c/busses/i2c-uniphier-f.c
> @@ -529,10 +529,8 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
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
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index 286faa9c855e..f2241cedf5d3 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -517,10 +517,8 @@ static int xlp9xx_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->base);
>
>         priv->irq = platform_get_irq(pdev, 0);
> -       if (priv->irq <= 0) {
> -               dev_err(&pdev->dev, "invalid irq!\n");
> +       if (priv->irq <= 0)
>                 return priv->irq;
> -       }
>         /* SMBAlert irq */
>         priv->alert_data.irq = platform_get_irq(pdev, 1);
>         if (priv->alert_data.irq <= 0)
> --
> 2.25.0
>


-- 
With Best Regards,
Andy Shevchenko
