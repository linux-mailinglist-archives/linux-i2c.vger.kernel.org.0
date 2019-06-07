Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C27C38893
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbfFGLKQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:10:16 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42972 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfFGLKQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:10:16 -0400
Received: by mail-io1-f66.google.com with SMTP id u19so1074481ior.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtT3xvK7Vazpl4o9exivAkvcEkMHtpOwXvVAPT2SJ40=;
        b=jDo5BRjlVR3AVWDSSfo+gKcryeGPi/AmUttwaIMq0VxqJ+qVI2178K607NkM3CeySN
         bBJCIl7N6/so3FXSZPrNsg3COjHe1B1atLZy+JgJHiMd9jSc8S4CwxPUM6KpZZWut1Ki
         xcHnXQyeNRyWHaRgAcrIbDX07S1YcY1LGHUjDdLkg/rEBtcOlHPuiUzuOvE284Cn3XuW
         cuJfglGXmCS+YULoWL89XM76DEtg5rZupYaC6jM/6ElBUMEg2tOGlKPglN2UFzQeSrkg
         DGDDIKwDF2JCsDEdafcgCsWVVNTP3zHe6AU0YMfye1c3ZW0cWJg/BGgUKlW7y9Tbthif
         UZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtT3xvK7Vazpl4o9exivAkvcEkMHtpOwXvVAPT2SJ40=;
        b=HgEE9nez0KlmbQ+m9VkTxfBo6SmTwQ2yN1q1wIEAp65l2gt212v3LuKZxFHh3D+EHe
         jqBX7NtiWdyBRXFPHITIjl6c8EJxRzMkg5T8JmvZdQd6Rsy8E8LGb81PwaOrMon063co
         hnRmFhW7S6ikI+Rd12pjA964DAfr1wa2h67dFCCQ+HllSUW36lcLCp2H1BF/IE/ml1wz
         AKt77iMompZqrSQI4oka6Xc+fFkFy6pThqCx4HoMAITryxdhO0gVpClV5JJK/T+JdjMI
         l0km3SkKOmkb1xtnpe5AchngooM5GdwUtrAK5RlSgc/qSGvcjQaJdmzh4VXHrMbNWIty
         M16Q==
X-Gm-Message-State: APjAAAU6W9tUjzL4RSaUmw6fYxh3PA4kUiGDv9p4v2mJx8IGdOO2to6q
        lzd+4ZHsTU/M7T9YDDnUK7BdHuVD8Bqj+2vrVDhwfQ==
X-Google-Smtp-Source: APXvYqwrUGnknS/zJMuvQI2wfL8thoDfsVGFqzJXzvtaPiQuD0VcSmpnabR9lJl/h/nYmF51UIoE2867Nj/5gi+piZI=
X-Received: by 2002:a05:6602:98:: with SMTP id h24mr304941iob.49.1559905815366;
 Fri, 07 Jun 2019 04:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190607082901.6491-1-lee.jones@linaro.org> <20190607082901.6491-3-lee.jones@linaro.org>
In-Reply-To: <20190607082901.6491-3-lee.jones@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 7 Jun 2019 13:10:04 +0200
Message-ID: <CAKv+Gu-1QhX-9aNhFJauc9NVe6ceQQueE8Kd14031XJ-2yaupA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
>
> When booting MSM based platforms with Device Tree or some ACPI
> implementations, it is possible to provide a list of reserved pins
> via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> However some ACPI tables are not populated with this information,
> thus it has to come from a knowledgable device driver instead.
>
> Here we provide the MSM common driver with additional support to
> parse this informtion and correctly populate the widely used
> 'valid_mask'.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

I'm not sure if this is the correct approach. Presumably, on ACPI
systems, all the pinctl stuff is already set up by the firmware, and
so we shouldn't touch *any* pins unless they have been requested
explicitly. Is there any way we can support this in the current
framework?

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index ee8119879c4c..3ac740b36508 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
>         int ret;
>         unsigned int len, i;
>         unsigned int max_gpios = pctrl->soc->ngpios;
> +       const int *reserved = pctrl->soc->reserved_gpios;
>         u16 *tmp;
>
> +       /* Driver provided reserved list overrides DT and ACPI */
> +       if (reserved) {
> +               bitmap_fill(chip->valid_mask, max_gpios);
> +               for (i = 0; reserved[i] >= 0; i++) {
> +                       if (i >= max_gpios || reserved[i] >= max_gpios) {
> +                               dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
> +                               return -EINVAL;
> +                       }
> +                       clear_bit(reserved[i], chip->valid_mask);
> +               }
> +
> +               return 0;
> +       }
> +
>         /* The number of GPIOs in the ACPI tables */
>         len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
>                                                    0);
> @@ -964,6 +979,9 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
>
>  static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>  {
> +       if (pctrl->soc->reserved_gpios)
> +               return true;
> +
>         return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
>  }
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index c12048e54a6f..23b93ae92269 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -121,6 +121,7 @@ struct msm_pinctrl_soc_data {
>         bool pull_no_keeper;
>         const char *const *tiles;
>         unsigned int ntiles;
> +       const int *reserved_gpios;
>  };
>
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
