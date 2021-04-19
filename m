Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F4036464E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 16:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhDSOkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 10:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbhDSOkK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 10:40:10 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01925C06174A;
        Mon, 19 Apr 2021 07:39:40 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id b17so24401274pgh.7;
        Mon, 19 Apr 2021 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rw9II8yNG1e/EGw+d95WfeKsIJyFJ3Hb1OX6V58ZRlw=;
        b=Vm1e3x6jsvKApaJgZoT+SzksilQH5Cr8XPi+LStyEu+cYd0pgqPxoH+FqOlKW0CTn9
         SonuXWr0UAai69mNcO/zJ6a0d1XM8JrO/AiYx6kg5Z9mOqgafqs12HC9O5OOZaqmyNsA
         Wx1MxOU01K4kMH1vmWC6327GSd69ghn63ALLdd9PdEAMSxRhqrhhQZGNKuYOGVzk5jT2
         4j6KWiv7xGG1jh+G6PBrLC8j/j8HymwmwhkrnNoWuD4Ja8crADvYuSvpzSHkQ5MkQgIl
         X35AMQnmLbThPIUqbAhb0GR7w7QRibr8Us6Wc7v/CkCgkHnqcOwo4RSsdRnbUOyRatft
         A6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rw9II8yNG1e/EGw+d95WfeKsIJyFJ3Hb1OX6V58ZRlw=;
        b=krSsudHA3JjPv6QQ2tZ/4QOEf96ApPDbii9KAk7Jbv7qCT+wiBWDeiaecMMBe3zVIJ
         lXiM7b4CvMBQu6eWr+bOGJmkcgaf2TXFAUFG/Skhe3IX6xo6G0+Go0qs7eqWFBFQkE9Z
         iWffnCPvWzzQRBC7PhmBPUAET8uaR4+A34RezYOeFoRaY8Lgy/7K1y99B3IO/X5vpryB
         eZo/iRp17coFK2X8mkhm8ZtEClVyEKePB4fKQ/cAJTHjosvuu2fvpR0i4WZDOJbHCYjJ
         1SfaJAOx/B/8V4TTXtD60UQm8bX/K2nDuX8HWvGtdmBkjqRePYYtqfV0lfqYzAoomUr1
         FvqQ==
X-Gm-Message-State: AOAM531DMSllZNpH0ZHDiT6VN3isv+9AcYbk3NQtHypXTfarQq0gZAfZ
        jp57Cy4nxHsOhLGUHA/yaZIl2R7cK3+Odp4ebkE=
X-Google-Smtp-Source: ABdhPJwUc9HZ96zvgj5uTrQDrWfElS2TNE81h7K2S0Cpqop6Uwiyrou2mA6rPr0tjr1uFjLr456N9EY0x17xiepUwmA=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr8166927pgg.74.1618843179581;
 Mon, 19 Apr 2021 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
 <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com>
 <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com> <CAMuHMdX1D+2iLPEDzG9BiR8bu-dEBmE-=w0nFMhF8ojD7rCfzg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1D+2iLPEDzG9BiR8bu-dEBmE-=w0nFMhF8ojD7rCfzg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 17:39:23 +0300
Message-ID: <CAHp75VfPsq+Bv=nbFtbLyU3=ihEdHhEWpZO+1SEutPz_ByELtw@mail.gmail.com>
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

On Mon, Apr 19, 2021 at 5:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Apr 19, 2021 at 3:58 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

> Please tell me how this driver will be probed when CONFIG_ACPI
> is disabled (it cannot, as nothing instantiates platform devices of the
> right type, so there is no reason to bother the user with a question about
> this driver when configuring his kernel).

Go ahead with it in v2. I'll not block you.

-- 
With Best Regards,
Andy Shevchenko
