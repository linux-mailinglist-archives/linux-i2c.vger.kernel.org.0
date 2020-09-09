Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4EE262B6E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 11:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgIIJLl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 05:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgIIJLl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 05:11:41 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0F0C061573;
        Wed,  9 Sep 2020 02:11:40 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id c196so1745454pfc.0;
        Wed, 09 Sep 2020 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UdhXGGjmL8NBGezSBYtuMby3MN847qFHmnMYU3bZb0U=;
        b=qSlgv/rz8fwOcXX/321k0NADun5Hhu6KIKc7OlaqYfc4eLoXvTvHDVLYDtCRYfMzIB
         f0B/sMbBlEWJBllvqQIjR3wWSLexC2sqfvrN435mAGKFFtTuvam9ktIXSAivUvBLuuxs
         6o0fTkh9N83o9eVw/A56TSmR5QPGtRBBH6SlwxMz821trnak17bSOnUEpeJlp1VEZBiJ
         tJh/JxC7GEB/E2Qm9koUlZq6kZhFGq23gML4A5C1aIPqKYDRZ4vTV6rTcbnPFnhghDOq
         oTPkSk6tC4s4Rx1JSIqNzr6mWPn+Erdhy5QU27fGxAWJ6XrZgOpdKBEyeGaJpCGzwC0+
         gUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UdhXGGjmL8NBGezSBYtuMby3MN847qFHmnMYU3bZb0U=;
        b=BEeY8xkUSLGHTCrf6ji+qxh6sPUHE3RnEzLnHZ0JkYDwrm6w6sigQTnxTaEXu0Kc4/
         GFuE0Suy5Tc2yHWJbs9Gj//4sDX2ElBqCsC6kZDKsOv4K7gJ35d3OXZCZVTZDujUyI22
         /Yb68NoqmFtBiSd5DMNpSkvpquqvVzpR4ds2TUaLUx7Fvvs44ZQQSYnrLgcUJiF2K9wc
         45DWhtu2FxnP9NlNiAj7AoCK22beOmL2i7e5UkkRJPt4s9wAmuqWNvuZceewtvvUNtql
         b4aP6anFjTd/6rC81nfxRoPg/VCQ4TcDDnDjg+AdDIHissecvIQWw6UjFk693XBjrh0x
         Snbw==
X-Gm-Message-State: AOAM530JL22AclqeLufMY6P3tE3lGL8Lhj9C11FBrIZq2C9ZVXxMxhV0
        M+9YaHHakoq62OPyz4PMDJqnYhhhP0yjns79V2s=
X-Google-Smtp-Source: ABdhPJzZoADQ4rrH1HSmn5c+kiBBYH0HmNXud2sbj2Bs2mVz2jIMcCxyETNDqZgT21j87e/8y9U8h3qo3MhNGKBbIZA=
X-Received: by 2002:aa7:9517:: with SMTP id b23mr2704286pfp.21.1599642699529;
 Wed, 09 Sep 2020 02:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200908224006.25636-1-digetx@gmail.com>
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Sep 2020 12:11:22 +0300
Message-ID: <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Hello!
>
> This series performs refactoring of the Tegra I2C driver code and hardens
> the atomic-transfer mode.

I think there is still room for improvement, but let not block it, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changelog:
>
> v7: - Reworked the "Clean up probe function" patch by moving out all
>       variable renamings into the "Clean up variable names" patch.
>       This results in a nicer diff, which was asked by Andy Shevchenko.
>
>     - Squashed "Improve coding style of tegra_i2c_wait_for_config_load()"
>       patch into "Factor out register polling into separate function" in
>       order avoid unnecessary ping-pong changes, which was asked by
>       Andy Shevchenko.
>
>     - Added more indentation improvements, it should be ideal now.
>
>     - I haven't changed order of the "Clean up variable types" patch,
>       which was suggested by Andy Shevchenko, because I already moved
>       that patch multiple times and we decided to sort patches starting
>       with more important cleanups and down to less important. The type
>       changes are more important than shuffling code around, IMO.
>
> v6: - Added new patch that adds missing RPM puts, thanks to Andy Shevchen=
ko
>       for the suggestion.
>
>     - Improved commit messages by extending them with more a more detaile=
d
>       explanation of the changes.
>
>     - Added clarifying comment to the "Use reset_control_reset()" change,
>       which was asked by Andy Shevchenko.
>
>     - Refactored the "Clean up probe function" patch by moving the
>       dev_err_probe() change into the "Use clk-bulk helpers" patch,
>       which was suggested by Andy Shevchenko.
>
>     - Improved ordering of the patches like it was suggested by
>       Andy Shevchenko.
>
>     - Added Andy Shevchenko to suggested-by of the "Use clk-bulk helpers"
>       patch.
>
>     - Improved "Remove i2c_dev.clk_divisor_non_hs_mode member" patch by
>       making the case-switch to use "fast plus mode" timing if clock rate
>       is out-of-range. Just to make it more consistent.
>
>     - The "Improve tegra_i2c_dev structure" patch is squashed into
>      "Improve formatting of variables" and "Clean up types/names" patches=
.
>
>     - All variable-renaming changes are squashed into a single "Clean up
>       variable names" patch.
>
>     - Made extra minor improvement to various patches, like more comments
>       and indentations improved.
>
> v5: - Dropped the "Factor out runtime PM and hardware initialization"
>       patch, like it was suggested by Micha=C5=82 Miros=C5=82aw. Instead =
a less
>       invasive "Factor out hardware initialization into separate function=
"
>       patch added, it doesn't touch the RPM initialization.
>
>     - The "Remove outdated barrier()" patch now removes outdated comments=
.
>
>     - Updated commit description of the "Remove "dma" variable" patch,
>       saying that the transfer mode may be changed by a callee. This was
>       suggested by Micha=C5=82 Miros=C5=82aw.
>
>     - Reworked the "Clean up and improve comments" patch. Couple more
>       comments are corrected and reworded now.
>
>     - Added r-b's from Micha=C5=82 Miros=C5=82aw.
>
>     - New patches:
>
>         i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Don't fall back to PIO mode if DMA configuration fail=
s
>         i2c: tegra: Clean up variable types
>         i2c: tegra: Improve tegra_i2c_dev structure
>
> v4: - Reordered patches in the fixes/features/cleanups order like it was
>       suggested by Andy Shevchenko.
>
>     - Now using clk-bulk API, which was suggested by Andy Shevchenko.
>
>     - Reworked "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch to use iopoll API, which was suggested by Andy Shevchenko.
>
>     - Separated "Clean up probe function" into several smaller patches.
>
>     - Squashed "Add missing newline before returns" patch into
>       "Clean up whitespaces, newlines and indentation".
>
>     - The "Drop '_timeout' from wait/poll function names" is renamed to
>       "Rename wait/poll functions".
>
>     - The "Use reset_control_reset()" is changed to not fail tegra_i2c_in=
it(),
>       but only emit warning. This should be more friendly behaviour in op=
pose
>       to having a non-bootable machine if reset-control fails.
>
>     - New patches:
>
>         i2c: tegra: Remove error message used for devm_request_irq() fail=
ure
>         i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>         i2c: tegra: Use platform_get_irq()
>         i2c: tegra: Use clk-bulk helpers
>         i2c: tegra: Remove bogus barrier()
>         i2c: tegra: Factor out register polling into separate function
>         i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
>         i2c: tegra: Clean up and improve comments
>         i2c: tegra: Rename couple "ret" variables to "err"
>
> v3: - Optimized "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch by pre-checking FIFO state before starting to poll using
>       ktime API, which may be expensive under some circumstances.
>
>     - The "Clean up messages in the code" patch now makes all messages
>       to use proper capitalization of abbreviations. Thanks to Andy Shevc=
henko
>       and Micha=C5=82 Miros=C5=82aw for the suggestion.
>
>     - The "Remove unnecessary whitespaces and newlines" patch is transfor=
med
>       into "Clean up whitespaces and newlines", it now also adds missing
>       newlines and spaces.
>
>     - Reworked the "Clean up probe function" patch in accordance to
>       suggestion from Micha=C5=82 Miros=C5=82aw by factoring out only par=
ts of
>       the code that make error unwinding cleaner.
>
>     - Added r-b from Micha=C5=82 Miros=C5=82aw.
>
>     - Added more patches:
>
>         i2c: tegra: Reorder location of functions in the code
>         i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_ms=
g()
>         i2c: tegra: Remove "dma" variable
>         i2c: tegra: Initialization div-clk rate unconditionally
>         i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
>
> v2: - Cleaned more messages in the "Clean up messages in the code" patch.
>
>     - The error code of reset_control_reset() is checked now.
>
>     - Added these new patches to clean up couple more things:
>
>         i2c: tegra: Check errors for both positive and negative values
>         i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_loa=
d()
>         i2c: tegra: Remove unnecessary whitespaces and newlines
>         i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Improve driver module description
>
> Dmitry Osipenko (34):
>   i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
>   i2c: tegra: Add missing pm_runtime_put()
>   i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
>   i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Initialize div-clk rate unconditionally
>   i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
>   i2c: tegra: Runtime PM always available on Tegra
>   i2c: tegra: Remove error message used for devm_request_irq() failure
>   i2c: tegra: Use reset_control_reset()
>   i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>   i2c: tegra: Use platform_get_irq()
>   i2c: tegra: Use clk-bulk helpers
>   i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
>   i2c: tegra: Clean up probe function
>   i2c: tegra: Reorder location of functions in the code
>   i2c: tegra: Clean up variable types
>   i2c: tegra: Remove outdated barrier()
>   i2c: tegra: Remove likely/unlikely from the code
>   i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
>   i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
>   i2c: tegra: Rename wait/poll functions
>   i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out register polling into separate function
>   i2c: tegra: Factor out hardware initialization into separate function
>   i2c: tegra: Check errors for both positive and negative values
>   i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
>   i2c: tegra: Improve formatting of variables
>   i2c: tegra: Clean up variable names
>   i2c: tegra: Clean up printk messages
>   i2c: tegra: Clean up and improve comments
>   i2c: tegra: Clean up whitespaces, newlines and indentation
>   i2c: tegra: Improve driver module description
>
>  drivers/i2c/busses/i2c-tegra.c | 1435 ++++++++++++++++----------------
>  1 file changed, 701 insertions(+), 734 deletions(-)
>
> --
> 2.27.0
>


--=20
With Best Regards,
Andy Shevchenko
