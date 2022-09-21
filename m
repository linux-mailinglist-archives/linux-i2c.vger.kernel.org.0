Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFC35C019E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiIUPa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 11:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiIUPad (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 11:30:33 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259C39AFFA
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:27:22 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id c24so6037603plo.3
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KLCmAE9UlNDGgLGs2ArJ00VmIdhhVt7eh934lDS0138=;
        b=JURosBZkyeDvy/vyZPMqlVgB6IuAkyD75OrRJfNUt8s3w3vxLN7VamcPkqlyzdXLxr
         6swKXk3vZvHZYdWG8NrSs5fqQ4zSAGVnpshII0vyAtAUYXty40xxoz50U7xZkAXpCBnl
         B3sxf5HQVWZvvDPtd3cWBMqGFvqnM1X5cb4es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KLCmAE9UlNDGgLGs2ArJ00VmIdhhVt7eh934lDS0138=;
        b=VLDQba0mjfn5L9VJVFEOONK8XtRwzEzjmd6O6PbnooPOmKqnlDxetw7wxGzXoGyyih
         XUabFfklQLhcykOhnkIetuZu4KMurbxvSiDKL00LqVvrrb0N0EsOMS4j1T+HgcgcWrHQ
         3FjiDeVRkhaK7EtfcNdINndQYgxZgYDC9bY/5/h1KGeErxN0gUZN9eVt0KqE6bDoyBmC
         Ho8CCUC25t9Dx7qYhxAjSy2VR6hMfx56LwPp5kAz6svznPkegPgdhbdcmmSQj7BQfDIH
         3Q5WfdOlQE6gr2a7O4TvjO417/I54eTuRc3Ea6ssyToevn3d50DsnrVGz1MEOJ1jceCg
         nFiA==
X-Gm-Message-State: ACrzQf0qzna4vfC70JBOwFuFe/zalAWc9Ewi++kp0VFv82z4TXD0P10+
        j9aymxVvr3yGno3FOqu7qu/GHubUMf6Q/g==
X-Google-Smtp-Source: AMsMyM6hxAWVH0kosJdcTrm1Pnk37m2yT9W6AuT4w1ro6YguJIZu4O+/LExzdXDkhubwOeerumB5yA==
X-Received: by 2002:a17:90b:4b43:b0:202:e09c:664d with SMTP id mi3-20020a17090b4b4300b00202e09c664dmr10010376pjb.120.1663774021678;
        Wed, 21 Sep 2022 08:27:01 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id a202-20020a621ad3000000b005380c555ba1sm2347526pfa.13.2022.09.21.08.27.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:27:01 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 78so6248012pgb.13
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:27:01 -0700 (PDT)
X-Received: by 2002:a92:c569:0:b0:2f5:927d:b61a with SMTP id
 b9-20020a92c569000000b002f5927db61amr7672947ilj.151.1663773525104; Wed, 21
 Sep 2022 08:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220919155916.1044219-1-rrangel@chromium.org>
 <20220919095504.v4.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <Yymyzcfp7gqdTYam@smile.fi.intel.com>
In-Reply-To: <Yymyzcfp7gqdTYam@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 21 Sep 2022 09:18:34 -0600
X-Gmail-Original-Message-ID: <CAHQZ30C3Wsqbwnpn+9tP2DCDdtMGOqOZ8di77agDcLM7idWxuQ@mail.gmail.com>
Message-ID: <CAHQZ30C3Wsqbwnpn+9tP2DCDdtMGOqOZ8di77agDcLM7idWxuQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Tim Van Patten <timvp@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 20, 2022 at 6:32 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 19, 2022 at 09:59:09AM -0600, Raul E Rangel wrote:
> > Device tree already has a mechanism to pass the wake_irq. It does this
> > by looking for the wakeup-source property and setting the
> > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > ACPI interrupt wake flag to determine if the interrupt can be used to
> > wake the system. Previously the i2c drivers had to make assumptions and
> > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > If there is a device with an Active Low interrupt and the device gets
> > powered off while suspending, the interrupt line will go low since it's
> > no longer powered and wakes the system. For this reason we should
> > respect the board designers wishes and honor the wake bit defined on the
> > interrupt.
>
> ...
>
> > +     if (irq_ctx.irq == -ENOENT)
> > +             irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0, &irq_ctx.wake_capable);
>
> I just realized, that there is an inconsistency on how we fill the wake_capable
> parameter. In some cases we check for IRQ for an error condition (IRQ not found)
> and in some the wake_capable still be filled.
>
> Here the best approach I believe is to add
>
>         if (irq_ctx.irq < 0)
>                 return irq_ctx.irq;
>
> I.o.w. we apply the rule "do not fill the output parameters when it's known
> to be an error condition".
>
> > +     if (wake_capable)
> > +             *wake_capable = irq_ctx.wake_capable;
>
> > +     return irq_ctx.irq;
>

I applied the following:
diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index ba64e505183595..1618f5619d5ed9 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -220,7 +220,7 @@ int i2c_acpi_get_irq(struct i2c_client *client,
bool *wake_capable)
        if (irq_ctx.irq == -ENOENT)
                irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0,
&irq_ctx.wake_capable);

-       if (wake_capable)
+       if (irq_ctx.irq > 0 && wake_capable)
                *wake_capable = irq_ctx.wake_capable;

        return irq_ctx.irq;

Thanks!
