Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A781554DF4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 13:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731300AbfFYLuS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 07:50:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:5186 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbfFYLuS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 07:50:18 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 04:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="182871497"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 25 Jun 2019 04:50:12 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Jun 2019 14:50:11 +0300
Date:   Tue, 25 Jun 2019 14:50:11 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190625115011.GE2640@lahna.fi.intel.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
 <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 21, 2019 at 11:08:12AM +0100, Charles Keepax wrote:
> In preparation for more refactoring make i2c_acpi_get_irq available
> outside i2c-core-acpi.c.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v5:
>  - Pass a struct device rather than acpi_device to i2c_acpi_get_irq,
>    note this is more awkward than I would have liked as I am very
>    unconvinced that adev->dev can actually be passed to
>    ACPI_COMPANION. If anyone can answer that for sure that would be
>    very helpful.

I don't think you can do that.

I probably missed some previous discussion but what's wrong passing
struct i2c_client instead and use ACPI_COMPANION() for that?

> 
> Thanks,
> Charles
> 
>  drivers/i2c/i2c-core-acpi.c | 13 +++++++++++--
>  drivers/i2c/i2c-core.h      |  7 +++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index c91492eaacd93..37bf80b35365f 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -145,8 +145,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  	return 1;
>  }
>  
> -static int i2c_acpi_get_irq(struct acpi_device *adev)
> +/**
> + * i2c_acpi_get_irq - get device IRQ number from ACPI
> + * @client: Pointer to the I2C client device

I think this should be @dev now.

> + *
> + * Find the IRQ number used by a specific client device.
> + *
> + * Return: The IRQ number or an error code.
> + */
> +int i2c_acpi_get_irq(struct device *dev)
>  {
> +	struct acpi_device *adev = container_of(dev, struct acpi_device, dev);
>  	struct list_head resource_list;
>  	int irq = -ENOENT;
>  	int ret;
> @@ -199,7 +208,7 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  		*adapter_handle = lookup.adapter_handle;
>  
>  	/* Then fill IRQ number if any */
> -	info->irq = i2c_acpi_get_irq(adev);
> +	info->irq = i2c_acpi_get_irq(&adev->dev);
>  	if (info->irq < 0)
>  		return info->irq;
>  
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 2a3b28bf826b1..1735ac17a957a 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -63,6 +63,8 @@ const struct acpi_device_id *
>  i2c_acpi_match_device(const struct acpi_device_id *matches,
>  		      struct i2c_client *client);
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> +
> +int i2c_acpi_get_irq(struct device *dev);
>  #else /* CONFIG_ACPI */
>  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
>  static inline const struct acpi_device_id *
> @@ -71,6 +73,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
>  {
>  	return NULL;
>  }
> +
> +static inline int i2c_acpi_get_irq(struct device *dev)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_ACPI */
>  extern struct notifier_block i2c_acpi_notifier;
>  
> -- 
> 2.11.0
