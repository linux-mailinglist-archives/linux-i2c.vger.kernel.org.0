Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7789A8FC56
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 09:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfHPHc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 03:32:58 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39258 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfHPHc6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 03:32:58 -0400
Received: by mail-oi1-f193.google.com with SMTP id 16so4173748oiq.6;
        Fri, 16 Aug 2019 00:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMjNDFoTyC/WmTTL8SMem1efnk9isGv2HzTBMC3OaDU=;
        b=VgEFn3Lf4+tJ5bbPjjrpw6dqL3yTQrl85bHpDr4BnfJFmvPHH1/8A40b66xGJkxPDE
         S1Uhp83gbPsmFtCt9JCb0z3XUKClE8AvH+1Yg3p9VyyG/4xHB/mGdEh17Iewtv0Ewrg3
         T36SG3Gxn+A1TfIN7kCx8NdLvPueu5UYcVZoa/2ljMrzuUhpx/icpHN45XudXIYfdpuV
         QHak7GLdjfxcxKE/NlUtOJogTdme57rU3z6JNPArk1LZLUykp91qZUqtpcnjVMTEroN3
         MPikaGlWY0RAnOnO/Y57QWz5YDVsLoLL1i9KTW7S2IgN9VJCnXikaBWO8bHmxyyWpg2B
         j2xA==
X-Gm-Message-State: APjAAAU3pwF3FcHv9yHjBBjVK1SiCiKxN07L1dno2Z9t7rUqb+Duonvn
        fEwtC7ezYXXYpJacnottsDtT44kuUGoaEo7nx3a63m9N
X-Google-Smtp-Source: APXvYqzWNfvTWG9fpc413R/pCWadsylPqkNbdupcwfsE0h3lCFrO/2jZVW5KOMPqSw0qJrHen5M2M68ksj0bajITnUg=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr3877069oia.153.1565940777213;
 Fri, 16 Aug 2019 00:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190815125802.16500-1-max@enpas.org> <20190815125802.16500-2-max@enpas.org>
 <6920f2da-3139-6fc8-b02c-3678cc17912e@enpas.org> <20190815224341.GA12420@roeck-us.net>
In-Reply-To: <20190815224341.GA12420@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 09:32:46 +0200
Message-ID: <CAMuHMdUYpkkmhxwTu7MGm6NiMfYs9SqjLKRPazuSEjRgpRavyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon/ltc2990: Generalise DT to fwnode support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Max Staudt <max@enpas.org>, Linux I2C <linux-i2c@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 16, 2019 at 1:50 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Aug 16, 2019 at 12:19:42AM +0200, Max Staudt wrote:
> > On 08/15/2019 02:58 PM, Max Staudt wrote:
> > > -   if (of_node) {
> > > -           ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> > > -                                            data->mode, 2);
> > > +   if (i2c->dev.of_node || i2c->dev.fwnode) {

I was just going to comment on this check...

> > One more idea, would it be better here to do the following?
> >
> >       if (device_property_present(i2c->dev, "lltc,meas-mode")) {
> >               ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> >                                                data->mode, 2);
> >       }
> >
> > I'm happy to prepare a patch if you wish to have this in - just let me know whether it should be on top of the last one, or instead of it.
>
> That would be semantically different. The property is currently mandatory.
> The above code would make it optional. This might work:
>
>         if (dev_fwnode(&i2c->dev)) {
>                 ret = device_property_read_u32_array(...);
>                 ...
>         }

Much better, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
