Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F995B9909
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 12:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiIOKp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 06:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiIOKp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 06:45:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DF76B8EB;
        Thu, 15 Sep 2022 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663238755; x=1694774755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iS7c7k70jjt4AO2BjhynK1wja9yk06pd1HXHiGqzGLQ=;
  b=gxUQipR19bTm838qtyUPTa8JmRNloyLfwd+OgFlrjQWz9nqPH1r4MyRG
   OiaPBcphLMJqora8QzCk+W4tBubq/vbC0lM+ywqyDpewaEvSeWpGAykFP
   7ld+49sjxPie+IUIF1SYTte1gEUy0/uFwlezAC71MrUPCV/dZ/Fo3ryc1
   /Vdhs0Jp0/1sfsKs2vv3DcEjfOqtaCHcaUJcASTSpknTPWzOYb8VBPtG3
   l2Ow21KEU28ls2UHMxQnml+as4alMWxGvIKQqqlOUHotpuFSspOgIo3je
   m9n7X3buc5n5kj6DXmwjRLPVvtxmS+yQuhMxIeTTSef/D560Zbst4huBu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="297405352"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="297405352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 03:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="706304573"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2022 03:45:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 86F0C235; Thu, 15 Sep 2022 13:46:08 +0300 (EEST)
Date:   Thu, 15 Sep 2022 13:46:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyMCcNl2zU4/xEHN@black.fi.intel.com>
References: <20220914235801.1731478-1-rrangel@chromium.org>
 <20220914155914.v3.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914155914.v3.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 14, 2022 at 05:57:55PM -0600, Raul E Rangel wrote:
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
> Changes in v3:
> - Convert wake_capable to bool
> - Only update wake_capable pointer once
> - Move wake_capable local into local block
> 
> Changes in v2:
> - Look at wake_cabple bit for IRQ/Interrupt resources
> 
>  drivers/i2c/i2c-core-acpi.c | 33 ++++++++++++++++++++++++---------
>  drivers/i2c/i2c-core-base.c |  8 +++++++-
>  drivers/i2c/i2c-core.h      |  4 ++--
>  3 files changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index c762a879c4cc6b..b3d68a9659ff4f 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
>  	{}
>  };
>  
> +struct i2c_acpi_irq_context {
> +	int irq;
> +	bool wake_capable;
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
> +			!!(r.flags & IORESOURCE_IRQ_WAKECAPABLE);

You don't need the !!() here. Just

		irq_ctx->wake_capable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;

> +	}
>  
>  	return 1; /* No need to add resource to the list */
>  }
> @@ -182,31 +190,38 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  /**
>   * i2c_acpi_get_irq - get device IRQ number from ACPI
>   * @client: Pointer to the I2C client device
> + * @wake_capable: Set to true if the IRQ is wake capable
>   *
>   * Find the IRQ number used by a specific client device.
>   *
>   * Return: The IRQ number or an error code.
>   */
> -int i2c_acpi_get_irq(struct i2c_client *client)
> +int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	struct list_head resource_list;
> -	int irq = -ENOENT;
> +	struct i2c_acpi_irq_context irq_ctx = {
> +		.irq = -ENOENT,
> +	};
>  	int ret;
>  
>  	INIT_LIST_HEAD(&resource_list);
>  
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
> +		irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0,
> +							 &irq_ctx.wake_capable);
> +
> +	if (wake_capable)
> +		*wake_capable = irq_ctx.wake_capable;
>  
> -	return irq;
> +	return irq_ctx.irq;
>  }
>  
>  static int i2c_acpi_get_info(struct acpi_device *adev,
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 91007558bcb260..c4debd46c6340f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -487,8 +487,14 @@ static int i2c_device_probe(struct device *dev)
>  			if (irq == -EINVAL || irq == -ENODATA)
>  				irq = of_irq_get(dev->of_node, 0);
>  		} else if (ACPI_COMPANION(dev)) {
> -			irq = i2c_acpi_get_irq(client);
> +			bool wake_capable;
> +
> +			irq = i2c_acpi_get_irq(client, &wake_capable);
> +

Drop the empty line here.

> +			if (irq > 0 && wake_capable)
> +				client->flags |= I2C_CLIENT_WAKE;
>  		}
> +

Unrelated whitespace change.

With those fixed feel free to add,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
