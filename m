Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1247E616
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 16:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbhLWPzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 10:55:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:47181 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231974AbhLWPzb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Dec 2021 10:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640274931; x=1671810931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eoq3IQ3HEs2cTlYpYY/HXtuejXWzsO7qZJoQ6uinrMU=;
  b=KpkDSfxkMD/+eOjwDqvI78OB9nfKqhTpr4RDlct/Y3LTtFZFPL4MFt64
   9ettBKW0nxTL3p/OF8m1hMwmcB/ttYKTvsFrMoRlD65GHHjMNWOkBnWbm
   XY1QNa94lqIt6SjIW4MdUmeHmTH6vWue5zDygOAFE+3rR1mLAQuCXPek+
   XgJ5jUN11wmWE+Efh30O+s5IeMlNJoxLsvEX6x13/VqmUJVEpeJVcrPjf
   mXVQmzaS141mYwc4ekbYldrzXVmNtxB7tdurTTOHYrFblqxN3Ti0ZBFMu
   QV9PDvw1rMTpIjh5F4+hQ2nTXJ3RCDBWIWV/SlytoOM+p9tCIC4Cce4vi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="327157245"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="327157245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 07:55:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="587346317"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 07:55:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n0QPp-001Iqq-B3;
        Thu, 23 Dec 2021 17:54:01 +0200
Date:   Thu, 23 Dec 2021 17:54:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <YcSbmQq4sCd9Dshy@smile.fi.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 08:15:18PM +0200, Andy Shevchenko wrote:
> There are a few users and at least one more is coming that would
> like to utilize P2SB mechanism of hiding and unhiding a device from
> the PCI configuration space.
> 
> Here is the series to deduplicate existing users and provide
> a generic way for new comers.
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that bring the helper ("platform/x86/intel: Add Primary
> to Sideband (P2SB) bridge support") has a commit message that
> sheds a light on what the P2SB is and why this is needed.
> 
> Please, comment on the approach and individual patches.
> 
> The changes made in v2 do not change the main idea and the functionality
> in a big scale. What we need is probably one more (RE-)test done by Henning.
> I hope to have it merged to v5.17-rc1 that Siemens can develop their changes
> based on this series.
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> (Since it's cross subsystem, the PDx86 seems the main one and
> I think it makes sense to route it throught it with immutable
> tag or branch provided for the others).
> 
> Bjorn, are you okay with this approach and the commit message in the main
> patch?
> 
> Changes in v3:
> - resent with cover letter
> 
> Changes in v2:
> - added parentheses around bus in macros (Joe)
> - added tag (Jean)
> - fixed indentation and wrapping in the header (Christoph)
> - moved out of PCI realm to PDx86 as the best common denominator (Bjorn)
> - added a verbose commit message to explain P2SB thingy (Bjorn)
> - converted first parameter from pci_dev to pci_bus
> - made first two parameters (bus and devfn) optional (Henning, Lee)
> - added Intel pin control patch to the series (Henning, Mika)
> - fixed English style in the commit message of one of MFD patch (Lee)
> - added tags to my MFD LPC ICH patches (Lee)
> - used consistently (c) (Lee)
> - made indexing for MFD cell and resource arrays (Lee)
> - fixed the resource size in i801 (Jean)

I'm going to be on vacation till 2022-01-03, I'll address comments if any
during the first week of January and I hope it can make v5.17. Hans, what
do you think?

(Meanwhile I'm expecting that my patch to fix dependencies will be applied,
 so kbuild bot won't complain anymore on them being broken)

-- 
With Best Regards,
Andy Shevchenko


