Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271ED4113AC
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 13:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbhITLnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 07:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237018AbhITLnD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 07:43:03 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89934C061574
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 04:41:36 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id dj4so4022521edb.5
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oznmaGRVrHtxLdz21rhT8rtGnk/pKW1IuycVU1NNZQI=;
        b=nu64i44cca1TGhdrBZc2AvH4MW0LRu5At3GAsQIrPlXRtMVZfMWIXmSBkLptlRvJRH
         AV2QCk702OsMKqbMV4KMwGoX/I8mGIZOfP6jE8Jj+GP9ZiIBh85A5ADj4+jeg6A2HwmM
         b0v1iNGEoqYQS26gLB7YsXH00izdvInsUgmoNEl2jIONbtRmU9UrkR6Gqb9Vq7ajfUgh
         anQV5ToXNwrn/ibNU2ME96S/tyu8kRLA5dWmipfvE9Phnb3ZeqkfyGFSqRP/CYPji5Ce
         uhWtziQQx58aWa30lWN8GrOSKzIDILLiHFwaSUbcI4kPGxDW+V+KJUsay1nqHVix0fGE
         ruBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oznmaGRVrHtxLdz21rhT8rtGnk/pKW1IuycVU1NNZQI=;
        b=yZxWUwr70IwzNl9L9MwgDgKyZweMq3ntAJ2BcVosVAPydpJ+VH4v9OMhPcZyFtqiYt
         QAYfkweI10AmGKy+kDNI9us8F/fVG5UjSDdqvUkUJzfR0KJFDMG9YdIGNyNcp6cIs/BE
         0TjgI6N7e5Aodp0rrpTHO2YmVjE0I+ExbsQmQTa0lMEAdAkYvzCEMvMB1oW3WuwqB09v
         b5YYBHpVAG2nrc5GFctkl3wiVKthpyqJj1FgKPijbkjHUrrQM0oN2laTNOzr7Y8XzypF
         DMUHOkQzTcDoT0wbvPlSnmcjrxCM7fpAi2ZvWEqKCwIDgpLNOcfEsafRzrKbD+pV/26d
         MYtg==
X-Gm-Message-State: AOAM533CpDXdm9vlTViZAhzjGGKYLkGIEqZDsKs4l/nxOfp+mGV2JzRm
        vpBW3dCvZ55VCleJhS9h2/yTQY0A0U6Edi/7vqKeGA==
X-Google-Smtp-Source: ABdhPJzidiKuODsDvZlYYgCkPEtfjXh1pYOz7UvhV5Ir0F2MUFALenmhBFjaWEn7IE11o62BoFhcsUsnFvA0tdGtAPw=
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr3071349edl.60.1632138095096;
 Mon, 20 Sep 2021 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210920072842.30889-1-brgl@bgdev.pl> <CAHp75Vc0ytt4gWqaEWVOLSwu8J15t92JXg790jvjtGJqMo5_6A@mail.gmail.com>
In-Reply-To: <CAHp75Vc0ytt4gWqaEWVOLSwu8J15t92JXg790jvjtGJqMo5_6A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 13:41:24 +0200
Message-ID: <CAMRc=MeLMngUi3oZAWuM6sBazvm6iXOYiVYbHOjbCdm7Z9r3bQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 20, 2021 at 11:42 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 20, 2021 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > My professional situation changes soon. Update my email address.
>
> I'm wondering if @kernel.org address would be a better choice. In such
> a case you don't need to send a patch whenever your situation changes.
>

This is my "private professional" address that I had used even before
doing kernel work on BayLibre payroll - I intend to keep it from now
on.

> Either way, with hope that you will be still active here,
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I will! :)

Bart

>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  MAINTAINERS | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index eeb4c70b3d5b..6bebe6168922 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2962,7 +2962,7 @@ F:        crypto/async_tx/
> >  F:     include/linux/async_tx.h
> >
> >  AT24 EEPROM DRIVER
> > -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +M:     Bartosz Golaszewski <brgl@bgdev.pl>
> >  L:     linux-i2c@vger.kernel.org
> >  S:     Maintained
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> > @@ -7986,7 +7986,7 @@ F:        include/linux/gpio/regmap.h
> >
> >  GPIO SUBSYSTEM
> >  M:     Linus Walleij <linus.walleij@linaro.org>
> > -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +M:     Bartosz Golaszewski <brgl@bgdev.pl>
> >  L:     linux-gpio@vger.kernel.org
> >  S:     Maintained
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> > @@ -11367,7 +11367,7 @@ F:      Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
> >  F:     drivers/iio/proximity/mb1232.c
> >
> >  MAXIM MAX77650 PMIC MFD DRIVER
> > -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +M:     Bartosz Golaszewski <brgl@bgdev.pl>
> >  L:     linux-kernel@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/devicetree/bindings/*/*max77650.yaml
> > @@ -18689,7 +18689,7 @@ F:      include/linux/clk/ti.h
> >
> >  TI DAVINCI MACHINE SUPPORT
> >  M:     Sekhar Nori <nsekhar@ti.com>
> > -R:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +R:     Bartosz Golaszewski <brgl@bgdev.pl>
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:     Supported
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git
> > --
> > 2.30.1
> >
