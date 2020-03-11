Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341851811F6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 08:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgCKHap (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 03:30:45 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41542 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728195AbgCKHao (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Mar 2020 03:30:44 -0400
Received: by mail-ua1-f66.google.com with SMTP id l7so355162uap.8
        for <linux-i2c@vger.kernel.org>; Wed, 11 Mar 2020 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Nk9d88tir1z9F+OfZqa+RxpSNCU78XfSYzCiKpe64Q=;
        b=xgQwRmjyFp8+taCvHKFUoeqURRY7TiuLf89r+llmJb6qciItR+j4GtXgiRI5Exwd45
         8jY928jqPvHCyGb0XL6Yw1dwNw+V6ErLpr7mxnrq88bL4/4l1fxxvnk+5Blu4/kH7/Xh
         ueBcClS0plhlOrAmI5a1ehlI88tkTnKwZWqqm8hMJRkWRy+Uxw5CgXOrrXvyPuXDCxv0
         KA1o+PY55P+eaR+1D47waYAVPaIv8GIphtvyWcwDUCvIXPNyBcE+WQBFo2jMEYI2q8hC
         mq4en4mQHKnr8MdkVJrpwwvrNzg8SMAcgndxI3YXecLM6bqw65F4rBuie5VlWe9l4yiD
         3zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Nk9d88tir1z9F+OfZqa+RxpSNCU78XfSYzCiKpe64Q=;
        b=nHPZwmU23J3x92jMInM9spzps8YnBSk37eaF3CIe0jzFDLejDa/vHJGmd1uNWuZZ0S
         FfFnrukhiegrBSeIddFWgYPWeEOcd5Nx5iWfab24k49U64SCNFEHVdoOsc/1WQB4/mL2
         Zgl0muwPbzkIPGhyogeOv+Cu+Tyd+ICnu/CZwoZYLao13ttPYOk9vwkynvvZNbhMZFh+
         aCCtuBjFIOWXwzHfGnKQ9PMUpeVGbWwy3x2M4pZWzusUX3Du+bdu/8SHZsCRjulf/JBn
         Ae/u26YF7rxk6SyW63PFNj3gukr067Nio01WN/p81n8W04qSKZ/OFP8X9jPJ/TwscsqP
         aLXw==
X-Gm-Message-State: ANhLgQ2/yDhL49NxA9axMH3GjgdPc/xfiMoAW8c7dIuwyYsEAVeIZ377
        HRHQx4pSWtcbxO90L/FW3Fgb7ONKiParFn/lhVGzFQ==
X-Google-Smtp-Source: ADFU+vt1Nj01BNrpKA6Wcf6tdySvJn+95tH2Jbcar3F9/LL7ZtoYmUEKyaT4NHRuBSPHRz11S0Tm9XGr1rpoOymRoko=
X-Received: by 2002:ab0:3089:: with SMTP id h9mr877616ual.48.1583911843276;
 Wed, 11 Mar 2020 00:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200310154358.39367-1-swboyd@chromium.org> <20200310154358.39367-3-swboyd@chromium.org>
In-Reply-To: <20200310154358.39367-3-swboyd@chromium.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 11 Mar 2020 13:00:00 +0530
Message-ID: <CAHLCerNVX844nUwaYHCRQdUhYbpfjRxQQp445bd_v7hnQ3YbyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 10, 2020 at 9:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful. Finally, platform_get_irq() already prints an error so just
> remove that error message.
>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 57 ++++++++++++++----------------
>  1 file changed, 26 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 4efca130035a..2f5fb2e83f95 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -502,45 +502,40 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
> -               ret = PTR_ERR(gi2c->se.clk);
> -               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> -               return ret;
> -       }
> +       gi2c->se.clk = devm_clk_get(dev, "se");
> +       if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
> +               return PTR_ERR(gi2c->se.clk);
>
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
>                 return gi2c->irq;
> -       }
>
>         ret = geni_i2c_clk_map_idx(gi2c);
>         if (ret) {
> -               dev_err(&pdev->dev, "Invalid clk frequency %d Hz: %d\n",
> +               dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
>                         gi2c->clk_freq_out, ret);
>                 return ret;
>         }
> @@ -549,29 +544,29 @@ static int geni_i2c_probe(struct platform_device *pdev)
>         init_completion(&gi2c->done);
>         spin_lock_init(&gi2c->lock);
>         platform_set_drvdata(pdev, gi2c);
> -       ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
> -                              dev_name(&pdev->dev), gi2c);
> +       ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +                              dev_name(dev), gi2c);
>         if (ret) {
> -               dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
> +               dev_err(dev, "Request_irq failed:%d: err:%d\n",
>                         gi2c->irq, ret);
>                 return ret;
>         }
>         /* Disable the interrupt so that the system can enter low-power mode */
>         disable_irq(gi2c->irq);
>         i2c_set_adapdata(&gi2c->adap, gi2c);
> -       gi2c->adap.dev.parent = &pdev->dev;
> -       gi2c->adap.dev.of_node = pdev->dev.of_node;
> +       gi2c->adap.dev.parent = dev;
> +       gi2c->adap.dev.of_node = dev->of_node;
>         strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>
>         ret = geni_se_resources_on(&gi2c->se);
>         if (ret) {
> -               dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
> +               dev_err(dev, "Error turning on resources %d\n", ret);
>                 return ret;
>         }
>         proto = geni_se_read_proto(&gi2c->se);
>         tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>         if (proto != GENI_SE_I2C) {
> -               dev_err(&pdev->dev, "Invalid proto %d\n", proto);
> +               dev_err(dev, "Invalid proto %d\n", proto);
>                 geni_se_resources_off(&gi2c->se);
>                 return -ENXIO;
>         }
> @@ -581,11 +576,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>                                                         true, true, true);
>         ret = geni_se_resources_off(&gi2c->se);
>         if (ret) {
> -               dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
> +               dev_err(dev, "Error turning off resources %d\n", ret);
>                 return ret;
>         }
>
> -       dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +       dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>
>         gi2c->suspended = 1;
>         pm_runtime_set_suspended(gi2c->se.dev);
> @@ -595,12 +590,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
>
>         ret = i2c_add_adapter(&gi2c->adap);
>         if (ret) {
> -               dev_err(&pdev->dev, "Error adding i2c adapter %d\n", ret);
> +               dev_err(dev, "Error adding i2c adapter %d\n", ret);
>                 pm_runtime_disable(gi2c->se.dev);
>                 return ret;
>         }
>
> -       dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +       dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
>
>         return 0;
>  }
> --
> Sent by a computer, using git, on the internet
>
