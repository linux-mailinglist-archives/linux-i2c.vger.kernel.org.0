Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82EF5715E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 21:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfFZTLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 15:11:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:24809 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFZTLP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 15:11:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 12:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; 
   d="scan'208";a="167141508"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2019 12:11:11 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hgDK2-0002SX-2f; Wed, 26 Jun 2019 22:11:10 +0300
Date:   Wed, 26 Jun 2019 22:11:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v7 0/6] I2C IRQ Probe Improvements
Message-ID: <20190626191110.GB9224@smile.fi.intel.com>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 26, 2019 at 04:02:56PM +0100, Charles Keepax wrote:
> This series attempts to align as much IRQ handling into the
> probe path as possible. Note that I don't have a great setup
> for testing these patches so they are mostly just build tested
> and need careful review and testing before any of them are
> merged.
> 
> The series brings the ACPI path inline with the way the device
> tree path handles the IRQ entirely at probe time. However,
> it still leaves any IRQ specified through the board_info as
> being handled at device time. In that case we need to cache
> something from the board_info until probe time, which leaves
> any alternative solution with something basically the same as
> the current handling although perhaps caching more stuff.
> 

Thanks!
After addressing one comment, take my

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

for all patches which lack it now.

> Thanks,
> Charles
> 
> See previous discussions:
>  - https://lkml.org/lkml/2019/2/15/989
>  - https://www.spinics.net/lists/linux-i2c/msg39541.html
> 
> Charles Keepax (6):
>   i2c: core: Allow whole core to use i2c_dev_irq_from_resources
>   i2c: acpi: Use available IRQ helper functions
>   i2c: acpi: Factor out getting the IRQ from ACPI
>   i2c: core: Move ACPI IRQ handling to probe time
>   i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
>   i2c: core: Tidy up handling of init_irq
> 
>  drivers/i2c/i2c-core-acpi.c | 59 ++++++++++++++++++++++++++++++++-------------
>  drivers/i2c/i2c-core-base.c | 11 +++++----
>  drivers/i2c/i2c-core.h      |  9 +++++++
>  3 files changed, 57 insertions(+), 22 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


