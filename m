Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BCD35FAAF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 20:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351579AbhDNSTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 14:19:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:6206 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351181AbhDNSTB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 14:19:01 -0400
IronPort-SDR: FkaWA9vYGEAvp7UUdK4tPCqMy+KymOZvbcs5jzSJdWX2gzZgysr3smbR2hRuNHEWr5EH1xK6IK
 gOnslymMrYBQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256022629"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="256022629"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 11:18:39 -0700
IronPort-SDR: 5A8f5t1RUp4VdMjycKZodAi04nXup7E+xILZDHlFh0roHmjrcJitplJg9HfXslv0wUZ1v4FgEw
 2vzuVK8/SJXg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="382449380"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 11:18:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWk5x-0044TC-JU; Wed, 14 Apr 2021 21:18:33 +0300
Date:   Wed, 14 Apr 2021 21:18:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Message-ID: <YHcx+QPbkTA0bv9V@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
 <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> > On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > about this driver when configuring a kernel without Hisilicon platform
> > > or ACPI firmware support.
> >
> > this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> > not sure all the platform this IP on has ARCH_HISI configured. The driver
> > will not be compiled by default config. This is not correct to have
> > this dependence.
> 
> Thanks for your answer!
> 
> I guess it's still fine to add a dependency on ACPI?

But why?

-- 
With Best Regards,
Andy Shevchenko


