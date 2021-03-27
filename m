Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D8534B8D1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Mar 2021 19:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhC0SQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Mar 2021 14:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhC0SPm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Mar 2021 14:15:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B89C0613B2
        for <linux-i2c@vger.kernel.org>; Sat, 27 Mar 2021 11:15:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so12538610lfa.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Mar 2021 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=evJX19dU5Mx28QHYYEKviXtnrg34Fwplbft8/yObPw8=;
        b=e8YfHM+0IV1N1893t1dVp4xho68IA8dniYm/VAczIATwLcvj9qWC5J66r+fEpHSjba
         B/T6BlMWLi8vehfIffIK0ZxAguI97MkYDKXn0hjrgeDgaKfXEVrpCl3HMwunszABxne+
         RBOOgc3+L3VqB8Tlzx0eYjONRzV1ierftICPAjxNeBdojpYUiYs2Bo3ZksPAub48Qdtz
         jkOqPuRaaLi5Nl/O3aEeRJS8UWVSMY0qo0l0UubWHP9fZJApBCv7KqinI9wQaliz2UL2
         iXrvoXzxX/wbvhTYRyChan7U1NGEg5kOAZon0g+ZeHxxyvBjCK9VJ3rDOCVQhkbGNYTu
         yv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evJX19dU5Mx28QHYYEKviXtnrg34Fwplbft8/yObPw8=;
        b=J6kUnXYDutYpmNvRdKDzBoNicm/T2KYowDzE2aIx96v8G9tNnaDyWC5hTVChshTvcn
         aRaovOdSkcs96yd8sFR3QnN0DuaZYaGJObUhX1q6sXp0HzHg2R9CdTSQPeIk5IRpzZyj
         f/LWmX1JfRHdW7hOKge4ZxWCY/WkQMm0dEi4tidaIXSjOSiSc3h6gwZFBhEIfo4Dzx3u
         dsN1gfOLKJajGuSef7WScuJranIwJlfd+GyKEPxTKuQVTFfP62vZhSb7JW37abczaXkh
         5FuWBgOVP3lC/vkkQ4x8/4nN5lEfOetepPr/d4SsEc0PHoA5uNgUlf5Wh+rmJVledRlL
         2VtA==
X-Gm-Message-State: AOAM533f0XgX5jNseABAnDmZQ+MIOZa0cWWbvJUnfKM/ZdeQETf3QXb5
        GbjPw5wYwIFESlxrsx++x2DLWeCnMe+/xbtUDBPGXLh/V7Qg9w==
X-Google-Smtp-Source: ABdhPJwik9U0fZNB4evJY7XACfuyzIlTF7MQrg3C3jKuCpiz/EttjmGK2aVv+KB4mSRfPEN8e2/XaJ/fNdGHU0k0ino=
X-Received: by 2002:a05:6512:70c:: with SMTP id b12mr4189548lfs.621.1616868939995;
 Sat, 27 Mar 2021 11:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210325151248.1066643-1-daniel@qtec.com> <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
 <CAH1Ww+Qs13GBC02PCgW60No2Z+vNsV14yRe7S4rtnnMLqH7BYQ@mail.gmail.com> <YF3TUhGEjrQyG5UU@smile.fi.intel.com>
In-Reply-To: <YF3TUhGEjrQyG5UU@smile.fi.intel.com>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Sat, 27 Mar 2021 19:15:29 +0100
Message-ID: <CAH1Ww+Q8-YD_jc5Pkk3PG4M5vCiisnbpmd2zx0GQsaa_=si0ig@mail.gmail.com>
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

On Fri, 26 Mar 2021 at 13:28, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 26, 2021 at 11:35:08AM +0100, Daniel Gomez wrote:
> > On Thu, 25 Mar 2021 at 16:43, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 25, 2021 at 04:12:48PM +0100, Daniel Gomez wrote:
>
> ...
>
> > > > Add i2c hw base address in the adapter name and when the device is
> > > > probed.
> > >
> > > Why?
> > > We have /proc/iomem for that.
> > The initial reason was because I wasn't aware of /proc/iomem therefore
> > I didn't have a way to match the physical address to the i2c adapter.
> > So, thanks for pointing that out as now I'm able to match the physical
> > address listed in iomem with the sysfs i2c bus.
>
> You are welcome!
>
> ...
>
> > > >       snprintf(adap->name, sizeof(adap->name),
> > > > -              "Synopsys DesignWare I2C adapter");
> > > > +              "Synopsys DesignWare I2C adapter at 0x%llx", dev->base_addr);
> > >
> > > It actually should be resource_size_t and corresponding specifier, i.e. %pa to
> > > print it. Moreover, we have %pR (and %pr) specifiers for struct resource.
> > I understand this but I had some doubts when I declared the variable.
> > I took this as reference:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-tegra.c?h=v5.12-rc4#n268
> > Should it be then defined as resource_size_t instead?
>
> It's a good question. On one hand we know that resource_size_t is a simple
> redefinition of phys_addr_t, but it might be changed in the future. OTOH,
> struct resource has types of resource_size_t. In any case it's a type that is
> platform dependent (like long, size_t). Hence, the special specifier is needed.

This 'issue' occurs in other subsystems like iio but I can see the
patches are quite old in comparison with the i2c-tegra one.
Also, the same happens when they print the variable (wrong specifier).

>
> > Out of the i2c subsystem, I also found several examples. For example this:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/adc/at91-sama5d2_adc.c?h=v5.12-rc4#n364
> > But I understand this could be out of the scope.
>
> Not all examples in the kernel are good examples (many of them is a cargo-cult
> and / or outdated). Take them with grain of salt.
>
Yes, you are right.

> But common rule is to check the log of the interesting subsystem (`git log --
> drivers/<subsystem>/`) in order to find the most recent drivers or modules
> added. There you very likely will find more or less modern standards and APIs
> you might reuse in your code.
>
> > Some others, even assign the the start to the dma_addr_t which could
> > vary depending on CONFIG_ARCH_DMA_ADDR_T_64BIT
> > but it seems equivalent to the phys_addr_t definition.
>
> There is a document that describes all possible extensions we have for %p. You
> might be curious to read more there.

https://www.kernel.org/doc/html/latest/core-api/printk-formats.html?highlight=physical%20addresses%20types#how-to-get-printk-format-specifiers-right
>
> ...
>
> > > > +     dev_info(&pdev->dev, "%s\n", adap->name);
> > >
> > > Unneeded noise.
> > Also this might be out of the scope again but I added because in tty
> > they were printing that information:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/serial_core.c?h=v5.12-rc4#n2336
>
> TTY is different. TTY often related to a console and it's very important to
> know some information as soon as possible (don't forget also hardware
> debuggers, e.g. Lauterbach, which able to show kernel message ring buffer).
> As you may know console is the first common target during new platform
> bring-up.

That's right, completely different topic, I used Lauterbach in the
past and the kernel initcalls with the tty physical address and I
understand your point.

>
> --
> With Best Regards,
> Andy Shevchenko

Thank you Andy for all the comments and hints! :)

Regards,
Daniel Gomez
>
>
