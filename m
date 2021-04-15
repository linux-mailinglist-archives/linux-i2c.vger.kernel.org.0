Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AA03604DB
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 10:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhDOIvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 04:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbhDOIvQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 04:51:16 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E463C061574;
        Thu, 15 Apr 2021 01:50:53 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso12306354pjh.2;
        Thu, 15 Apr 2021 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6iDhpxs+5W7xhPPyWJKa/R+jas3XNSVfnqzpKFbZZU=;
        b=B+ez1qQ9sBLxXH4vCYkoOsbsReIFeuRgpufyG/GNuSDjvMTLH/lsJ4Z+LBBn/TOrQF
         szrpnnQgNzsYiw+HAZQZ3l7htgHIeUlcR+dA0k1gR4H4AXzAiynKqRg9X0SFBL6dg4R/
         NggkhLdNMmzcTmo18+W/fvcX2CZr3ZXsSoD35xABi8kAIn25K8ez8+gVukHpre+Ul7Zn
         y9OEBngmvk3WfLRAEFHrs83CWqx/eHYidt8ysxoHQ55f/mJmuLvnkzgaz3LFfjyUqdPU
         whbKGPrCi1QM5owa9v67QYX36uPmE2fCS79xO2spxtdILSaIg5ytw5ecMQiG+sxvLPac
         OujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6iDhpxs+5W7xhPPyWJKa/R+jas3XNSVfnqzpKFbZZU=;
        b=DPd9C7OJ417hgh9PFgAEGiMMR9gG4V31QIRSkLnCkSVyhEgSEgfYyXfjwg6UwCoBGY
         u67Ic0sng4b6OuEBugq9BhIi8XxTQ/Ho4fnHY3OH/SHPXs4lK5F4NQGDkvPgoRbmnf1g
         I9H/brEu30rmNjSFx6IrSZszu0LHKfV8y60gjJKDq4CZi3uT+TICxFBlp5e4N/kp3N1F
         0pJ6nyZd8Mdf9QyeJZxGFeONGPUekFXU8aCHVDecWBnSC3R33qzP38Tk8Z+bG6+MdYvS
         3INb9XK1V9CzzVbgRUUAp7f9AzQ3bqUlmMzM+45FOph8BSaWTG08Fcy56BzBTP9Udx5p
         nRHA==
X-Gm-Message-State: AOAM530kJg9f8hRCZ7N//uKuzhJM0myniF7djT90izvOcIcPawcNJ6qB
        e/oBLiYwAIZk7d7/d+NjisCzFkT8r6vLRbWrduU=
X-Google-Smtp-Source: ABdhPJxu3rXXptRhVwp318YsuQ/EdZ/T0jKYj0kA+UJCPu+zEaZ3KoV2zJXu2CU8TIiy144PbCGgxigIjv44P5IoquY=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr2799900plc.0.1618476652952; Thu, 15 Apr
 2021 01:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
In-Reply-To: <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Apr 2021 11:50:36 +0300
Message-ID: <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Apr 15, 2021 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:

...

> > > > > I guess it's still fine to add a dependency on ACPI?
> > > >
> > > > But why?
> > >
> > > Please tell me how/when the driver is used when CONFIG_ACPI=n.
> >
> > I'm not using it at all. Ask the author :-)
> >
> > But if we follow your logic, then we need to mark all the _platform_ drivers
> > for x86 world as ACPI dependent? This sounds ugly.
>
> Do all other x86 platform drivers have (1) an .acpi_match_table[] and
> (2) no other way of instantiating their devices?
> The first driver from the top of my memory I looked at is rtc-cmos:
> it has no .acpi_match_table[], and the rtc-cmos device is instantiated
> from arch/x86/kernel/rtc.c.
>
> For drivers with only an .of_match_table(), and no legacy users
> instantiating platform devices, we do have dependencies on OF.

This is not true. Entire IIO subsystem is an example.

-- 
With Best Regards,
Andy Shevchenko
