Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA15B8119
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 07:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiINFyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 01:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiINFyT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 01:54:19 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B3753D01;
        Tue, 13 Sep 2022 22:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663134858; x=1694670858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0ZDy774WTGsi9qoMGjCuWt0nAi4gxFyXs0tiK+AsLk=;
  b=J1r0PWI0BKcp4kEbMeJ2WxI8lnwCAXFx+HHahW6IKd1EU6+RUzlJzxye
   Lfasq7mFTLsFpbRvSIzxPRBH/04X430eOIitmUu7y3o6Q0nfWeAuJdPbB
   N0SoYLbCnw18yhi5ftmp5Yh0HgNsNG7lqt+0eg9O9A6LWnitKsLHns0ND
   4sRkmv7IFrFl4CJZ8Docjf/I6NmvMn7mzKjqHpcXpBDUSP8ojO5Ri5lHn
   50r2jb1TwVXWX5hJk753HNfTY/Z1ZHALCfTQN98WoOMfwWRJqiHWEjqO2
   b9f8hZ7HheC5AnXMtsHf1OseHOHOtjcX/wz7m/fwf8JTnYSy4s6DNQNhe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="298342848"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="298342848"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 22:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="649947388"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 13 Sep 2022 22:54:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 28560F7; Wed, 14 Sep 2022 08:54:31 +0300 (EEST)
Date:   Wed, 14 Sep 2022 08:54:31 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jingle.wu@emc.com.tw,
        mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyFslxMchzntebVb@black.fi.intel.com>
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> Device tree already has a mechanism to pass the wake_irq. It does this
> by looking for the wakeup-source property and setting the
> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> ACPI interrupt wake flag to determine if the interrupt can be used to
> wake the system. Previously the i2c drivers had to make assumptions and
> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> If there is a device with an Active Low interrupt and the device gets
> powered off while suspending, the interrupt line will go low since it's
> no longer powered and wakes the system. For this reason we should
> respect the board designers wishes and honor the wake bit defined on the
> interrupt.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> 
> Changes in v2:
> - Look at wake_cabple bit for IRQ/Interrupt resources
> 
>  drivers/i2c/i2c-core-acpi.c | 37 ++++++++++++++++++++++++++++---------
>  drivers/i2c/i2c-core-base.c |  6 +++++-
>  drivers/i2c/i2c-core.h      |  4 ++--
>  3 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index c762a879c4cc6b..c3d69b287df824 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
>  	{}
>  };
>  
> +struct i2c_acpi_irq_context {
> +	int irq;
> +	int wake_capable;

Why not bool?

Also perhaps 'wakeable'?

> +};
> +
>  static int i2c_acpi_do_lookup(struct acpi_device *adev,
>  			      struct i2c_acpi_lookup *lookup)
>  {
> @@ -170,11 +175,14 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
>  
>  static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  {
> -	int *irq = data;
> +	struct i2c_acpi_irq_context *irq_ctx = data;
>  	struct resource r;
>  
> -	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> -		*irq = i2c_dev_irq_from_resources(&r, 1);
> +	if (irq_ctx->irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r)) {
> +		irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
> +		irq_ctx->wake_capable =
> +			r.flags & IORESOURCE_IRQ_WAKECAPABLE ? 1 : 0;

Then you can just do this:

		irq_ctx->wakeable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;

> +	}
>  
>  	return 1; /* No need to add resource to the list */
>  }
> @@ -182,31 +190,42 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  /**
>   * i2c_acpi_get_irq - get device IRQ number from ACPI
>   * @client: Pointer to the I2C client device
> + * @wake_capable: Set to 1 if the IRQ is wake capable
>   *
>   * Find the IRQ number used by a specific client device.
>   *
>   * Return: The IRQ number or an error code.
>   */
> -int i2c_acpi_get_irq(struct i2c_client *client)
> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)

bool here too

>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	struct list_head resource_list;
> -	int irq = -ENOENT;
> +	struct i2c_acpi_irq_context irq_ctx = {
> +		.irq = -ENOENT,
> +		.wake_capable = 0,
> +	};
>  	int ret;
>  
>  	INIT_LIST_HEAD(&resource_list);
>  
> +	if (wake_capable)
> +		*wake_capable = 0;

I think it is better to touch this only after the function succeeds so..

> +
>  	ret = acpi_dev_get_resources(adev, &resource_list,
> -				     i2c_acpi_add_resource, &irq);
> +				     i2c_acpi_add_resource, &irq_ctx);
>  	if (ret < 0)
>  		return ret;
>  
>  	acpi_dev_free_resource_list(&resource_list);
>  
> -	if (irq == -ENOENT)
> -		irq = acpi_dev_gpio_irq_get(adev, 0);
> +	if (irq_ctx.irq == -ENOENT)
> +		irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
> +			adev, 0, &irq_ctx.wake_capable);
> +
> +	if (wake_capable)
> +		*wake_capable = irq_ctx.wake_capable;

... here only.

>  
> -	return irq;
> +	return irq_ctx.irq;
>  }
>  
>  static int i2c_acpi_get_info(struct acpi_device *adev,
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 91007558bcb260..97315b41550213 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -468,6 +468,7 @@ static int i2c_device_probe(struct device *dev)
>  	struct i2c_client	*client = i2c_verify_client(dev);
>  	struct i2c_driver	*driver;
>  	int status;
> +	int acpi_wake_capable = 0;

You can declare this in the below block instead.

>  
>  	if (!client)
>  		return 0;
> @@ -487,7 +488,10 @@ static int i2c_device_probe(struct device *dev)
>  			if (irq == -EINVAL || irq == -ENODATA)
>  				irq = of_irq_get(dev->of_node, 0);
>  		} else if (ACPI_COMPANION(dev)) {

			bool wakeable;

> -			irq = i2c_acpi_get_irq(client);
> +			irq = i2c_acpi_get_irq(client, &acpi_wake_capable);
> +
			if (irq > 0 && wakeable)
				client->flags |= I2C_CLIENT_WAKE;
>  		}
>  		if (irq == -EPROBE_DEFER) {
>  			status = irq;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 87e2c914f1c57b..8e336638a0cd2e 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
>  #ifdef CONFIG_ACPI
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
>  
> -int i2c_acpi_get_irq(struct i2c_client *client);
> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable);
>  #else /* CONFIG_ACPI */
>  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
>  
> -static inline int i2c_acpi_get_irq(struct i2c_client *client)
> +static inline int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
>  {
>  	return 0;
>  }
> -- 
> 2.37.2.789.g6183377224-goog
