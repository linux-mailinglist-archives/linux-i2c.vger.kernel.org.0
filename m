Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55B3494C94
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiATLOu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiATLOr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:14:47 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB00EC061574;
        Thu, 20 Jan 2022 03:14:46 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id p12so27114411edq.9;
        Thu, 20 Jan 2022 03:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IT9uvhWZdWmjY3EmgbPu/lh1Ibe0zATbXaJ/u/RtpyE=;
        b=dfwxLtXcM9MSY3S5yJHp6J1gQ/QR7MYKFBVfKhF4e+XZoNSWb88hHwjtJAFxV2Clkg
         YnZS4/2OLsHTUQ/Fhmvk6MhsYNUDN7ao872f2QflOuYKcGNaovKLgvpRj70HDXSOaYOg
         1mdxn5f6poTJ0TS9lDA7/n/ckq1sHmaiPJn/vCInz4vGdfEG6ugxAqplLMW49AZ9goa5
         ZFaEDjehLmQvtEK26BxDJMRZdL8UgvILRQT8wiydr9y8CxDTrqi1M50CeZ0C/2O0ZOgO
         CGwvZJm4rI5RG53PYBQK0NSTrYtpvGgG8p9xQzS7j6+oXDA617Hf+6ajCKzbkzftXi1x
         oHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IT9uvhWZdWmjY3EmgbPu/lh1Ibe0zATbXaJ/u/RtpyE=;
        b=oUZtKiXnnx9lRMZTcBHipA9VLaRQnz2EL5LPPuQN3uU5xnda3YSC5nL70T31diKnQI
         mQzb6V6QBoD4ocMdh5SsONle24Lq2daGC85YI3h19xYLgUMZL0mhnRuHlR8CE76WyiXw
         /WSQOY1y9pstXnCQM7EjZ+Wx1p4HNUkzBXbsouBU44odlEFfeVOMHUGeSJaCMpgVZeEs
         bP+/7G3sGufgex9uaj+VlmwArdHPFYYYfr5io2ZOLIV4ijtznviOJciInxdMs47FWHKy
         gRge8Lk+7+mBu5VpCOpkpz7fX1ZvhtSvtxXAYrSJBKD75F3IAgPgY/UIHud+95tJl0tI
         oLSw==
X-Gm-Message-State: AOAM531K8EdAegZVEren8G3J9D2BklfVTb8OHJRNemtLMm8OPOrjQkCM
        zYvsFlA38xagk6q0VVWTWKPAjuSxNerDl/xwwNH+H2muF9CAow==
X-Google-Smtp-Source: ABdhPJywg0WB3YNKw1F/9yC8fESf3+WJp8so5WFTFo89l712Oi5LZYLmHYr+UFN/37dpaRI8FKH8FMK+3Gc/MFqzVys=
X-Received: by 2002:a17:907:94d3:: with SMTP id dn19mr1405352ejc.77.1642677285360;
 Thu, 20 Jan 2022 03:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20220118202234.410555-1-terry.bowman@amd.com> <20220118202234.410555-3-terry.bowman@amd.com>
 <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com> <b4f66a42-6f25-7e93-2a3b-5d73af39e72e@roeck-us.net>
In-Reply-To: <b4f66a42-6f25-7e93-2a3b-5d73af39e72e@roeck-us.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:13:03 +0200
Message-ID: <CAHp75VfcJ1HBM=Rw5LcTZWYMxxpASC2b=gTWTrRs4--CmqafpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Terry Bowman <terry.bowman@amd.com>,
        linux-watchdog@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 19, 2022 at 5:46 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 1/19/22 3:53 AM, Andy Shevchenko wrote:
> > On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:

...

> >> +               devm_release_mem_region(dev, mmio_addr,
> >> +                                       SP5100_WDT_MEM_MAP_SIZE);
> >
> > Why? If it's a short live mapping, do not use devm.
>
> This is not short lived; it is needed by the driver. The release
> is an artifact of calling this function twice and ignoring the error
> from devm_ioremap() if the first call fails. devm_release_mem_region()
> isn't strictly needed but that would result in keeping the memory
> region reserved even though it isn't used by the driver.

So, this seems like micro-optimization, but okay, at least it
justifies it. Thanks for explaining.

> There is a functional difference to the original code, though.
> The failing devm_ioremap() causes the code to try the alternate
> address. I am not sure if that really adds value; devm_ioremap()
> fails because the system is out of virtual memory, and calling
> it again on a different address doesn't seem to add much value.
> I preferred the original code, which would only call devm_ioremap()
> after successfully reserving a memory region.

...

> > On top of above it's a NIH devm_ioremap_resource().
>
> Not sure what NIH means

Not Invented Here (syndrome)

...

> >> +       /* Check MMIO address conflict */
> >> +       ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
> >
> >> +
> >> +       /* Check alternate MMIO address conflict */
> >
> > Unify this with the previous comment.
>
> Why ? It refers to the code below. If that is a single or two comments
> is really just POV.

It depends on the angle from which you see it (i.o.w. like you said
POV). I considered it from the code perspective and personally found
the
/*
 * Bla bla bla
 */
ret = foo();
if (ret)
  bar();

better than above.

> >> +       if (ret)
> >> +               ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
> >> +                                               dev_name);

...

> >>          release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> >
> > Is it still needed? I have no context to say if devm_iomap() and this
> > are not colliding, please double check the correctness.
> >
> Not sure I understand. This is the release of the io region reserved with
> request_muxed_region() at the beginning of this function. Why would it no
> longer be necessary to release that region ?

Thank you for explaining, as I said I have no full context here, and I
simply asked for double check.

-- 
With Best Regards,
Andy Shevchenko
