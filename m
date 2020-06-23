Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58440204629
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 02:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731980AbgFWAuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jun 2020 20:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731526AbgFWAuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jun 2020 20:50:52 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A71C061573;
        Mon, 22 Jun 2020 17:50:51 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y2so3930282ioy.3;
        Mon, 22 Jun 2020 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TC5E7FBCygNfpPUxzm/+B85lgL0z7T8GyhtO4MSugaA=;
        b=B71EVIIvLJy1GqZtUTl5kyWxs6o5dHGg2JmtH55aOX/tb3wRZSh44zAqs0szJiPnut
         wM6Dh0N4ZTzFL4841xcfTjeVeFGmhtoMmm+Fp4hKt8tC1onSbMOtULywXB6DZpRkBRmi
         3ei3o9mm0R71BM+bL8jwxaDQ2Q5oIgooi88nszUH1a1AyIM41ER2eeHq17Z6qtzpJgsV
         9EAnsAqruoLiV9kIRltkU55NoAKzlOJeaDu2O0MOc7U3r2naTss/4XL4LZ7z+tbVYvV5
         Emx1ksZ8gdrv6MX9rRmPryjI9wsuF5CTHoCYYE0W+Q0jxttlPLiHdn1+5XAflbc3kMkB
         ajAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TC5E7FBCygNfpPUxzm/+B85lgL0z7T8GyhtO4MSugaA=;
        b=likF1gt0vh7d3/0WQPzILoCt5EHBR8dBOn7+1R/gDXryZD49NKuS2ljuoadQgIv54z
         CqSvnVU2TWImGNJQ7C94E9nPifWF2Z59UEU6qCailt2KAU3I+zL2ebepBT2S+AiSHCoy
         7k5+GX8cNVFsk3kMhT5o+XUQY5aV2voAgaAvVuo1UrGwfSM0qb6HY9NCx52m82n8IAym
         Q5vcP7jsD+abt2w/nL7xdmXOHhz12kB/uo9taOVmHgy1fjA+NQ7EF5iKi/Y98F1EaXDT
         s60VGkzo3PBcd0orqs6/pzYc7l6wPkYWGd79EMkqQyTC1OMzJndGv9HhEgCPIs3Pu5hY
         v/rQ==
X-Gm-Message-State: AOAM531VMHsF/YM8KQ5SdG7z+/4/iXEM/W1w9M8vEyKQpUh9CqxtzPVy
        0Q23rL0SprK/WGgBg8ANMKEwSetxQRdGlmgSsF4=
X-Google-Smtp-Source: ABdhPJwrccQ66NR/S/2MSSbWAnAVlOOmY7C50w7T0a+7PEVeu1clAgXom7F5uFm8dt9SPDDJgcSlVI12AMieh9UhVN8=
X-Received: by 2002:a05:6602:2805:: with SMTP id d5mr19836073ioe.124.1592873450496;
 Mon, 22 Jun 2020 17:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200613113328.GA5400@kunai>
In-Reply-To: <20200613113328.GA5400@kunai>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 22 Jun 2020 17:50:40 -0700
Message-ID: <CANcMJZDT0oc8m1jjthVANGz6iZ+J4gv5YOqnXMLWbHtZgeQ_eA@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for 5.8
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Tom Gall <tom.gall@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 13, 2020 at 4:36 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> I2C has quite some patches for you this time. I hope it is the move to
> per-driver-maintainers which is now showing results. We will see.
>
> Big news is two new drivers (Nuvoton NPCM and Qualcomm CCI), larger
> refactoring of the Designware, Tegra, and PXA drivers, the Cadence
> driver supports being a slave now, and there is support to
> instanciate SPD eeproms for well-known cases (which will be user-visible
> because the i801 driver supports it), and some
> devm_platform_ioremap_resource() conversions which blow up the diffstat.
>
> Note that I applied the Nuvoton driver quite late, so some minor fixup patches
> arrived during the merge window. I chose to apply them right away
> because they were trivial.
>
> Please pull.
>
> Thanks,
>
>    Wolfram
>
>
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
>
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.8
>
> for you to fetch changes up to d790eeb3db6aefac39ffa06e598eb31b7352ca4f:
>
>   i2c: Drop stray comma in MODULE_AUTHOR statements (2020-06-11 12:32:14 +0200)
>
> ----------------------------------------------------------------
...
> Andy Shevchenko (17):
...
>       i2c: designware: Move ACPI parts into common module

Just as a heads up. I'm seeing a regression from this merge that I
bisected down to the patch above (f9288fcc5c615), with the HiKey
board. It seems the adv7511 (HDMI bridge) driver isn't probing, which
causes graphics to fail.

I've just bisected it down and haven't managed to do much debugging,
but I wanted to raise a flag on this. Let me know if there is anything
you'd like me to try right off.

thanks
-john
