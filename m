Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B862C8CB4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 19:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388128AbgK3SYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 13:24:42 -0500
Received: from mga04.intel.com ([192.55.52.120]:49189 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388042AbgK3SYm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 13:24:42 -0500
IronPort-SDR: cO21u1Gs+DIDkXtOZoOyHp0t7zlXfN0XdDOytcT6fIGuDmCF48YE4QNq2aISQ9Qkd89HvTOXit
 ugI1mHvlY/Uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170121653"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="170121653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:23:01 -0800
IronPort-SDR: LAL3B3M6tmBMESxAftDHo+ddvK6h6BnOG2TFM/LinWKrkXwNlECJjHz7mgl8VAqV6rcS2o9R6t
 /VlLQBNZwEtw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="345161635"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:22:54 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjnq6-00B6WE-RI; Mon, 30 Nov 2020 20:23:54 +0200
Date:   Mon, 30 Nov 2020 20:23:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 14/18] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <20201130182354.GW4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-15-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-15-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 01:31:25PM +0000, Daniel Scally wrote:
> ACPI devices declare themselves dependent on other devices via the _DEP
> buffer. Fetching the dependee from dependent is a matter of parsing
> _DEP, but currently there's no method to fetch dependent from dependee.
> Add one, so we can parse sensors dependent on a PMIC from the PMIC's
> acpi_driver.

Do I understand correctly that it's an existing table provided by firmware that
(ab)uses _DEP in such way? Note, the specification doesn't tell we may use it
in this way, OTOH I don't remember if it strictly forbids such use.

So, please elaborate in the commit message why you need this and pint out to
the 6.5.8 "_DEP (Operation Region Dependencies)" which clearly says about
OpRegions and that part already supported by ACPI in the Linux, if I'm not
mistaken, need to refresh my memory.

...

> +	handle = adev->handle;
> +
> +	if (!acpi_has_method(handle, "_DEP"))
> +		return 0;
> +
> +	status = acpi_evaluate_reference(handle, "_DEP", NULL, &dep_handles);
> +	if (ACPI_FAILURE(status))
> +		return 0;
> +
> +	for (i = 0; i < dep_handles.count; i++) {
> +		struct acpi_device_info *info;
> +
> +		status = acpi_get_object_info(dep_handles.handles[i], &info);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		if (info->valid & ACPI_VALID_HID) {
> +			ret = acpi_bus_get_device(dep_handles.handles[i], &candidate);
> +			if (ret || !candidate) {
> +				kfree(info);
> +				continue;
> +			}
> +
> +			if (candidate == dependee) {
> +				acpi_dev_put(candidate);
> +				kfree(info);
> +				return 1;
> +			}
> +
> +			kfree(info);
> +		}
> +	}

Can you utilize (by moving to here and export for ACPI layer the
acpi_lpss_dep()?

-- 
With Best Regards,
Andy Shevchenko


