Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5CC35DF5F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbhDMMvA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:51:00 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:37510 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345905AbhDMMsq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 08:48:46 -0400
Received: by mail-vk1-f172.google.com with SMTP id p206so1060810vkd.4;
        Tue, 13 Apr 2021 05:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPCwCEu/tlD0sPdVV7Acf3Q88fdnLj8wuh/uaB99fZ0=;
        b=SxSg1XYx4RyYpuIGG8o9w0PpfCiC/84tJy6jumMgo888duy0YbQFzbvt4yUji2H89h
         lBLyIUiruh+dIMQC/YPCPiL90s5aEBe5FjsjaZHc1WN1MBxrP2112yy4sMTxd8csHGFm
         404tXIc9leiIb04bO+lm+hudoOnhTdiRhLg0wdE9y/7/oi1hvTV/oUdoQxnZkpjnquuy
         Gt+tebNdPfwmPubPrIx3beAxjjT8yOKLqNuqe+6cM/5K+PVv6mwqIopJebHkY7OjtHRG
         oRwM7PUSk/wXn8HsvSBuj99IJXx9AlZM/89fONfmo4ciKOHy3UaaF1/i+63/BFLxWZQW
         fEdg==
X-Gm-Message-State: AOAM5311/P1x8gka0sSnmoDXvIXdG6qLTn1U6Xp0C61SZ6QrrCp9y/HZ
        DCPM8CqhMv/aWp8eg/sii9q/xnWTiQDqzF14icg=
X-Google-Smtp-Source: ABdhPJzV+Q6RQgrKzEVEruhMtyqX3cZ+hfIXaRTxVkQJ4gAkFfCxaCbMerKFjzCqhoZqkiQzh4ee87eJb2p6DQ1CyqQ=
X-Received: by 2002:a1f:1f81:: with SMTP id f123mr567276vkf.6.1618318106468;
 Tue, 13 Apr 2021 05:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <YHWQaQaw53eZtYzn@smile.fi.intel.com>
In-Reply-To: <YHWQaQaw53eZtYzn@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Apr 2021 14:48:15 +0200
Message-ID: <CAMuHMdX29zQHaC9UgGyGad-LxRRK=hBKVHVZ5+9_Cawqk=NMtA@mail.gmail.com>
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

On Tue, Apr 13, 2021 at 2:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 13, 2021 at 02:26:15PM +0200, Geert Uytterhoeven wrote:
> > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > about this driver when configuring a kernel without Hisilicon platform
> > or ACPI firmware support.
>
> I don't by the ACPI dependency, sorry.
>
> The driver is a pure platform driver that can be enumerated on ACPI enabled
> devices, but otherwise it can be used as a platform one.

Sure, you can manually instantiate a platform device with a matching
name, and set up the "clk_rate" device property.
But would it make sense to do that? Would anyone ever do that?

The corresponding SPI_HISI_KUNPENG depends on ACPI, too.

> If you remove ACPI dependency, feel free to add my
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
