Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23192F9A73
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 08:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbhARHZN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 02:25:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54760 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhARHZL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 02:25:11 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F85C2BB;
        Mon, 18 Jan 2021 08:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610954666;
        bh=3qJSoCI7SF2zDdQCUq9GpIdMp5rLrOkUptxbBj0SSQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aBbUiscUC4/ZHLO0Sc0JgDQilr6aGaDNhgS4lshSSxtLCpufsRCQmqxmFFA0bq71x
         HXYNQGvqeogfMJ4PA84AZJ7VBZB/k4eiUbhHtAmvaBhIRFwZ6ImrQRe8SGX9p9vI6L
         etCnn6p18UuW2No7VkqY5OlwOGODEVvlk043aY9c=
Date:   Mon, 18 Jan 2021 09:24:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
Message-ID: <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-2-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:
> I need to be able to identify devices which declare themselves to be
> dependent on other devices through _DEP; add this function to utils.c
> and export it to the rest of the ACPI layer.
> 
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

"lpss" stands for low power subsystem, an Intel device within the PCH
that handles I2C, SPI, UART, ... I think the function should be renamed,
as it's now generic. acpi_dev_has_dep() is a potential candidate, I'm
sure better ones exist. A bit of kerneldoc would also not hurt.

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

-- 
Regards,

Laurent Pinchart
