Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24253645D7
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 16:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbhDSOTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 10:19:11 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:42943 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhDSOTJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 10:19:09 -0400
Received: by mail-vs1-f53.google.com with SMTP id 66so17639721vsk.9;
        Mon, 19 Apr 2021 07:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k26scZ2ZxzyMMbBVPJSGGaSA9s7p9mhsW9mmH6gzCOg=;
        b=Rv7mm7GA6BwOKphKM2IwX0XdhzV/uVF+RUv3LZea5ScZGLEwRsEhe6pxATNn25Zed1
         cDCisYbFuLOmkDRIXOebVmsbga+pq/IAxHTCrNqZq5nsmKkyVqAYN3GT19a8O+h3AMTr
         5ApMLQmi+lwj+ExMFy4fF3KECY483ui5Y9TPj2MOCK94qNlmVcuJ7RCPmZw6210banUm
         MkA8++FJuJ3yG4gtj1Kt708xTKYCEf6ooCN2q+F2Y+LCL59Ypb/YYoWR3I79sRaUwrvf
         6MtqWZYnGrNiXRR1HG2H8Xrl30UA/WasNL0v9RjFpOazNA0DXCKDg2ExhC6wNxcS6Bj6
         okwA==
X-Gm-Message-State: AOAM532pTiSB8eoSiblUPC7snm+HNk6kcQkQYS73WDBLxMVqRIdlp/Th
        hAOyCbhz1uDva6m8QrN6qMHMSm1yQIesFdXcXs8=
X-Google-Smtp-Source: ABdhPJygm9EPdyyaxvFoHxSJ7IKNDdXyt30FMolGCUK0JYhE35gT1CUdLM283xzc0aQIh6sp5YiHd8qfC93bpFyNAj4=
X-Received: by 2002:a05:6102:814:: with SMTP id g20mr1588701vsb.42.1618841919211;
 Mon, 19 Apr 2021 07:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
 <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com>
 <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com> <CAHp75VdjnNywLF7rt_Q9tw+sJwtm8S-BMU57ve21WGVoADFtuA@mail.gmail.com>
In-Reply-To: <CAHp75VdjnNywLF7rt_Q9tw+sJwtm8S-BMU57ve21WGVoADFtuA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Apr 2021 16:18:28 +0200
Message-ID: <CAMuHMdVwWLpS-N2fvihLcJ9RsAppzRMd5ZQhra-sz6EFavhy2g@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Hi Andy,

On Mon, Apr 19, 2021 at 4:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 4:58 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 19, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > > > In any case it's not true. We have the platform drivers w/o legacy
> > > > users that are not dependent on OF.
> > >
> > > Example? ;-)
> >
> > i2c-owl.c
>
> In case you want more
> sound/sparc/amd7930.c

SND_SUN_AMD7930 depends on SND_SPARC && SBUS
SND_SPARC depends on SPARC
SPARC selects OF

Hence, SND_SUN_AMD7930 depends on OF.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
