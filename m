Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2C035E283
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 17:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbhDMPTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 11:19:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:47879 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229666AbhDMPTh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 11:19:37 -0400
IronPort-SDR: utkXdyqFAxWkMSNx88iU+zIYMHlTdxJlIGysw34qz5G7+b/bXws5ORb5wK/d6tbqVQmAmc1Vj9
 Jr7NfzeFmwMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="192308440"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="192308440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 08:19:16 -0700
IronPort-SDR: X219gHHz8kzHn2xu7wq2ixh9m7MiJuE4NdlA41TZxuyJl6Zw/I7a9PUqJSjQyI8Gcl4m1HvF1H
 VKxK4mE3aLzA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="521633732"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 08:19:14 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWKop-003nEY-Oq; Tue, 13 Apr 2021 18:19:11 +0300
Date:   Tue, 13 Apr 2021 18:19:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Message-ID: <YHW2b4aBHh3ohs8r@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <YHWQaQaw53eZtYzn@smile.fi.intel.com>
 <CAMuHMdX29zQHaC9UgGyGad-LxRRK=hBKVHVZ5+9_Cawqk=NMtA@mail.gmail.com>
 <YHWtmBTSKzFMQ/Dy@smile.fi.intel.com>
 <CAMuHMdV1kTcPhutZZa04zd53C37Ci7Fr51nq1z8OX3kg1C14CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1kTcPhutZZa04zd53C37Ci7Fr51nq1z8OX3kg1C14CA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 04:44:33PM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 13, 2021 at 4:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 13, 2021 at 02:48:15PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Apr 13, 2021 at 2:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Apr 13, 2021 at 02:26:15PM +0200, Geert Uytterhoeven wrote:
> > > > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > > > about this driver when configuring a kernel without Hisilicon platform
> > > > > or ACPI firmware support.
> > > >
> > > > I don't by the ACPI dependency, sorry.
> > > >
> > > > The driver is a pure platform driver that can be enumerated on ACPI enabled
> > > > devices, but otherwise it can be used as a platform one.
> > >
> > > Sure, you can manually instantiate a platform device with a matching
> > > name, and set up the "clk_rate" device property.
> > > But would it make sense to do that? Would anyone ever do that?
> >
> > It will narrow down the possibility to have One Kernel for as many as possible
> > platforms.
> 
> That One Kernel needs to have CONFIG_ACPI enabled to use I2C on the
> HiSilicon Kunpeng.  If CONFIG_ACPI is disabled, it cannot be used, as there
> is no other code that creates "hisi-i2c" platform devices.

It is fine, but since you add a dependency to the ARCH variant, the ACPI should
be added there, not here. Here is simply wrong place for this dependency as driver
is *not* dependent on ACPI per se.

-- 
With Best Regards,
Andy Shevchenko


