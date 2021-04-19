Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F39364613
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 16:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239572AbhDSO2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 10:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbhDSO2d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 10:28:33 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C07C06174A;
        Mon, 19 Apr 2021 07:28:04 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso1712960pjn.0;
        Mon, 19 Apr 2021 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KAZ9BnyuRytWoXXWXqpuAXZKdrp72mnZ3/aW9Oo7Va0=;
        b=HAudkUBBcDK0brXk7OQgwpQszpJxJ5Lb/RbPObK/T/mk/EXYhS7mNqjS6sGw7jHlso
         A/j4MOfpoTkid//0s9OMICBNaoo3xO9YNJX4U0Vpw4ibNnZdU64+cpSS8SJoE23x7DDq
         QDeQNYG/dNRUeLEROLce6OBJb7oKLa7dQ10SxmjPGiee0/CBHtbfsUmUNMQpbgjk59Tl
         OxXnHSZi44yNLKCXRDlhdx3h2AYkMmXbYxXY7q8DLa5jboPeUSV+LtFGfw8hkITgJoBL
         nFp/QUFyUF2EeUYnxOxm54yEzK9srA1zEepZDFeRSDwLl4y0gX/zPHa1hu6o9dkxTTi7
         Y1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KAZ9BnyuRytWoXXWXqpuAXZKdrp72mnZ3/aW9Oo7Va0=;
        b=KCQUjglJaKF2OtRaJm5DvJ0aoRSREziVPR8iUjNjHRE6SCF4K7BUprAUBnc8J0YZFo
         AiWYDWCMo+UrGnjTYf6xzPYZ1cECPAg55qHMBBVq0xH4gNe1Qxjsk+So/Gv8JXV9ul0T
         eSLwgm3bgEUbLCY22K7Jo9nDEOHDTFLzzi4LROxItmCTnNGNsos4uvqVtTpFTFNm+zZO
         TyeyzSu0zWMXTtJPMDX5R/5ZKdiYFjO09+fzwmabdLyflQ1xBWQeldHZQzzJi9lqEFc5
         kBGi6MA5liEKOTTDLP1Ri96OseWkFE6LeCDn1NEyrH+XLM/m+soSmQL/PyrCLH/50CIh
         0UvQ==
X-Gm-Message-State: AOAM530vwR3FKBXvFCEa/akPs67CewNgXAi73kv8S69YA8I+oyup64F+
        wxPnXA5H4hUeMNWmdtEDTeyLzrWJK+6lwUtYnDc=
X-Google-Smtp-Source: ABdhPJwDgmOjRnzRnoB/dRfTm3c9kMdBzAw589kXgY2OXrmnZ49BWXNZIzhIpgXlUmsuvx4BUfqBZeDiDv7HMUZ32CQ=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr6415276pjr.181.1618842483717;
 Mon, 19 Apr 2021 07:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
 <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com>
 <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
 <CAHp75VdjnNywLF7rt_Q9tw+sJwtm8S-BMU57ve21WGVoADFtuA@mail.gmail.com> <CAMuHMdVwWLpS-N2fvihLcJ9RsAppzRMd5ZQhra-sz6EFavhy2g@mail.gmail.com>
In-Reply-To: <CAMuHMdVwWLpS-N2fvihLcJ9RsAppzRMd5ZQhra-sz6EFavhy2g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 17:27:47 +0300
Message-ID: <CAHp75Vc5yGALSh2pxt6z_6bsyFweuu+vPH6dFKQtBMzXM-dY6Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Apr 19, 2021 at 5:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Apr 19, 2021 at 4:14 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 19, 2021 at 4:58 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Apr 19, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > > > > In any case it's not true. We have the platform drivers w/o legacy
> > > > > users that are not dependent on OF.
> > > >
> > > > Example? ;-)
> > >
> > > i2c-owl.c
> >
> > In case you want more
> > sound/sparc/amd7930.c
>
> SND_SUN_AMD7930 depends on SND_SPARC && SBUS
> SND_SPARC depends on SPARC
> SPARC selects OF
>
> Hence, SND_SUN_AMD7930 depends on OF.

Exactly my point. Read back what I wrote.

TL;DR: It's *fine* to have _indirect_ dependency like this.

-- 
With Best Regards,
Andy Shevchenko
