Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2975816C403
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgBYOfr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:35:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:22044 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729895AbgBYOfr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:35:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 06:35:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="436276291"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2020 06:35:43 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j6bJJ-004ft5-Lt; Tue, 25 Feb 2020 16:35:45 +0200
Date:   Tue, 25 Feb 2020 16:35:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Martin Volf <martin.volf.42@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: i801: Do not add ICH_RES_IO_SMI if PMC device
 is not present
Message-ID: <20200225143545.GM10400@smile.fi.intel.com>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
 <20200225123802.88984-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225123802.88984-4-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 03:38:02PM +0300, Mika Westerberg wrote:
> Martin noticed that nct6775 driver does not load properly on his system
> in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
> i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
> likely not the culprit because the faulty code has been in the driver
> already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
> newer Intel PCHs"). So more likely some commit that added PCI IDs of
> recent chipsets made the driver to create the iTCO_wdt device on Martins
> system.
> 
> The issue was debugged to be PCI configuration access to the PMC device
> that is not present. This returns all 1's when read and this caused the
> iTCO_wdt driver to accidentally request resourses used by nct6775.
> 
> Fix this by checking that the PMC device is there and only then populate
> the iTCO_wdt ICH_RES_IO_SMI resource. Since the resource is now optional
> the iTCO_wdt driver should continue to work on recent systems without it.

...

>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 3, &spt_tco_platform_data,
> +					tco_res, nres + 1, &spt_tco_platform_data,
>  					sizeof(spt_tco_platform_data));

Perhaps use the same pattern as below, i.e.

	nres++;
	return ...(..., nres, ...);

?

...

>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 2, &cnl_tco_platform_data,
> +					tco_res, nres, &cnl_tco_platform_data,
>  					sizeof(cnl_tco_platform_data));

Ditto.

...

> +	nres++;

-- 
With Best Regards,
Andy Shevchenko


