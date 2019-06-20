Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572004D128
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 17:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732165AbfFTPAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 11:00:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:2903 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732148AbfFTPAo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 11:00:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 08:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; 
   d="scan'208";a="162387155"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2019 08:00:40 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hdyYJ-0001PS-8N; Thu, 20 Jun 2019 18:00:39 +0300
Date:   Thu, 20 Jun 2019 18:00:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 0/7] I2C IRQ Probe Improvements
Message-ID: <20190620150039.GF9224@smile.fi.intel.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 20, 2019 at 02:34:13PM +0100, Charles Keepax wrote:
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

Thank you for an update.
I asked few last minute questions on per patch basis.

> 
> Thanks,
> Charles
> 
> See previous discussions:
>  - https://lkml.org/lkml/2019/2/15/989
>  - https://www.spinics.net/lists/linux-i2c/msg39541.html
> 
> Charles Keepax (7):
>   i2c: core: Allow whole core to use i2c_dev_irq_from_resources
>   i2c: acpi: Use available IRQ helper functions
>   i2c: acpi: Factor out getting the IRQ from ACPI
>   i2c: core: Make i2c_acpi_get_irq available to the rest of the I2C core
>   i2c: core: Move ACPI IRQ handling to probe time
>   i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
>   i2c: core: Tidy up handling of init_irq
> 
>  drivers/i2c/i2c-core-acpi.c | 57 +++++++++++++++++++++++++++++++--------------
>  drivers/i2c/i2c-core-base.c | 11 +++++----
>  drivers/i2c/i2c-core.h      | 11 +++++++++
>  3 files changed, 57 insertions(+), 22 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


