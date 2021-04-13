Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E363435E1BE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344059AbhDMOl6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:41:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:29608 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343989AbhDMOl5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 10:41:57 -0400
IronPort-SDR: mEfQT61Wj7mlsTR5eG47696++DPpatJu3REIJ8MBsIjCkPuKC9Se+T99uMl2RXyd0K31VRjLTv
 RchNZFcdtOrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="258398120"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="258398120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:41:35 -0700
IronPort-SDR: BHBROY0G8Rf5UwPmEOHL3w+0AYNLRlRk4f1J/QWb5YQwi0g304cW8aRWaqSUilie2N4P2HB68P
 1vbxZUsjBqrg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="521619792"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:41:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWKEK-003mj2-JO; Tue, 13 Apr 2021 17:41:28 +0300
Date:   Tue, 13 Apr 2021 17:41:28 +0300
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
Message-ID: <YHWtmBTSKzFMQ/Dy@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <YHWQaQaw53eZtYzn@smile.fi.intel.com>
 <CAMuHMdX29zQHaC9UgGyGad-LxRRK=hBKVHVZ5+9_Cawqk=NMtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX29zQHaC9UgGyGad-LxRRK=hBKVHVZ5+9_Cawqk=NMtA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 02:48:15PM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 13, 2021 at 2:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 13, 2021 at 02:26:15PM +0200, Geert Uytterhoeven wrote:
> > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > about this driver when configuring a kernel without Hisilicon platform
> > > or ACPI firmware support.
> >
> > I don't by the ACPI dependency, sorry.
> >
> > The driver is a pure platform driver that can be enumerated on ACPI enabled
> > devices, but otherwise it can be used as a platform one.
> 
> Sure, you can manually instantiate a platform device with a matching
> name, and set up the "clk_rate" device property.
> But would it make sense to do that? Would anyone ever do that?

It will narrow down the possibility to have One Kernel for as many as possible
platforms.

> The corresponding SPI_HISI_KUNPENG depends on ACPI, too.

-- 
With Best Regards,
Andy Shevchenko


