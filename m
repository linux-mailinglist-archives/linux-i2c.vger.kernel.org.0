Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D21CC1521D6
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 22:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgBDVSy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 16:18:54 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:34396 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgBDVSx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 16:18:53 -0500
Received: by mail-vk1-f196.google.com with SMTP id w67so5629498vkf.1
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ig51N1g6KEOgKY3CEDTkDorjmkcG1hiofbCpAcjU/P0=;
        b=MbThkf17ZqdxHDxIYXmCBNWXk/NFKFXqv0PotnuvrnwkaoezorZsnAXOkc9nD6Bag/
         r5bgOiJxr07kUK8bfSFBJ/udvgZlfFuV8+5j4ko/r+AWxOMYXFEi7dhzaXHuNjAyC0gc
         24b2xgB4p1oVhuE8CNVmGyy0jlvsb0dAasjrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ig51N1g6KEOgKY3CEDTkDorjmkcG1hiofbCpAcjU/P0=;
        b=T3FIzKpPkPNzQuwNMbIbLqNxZIuPqCf67Y7A8kU9HyrQ647V+5cRsnjHAWfPQgalNc
         PDd2Ps7J12lJPleF65scPb++u1+euLno1mLQcFEZ1Wr2LbIdDGImUxkwKUo4vXAj2Y57
         VJWvHYQFR2pJB4O7CSQ448AXvQOzx0UYNTYPIsdcu3jmZG7FZmuHmdF8Q/b3BxSnE0ls
         CPpOg8tO4hUR3rKiB3Oz2pvNDPCcvE6nY3+547c6IW1TDEkwo3vmVjsrMIGLjnkX5aM7
         wo9qcKCp8xhOdaIbHnDLXEPasWDC9wcgEc1lv6OIoGqNddhs46aae0cjtn8cH9780EE2
         fiCQ==
X-Gm-Message-State: APjAAAV99MZTorAqqOGpBZjZ3ddNmbyHkZaIOHkgk1eSuuVxrq8bvKJt
        7N0vlPnTIWdQ9WOytPQoaHAfp944rbo=
X-Google-Smtp-Source: APXvYqxNiG7gDish9D9sZ8GSB2p8e6FRJg/Z5lC3mb31/FkblmQzedPNXpcdQ4WDqieJgFGtjg0dnw==
X-Received: by 2002:a1f:4d85:: with SMTP id a127mr18383421vkb.67.1580851132478;
        Tue, 04 Feb 2020 13:18:52 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id p4sm6624001vsg.10.2020.02.04.13.18.51
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:18:51 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id t12so12428526vso.13
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:18:51 -0800 (PST)
X-Received: by 2002:a67:ec4a:: with SMTP id z10mr18832183vso.73.1580851131312;
 Tue, 04 Feb 2020 13:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-3-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-3-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 13:18:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-2jrpSbHoTLJ7MzVAhR=4hKnVyjdtgUQCs=Qr4ptOfg@mail.gmail.com>
Message-ID: <CAD=FV=W-2jrpSbHoTLJ7MzVAhR=4hKnVyjdtgUQCs=Qr4ptOfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:31 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 51 ++++++++++++++----------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 3e13b54ce3f8..192a8f622f3d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -502,45 +502,42 @@ static int geni_i2c_probe(struct platform_device *pdev)
>         struct resource *res;
>         u32 proto, tx_depth;
>         int ret;
> +       struct device *dev = &pdev->dev;
>
> -       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
> +       gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
>         if (!gi2c)
>                 return -ENOMEM;
>
> -       gi2c->se.dev = &pdev->dev;
> -       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +       gi2c->se.dev = dev;
> +       gi2c->se.wrapper = dev_get_drvdata(dev->parent);
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +       gi2c->se.base = devm_ioremap_resource(dev, res);
>         if (IS_ERR(gi2c->se.base))
>                 return PTR_ERR(gi2c->se.base);
>
> -       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> -       if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
> +       gi2c->se.clk = devm_clk_get(dev, "se");
> +       if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev)) {
>                 ret = PTR_ERR(gi2c->se.clk);
> -               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>                 return ret;
>         }

As with my response to your similar SPI change [1], there are cases
where this print could have informed us about other errors besides
EPROBE_DEFER, but it does seem rather unlikely so I'm OK w/ your
change.

I'm wondering why you didn't further clean this up, though.  You could
have fully gotten rid of the braces by just doing:

return PTR_ERR(gi2c->se.clk);


> -       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> -                                                       &gi2c->clk_freq_out);
> +       ret = device_property_read_u32(dev, "clock-frequency",
> +                                      &gi2c->clk_freq_out);
>         if (ret) {
> -               dev_info(&pdev->dev,
> -                       "Bus frequency not specified, default to 100kHz.\n");
> +               dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
>                 gi2c->clk_freq_out = KHZ(100);
>         }
>
> -       if (has_acpi_companion(&pdev->dev))
> -               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +       if (has_acpi_companion(dev))
> +               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>
>         gi2c->irq = platform_get_irq(pdev, 0);
> -       if (gi2c->irq < 0) {
> -               dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
> +       if (gi2c->irq < 0)

Commit message doesn't mention removing this print, though checking
platform_get_irq() it looks like it already spams in the case where a
non-EPROBE_DEFER error is returned so I think you're good.

[1] https://lore.kernel.org/r/CAD=FV=U6Yiv5i4PdDFqNhp0STqAvVi_=F_iuKyonx=MsOQFABQ@mail.gmail.com


In any case above things aren't terribly important, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
