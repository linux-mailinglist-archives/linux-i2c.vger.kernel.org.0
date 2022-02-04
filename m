Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999514A9EF8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 19:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377521AbiBDS2N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 13:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377511AbiBDS2N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 13:28:13 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A52C06173D
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 10:28:13 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so5728324otr.11
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 10:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q5whXe766eN2dvW16rLxruwXYwjdklRHQUViQq7FncE=;
        b=Nrf4iVcvBEypy42qoFWktCyEflKRkG6I+7kawLKrHNOxu7ckKBrB1rN+0Ig29AF7DF
         W3nU+PVybBQwHmKfwcVY5o5vp9S+w55dUlsGpfNpwpltxSjS5QmTTPYkJZsgKgFai0Oy
         1c/Pn6Gt4QfKW2vgCjPI1WPYOBSv1jfPhqTaAUXSDFsLewAnD+KYWYzZX2ciKwvfRwNf
         CVqI1yF7GsfT9ALYgX42agd95ZoIbV3FjktfYj5GnaWjGXkqeIl4TAK24oaRxMdaPOvF
         YvTXhzPcBDnfg5RUhzToWxlw2ngcl+uhaKFd/k00Bw0342TpiXZoHcAhrUOeCp176zkp
         I+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q5whXe766eN2dvW16rLxruwXYwjdklRHQUViQq7FncE=;
        b=ZkGCEspCIo96Tbw/harghdtvleH45hO1bHNQeeEd/HV0/90rOno6kA5+fYFo5vtIx8
         CK46VrYgk66I2//S83UaEe1V6S9+9GI+I0yXwcKan50srYSLggpXX1d6ZlecP6Dt7E8i
         woj+dZzmApgVUE9D8oJiIFVv3oYvmtqYarR2v+9i6qCR8hSiRBfH2t56AqmCZfUeYhyf
         PEsmGqya45tk8cOtGtNBnUapjrFYEox7+rQ/YhZY8rn7MB8VbYM0dZlvh53yeVgY09H4
         h4NdStEqvV9o2WmWKfg45i1BbyboaJWhyonN6sczJLkRm3v6xCxqfo7zZfzBKBVvFNcc
         qx3A==
X-Gm-Message-State: AOAM530NnaQL1bu4uVq6ZRbyKSvGzO1K8fs8mNTN9vhyta2CFojT3Q8o
        no9g9sM086M6F/nQYOoKW62JYg==
X-Google-Smtp-Source: ABdhPJxOQay7QMlbL1ay9D393pLxHfzPSZkHM3yzrPJKrxnvwpIYQpjdJYw9MKO6b/Cw2p4Uy4nRVg==
X-Received: by 2002:a05:6830:2814:: with SMTP id w20mr110989otu.295.1643999292616;
        Fri, 04 Feb 2022 10:28:12 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id q4sm1015320otk.39.2022.02.04.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:28:12 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:28:28 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply
 regulators
Message-ID: <Yf1wTLBih5i88zFX@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
 <CAG3jFyuzJmRk47kfd_zVw3g+_eKUQVG6y5hU0z1KfXPEM4quNg@mail.gmail.com>
 <CAMZdPi9cbH2Xiwr+QOF46pqZEtaZCBbq8Zq-3gUaYDp7MekJSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9cbH2Xiwr+QOF46pqZEtaZCBbq8Zq-3gUaYDp7MekJSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 04 Feb 03:41 PST 2022, Loic Poulain wrote:

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
> without extra loop/check.

But that implies that you always will have the same io-supply for your
two busses. Something that seems likely but I don't see that it's a
requirement.

Although as proposed "vbus" is acquired from the cci node and not the
individual bus anyways...

> I2C core does nothing with
> adap.bus_regulator anyway (5a7b95fb993e has been partially reverted).
> 

Thanks for the pointer, that looks like a much better and generic
solution. In particular if we specify the regulator per bus.

Regards,
Bjorn

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
