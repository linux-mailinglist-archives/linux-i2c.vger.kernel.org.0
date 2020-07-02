Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DF321204B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 11:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgGBJsJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 05:48:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:25208 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgGBJsJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 05:48:09 -0400
IronPort-SDR: NGBI4Fq2mlW8pYu/gBtQwUHP34eXyVplRtl5HUJtxCpGCXLnJ/MuBbRiIRmzdpMA4p/9/RNQ+g
 /sbkW+43EJiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="126935773"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="126935773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 02:48:08 -0700
IronPort-SDR: MfId8Xsu+pXlIBLT1E+9fv/iiNoFYtd++gWymsw2yHsvG9sWxYALZwFkKAD2yM4c+SnyCT72lE
 YVtF4tDtg/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="265657264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2020 02:48:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jqvpA-00HBHk-Oy; Thu, 02 Jul 2020 12:48:08 +0300
Date:   Thu, 2 Jul 2020 12:48:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ricardo Ribalda <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: designware: platdrv: Set class based on dmi
Message-ID: <20200702094808.GP3703480@smile.fi.intel.com>
References: <20200702093832.2077252-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702093832.2077252-1-ribalda@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 02, 2020 at 11:38:32AM +0200, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the dmi information.

dmi -> DMI

> Dmi is probed only on Qtechnology QT5222 Industrial Camera Platform

Dmi -> DMI

> https://qtec.com/camera-technology-camera-platforms/

Use DocLink: tag.

...

> +static const struct dmi_system_id allow_probe[] = {

allow_probe -> dw_i2c_hwmon_class_dmi

> +	{
> +		.ident = "Qtechnology QT5222",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Qtechnology"),

> +			DMI_MATCH(DMI_PRODUCT_NAME, "QT5222")

Comma is missed.

> +		}
> +	},

> +

Redundant.

> +	{ }
> +};

-- 
With Best Regards,
Andy Shevchenko


