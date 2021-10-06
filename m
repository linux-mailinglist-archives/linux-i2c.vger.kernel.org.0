Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9F542440B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 19:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhJFR0r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 13:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhJFR0r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 13:26:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9D4C061746;
        Wed,  6 Oct 2021 10:24:54 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id dj4so12638157edb.5;
        Wed, 06 Oct 2021 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1a2sqB7fy/MZa9Oh3cs9Js33qEalPD/IW1ZR53EtNgc=;
        b=UmLS9faDG2LuS/90/05YiAlTWiQgBvllD16X1z+yI/0ItgDiSH6ohtziR5+NtdflAa
         NnrMZ6ertDLPGSkEUYhJNf11640hQUF7CCqiYM0ck5FkLjYvPZyGSETqtEBuKXHJscnD
         bjTthbaGQ3Nkc1cmsRi08v4/70VW2AYMk/7HoGUvgziH4IPrDPHhhXlKT35HIE/QHVxW
         AaFTalYYQPg/8J0s3qMbinJlnSxVUzUFR2ANXDMQuN93Pub6cMTg8+deKlK4YJSf5Cf0
         t0eR5/Y7ZjN5mOv6aPJlVxc4Y+LNJ4JUDSeD1CUFuBXUu1JPtiOUki31xrtNfFNO+7QW
         V2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1a2sqB7fy/MZa9Oh3cs9Js33qEalPD/IW1ZR53EtNgc=;
        b=TaGBflnWE5KlnhZa7t3X7BrMPQqJDbqjDmuibNXqSvhFT5mERJAXnnjNtYLcUO8Jib
         HMp/yQjFRyqm7vhdOQMXRfczZG/soR+Yz/qw8H4sy4zmx++1pg0Sh/Psyyb4y+iTIA+I
         1BbD+qVp6/opAIXBErtgXXuQYXKUtX5Vf8Ix/nLCi6pR5ANKtryCg9Y35x5bOCCMO8WI
         HkARUsifh21UNiRRutKbMK6e6kHxEVhMzCnChteXK/q/+9E3t0/uUvcmAb9Puahw0zCS
         /XGyS0QA7Lm18Q7kupz82Q3+DM+YVmh3XpYUrqv8uVuKqN0cRCBuyIOP9SxYEmTmFoRg
         snHA==
X-Gm-Message-State: AOAM530s8P4QkfTLEu2hiToINZ2UWJQhr9+phAb67KBhZiRXaKL109BK
        wvOKFh+bZWSqlT4hQj2fDzZuwcWZaM6SE9EzsiA=
X-Google-Smtp-Source: ABdhPJwUb2vYx05WwrjqgNzXkmewLBINspUcYRgsZkqUhfuO3DQGXUzGcV4a2YpS9z/Mf+vMCKVzcf474+esKpig7WU=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr32908297ejc.128.1633541093181;
 Wed, 06 Oct 2021 10:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211006171517.47393-1-andriy.shevchenko@linux.intel.com> <YV3a69VgQT4dOKTH@kroah.com>
In-Reply-To: <YV3a69VgQT4dOKTH@kroah.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Oct 2021 20:24:16 +0300
Message-ID: <CAHp75Vff0Vw4R3Ba3H-ME0p-=cy1TkF8LUq_ABQe84ZTdpDEhQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] driver core: Provide device_match_acpi_handle() helper
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 6, 2021 at 8:21 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Oct 06, 2021 at 08:15:15PM +0300, Andy Shevchenko wrote:
> > We have couple of users of this helper, make it available for them.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/base/core.c        | 6 ++++++
> >  include/linux/device/bus.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index c4a2c97a21a2..18f1f6499246 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -4840,6 +4840,12 @@ int device_match_acpi_dev(struct device *dev, const void *adev)
> >  }
> >  EXPORT_SYMBOL(device_match_acpi_dev);
> >
> > +int device_match_acpi_handle(struct device *dev, const void *handle)
> > +{
> > +     return ACPI_HANDLE(dev) == handle;
> > +}
> > +EXPORT_SYMBOL(device_match_acpi_dev);
>
> Did you build this?

Yes, and it failed.

Sorry for the noise that I mistakenly sent the non-working version.
In fact, I typed 'a' literally thinking the word 'abort' for
git-send-email, what an irony!

-- 
With Best Regards,
Andy Shevchenko
