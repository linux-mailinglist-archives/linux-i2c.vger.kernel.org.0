Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB1621208D
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgGBKEc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:04:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:60799 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgGBKEb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 06:04:31 -0400
IronPort-SDR: ThQrZNedRbhh8idl3yAPD77IRoo5tlh++WHks08hpZDQ3M4PylDYTwrQDxAWLTmx/S//Is2d7g
 aH/3+hLz2KYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="144369343"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="144369343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 03:04:30 -0700
IronPort-SDR: eV5vhCrF/V/avimrcklFEMXLzkWgEjeF2mAInxhkm4eizzd8n0KALSBTv4pAUztNCCrUhlAs/8
 aVjNORiPEevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="322050416"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 02 Jul 2020 03:04:28 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jqw50-00HBPd-1y; Thu, 02 Jul 2020 13:04:30 +0300
Date:   Thu, 2 Jul 2020 13:04:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     wsa@kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: algo-pca: Add 0x78 as SCL stuck low status
Message-ID: <20200702100430.GR3703480@smile.fi.intel.com>
References: <20200701223912.30864-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701223912.30864-1-chris.packham@alliedtelesis.co.nz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 02, 2020 at 10:39:11AM +1200, Chris Packham wrote:
> The PCA9665 datasheet says that I2CSTA = 78h indicates that SCL is stuck
> low, this differs to the PCA9564 which uses 90h for this indication.
> Treat either 0x78 or 0x90 as an indication that the SCL line is stuck.
> 
> Based on looking through the PCA9564 and PCA9665 datasheets this should
> be safe for both chips. The PCA9564 should not return 0x78 for any valid
> state and the PCA9665 should not return 0x90.

For me as well looks better this way.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - Note which status corresponds to which chip
> - Move patch commentary to commit message
> 
>  drivers/i2c/algos/i2c-algo-pca.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
> index 7f10312d1b88..388978775be0 100644
> --- a/drivers/i2c/algos/i2c-algo-pca.c
> +++ b/drivers/i2c/algos/i2c-algo-pca.c
> @@ -314,7 +314,8 @@ static int pca_xfer(struct i2c_adapter *i2c_adap,
>  			DEB2("BUS ERROR - SDA Stuck low\n");
>  			pca_reset(adap);
>  			goto out;
> -		case 0x90: /* Bus error - SCL stuck low */
> +		case 0x78: /* Bus error - SCL stuck low (PCA9665) */
> +		case 0x90: /* Bus error - SCL stuck low (PCA9564) */
>  			DEB2("BUS ERROR - SCL Stuck low\n");
>  			pca_reset(adap);
>  			goto out;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


