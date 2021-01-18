Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B253B2F9A96
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 08:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbhARHfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 02:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731544AbhARHfE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 02:35:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A38C061573;
        Sun, 17 Jan 2021 23:34:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 981712BB;
        Mon, 18 Jan 2021 08:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610955260;
        bh=3ZDbWSNMk25Oq6QHRjrIbAXJOZHgOoobzPTgr2XKPX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pjKmGMVUeqB7fHtO3ZvOZtPasArkDSapiHMXmCN+OmXSAXkrf712MWG4gTUqhjZAs
         kE5Wtylg5w5ZxvEGSChRKgkmJd9I+veyH6tsoRv+YqOERQH4ipBbH1QokGFFZSO69p
         YH0cWGnsS6Pj5Rj+Rh+ghS4P13OwPcJV3T/BO1Cc=
Date:   Mon, 18 Jan 2021 09:34:04 +0200
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
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <YAU57AEmtBHuz6T8@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:23AM +0000, Daniel Scally wrote:
> In some ACPI tables we encounter, devices use the _DEP method to assert
> a dependence on other ACPI devices as opposed to the OpRegions that the
> specification intends. We need to be able to find those devices "from"
> the dependee, so add a function to parse all ACPI Devices and check if
> the include the handle of the dependee device in their _DEP buffer.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 	- Used acpi_lpss_dep() as Andy suggested.
> 
>  drivers/acpi/utils.c    | 34 ++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  2 ++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 78b38775f18b..ec6a2406a886 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -831,6 +831,18 @@ bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
>  	return false;
>  }
>  
> +static int acpi_dev_match_by_dep(struct device *dev, const void *data)
> +{
> +	struct acpi_device *adev = to_acpi_device(dev);
> +	const struct acpi_device *dependee = data;
> +	acpi_handle handle = dependee->handle;
> +
> +	if (acpi_lpss_dep(adev, handle))
> +		return 1;
> +
> +	return 0;
> +}
> +

I think I'd move this just before acpi_dev_get_next_dep_dev() to keep
the two together.

>  /**
>   * acpi_dev_present - Detect that a given ACPI device is present
>   * @hid: Hardware ID of the device.
> @@ -866,6 +878,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
>  }
>  EXPORT_SYMBOL(acpi_dev_present);
>  
> +/**
> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev

Maybe acpi_dev_get_next_dependent_dev() ? "dep" could mean either
dependent or dependency.

> + * @adev: Pointer to the dependee device
> + * @prev: Pointer to the previous dependent device (or NULL for first match)
> + *
> + * Return the next ACPI device which declares itself dependent on @adev in
> + * the _DEP buffer.
> + *
> + * The caller is responsible to call put_device() on the returned device.
> + */
> +struct acpi_device *acpi_dev_get_next_dep_dev(struct acpi_device *adev,
> +					      struct acpi_device *prev)
> +{
> +	struct device *start = prev ? &prev->dev : NULL;
> +	struct device *dev;
> +
> +	dev = bus_find_device(&acpi_bus_type, start, adev, acpi_dev_match_by_dep);

Having to loop over all ACPI devices is quite inefficient, but if we
need a reverse lookup, we don't really have a choice. We could create a
reverse map, but I don't think it's worth it.

> +
> +	return dev ? to_acpi_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(acpi_dev_get_next_dep_dev);

I would have used EXPORT_SYMBOL_GPL. I'm not sure what the policy is in
the ACPI subsystem, and it's also a personal choice.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  /**
>   * acpi_dev_get_next_match_dev - Return the next match of ACPI device
>   * @adev: Pointer to the previous acpi_device matching this @hid, @uid and @hrv
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 02a716a0af5d..33deb22294f2 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -683,6 +683,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>  
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>  
> +struct acpi_device *
> +acpi_dev_get_next_dep_dev(struct acpi_device *adev, struct acpi_device *prev);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *

-- 
Regards,

Laurent Pinchart
