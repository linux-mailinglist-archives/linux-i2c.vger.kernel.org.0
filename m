Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C664A9887
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 12:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358457AbiBDLmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 06:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358456AbiBDLmU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 06:42:20 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9072C06173D
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 03:42:20 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so12825680pjj.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+zh5WCRb50CoPz2i6DBEtQTuAWuIq0sIhNKZsB3W76s=;
        b=NdIDYDix+usqwTI0I30W5uAHJFvvyuuOHlTXEUjF3nRTvW/XNoFyMWOb1YQKbZ5Fu4
         DPs8cbd/FsCuQkNkQ7eDoc5hvG2fOPFriY4LgamzWmDHLTSer/Yd0Fb6sLofXKbAJZXc
         YYeQOjBYQ9Q4vVNM/ND8FkQa08XhvGejXliUuKy5YslciaReAJtSg11iN+dbUU3CGXOj
         aZzW68M0ral9vziX71AZ0p37AFUq94r1B00VTiuOcD7wV6B3s7etkDUr1PBmkHeIOlXQ
         YspAIHi6EZbT7XR7q/exymj0spmtP+iPZE6DcD2KJ79fjmrgOQtf0g0P/KiS+8Fux027
         1f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zh5WCRb50CoPz2i6DBEtQTuAWuIq0sIhNKZsB3W76s=;
        b=cQtpGgeNYqlUnCH930aMdK3Ld9VIUttF6AF16reStRH1fWO6FCSridSnlkeruFnt+K
         PmQ+LCb9uNepVCxBAo8fefKWtYzXkDx7pG2Kz9KCRY/Sec0m5ez1cU3dd3pWgEjL4XUS
         fzZ2SQjWmuBQu7FilTCycAgKbRjzuXvhvGuw5rKGPobTrZoQCVkpBHO3c1q4kleKLbSr
         eSOSRTGSHzgFt4EjbQ12Lkj03cZL+7P+CpuZMR+mGX2lnVNjsVE4MN/5nukLGmW22V8e
         M1mYAbt8FFI5zs3adjwfbFSnOXMTypj0lU8YDfyydhor0FmJqyU0bbzk5EujJ6yEFFp4
         mQxw==
X-Gm-Message-State: AOAM533t3ROm8URsuhc9rOS0UB/9hWvV/VHPh5ChQFxaePDu6VykBv+x
        iVISzT2fI+xR47CFicNffuqtgDaJjrAmxqqx6aSS5g==
X-Google-Smtp-Source: ABdhPJyHV6ABWS84FpU545oG3NmT30FoMuQQELrouzY1AF+BJc0BMiEHMO5NiN9l56he3B6KrM+72+zCzAO/CXzRrwI=
X-Received: by 2002:a17:902:714c:: with SMTP id u12mr2535405plm.51.1643974940143;
 Fri, 04 Feb 2022 03:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org> <CAG3jFyuzJmRk47kfd_zVw3g+_eKUQVG6y5hU0z1KfXPEM4quNg@mail.gmail.com>
In-Reply-To: <CAG3jFyuzJmRk47kfd_zVw3g+_eKUQVG6y5hU0z1KfXPEM4quNg@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 4 Feb 2022 12:41:44 +0100
Message-ID: <CAMZdPi9cbH2Xiwr+QOF46pqZEtaZCBbq8Zq-3gUaYDp7MekJSA@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply regulators
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 4 Feb 2022 at 12:03, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
> >
> > The change adds handling of optional vbus regulators in the driver.
> >
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-cci.c | 49 +++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> > index 775945f7b4cd..2fc7f1f2616f 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #define CCI_HW_VERSION                         0x0
> >  #define CCI_RESET_CMD                          0x004
> > @@ -480,6 +481,20 @@ static void cci_disable_clocks(struct cci *cci)
> >  static int __maybe_unused cci_suspend_runtime(struct device *dev)
> >  {
> >         struct cci *cci = dev_get_drvdata(dev);
> > +       struct regulator *bus_regulator;
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < cci->data->num_masters; i++) {
> > +               if (!cci->master[i].cci)
> > +                       continue;
> > +
> > +               bus_regulator = cci->master[i].adap.bus_regulator;
> > +               if (!bus_regulator)
> > +                       continue;
> > +
> > +               if (regulator_is_enabled(bus_regulator) > 0)
>
> Is this check needed? No matter the current status of the regulator,
> we'd like to disable it, and from my reading regulator_disable can be
> called for already disabled regulators.

+1, but why do we even assign this regulator to each adapter, a
simpler solution would be to have the regulator part of the cci
struct, and simply disable/enable it on runtime suspend/resume,
without extra loop/check. I2C core does nothing with
adap.bus_regulator anyway (5a7b95fb993e has been partially reverted).

>
> > +                       regulator_disable(bus_regulator);
> > +       }
> >
> >         cci_disable_clocks(cci);
> >         return 0;
> > @@ -488,12 +503,30 @@ static int __maybe_unused cci_suspend_runtime(struct device *dev)
> >  static int __maybe_unused cci_resume_runtime(struct device *dev)
> >  {
> >         struct cci *cci = dev_get_drvdata(dev);
> > +       struct regulator *bus_regulator;
> > +       unsigned int i;
> >         int ret;
> >
> >         ret = cci_enable_clocks(cci);
> >         if (ret)
> >                 return ret;
> >
> > +       for (i = 0; i < cci->data->num_masters; i++) {
> > +               if (!cci->master[i].cci)
> > +                       continue;
> > +
> > +               bus_regulator = cci->master[i].adap.bus_regulator;
> > +               if (!bus_regulator)
> > +                       continue;
> > +
> > +               if (!regulator_is_enabled(bus_regulator)) {
> > +                       ret = regulator_enable(bus_regulator);
> > +                       if (ret)
> > +                               dev_err(dev, "failed to enable regulator: %d\n",
> > +                                       ret);
> > +               }
> > +       }
> > +
> >         cci_init(cci);
> >         return 0;
> >  }
> > @@ -593,6 +626,7 @@ static int cci_probe(struct platform_device *pdev)
> >         dev_dbg(dev, "CCI HW version = 0x%08x", val);
> >
> >         for_each_available_child_of_node(dev->of_node, child) {
> > +               struct regulator *bus_regulator;
> >                 struct cci_master *master;
> >                 u32 idx;
> >
> > @@ -637,6 +671,21 @@ static int cci_probe(struct platform_device *pdev)
> >                         master->cci = NULL;
> >                         goto error_i2c;
> >                 }
> > +
> > +               /*
> > +                * It might be possible to find an optional vbus supply, but
> > +                * it requires to pass the registration of an I2C adapter
> > +                * device and its association with a bus device tree node.
> > +                */
> > +               bus_regulator = devm_regulator_get_optional(&master->adap.dev,
> > +                                                           "vbus");
> > +               if (IS_ERR(bus_regulator)) {
> > +                       ret = PTR_ERR(bus_regulator);
> > +                       if (ret == -EPROBE_DEFER)
> > +                               goto error_i2c;
> > +                       bus_regulator = NULL;
> > +               }
> > +               master->adap.bus_regulator = bus_regulator;
> >         }
> >
> >         ret = cci_reset(cci);
> > --
> > 2.33.0
> >
>
> With the above nit sorted, feel free to add my r-b.
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
