Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798CE360742
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhDOKg4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 06:36:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:25587 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232233AbhDOKgy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 06:36:54 -0400
IronPort-SDR: IEnvXnyjXYVYrezVu2r7nicDeVzAtyb8S0rdydNq79UhbqEiDRsnPpEXbaXNmKs2Px+FIh7zcE
 U5zbpfhWH4FQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="258789617"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="258789617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 03:36:30 -0700
IronPort-SDR: JWGyp9+PPSR53zav66bKAZd/Xsmd/rWmwo2rlRUx4L7nniUkwlQUJOrKA7mp+07hmz2SRoJI37
 Rul1GLppECHQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="399530258"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 03:36:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWzMG-004DhB-5Q; Thu, 15 Apr 2021 13:36:24 +0300
Date:   Thu, 15 Apr 2021 13:36:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Message-ID: <YHgXKHvjnC5qzDPy@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
 <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <21d833f0-b1b8-9732-21c7-3a73676e07d3@hisilicon.com>
 <39f6bbed-9eea-963a-1ef1-a83248f162aa@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39f6bbed-9eea-963a-1ef1-a83248f162aa@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 15, 2021 at 05:04:39PM +0800, Yicong Yang wrote:
> On 2021/4/15 16:18, Yicong Yang wrote:
> > On 2021/4/15 2:06, Geert Uytterhoeven wrote:
> >> On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> >>> On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> >>>> The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> >>>> Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> >>>> Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> >>>> about this driver when configuring a kernel without Hisilicon platform
> >>>> or ACPI firmware support.
> >>>
> >>> this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> >>> not sure all the platform this IP on has ARCH_HISI configured. The driver
> >>> will not be compiled by default config. This is not correct to have
> >>> this dependence.
> >>
> >> Thanks for your answer!
> >>
> >> I guess it's still fine to add a dependency on ACPI?
> > 
> > yes. currently we only use this driver through ACPI. So at least
> > for this driver, it make sense to keep the dependency.
> > 
> 
> sorry. i was a little mess about this. I dropped this in [1].
> so just keep it as is.
> 
> [1] https://lore.kernel.org/linux-i2c/YGMntYT2iz72wgrd@smile.fi.intel.com/

If you think that ACPI dependency is good to have there, go ahead, not my
worries of the consequences. I just consider that as unneeded dependencies.

The proper fix would be to have a split in Kbuild infra for compile
dependencies and run-time dependencies.

+Cc: Masahiro for the discussion, maybe it had already taken place and there is
an impediment to do so.

-- 
With Best Regards,
Andy Shevchenko


