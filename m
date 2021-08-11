Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8843E94E6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 17:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhHKPq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 11:46:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:18707 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233532AbhHKPq1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 11:46:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="237171778"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="237171778"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:46:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="484954510"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:46:00 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mDqQU-008Bxu-DA; Wed, 11 Aug 2021 18:45:54 +0300
Date:   Wed, 11 Aug 2021 18:45:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 4/9] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <YRPwsvJ7T+NcPepu@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 06, 2021 at 11:15:15PM +0200, Heiner Kallweit wrote:
> Replace the ugly cast of the return_value pointer with proper usage.
> In addition use dmi_match() instead of open-coding it.

...

> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> -			 (void **)&found);
> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
>  
> -	return found;
> +	return !IS_ERR(err);

Shouldn't you also check the status of acpi_get_device()?

-- 
With Best Regards,
Andy Shevchenko


