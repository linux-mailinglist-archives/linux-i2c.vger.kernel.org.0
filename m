Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0392234E47
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 19:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfFDREI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 13:04:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:27906 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbfFDREH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 13:04:07 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 10:04:07 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga002.jf.intel.com with ESMTP; 04 Jun 2019 10:04:04 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hYCqy-0001Dt-19; Tue, 04 Jun 2019 20:04:04 +0300
Date:   Tue, 4 Jun 2019 20:04:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 4/6] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190604170404.GR9224@smile.fi.intel.com>
References: <20190528142900.24147-1-ckeepax@opensource.cirrus.com>
 <20190528142900.24147-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528142900.24147-4-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 28, 2019 at 03:28:58PM +0100, Charles Keepax wrote:
> Bring the ACPI path in sync with the device tree path and handle all the
> IRQ fetching at probe time. This leaves the only IRQ handling at device
> registration time being that which is passed directly through the board
> info as either a resource or an actual IRQ number.
> 

It seems my comments weren't addressed by one or another reason.
This one I would rather to split with exporting function as a separate patch.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v2:
>  - Add kernel doc for i2c_acpi_get_irq
> 
> Thanks,
> Charles
> 
>  drivers/i2c/i2c-core-acpi.c | 16 ++++++++++------
>  drivers/i2c/i2c-core-base.c |  5 ++++-
>  drivers/i2c/i2c-core.h      |  7 +++++++
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index c107f260e252f..62a938c17cbd2 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -148,8 +148,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  	return 1; /* No need to add resource to the list */
>  }
>  
> -static int i2c_acpi_get_irq(struct acpi_device *adev)
> +/**
> + * i2c_acpi_get_irq - get device IRQ number from ACPI
> + * @client: Pointer to the I2C client device
> + *
> + * Find the IRQ number used by a specific client device.
> + *
> + * Return: The IRQ number or an error code.
> + */
> +int i2c_acpi_get_irq(struct i2c_client *client)
>  {
> +	struct acpi_device *adev = ACPI_COMPANION(&client->adapter->dev);
>  	struct list_head resource_list;
>  	int irq = -ENOENT;
>  	int ret;
> @@ -201,11 +210,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  	if (adapter_handle)
>  		*adapter_handle = lookup.adapter_handle;
>  
> -	/* Then fill IRQ number if any */
> -	ret = i2c_acpi_get_irq(adev);
> -	if (ret > 0)
> -		info->irq = ret;
> -
>  	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
>  			  sizeof(info->type));
>  
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 84bf11b25a120..b6b009bfe842b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -335,7 +335,10 @@ static int i2c_device_probe(struct device *dev)
>  			if (irq == -EINVAL || irq == -ENODATA)
>  				irq = of_irq_get(dev->of_node, 0);
>  		} else if (ACPI_COMPANION(dev)) {
> -			irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
> +			irq = i2c_acpi_get_irq(client);
> +
> +			if (irq == -ENOENT)
> +				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
>  		}
>  		if (irq == -EPROBE_DEFER)
>  			return irq;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 8f3a08dc73a25..15c1411f35f07 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -72,6 +72,8 @@ const struct acpi_device_id *
>  i2c_acpi_match_device(const struct acpi_device_id *matches,
>  		      struct i2c_client *client);
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> +
> +int i2c_acpi_get_irq(struct i2c_client *client);
>  #else /* CONFIG_ACPI */
>  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
>  static inline const struct acpi_device_id *
> @@ -80,6 +82,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
>  {
>  	return NULL;
>  }
> +
> +static inline int i2c_acpi_get_irq(struct i2c_client *client)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_ACPI */
>  extern struct notifier_block i2c_acpi_notifier;
>  
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


