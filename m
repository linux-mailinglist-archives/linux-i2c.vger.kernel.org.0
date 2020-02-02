Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B165214FF00
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2020 20:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgBBTwa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Feb 2020 14:52:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:33018 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgBBTwa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Feb 2020 14:52:30 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Feb 2020 11:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,395,1574150400"; 
   d="scan'208";a="223714928"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 02 Feb 2020 11:52:02 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iyLHo-0005E6-2E; Sun, 02 Feb 2020 21:52:04 +0200
Date:   Sun, 2 Feb 2020 21:52:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanjun Guo <guohanjun@huawei.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linuxarm@huawei.com, Sheng Feng <fengsheng5@huawei.com>
Subject: Re: [PATCH 1/2] i2c: designware: Add ACPI HID for Hisilicon
 Hip08-Lite I2C controller
Message-ID: <20200202195204.GV32742@smile.fi.intel.com>
References: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 02, 2020 at 07:34:14PM +0800, Hanjun Guo wrote:
> Add ACPI HID HISI02A3 for Hisilicon Hip08 Lite, which has different
> clock frequency from Hip08 for I2C controller.

The series is good for me, but I think you should reverse the order of the
patches in it.

> Tested-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 16dd338..3b7d58c 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -130,6 +130,7 @@ static int dw_i2c_acpi_configure(struct platform_device *pdev)
>  	{ "APMC0D0F", 0 },
>  	{ "HISI02A1", 0 },
>  	{ "HISI02A2", 0 },
> +	{ "HISI02A3", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> -- 
> 1.7.12.4
> 

-- 
With Best Regards,
Andy Shevchenko


