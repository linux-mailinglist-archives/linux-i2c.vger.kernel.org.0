Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB5B35FB66
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 21:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352037AbhDNTOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 15:14:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:6090 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234810AbhDNTOd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 15:14:33 -0400
IronPort-SDR: xBgx9sbQT3IsgryJ/amAmSLeUiPG+Uas9BMJKmEL+oPXF2KKYdtzI+/W0BMhHrNfIYztL7dlDy
 8NqnkyCNWhRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174820144"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="174820144"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 12:14:11 -0700
IronPort-SDR: zikZ0vApu1KHhNyZ89lWF495VbGWfFolKVkrJN9M51UT0i2Lon4fSa5vXCxs5GuOmtk7olwrHP
 gwjNJYORAKQQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="382464970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 12:14:08 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWkxg-00456I-Uc; Wed, 14 Apr 2021 22:14:04 +0300
Date:   Wed, 14 Apr 2021 22:14:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Message-ID: <YHc+/MOWA6rO+1Wy@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
 <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com>
 <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> > > > On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> > > > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > > > about this driver when configuring a kernel without Hisilicon platform
> > > > > or ACPI firmware support.
> > > >
> > > > this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> > > > not sure all the platform this IP on has ARCH_HISI configured. The driver
> > > > will not be compiled by default config. This is not correct to have
> > > > this dependence.
> > >
> > > Thanks for your answer!
> > >
> > > I guess it's still fine to add a dependency on ACPI?
> >
> > But why?
> 
> Please tell me how/when the driver is used when CONFIG_ACPI=n.

I'm not using it at all. Ask the author :-)

But if we follow your logic, then we need to mark all the _platform_ drivers
for x86 world as ACPI dependent? This sounds ugly.

So, if you are going to send a such patch, NAK here from me.
Same here. NAK.

-- 
With Best Regards,
Andy Shevchenko


