Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6996C357F8B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 11:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhDHJoJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 05:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhDHJoF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 05:44:05 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D99C061760;
        Thu,  8 Apr 2021 02:43:53 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id a85so951240pfa.0;
        Thu, 08 Apr 2021 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hXTlbDK9vvFZbVBVbkmf9cc5XE6+3LtqaiUG7W1XCH0=;
        b=fl73aGuIHBBPNVLJyOgdAUXimE2pvcqhUPDQNL/9XB+967BEwY8MKnOdaw7mMqglhG
         YxLRkHllLm381ozVfhckQHKt+l9ydNkiMItjlNPdrsJQTBa/h5fQGbG0XKdjwiS/AiVZ
         /GGeon7H9NuPr68dbeFCM5TWcNSUfmU7mgTmaRFIU55+JejKeJomz2Z0XYV0zfukZKeO
         sG1UKLs+FMzw4YfNUeLRl4nLXyAjw9cXthABlIqPBTNbCTyj8SBtL6UCF5OoAF3ZLBXc
         FoNRMxkfCQIawoVRDnqUnXc8YYCzrt4zmA2urYotttRjIi5dJVTAYkQD+0JMokbTtt5n
         Yh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hXTlbDK9vvFZbVBVbkmf9cc5XE6+3LtqaiUG7W1XCH0=;
        b=bEdTSkPi6gKuOmiVt7Eyo7kt1m2ha6W4wAIEBFw37hNLHCxdd/f3I2OfXqiZxTJs7i
         SCSj59ZFqRypjBPD+sApt8cdoYZHNoOD0zLMt2ILmKW74kkzow+GJMgxHD2vcJAQmRnM
         HBJNU5Uh0PuHRUE7eA8k0oMOhOoV/H8JzMVb1v3+gsREXmDZ6PFmJGqjezWh0z0aA0Lp
         oNjcu37JaZUoWOaM0wc1yG2k5pkaI9p3JeF5Jhlh5ebvP97CtEC7v32g/bUiadSZlKVP
         sTQctN728iVpIUdipOnLUz6hM8c+drnFu3ztx35wyL25Gcl0PCBa8pZonqHvCd2l4bqn
         VJlw==
X-Gm-Message-State: AOAM531TCaJUmNxXjUl7j03ZnH1hzGITMzA7nYNOC154yExnFpuGBtQk
        9h3EOBO1v5ZU7PBoYo7YpOF15sg0Fzl25xg4/tM=
X-Google-Smtp-Source: ABdhPJxrCR4TUvws6U/8Cg1u4rxuaLxXimtvZO6SHw/Cy7VELojsStOGMZiibRso26kSuoyWLwbfIeWOMCubwTABQk8=
X-Received: by 2002:a63:c48:: with SMTP id 8mr7234159pgm.74.1617875033137;
 Thu, 08 Apr 2021 02:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
 <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com> <20210407230421.GB860@kunai>
 <5c478c9b-fc2a-2dd7-6191-8f68e265c2f7@hisilicon.com>
In-Reply-To: <5c478c9b-fc2a-2dd7-6191-8f68e265c2f7@hisilicon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Apr 2021 12:43:36 +0300
Message-ID: <CAHp75Vfpg4zdSM2eXe8yFsMAJUea_NSjvMRgxqYOF2nDvZA1wg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Barry Song <song.bao.hua@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        prime.zeng@huawei.com, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 8, 2021 at 10:17 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> On 2021/4/8 7:04, Wolfram Sang wrote:
> >
> >> Reason for temp variable is for me it's confusing to see statement like
> >> "rate_khz = rate_khz / 1000".
> >
> > Yes. And with this clearer calculation, we can maybe skip the HZ_PER_KHZ
> > define completely and just use plain '1000' as a factor/divider because
> > it then becomes obvious. I still find the define more confusing than
> > helpful TBH. But I'll leave the final decision to Yicong Yang.
> >
>
> HZ_PER_KHZ macro are defined separately in other places of the kernel.
> Andy suggested to have this defined and used so that one day we can factor
> this macro out to the public. :)

Right, and I'm still for the idea to have a macro defined.

-- 
With Best Regards,
Andy Shevchenko
