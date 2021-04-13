Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D7A35E1C7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344179AbhDMOpG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:45:06 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:41733 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344609AbhDMOpE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 10:45:04 -0400
Received: by mail-vs1-f46.google.com with SMTP id d6so2387981vsm.8;
        Tue, 13 Apr 2021 07:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qd2Cz9Wb7b4lwNE2TvDDaxnExO2muUrxaDPRQ6PGCSo=;
        b=YAyZKa2Z1GmCyHZwvOHo8eNMFtg5CKx1B0zetbkQz/WB+PjAeBXorB03dZT3JSFgmw
         Ra2RaqeOq57Ao/t3kqIc4QJ8M07thHLPSLXEjqR0btAwH3VSSPq4RnfPGCCMbKfKrfOs
         tUCAWZSLbMy8bzeScbCngw+a7p8oqjTk89CeTrQfKBvMwKjY84xhhIwFNEaMoB8gGjac
         UWW9/lliKBZzogl6RDDIjok/B3Hjv6b1xU0R/bWn3HhssokyRAjSVTyEnTllvO2Vi/h/
         AEJW2C5RvN8KLBe7FmizaOh/GjOmcBIWMR2YJFKkVwq0bzqRQWrQI54UO8YLWjExnts0
         76Cw==
X-Gm-Message-State: AOAM532jT6YL4VKYxjVha3GYySdl3MgQifh6XNH1sqCPlnBAe44vBaMY
        1HV1dZrATsszIzM/k8mQJvpL7iTQMSpt4y2ywWI=
X-Google-Smtp-Source: ABdhPJz9v/HcQN0oGObIKVjlIReu+0YExHhoYWAtnb781H0kVeDbJjHAVuaxN8240622vbYcvLuY09Cyey/kyimRjeI=
X-Received: by 2002:a67:2082:: with SMTP id g124mr9712122vsg.40.1618325084669;
 Tue, 13 Apr 2021 07:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <YHWQaQaw53eZtYzn@smile.fi.intel.com> <CAMuHMdX29zQHaC9UgGyGad-LxRRK=hBKVHVZ5+9_Cawqk=NMtA@mail.gmail.com>
 <YHWtmBTSKzFMQ/Dy@smile.fi.intel.com>
In-Reply-To: <YHWtmBTSKzFMQ/Dy@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Apr 2021 16:44:33 +0200
Message-ID: <CAMuHMdV1kTcPhutZZa04zd53C37Ci7Fr51nq1z8OX3kg1C14CA@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Apr 13, 2021 at 4:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 13, 2021 at 02:48:15PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Apr 13, 2021 at 2:37 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 13, 2021 at 02:26:15PM +0200, Geert Uytterhoeven wrote:
> > > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > > about this driver when configuring a kernel without Hisilicon platform
> > > > or ACPI firmware support.
> > >
> > > I don't by the ACPI dependency, sorry.
> > >
> > > The driver is a pure platform driver that can be enumerated on ACPI enabled
> > > devices, but otherwise it can be used as a platform one.
> >
> > Sure, you can manually instantiate a platform device with a matching
> > name, and set up the "clk_rate" device property.
> > But would it make sense to do that? Would anyone ever do that?
>
> It will narrow down the possibility to have One Kernel for as many as possible
> platforms.

That One Kernel needs to have CONFIG_ACPI enabled to use I2C on the
HiSilicon Kunpeng.  If CONFIG_ACPI is disabled, it cannot be used, as there
is no other code that creates "hisi-i2c" platform devices.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
