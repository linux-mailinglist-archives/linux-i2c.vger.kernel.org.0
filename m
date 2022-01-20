Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CC5495100
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376465AbiATPHA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 10:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376424AbiATPG5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 10:06:57 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5A5C06161C;
        Thu, 20 Jan 2022 07:06:56 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id n10so14327212edv.2;
        Thu, 20 Jan 2022 07:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqnbvcF63+uApi2EhOn9/7NQ0bQFc9rvPdUrWfP50Zw=;
        b=cFCSlazVlXbqrLHOgpSmH/470GORmHhtDM7s9dozAE7T5eXQlK0EWoy/iJmzSv3Bv0
         DgXkVpfi6+rgyqGze/10CTzRBwSvkOhCWMC51qRo5c0gtJmOHgroNZISLf5u/nF+EF2f
         IPTRm2CNo5/CAX1aqDQVKt7OVT0NYoG7mclTL1Neg7VMztliMYXpggIHibr/+kHruoLB
         kxT2uwgT42qs5bXHE0h131qyKV/WFlSKHMia7MsOqavgHtSlPEVS1MSutDZIXIf7EFY4
         L4Lh0Ibf2BiJ/UvLd4xuBO55V1m3l7BLshJiceBSIqZZUxAxvFpnBvEA293LIZ8Yotm4
         XAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqnbvcF63+uApi2EhOn9/7NQ0bQFc9rvPdUrWfP50Zw=;
        b=00f7MQu/Kge9Y813HYUZP+BprEwW2fhdf9YF4Fi3NNoyyrGlIgDnTKaB7T+gxk5HDw
         eavvtV1egPS8PqJ3h+s34GvkpkgHUJM0Ye60YPUfnP9oSl6VjxWHx6X8sjWl6HJuRXQ9
         62mxfKg9BTbv3ZsEA6zt7i8tK23hhi17uvD8XXQfOtNENEbi8ILU0GcVZ1brfDCMUm4B
         Z1en0timt42FDz3vN6O7C8ZMWxO1zbLJR2PRwmBSyw90G78QLvVAZaghu/V/sVBkbZiz
         ttpOV1yGit+6Zj5YFtXohqRllkeXLpmaHbMu7tJzewmpddvC+fMOOpqeHFYeZ/mKpzMG
         6+UQ==
X-Gm-Message-State: AOAM533KQlfxxGyGnAq3W1hU7FENqVWijrzmx/VA24pBPs9Fkw0OYKt8
        sfDf97bjZ1ua4DWm179iNhUPz6vBMcYBhAlCYfs=
X-Google-Smtp-Source: ABdhPJzb5cRpzEAwdTUzxGEj33YV4a0nbkAyA6u/Tf8nCrvMjsqx1WYbld1uzPAX3RZeYJfj0P4RKiEwSPaCO7ZLdvA=
X-Received: by 2002:a05:6402:34cb:: with SMTP id w11mr35621907edc.158.1642691215196;
 Thu, 20 Jan 2022 07:06:55 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com> <1642686255-25951-4-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642686255-25951-4-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 17:05:13 +0200
Message-ID: <CAHp75VcBPn=2EBNfwfs-V81PzT5vrYk5NNqpXnUeHeqcyP1sTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: smbus: Use device_*() functions instead of of_*()
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 3:45 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Change of_*() functions to device_*() for firmware agnostic usage.
> This allows to have the smbus_alert interrupt without any changes
> in the controller drivers using the ACPI table.

This patch LGTM.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

The 0 check needs a separate discussion and fixing, which is out of scope here.

> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/i2c-core-base.c  |  2 +-
>  drivers/i2c/i2c-core-smbus.c | 10 +++++-----
>  drivers/i2c/i2c-smbus.c      |  2 +-
>  include/linux/i2c-smbus.h    |  6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2c59dd7..32a4526 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1479,7 +1479,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>                 goto out_list;
>         }
>
> -       res = of_i2c_setup_smbus_alert(adap);
> +       res = i2c_setup_smbus_alert(adap);
>         if (res)
>                 goto out_reg;
>
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index e5b2d14..4c24c84 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -701,13 +701,13 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_smbus_alert_device);
>
> -#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
> -int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
> +#if IS_ENABLED(CONFIG_I2C_SMBUS)
> +int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
>  {
>         int irq;
>
> -       irq = of_property_match_string(adapter->dev.of_node, "interrupt-names",
> -                                      "smbus_alert");
> +       irq = device_property_match_string(adapter->dev.parent, "interrupt-names",
> +                                          "smbus_alert");
>         if (irq == -EINVAL || irq == -ENODATA)
>                 return 0;
>         else if (irq < 0)
> @@ -715,5 +715,5 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
>
>         return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
>  }
> -EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
> +EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
>  #endif
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index d3d06e3..fdd6d97 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -128,7 +128,7 @@ static int smbalert_probe(struct i2c_client *ara,
>         if (setup) {
>                 irq = setup->irq;
>         } else {
> -               irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
> +               irq = device_irq_get_byname(adapter->dev.parent, "smbus_alert");
>                 if (irq <= 0)
>                         return irq;
>         }
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index 1ef4218..95cf902 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -30,10 +30,10 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
>                                               struct i2c_smbus_alert_setup *setup);
>  int i2c_handle_smbus_alert(struct i2c_client *ara);
>
> -#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
> -int of_i2c_setup_smbus_alert(struct i2c_adapter *adap);
> +#if IS_ENABLED(CONFIG_I2C_SMBUS)
> +int i2c_setup_smbus_alert(struct i2c_adapter *adap);
>  #else
> -static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
> +static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
>  {
>         return 0;
>  }
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
