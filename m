Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D961C24DDE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 13:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfEUL1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 07:27:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:9229 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbfEUL1d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 07:27:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 04:27:32 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 May 2019 04:27:29 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 May 2019 14:27:28 +0300
Date:   Tue, 21 May 2019 14:27:28 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/5] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190521112728.GX2781@lahna.fi.intel.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
 <20190520084936.10590-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520084936.10590-4-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 20, 2019 at 09:49:34AM +0100, Charles Keepax wrote:
> Bring the ACPI path in sync with the device tree path and handle all the
> IRQ fetching at probe time. This leaves the only IRQ handling at device
> registration time being that which is passed directly through the board
> info as either a resource or an actual IRQ number.

I don't see issues with this approach. Cc'd Jarkko and Andy just in case
I missed something.

One minor stylistic comment, see below.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 6 ++----
>  drivers/i2c/i2c-core-base.c | 6 +++++-
>  drivers/i2c/i2c-core.h      | 7 +++++++
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 764cd10420a74..e332760bf9ebc 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -148,8 +148,9 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  	return 1; /* No need to add resource to the list */
>  }
>  
> -static int i2c_acpi_get_irq(struct acpi_device *adev, int *irq)
> +int i2c_acpi_get_irq(struct i2c_client *client, int *irq)
>  {
> +	struct acpi_device *adev = ACPI_COMPANION(&client->adapter->dev);
>  	struct list_head resource_list;
>  	int ret;
>  
> @@ -201,9 +202,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  	if (adapter_handle)
>  		*adapter_handle = lookup.adapter_handle;
>  
> -	/* Then fill IRQ number if any */
> -	i2c_acpi_get_irq(adev, &info->irq);
> -
>  	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
>  			  sizeof(info->type));
>  
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 84bf11b25a120..c1afa17a76bfc 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -335,7 +335,11 @@ static int i2c_device_probe(struct device *dev)
>  			if (irq == -EINVAL || irq == -ENODATA)
>  				irq = of_irq_get(dev->of_node, 0);
>  		} else if (ACPI_COMPANION(dev)) {
> -			irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
> +			i2c_acpi_get_irq(client, &irq);
> +
> +			if (irq == -ENOENT)
> +				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev),
> +							    0);

I think this looks better if you put everything one line:

				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);

>  		}
>  		if (irq == -EPROBE_DEFER)
>  			return irq;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 8f3a08dc73a25..6bec145ab7d74 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -72,6 +72,8 @@ const struct acpi_device_id *
>  i2c_acpi_match_device(const struct acpi_device_id *matches,
>  		      struct i2c_client *client);
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> +
> +int i2c_acpi_get_irq(struct i2c_client *client, int *irq);
>  #else /* CONFIG_ACPI */
>  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
>  static inline const struct acpi_device_id *
> @@ -80,6 +82,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
>  {
>  	return NULL;
>  }
> +
> +static inline int i2c_acpi_get_irq(struct i2c_client *client, int *irq)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_ACPI */
>  extern struct notifier_block i2c_acpi_notifier;
>  
> -- 
> 2.11.0
