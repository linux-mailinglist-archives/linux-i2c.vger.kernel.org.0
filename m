Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F92463A97
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 16:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239882AbhK3P4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 10:56:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:2534 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242260AbhK3PyL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Nov 2021 10:54:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="297045988"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="297045988"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 07:50:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="676879872"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 07:50:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ms5O2-000bCI-9c;
        Tue, 30 Nov 2021 17:49:42 +0200
Date:   Tue, 30 Nov 2021 17:49:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Wolfram Sang <wsa@kernel.org>, lakshmi.sowjanya.d@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
Message-ID: <YaZIFTHCGb5dLM2f@smile.fi.intel.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
 <YaUGX27+jHwQxg48@kunai>
 <YaXrkJbsktXFAgFJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaXrkJbsktXFAgFJ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 30, 2021 at 11:14:57AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 29, 2021 at 05:57:03PM +0100, Wolfram Sang wrote:
> > On Tue, Nov 09, 2021 at 04:05:52PM +0530, lakshmi.sowjanya.d@intel.com wrote:
> > > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > > 
> > > Set optimal HCNT, LCNT and hold time values for all the speeds supported
> > > in Intel Programmable Service Engine I2C controller in Intel Elkhart
> > > Lake.
> > > 
> > > Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > 
> > Applied to for-next, thanks!
> 
> Oh là là! Can we revert these, please?
> 
> After the commit 64d0a0755c7d ("i2c: designware: Read counters from ACPI for
> PCI driver") the PCI driver should get this from ACPI tables, no hard coding
> needed anymore. I did that series to address this very issue.
> 
> So, Lakshmi, please ask for BIOS fix as we discussed long time ago.

For the record, I have just checked the DSDT dump I have from
Elkhart Lake machine and BIOS provides those counters for devices
\_SB.PCI0.I2C0 .. \_SB.PCI0.I2C5 (6 devices altogether).

So, BIOS is quite aware of the interface and patches are not needed.
I rather add a comment there that these tables in the driver shouldn't
be spread and expanded anymore (at least by Intel).

-- 
With Best Regards,
Andy Shevchenko


