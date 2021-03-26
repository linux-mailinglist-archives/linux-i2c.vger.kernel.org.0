Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48B734A5AF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Mar 2021 11:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCZKfd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Mar 2021 06:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhCZKfV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Mar 2021 06:35:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550A3C0613B1
        for <linux-i2c@vger.kernel.org>; Fri, 26 Mar 2021 03:35:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b83so6917503lfd.11
        for <linux-i2c@vger.kernel.org>; Fri, 26 Mar 2021 03:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4iiVAZ5wP8F1gMdbkc2yTj4+SB47g4kbs/gxBR2nNI=;
        b=cXPt7TC6AP+FPpXRAylbkVHBX8VrtuqmQCLCjjoUppbn1AGIdfzL9Blx2a8T9k/0MH
         AzaXq95xgxSO63ZF0fqeHislkgrfFBU0FaZrIeC3Bbb1UvBbs/oVWdzaGsTgB46CY+6A
         RwrooQnWch01lgWQaP6ml52uOTvF90XVcA6nXXMu7onkJYjJ6NLpWUrvep6seY17D9vy
         kFo8XXzSc4zK1vMnvZvjA6ofeU013BHrAAMHXUc3QKmEmwQbZaC0wivt8PWXREU3aV/u
         CuYRzAUsFbKT99+W0+U3eKNDQIAVAJ5IvFFU+f0siHX5Qd1Xfxt8TEc0yRhjlo4ckzqy
         Iv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4iiVAZ5wP8F1gMdbkc2yTj4+SB47g4kbs/gxBR2nNI=;
        b=qTGjf2NmYf59Q+/edyMwRBMLdtfV88rZNWW/U7W1VKUiUz4N1GMHCoZ9wX9Z05s2u8
         nYJL78Ft4hoMtG/GqrWZTQMfeIGcJrK8GCZj7Ye25eJfqG6pEdQR4RISr/Kw7glLQUbg
         Da1Y5QwQtOMiG2094UDH6VYESGsFJ7N6YPfpvCCSyQTyOjri+5V7hiEFhKoZTGqG9Pbp
         FX8rE5SyHOufm3eS6FzrbXvxMwrF7BiHTj+Z/YRt3J6KqI1+RyBWDTr4pRjtqKamFnsN
         7gOIyi+eEiLPVILgka9rV69bQm1NyzkSB8UOsQdHcS+OcPdSKyJ/zuUIXxlPKVqzeAm6
         5CLA==
X-Gm-Message-State: AOAM5325Va1wAShnSh8WAxXDrQ274/fSU7dlYOqnwITc1iaR+ZGGxH3q
        /Msl1iU0UWWzAt4XxkKcKbQFYtK+0xplECcwqzNEyA==
X-Google-Smtp-Source: ABdhPJxes2GHS2I259EZkK8DNmpEKttkMA6NAtpRq5kcLuizqeY3sCSZdNZGpJ74F2KhU/5URWiN7Czzl9p4sZyx810=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr7962856lfa.238.1616754919658;
 Fri, 26 Mar 2021 03:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210325151248.1066643-1-daniel@qtec.com> <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
In-Reply-To: <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Fri, 26 Mar 2021 11:35:08 +0100
Message-ID: <CAH1Ww+Qs13GBC02PCgW60No2Z+vNsV14yRe7S4rtnnMLqH7BYQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: Add base addr info
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, 25 Mar 2021 at 16:43, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 25, 2021 at 04:12:48PM +0100, Daniel Gomez wrote:
> > Add i2c hw base address in the adapter name and when the device is
> > probed.
>
> Why?
> We have /proc/iomem for that.
The initial reason was because I wasn't aware of /proc/iomem therefore
I didn't have a way to match the physical address to the i2c adapter.
So, thanks for pointing that out as now I'm able to match the physical
address listed in iomem with the sysfs i2c bus.
>
> Sorry, I don't see value of this change.
> Some comments  below just to let you know about style:ish issues.
Thanks for the comments. Although there are no reasons to apply this
patch I have some doubts perhaps they will help me next time.
>
> ...
>
> >       snprintf(adap->name, sizeof(adap->name),
> > -              "Synopsys DesignWare I2C adapter");
> > +              "Synopsys DesignWare I2C adapter at 0x%llx", dev->base_addr);
>
> It actually should be resource_size_t and corresponding specifier, i.e. %pa to
> print it. Moreover, we have %pR (and %pr) specifiers for struct resource.
I understand this but I had some doubts when I declared the variable.
I took this as reference:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-tegra.c?h=v5.12-rc4#n268
Should it be then defined as resource_size_t instead?

Out of the i2c subsystem, I also found several examples. For example this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/adc/at91-sama5d2_adc.c?h=v5.12-rc4#n364
But I understand this could be out of the scope.

Some others, even assign the the start to the dma_addr_t which could
vary depending on CONFIG_ARCH_DMA_ADDR_T_64BIT
but it seems equivalent to the phys_addr_t definition.


>
> ...
>
> > +     dev_info(&pdev->dev, "%s\n", adap->name);
>
> Unneeded noise.
Also this might be out of the scope again but I added because in tty
they were printing that information:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/serial_core.c?h=v5.12-rc4#n2336

Anyway, thanks again Andy for the review. Really appreciate it! :)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
