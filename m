Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3F70916E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 10:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjESIMR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 04:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjESIMR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 04:12:17 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F273810D;
        Fri, 19 May 2023 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684483936; x=1716019936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bgHycw+4TuqtIcTMbm9M3yRYkHNr5v/H0XL3uZPuGU=;
  b=Ik+FWS3rww8t4rM/oB75ojIR46v++Po/IOMyt7BSOzREvFlgZu1gIN5i
   uHVGmJ7xxbJEoRpybVsahtDAfAC6vg8q10bsR5AL5kp3bA6h6HNinL8TY
   tCC7crjyQNL0zD76Wy6Gaw7de8a6k5/bJrGSUMikVSMZl099jJrZZRPky
   PMpf+Sf8NKJdkWggy1+XsBHOuY2mO1+8cfEM0FbA6rnHs4xo/cax3p9FT
   9GtEh/Nj01uMUFyibvZED7KImCt0GfQaGjwLc2+8pwgZqv6erz956MpbM
   5rYCgMV7VkHQERIahDH21agq3qF7ANgzQ7Y1D7ftpVU1eeFOGyh2crMw8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341748532"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341748532"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846808764"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846808764"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:12:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:12:11 +0300
Date:   Fri, 19 May 2023 11:12:11 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     ajayg@nvidia.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
Message-ID: <ZGcvW1fQIBofXGzk@kuha.fi.intel.com>
References: <20230518161150.92959-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518161150.92959-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

On Thu, May 18, 2023 at 11:11:50AM -0500, Mario Limonciello wrote:
> power_supply_is_system_supplied() checks whether any power
> supplies are present that aren't batteries to decide whether
> the system is running on DC or AC.  Downstream drivers use
> this to make performance decisions.
> 
> Navi dGPUs include an UCSI function that has been exported
> since commit 17631e8ca2d3 ("i2c: designware: Add driver
> support for AMD NAVI GPU").
> 
> This UCSI function registers a power supply since commit
> 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> but this is not a system power supply.
> 
> As the power supply for a dGPU is only for powering devices connected
> to dGPU, create a device property to indicate that the UCSI endpoint
> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
> 
> Link: https://lore.kernel.org/lkml/20230516182541.5836-2-mario.limonciello@amd.com/
> Reviewed-by: Evan Quan <evan.quan@amd.com>
> Tested-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Look good to me, but if there is anything else that has to be changed,
please consider modifying the ucsi driver part in its own patch.
Otherwise, FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v1->v2:
>  * Drop patch 1, merged into a maintainers tree
>  * Fix title
>  * Add tags
>  * Fix terminators
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
>  drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
>  drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 782fe1ef3ca1..61d7a27aa070 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/power_supply.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> @@ -234,6 +235,16 @@ static const struct dev_pm_ops i2c_dw_pm_ops = {
>  	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
>  };
>  
> +static const struct property_entry dgpu_properties[] = {
> +	/* USB-C doesn't power the system */
> +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> +	{}
> +};
> +
> +static const struct software_node dgpu_node = {
> +	.properties = dgpu_properties,
> +};
> +
>  static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  			    const struct pci_device_id *id)
>  {
> @@ -325,7 +336,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	}
>  
>  	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
> -		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
> +		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
>  		if (IS_ERR(dev->slave))
>  			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
>  					     "register UCSI failed\n");
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index a8b99e7f6262..26622d24bb1b 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/power_supply.h>
>  
>  #include <asm/unaligned.h>
>  
> @@ -261,6 +262,8 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>  static const struct property_entry ccgx_props[] = {
>  	/* Use FW built for NVIDIA GPU only */
>  	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
> +	/* USB-C doesn't power the system */
> +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
>  	{ }
>  };
>  
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 56bf56517f75..384b42267f1f 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -27,8 +27,20 @@ static enum power_supply_property ucsi_psy_props[] = {
>  	POWER_SUPPLY_PROP_VOLTAGE_NOW,
>  	POWER_SUPPLY_PROP_CURRENT_MAX,
>  	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_SCOPE,
>  };
>  
> +static int ucsi_psy_get_scope(struct ucsi_connector *con,
> +			      union power_supply_propval *val)
> +{
> +	u8 scope = POWER_SUPPLY_SCOPE_UNKNOWN;
> +	struct device *dev = con->ucsi->dev;
> +
> +	device_property_read_u8(dev, "scope", &scope);
> +	val->intval = scope;
> +	return 0;
> +}
> +
>  static int ucsi_psy_get_online(struct ucsi_connector *con,
>  			       union power_supply_propval *val)
>  {
> @@ -194,6 +206,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>  		return ucsi_psy_get_current_max(con, val);
>  	case POWER_SUPPLY_PROP_CURRENT_NOW:
>  		return ucsi_psy_get_current_now(con, val);
> +	case POWER_SUPPLY_PROP_SCOPE:
> +		return ucsi_psy_get_scope(con, val);
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.34.1

thanks,

-- 
heikki
