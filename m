Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5182F9FA9
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403917AbhARMaD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:30:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:3201 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391480AbhARM3m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:29:42 -0500
IronPort-SDR: nxnbOWCZEH08Q1+W7Lk7Ya10E3vlgOFxGF1x7ekinxN0/Gga4i2BjsI//wY1trC/Utl7CEB1cv
 T5chMmN6PWxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="158569566"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="158569566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:27:55 -0800
IronPort-SDR: 2j/s5jqLYA5tSPupN5GM+8EIavU5r0cI0hwt2U8w3taMjoaixo9V17vkvePk10ElGdV9NYhb2T
 SeW3LjG0YcBA==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="500631904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:27:50 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1TeO-0027Qp-96; Mon, 18 Jan 2021 14:28:52 +0200
Date:   Mon, 18 Jan 2021 14:28:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
Message-ID: <20210118122852.GD4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-2-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:
> I need to be able to identify devices which declare themselves to be
> dependent on other devices through _DEP; add this function to utils.c
> and export it to the rest of the ACPI layer.

Prefix -> "ACPI / utils: "

Otherwise good to me
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 	- Introduced
> 
>  drivers/acpi/acpi_lpss.c | 24 ------------------------
>  drivers/acpi/internal.h  |  1 +
>  drivers/acpi/utils.c     | 24 ++++++++++++++++++++++++
>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> index be73974ce449..70c7d9a3f715 100644
> --- a/drivers/acpi/acpi_lpss.c
> +++ b/drivers/acpi/acpi_lpss.c
> @@ -543,30 +543,6 @@ static struct device *acpi_lpss_find_device(const char *hid, const char *uid)
>  	return bus_find_device(&pci_bus_type, NULL, &data, match_hid_uid);
>  }
>  
> -static bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
> -{
> -	struct acpi_handle_list dep_devices;
> -	acpi_status status;
> -	int i;
> -
> -	if (!acpi_has_method(adev->handle, "_DEP"))
> -		return false;
> -
> -	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
> -					 &dep_devices);
> -	if (ACPI_FAILURE(status)) {
> -		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
> -		return false;
> -	}
> -
> -	for (i = 0; i < dep_devices.count; i++) {
> -		if (dep_devices.handles[i] == handle)
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
>  static void acpi_lpss_link_consumer(struct device *dev1,
>  				    const struct lpss_device_links *link)
>  {
> diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
> index cb229e24c563..ee62c0973576 100644
> --- a/drivers/acpi/internal.h
> +++ b/drivers/acpi/internal.h
> @@ -79,6 +79,7 @@ static inline void acpi_lpss_init(void) {}
>  #endif
>  
>  void acpi_apd_init(void);
> +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle);
>  
>  acpi_status acpi_hotplug_schedule(struct acpi_device *adev, u32 src);
>  bool acpi_queue_hotplug_work(struct work_struct *work);
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index ddca1550cce6..78b38775f18b 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -807,6 +807,30 @@ static int acpi_dev_match_cb(struct device *dev, const void *data)
>  	return hrv == match->hrv;
>  }
>  
> +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
> +{
> +	struct acpi_handle_list dep_devices;
> +	acpi_status status;
> +	int i;
> +
> +	if (!acpi_has_method(adev->handle, "_DEP"))
> +		return false;
> +
> +	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
> +					 &dep_devices);
> +	if (ACPI_FAILURE(status)) {
> +		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
> +		return false;
> +	}
> +
> +	for (i = 0; i < dep_devices.count; i++) {
> +		if (dep_devices.handles[i] == handle)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * acpi_dev_present - Detect that a given ACPI device is present
>   * @hid: Hardware ID of the device.
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


