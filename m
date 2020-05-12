Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C451CFA53
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 18:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgELQOo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 12:14:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:11707 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728164AbgELQOn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 12:14:43 -0400
IronPort-SDR: 2NaG36gMiDKhfuaVmfM4lv+75+9LA1XI2D0lWK2qe4JUzn7YKdovgFLrjBQCOj5w5RjJ7QBHuq
 +UBr8AyRWz8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 09:14:42 -0700
IronPort-SDR: /lBrwxSb+rFwF/p/A3dLkJzeigwBW8/JL6Dnzqi0mKZgay3IHQ7hNxVsXlRhpKgZeaK3O7DW8o
 Qx/k4L7+AUkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="250945371"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2020 09:14:40 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jYXYJ-006FvB-78; Tue, 12 May 2020 19:14:43 +0300
Date:   Tue, 12 May 2020 19:14:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 5/5] i2c: designware: Allow slave mode for PCI
 enumerated devices
Message-ID: <20200512161443.GA1491106@smile.fi.intel.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
 <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
 <9f6213e9-e14c-a4b2-eb10-d5463dbe2c19@linux.intel.com>
 <20200428221831.GC7698@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428221831.GC7698@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 29, 2020 at 12:18:31AM +0200, Wolfram Sang wrote:
> On Mon, Apr 27, 2020 at 05:05:35PM +0300, Jarkko Nikula wrote:
> > On 4/25/20 4:44 PM, Andy Shevchenko wrote:
> > > Allow slave mode for PCI enumerated devices by calling a common i2c_dw_probe()
> > > instead of i2c_dw_probe_master().
> > > 
> > > While dropping dependency to platform driver in slave module, move its
> > > configuration section above, closer to core.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > > v2: new patch
> > >   drivers/i2c/busses/Kconfig                 | 21 ++++++++++-----------
> > >   drivers/i2c/busses/i2c-designware-pcidrv.c |  4 ++--
> > >   2 files changed, 12 insertions(+), 13 deletions(-)
> > > 
> > To all 5 patches
> > 
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> And all applied to for-next, thanks!

Wolfram, I do not see them in your tree.
Neither Linux next has them. Something should I do?

-- 
With Best Regards,
Andy Shevchenko


