Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F176C3645BD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238553AbhDSOPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 10:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240246AbhDSOO7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 10:14:59 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066EBC06174A;
        Mon, 19 Apr 2021 07:14:30 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id nk8so4864084pjb.3;
        Mon, 19 Apr 2021 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Abdb7/tl6IzktzSgIBbKb8fZON6k1H0pSTO7x0VzMr8=;
        b=rEXY7FO2ZIW3JFcfMzDsTG4nAP8QzCAkLlLACGzcC/Aonb1DHCrfqE4V7sewn+GTly
         vRFK2zAVBLBYtvhfmlA9f74EnY8CQuCgdljXxafdVFV/rxoKJaJjUvvOTMRwdfIeQqjL
         6rpzkqYR9vwIEiahDkMKw8pS5slWNvftSnRb7/U0oqqDZfF1hOaGmW5A4UoX1ExzoWxG
         SKQ/vU5fTUwBIttNSdMXIHLH8EZaNujhTI0SmmhTxayZWawr1FIRA5CTyNsrbJg6wcM3
         ATAVlhOtceEzjIegfdg8ycstebBti2OliWETyozODsJrN1PX+iDuwoOu5DOFljNIn/cC
         n/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Abdb7/tl6IzktzSgIBbKb8fZON6k1H0pSTO7x0VzMr8=;
        b=jUoOoEsHQaqiXBcI9i+kyXGiwHfkI+tQwGExroukvV3S035Ubeh5KG5mANTPG+kLwQ
         hx4HzmgqI+3mDAxOd+5Ht/xM0XeZqtJspSKqzeDPmAMCAK5akZRWh/JsRWc7IIicuT+b
         C8tx7chgyU/xdOtaWBgoByAlDQ2VRytblhdRdylzfdMc4La/Yqb2JchFXWL1KnBIgP3r
         pbBq0axMNgK2hlb9wh2OdVeT1zd8mJUEEeQNmiWslyuLcEvADTszu83MW0cGSgmzh6kO
         R74Qeqdbsdq18KGu/zsttPXYRa1oT4fPnLgdj9F7jfeXw4UXvmXB6k5AYrONSH5EvPYu
         V9NA==
X-Gm-Message-State: AOAM532VJdOwE6qquZgIlHY9L8w5eTJXUBI6Kkm79+1QGJvBiIsy45wO
        IApZZF8691yy1e8z/wxzQJrm25wugoSkmdwXsmcENZsRIV4=
X-Google-Smtp-Source: ABdhPJzXAaJkqbopgjTpOGHb6DLAPSESuvCxpJFF3Pnnr3EroxFPscFdAnHMX2anPxr1n7uP40YU7k+16QqElRfdR50=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr6343418pjr.181.1618841669328;
 Mon, 19 Apr 2021 07:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
 <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com> <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
In-Reply-To: <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 17:14:13 +0300
Message-ID: <CAHp75VdjnNywLF7rt_Q9tw+sJwtm8S-BMU57ve21WGVoADFtuA@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 19, 2021 at 4:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > > In any case it's not true. We have the platform drivers w/o legacy
> > > users that are not dependent on OF.
> >
> > Example? ;-)
>
> i2c-owl.c

In case you want more
sound/sparc/amd7930.c

And I believe I can find zillions of them.

-- 
With Best Regards,
Andy Shevchenko
