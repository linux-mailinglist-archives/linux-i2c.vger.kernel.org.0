Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33747616530
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 15:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbiKBOav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 10:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiKBOaI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 10:30:08 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408E52A968
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667399407; x=1698935407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PU1D9vGFAD+hZGQOs8Zc5XAg8YMa3BXeF4a79TDAlO8=;
  b=RcbQuBu31VgbsUx3OfFuDXjN74Luhqf+P0PkdKjwzrT7tVUtXMctmW2W
   3LKBzekCOoOFnl8g0yKYWipDRoqOo7F6iD9N4QAfB52bhRqfBAViwbWnu
   lLxdR3P+PH+E+bq7DTlRrM44apN9f0yZwWY9esXjYTKNP5B0uQ0q+HH5T
   nYNoV4PvNheRtx0nzYotopToqS1K60clRi2plor7OLXq7GICN6hl00CFN
   Cq8nziO/T6JKeRCp9ARVkrwqH8FhMI2ZxWnutbP4KOYd0NlFyKeGviH7A
   ++/9ifnPb8SkoWTa/hmTLjzkbBvvabN+5JZiysht+jUG+WGZJRp0D8F4Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="309419440"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="309419440"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 07:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="879496227"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="879496227"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2022 07:28:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oqEjJ-006DRO-0s;
        Wed, 02 Nov 2022 16:28:33 +0200
Date:   Wed, 2 Nov 2022 16:28:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
Subject: Re: [PATCH v2 00/12] i2c: designware: Slave fixes and generic
 cleanups
Message-ID: <Y2J+kHMjYjZJP+KR@smile.fi.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 02, 2022 at 03:11:13PM +0200, Jarkko Nikula wrote:
> Hi
> 
> Version 2 of the patchset I sent last week:
> https://www.spinics.net/lists/linux-i2c/msg58933.html
> 
> Changes address the comments Andy made and is rebased on top of current
> i2c/for-next.
> 
> Luis Oliveira is not Cc'ed since I forgot his address is no longer working.

All look good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Changes:
> - Patch 07/12 is using GENMASK(31, 0) instead of ~0
> - Patch 10/12 Two leftovers from v1 removed and updated commit log
> - Patch 11/12 Removed accidental "struct i2c_bus_recovery_info rinfo" missalign
> - Patch 12/12 New patch commenting ASCII values of register value constants
> 
> Jarkko Nikula (12):
>   i2c: designware: Fix slave state machine for sequential reads
>   i2c: designware: Empty receive FIFO in slave interrupt handler
>   i2c: designware: Define software status flags with BIT()
>   i2c: designware: Remove needless initializations from
>     i2c_dw_reg_slave()
>   i2c: designware: Remove unused completion code from
>     i2c-designware-slave
>   i2c: designware: Simplify slave interrupt handler nesting
>   i2c: designware: Do not process interrupt when device is suspended
>   i2c: designware: Move debug print in i2c_dw_isr()
>   i2c: designware: Simplify master interrupt handler nesting
>   i2c: designware: Remove common i2c_dw_disable_int()
>   i2c: designware: Align defines in i2c-designware-core.h
>   i2c: designware: Add comment to custom register value constants
> 
>  drivers/i2c/busses/i2c-designware-common.c |   5 -
>  drivers/i2c/busses/i2c-designware-core.h   | 235 ++++++++++-----------
>  drivers/i2c/busses/i2c-designware-master.c |  44 ++--
>  drivers/i2c/busses/i2c-designware-slave.c  |  77 +++----
>  4 files changed, 163 insertions(+), 198 deletions(-)
> 
> base-commit: d28187f693ac5222d3b30955415143cd8e3b5edf
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


