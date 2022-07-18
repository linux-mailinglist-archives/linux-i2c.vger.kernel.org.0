Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A662457808D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 13:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiGRLR4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 07:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbiGRLRy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 07:17:54 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F73A201A6;
        Mon, 18 Jul 2022 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658143073; x=1689679073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpqXmie6D9DsH9mDkAnCsfL2eLPGa6h9nC1O717sCwo=;
  b=cURgWqaW9Lu9LegfsezxykDu/beK25EE3rbW0zMJcqSra9P939iuxMzp
   0PcP0aOGZUWZyPIQIzTvSlFfkEPQtP/b+Swq40zFTICLPdm7MsFTCRpoq
   FxlykXm/M79vT9CkFornHOeNs3nfESLH4hXCC5OvijSSk8/W4C0uganuw
   ZneLsGIR8tddAZw8sD2/Qxv1mFDuOG6NpvQzNy6FUf5GybNIQ/kuU7CF2
   IXC/zW7olnvselFsidhZCkbeTNxeX7yg33yUjKDotK3Kc2fNWRNYiPQIb
   /i6BuUvIuRYCQ7erashf3Q3ZK1+VeHAx17M7adMoF6Vh0fVGHX/lIUtH8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="287342817"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="287342817"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 04:17:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="686702470"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 04:17:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oDOkw-001O8N-2k;
        Mon, 18 Jul 2022 14:17:42 +0300
Date:   Mon, 18 Jul 2022 14:17:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <YtVBViMLFIUfFpXa@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 06, 2022 at 07:41:26PM +0300, Andy Shevchenko wrote:
> There are a few users that would like to utilize P2SB mechanism of hiding
> and unhiding a device from the PCI configuration space.
> 
> Here is the series to consolidate p2sb handling code for existing users
> and to provide a generic way for new comer(s).
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that brings the helper ("platform/x86/intel: Add Primary to
> Sideband (P2SB) bridge support") has a commit message that sheds a light
> on what the P2SB is and why this is needed.
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> The series is ready to be merged via MFD tree, but see below.
> 
> The series also includes updates for Simatic IPC drivers that partially
> tagged by respective maintainers (the main question is if Pavel is okay
> with the last three patches, since I believe Hans is okay with removing
> some code under PDx86). Hence the first 8 patches can be merged right
> away and the rest when Pavel does his review.

Kernel test bot seems found an issue with dependencies, because selection
of P2SB is not enough.

There are two solutions that I can see now:
1) move P2SB out of X86_PLATFORM_DEVICES section (like PMC_ATOM);
2) add 'depends on X86_PLATFORM_DEVICES' to the affected drivers.

I think the first solution cleaner, because it would be strange to have
the dependency on the drivers that quite unlikely be on server platforms
(e.g. EDAC).

In long term perhaps something like drivers/platform/x86/lib which is for
platform libraries or so and independent on X86_PLATFORM_DEVICES?

I will send a fix soon as per 1) above, feel free to comment here or there.

-- 
With Best Regards,
Andy Shevchenko


