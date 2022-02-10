Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A854B11D1
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 16:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241932AbiBJPiA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 10:38:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238726AbiBJPh7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 10:37:59 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C9CFA
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:38:00 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id b35so5181923qkp.6
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOIcJ6wQhY02nLa4jykUVh5HXVg6014x9J8/El/aByw=;
        b=UnZkf5JbRLhoxh2+rUNY0Y7PyxIkqLcEdAF/0BqSbgfUP68ieI6zShxTLjzggvblj0
         Aj2Mdb5FslsJeKFU+0QqDjfP1EkTs1tyV5j8+ei1fKWcm9+IxH4lo89gFqjchrXSt5tt
         ERnE61tF150G7lLUgTQIJQI26MyyKwU7w89Ed0YD7z6WctcOH3BlvyaI7VWVgE9o0a/l
         du51in55C+DMxgsCWe40l/YP0VW9oyOHbOmcGmlUPxSOWGJHu/Nc/M5rGO59GLPxjC4M
         6ciuirA0sWydcYZqHJ8y5dI3Lwy2JPKmkk5TfkHlc8cwzzbBfhNFo3WbpL7f7RJSnGH+
         h6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOIcJ6wQhY02nLa4jykUVh5HXVg6014x9J8/El/aByw=;
        b=tNBDSC+5SKQKbrOFkijaM7U8x7DOvHZbj8NVUMbtoXj7+0ClqGYtJwgUnarBRma30T
         T2nZK9MP16Ed1qMr4u/DTru1e7i+8kneApiL9lUDgUixDJyCc1DiULzRKCdrbt5yT23D
         U1sLu2YbOApWWrKSJJm6nFm7VweVsUBqKwtp2ty8+slsl2axzL+0XkChgsEB6G7Wxdwc
         VB+VVb9lK81vfRGvoKAkKkHr4mjRuHraaP3FvZj20kmkTG6AFt2OThl2+xcSpzBj1KZq
         ENV0xt9hvnq4sckOL6FX1XSnBeyvT+8CnlsvpSCDuCt6rD6HTLjIiiNPDwCpP42OXU/q
         2E9A==
X-Gm-Message-State: AOAM533b57/6YnQJuwK70DxxRaQ1EBZ/d65eVtlvoCmqU+5RmKFmHRMx
        ZDJThc48lG1/Zb2uVs86uYgM2CF+3KmJeKVy/kcfzQ==
X-Google-Smtp-Source: ABdhPJxgzM9OcdSJ67Pr7qWlAMGObbohX1R5smPQ9jC8pkCvNMgwYm8hy0eWMluvW3d8pXc4PaefPMVtp4VmedLAlW4=
X-Received: by 2002:ae9:eb87:: with SMTP id b129mr4223200qkg.203.1644507479554;
 Thu, 10 Feb 2022 07:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org> <CAG3jFyuzJmRk47kfd_zVw3g+_eKUQVG6y5hU0z1KfXPEM4quNg@mail.gmail.com>
 <CAMZdPi9cbH2Xiwr+QOF46pqZEtaZCBbq8Zq-3gUaYDp7MekJSA@mail.gmail.com>
In-Reply-To: <CAMZdPi9cbH2Xiwr+QOF46pqZEtaZCBbq8Zq-3gUaYDp7MekJSA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Feb 2022 18:37:48 +0300
Message-ID: <CAA8EJpri7d+RPSaUKG+g3HUbiNawCVnnNtW-xA8ON+Obm5x5yw@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply regulators
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 4 Feb 2022 at 14:42, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On Fri, 4 Feb 2022 at 12:03, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> > >
> > > The change adds handling of optional vbus regulators in the driver.
> > >
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > >  drivers/i2c/busses/i2c-qcom-cci.c | 49 +++++++++++++++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> > > index 775945f7b4cd..2fc7f1f2616f 100644
> > > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >
> > >  #define CCI_HW_VERSION                         0x0
> > >  #define CCI_RESET_CMD                          0x004
> > > @@ -480,6 +481,20 @@ static void cci_disable_clocks(struct cci *cci)
> > >  static int __maybe_unused cci_suspend_runtime(struct device *dev)
> > >  {
> > >         struct cci *cci = dev_get_drvdata(dev);
> > > +       struct regulator *bus_regulator;
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < cci->data->num_masters; i++) {
> > > +               if (!cci->master[i].cci)
> > > +                       continue;
> > > +
> > > +               bus_regulator = cci->master[i].adap.bus_regulator;
> > > +               if (!bus_regulator)
> > > +                       continue;
> > > +
> > > +               if (regulator_is_enabled(bus_regulator) > 0)
> >
> > Is this check needed? No matter the current status of the regulator,
> > we'd like to disable it, and from my reading regulator_disable can be
> > called for already disabled regulators.
>
> +1, but why do we even assign this regulator to each adapter, a
> simpler solution would be to have the regulator part of the cci
> struct, and simply disable/enable it on runtime suspend/resume,
> without extra loop/check. I2C core does nothing with
> adap.bus_regulator anyway (5a7b95fb993e has been partially reverted).

I like the idea of having the regulator per bus (rather than per
controller). However instead of pushing handling these changes to the
CCI controller, I'd suggest to move this code to the i2c-core itself.
The original patch tried to do the regulator control per client.
Instead it should be done per adapter. I think this should also solve
the reported issue for AMD controllers (since that i2c adapters won't
have vbus-supply).

>
> >
> > > +                       regulator_disable(bus_regulator);
> > > +       }
> > >
> > >         cci_disable_clocks(cci);
> > >         return 0;
> > > @@ -488,12 +503,30 @@ static int __maybe_unused cci_suspend_runtime(struct device *dev)
> > >  static int __maybe_unused cci_resume_runtime(struct device *dev)
> > >  {
> > >         struct cci *cci = dev_get_drvdata(dev);
> > > +       struct regulator *bus_regulator;
> > > +       unsigned int i;
> > >         int ret;
> > >
> > >         ret = cci_enable_clocks(cci);
> > >         if (ret)
> > >                 return ret;
> > >
> > > +       for (i = 0; i < cci->data->num_masters; i++) {
> > > +               if (!cci->master[i].cci)
> > > +                       continue;
> > > +
> > > +               bus_regulator = cci->master[i].adap.bus_regulator;
> > > +               if (!bus_regulator)
> > > +                       continue;
> > > +
> > > +               if (!regulator_is_enabled(bus_regulator)) {
> > > +                       ret = regulator_enable(bus_regulator);
> > > +                       if (ret)
> > > +                               dev_err(dev, "failed to enable regulator: %d\n",
> > > +                                       ret);
> > > +               }
> > > +       }
> > > +
> > >         cci_init(cci);
> > >         return 0;
> > >  }
> > > @@ -593,6 +626,7 @@ static int cci_probe(struct platform_device *pdev)
> > >         dev_dbg(dev, "CCI HW version = 0x%08x", val);
> > >
> > >         for_each_available_child_of_node(dev->of_node, child) {
> > > +               struct regulator *bus_regulator;
> > >                 struct cci_master *master;
> > >                 u32 idx;
> > >
> > > @@ -637,6 +671,21 @@ static int cci_probe(struct platform_device *pdev)
> > >                         master->cci = NULL;
> > >                         goto error_i2c;
> > >                 }
> > > +
> > > +               /*
> > > +                * It might be possible to find an optional vbus supply, but
> > > +                * it requires to pass the registration of an I2C adapter
> > > +                * device and its association with a bus device tree node.
> > > +                */
> > > +               bus_regulator = devm_regulator_get_optional(&master->adap.dev,
> > > +                                                           "vbus");
> > > +               if (IS_ERR(bus_regulator)) {
> > > +                       ret = PTR_ERR(bus_regulator);
> > > +                       if (ret == -EPROBE_DEFER)
> > > +                               goto error_i2c;
> > > +                       bus_regulator = NULL;
> > > +               }
> > > +               master->adap.bus_regulator = bus_regulator;
> > >         }
> > >
> > >         ret = cci_reset(cci);
> > > --
> > > 2.33.0
> > >
> >
> > With the above nit sorted, feel free to add my r-b.
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>



-- 
With best wishes
Dmitry
