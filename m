Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF153EA28A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 11:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhHLJzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 05:55:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:26356 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235345AbhHLJzw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Aug 2021 05:55:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="237349447"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="237349447"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:55:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="439998984"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:55:26 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mE7Qm-008XjM-Ok; Thu, 12 Aug 2021 12:55:20 +0300
Date:   Thu, 12 Aug 2021 12:55:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 4/9] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <YRTwCMgqmZmlExZk@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
 <YRPwsvJ7T+NcPepu@smile.fi.intel.com>
 <8d6e7c48-839a-44d7-3e4d-643dc79e20c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6e7c48-839a-44d7-3e4d-643dc79e20c5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 11, 2021 at 10:28:25PM +0200, Heiner Kallweit wrote:
> On 11.08.2021 17:45, Andy Shevchenko wrote:
> > On Fri, Aug 06, 2021 at 11:15:15PM +0200, Heiner Kallweit wrote:
> >> Replace the ugly cast of the return_value pointer with proper usage.
> >> In addition use dmi_match() instead of open-coding it.
> > 
> > ...
> > 
> >> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> >> -			 (void **)&found);
> >> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
> >>  
> >> -	return found;
> >> +	return !IS_ERR(err);
> > 
> > Shouldn't you also check the status of acpi_get_device()?
> > 
> This shouldn't be needed because err isn't touched if function fails.

For the sake of clearness of the code I would do it. But in any case what
really hurt my eye is the last line here. To me sounds like

	if (IS_ERR(err))
		return false;
	return true;

is much better to read (and I bet the compiler will generate the very same
code for it).

-- 
With Best Regards,
Andy Shevchenko


