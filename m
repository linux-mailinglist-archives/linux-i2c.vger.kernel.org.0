Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4AD462F62
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 10:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240032AbhK3JTX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:19:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:11777 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235402AbhK3JTW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Nov 2021 04:19:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236001416"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="236001416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 01:16:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="601334397"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 01:16:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mrzE1-000P6g-8K;
        Tue, 30 Nov 2021 11:14:57 +0200
Date:   Tue, 30 Nov 2021 11:14:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Wolfram Sang <wsa@kernel.org>, lakshmi.sowjanya.d@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
Message-ID: <YaXrkJbsktXFAgFJ@smile.fi.intel.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
 <YaUGX27+jHwQxg48@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaUGX27+jHwQxg48@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 29, 2021 at 05:57:03PM +0100, Wolfram Sang wrote:
> On Tue, Nov 09, 2021 at 04:05:52PM +0530, lakshmi.sowjanya.d@intel.com wrote:
> > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > 
> > Set optimal HCNT, LCNT and hold time values for all the speeds supported
> > in Intel Programmable Service Engine I2C controller in Intel Elkhart
> > Lake.
> > 
> > Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> 
> Applied to for-next, thanks!

Oh là là! Can we revert these, please?

After the commit 64d0a0755c7d ("i2c: designware: Read counters from ACPI for
PCI driver") the PCI driver should get this from ACPI tables, no hard coding
needed anymore. I did that series to address this very issue.

So, Lakshmi, please ask for BIOS fix as we discussed long time ago.

-- 
With Best Regards,
Andy Shevchenko


