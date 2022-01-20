Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3125494C83
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiATLJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiATLJh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:09:37 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E82C061574;
        Thu, 20 Jan 2022 03:09:36 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id c24so24739331edy.4;
        Thu, 20 Jan 2022 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSZuENnQtvpSb9XtNjDDtEDFI7SfngDO55OTaUOdmw4=;
        b=g7OIi0GtebZGboMXAanw7y/VpJ/1Ulx94qe38Ts36dUTPuIus4WUyOQzORpupDgwTr
         JLWdlRiF6LCXYRTxAxfujua7EynlrZN3tyfhlzDkusqbsv20lFibq62IcEBO+AVukAQc
         n1rABmd78KdBSe3rh1URZiWlxYAG0129Ke7IFn5omYXK7YAB3Pc8K5yCwJ7MBg53Z0S1
         WbhjWP2wzmUkIZbjgT3yBNy1ewGhXRbkt3gFd0H95ErBGpGItazyBb+fD4ohByxtQAyB
         XRyaXryUF+SlvGD2eI9I7bSum7iNa6Gb3OBiGoJAn8enpv9NNKZM2aHEL8xWbKyYWlKm
         Qnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSZuENnQtvpSb9XtNjDDtEDFI7SfngDO55OTaUOdmw4=;
        b=MPgCDhsL4v6sqkb7XVfFj2ik5qe0Bwg2BpcyUI2gQTLkjfQiUSWgrGzN9Kex9VAOov
         /HkUaKNsC3TcNKSt5CTC+NbrMQius08qCVw+bdSj+eJGqTI+N4NvQN4WuPU2GIV7agmy
         PnsfS5GDkqcp1miKWxj6I5VAh1VpgaddDHlmGxZk2Rjen8jJ04fXy0gJ55sPqNoGFaXb
         XdCITuQI3bsek7RAbkN6ZCsVGENaZlA87/CdROvP0Yy29O/Ci/Czm/W7mxFRMmnKyi++
         9K/Uw1ofOAPZgtPHMAF5XDk/81RMBeOXHyu6XOMYeVBkavpMZzqdLGr44XY2bUBE5Wfc
         RBsA==
X-Gm-Message-State: AOAM5335zqdnkIvywkDkt1HtN3QKIqzJe0sEWW5qvlT/zud3+NTT8fcr
        76OJ7lveMSQWDIqiAgbTqxU1HjgnEL+2A1LHkP8=
X-Google-Smtp-Source: ABdhPJyeqHQILu1JRTaWq3VF7OKVfjjePuQs/kowTNknuojPUjwSNhIHGqw2wflIoOnDcAzr+FuK4BHeTIuxxPFg4XE=
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr2624400edy.296.1642676974640;
 Thu, 20 Jan 2022 03:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20220118202234.410555-1-terry.bowman@amd.com> <20220118202234.410555-3-terry.bowman@amd.com>
 <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com> <b609230d-37e5-d7a3-3dff-5980c1cca5f7@amd.com>
In-Reply-To: <b609230d-37e5-d7a3-3dff-5980c1cca5f7@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:07:52 +0200
Message-ID: <CAHp75Vf6_SKT94rDQMLWah-WgdP=w1YZ=X+cHS0SWr_26b+u0g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
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

On Wed, Jan 19, 2022 at 6:57 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
> On 1/19/22 5:53 AM, Andy Shevchenko wrote:
> > On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:

> Ok. I'll reduce the patches' to/cc list to only contain maintainers owning
> the current patch. I prefer to leave the lengthy list in the cover letter
> if that is ok because it will not be added to the tree but will provide
> context this series has multiple systems and may need communication
> between maintainers. I'll use the -to & -cc commandline as you mentioned to
> send to the longer list of recipients without cluttering the patch. Let me
> know if you prefer otherwise.

My point is that: supply the list implicitly.
For the help of choosing the right people I have written a script [1]
that shows a very good heuristics approach to me.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

...

> >> +       if (!devm_request_mem_region(dev, mmio_addr,
> >> +                                   SP5100_WDT_MEM_MAP_SIZE,
> >> +                                   dev_name)) {
> >> +               dev_dbg(dev, "MMIO address 0x%08x already in use\n",
> >> +                       mmio_addr);
> >> +               return -EBUSY;
> >> +       }
> >> +
> >> +       tco->tcobase = devm_ioremap(dev, mmio_addr,
> >> +                                   SP5100_WDT_MEM_MAP_SIZE);
> >> +       if (!tco->tcobase) {
> >> +               dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
> >> +                       mmio_addr);

> > On top of above it's a NIH devm_ioremap_resource().
>
> I'm not familiar with NIH term. My friends google and grep weren't much help.

[2]: https://en.wikipedia.org/wiki/Not_invented_here

Means that you could very well simplify the code by using existing functions.

...

> > Okay, I see this is the original code like this... Perhaps it makes
> > sense to reshuffle them (indentation-wise) at the same time and
> > mention this in the changelog.

Here is the explanation that I noticed that the code you move is
original, and not written by you.

-- 
With Best Regards,
Andy Shevchenko
