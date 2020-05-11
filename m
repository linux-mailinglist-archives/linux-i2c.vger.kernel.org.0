Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D4E1CDC81
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 16:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730314AbgEKOFP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 10:05:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:9676 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730274AbgEKOFP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 10:05:15 -0400
IronPort-SDR: zn8rp2hGO+3Ux5c/+0rPlpWM0/PVkhJwimjjsDf4ddEUWVYS3UB54DGYAy3XTPHfe0lKQ7zjL8
 g42AQzjzLsyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 07:05:14 -0700
IronPort-SDR: 0aegeyU+rkb68wI9p8KIAJQN5u5QTzkIlRYygUtB34ODPowD5ZsYNLnzCk6earRBA4XbUOH4lA
 MB/7Lx1D8Zxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="286281842"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 07:05:13 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jY93U-005zJ9-A1; Mon, 11 May 2020 17:05:16 +0300
Date:   Mon, 11 May 2020 17:05:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/4] i2c: designware: Split out ACPI parts into
 separate module
Message-ID: <20200511140516.GL185537@smile.fi.intel.com>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
 <20200507135140.14635-3-andriy.shevchenko@linux.intel.com>
 <407cc9b3-fd56-43bf-1361-c6b1aec0442f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407cc9b3-fd56-43bf-1361-c6b1aec0442f@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 11, 2020 at 04:31:18PM +0300, Jarkko Nikula wrote:
> On 5/7/20 4:51 PM, Andy Shevchenko wrote:
> > For better maintenance and possible code reuse in the future,
> > split out ACPI parts into a separate module.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   drivers/i2c/busses/Makefile                 |   3 +
> >   drivers/i2c/busses/i2c-designware-acpi.c    | 130 +++++++++++++++++
> >   drivers/i2c/busses/i2c-designware-core.h    |   8 ++
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 151 +++-----------------
> >   4 files changed, 163 insertions(+), 129 deletions(-)
> >   create mode 100644 drivers/i2c/busses/i2c-designware-acpi.c
> > 
> Comment to both of this and patch 2/4:
> 
> I'm not so fan of introducing even more i2c-designware modules. No any other
> drivers have so many files as i2c-designware in drivers/i2c/busses/*.c.
> Feeling a bit of hall of shame because of it :-)
> 
> What's the rationale here? Currently i2c-designware-platdrv.c is 512 lines
> of code so it's not too hard to maintain in my opinion.

How to use same functionality in PCI and platform driver? Are you implying that
the common.c is good enough? I would move there, of course.

-- 
With Best Regards,
Andy Shevchenko


