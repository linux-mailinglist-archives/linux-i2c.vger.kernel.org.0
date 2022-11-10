Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D49F62467E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 17:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiKJQBU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 11:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiKJQAz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 11:00:55 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CCC31EE1;
        Thu, 10 Nov 2022 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668096055; x=1699632055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dvQpHQoEPiUyh/aikWjsPM6Iyz2edanS8xPnTyIZYho=;
  b=OH/OVw9NnnPxohhAMzvZMyUa1inaQ080znngsBX8kbUYdWLH1x6DqFNK
   fuo3EGGBCAp49/hwS/jP8dQw03RewZ8dJ98o3RLBHR917j3hApha21MvF
   /ZwXowhSVrFMiySQcUnIrwfv51Wfu8NAfE2y2vMfUgXgZ0RdsmKb+yTqJ
   x+qZZXRkwOpKfgEGVLf6t5OoCeHpmEExnLPn4/Rj8ndyFZRKL/6kCdwQF
   zwPaNujv7HEW951JnPMojUCFlxkfsMd8vGmF2w1o+eVa+76o/BGfm5emO
   aK9v+88xAjS7YcAeNw1t+uehQeJsk5T4jvSs1BiXBKr3SyylT746lVpxQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="312482847"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="312482847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 08:00:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="812087718"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="812087718"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 08:00:48 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 47F2E20187;
        Thu, 10 Nov 2022 18:00:46 +0200 (EET)
Date:   Thu, 10 Nov 2022 16:00:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hidenori Kobayashi <hidenorik@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/1] i2c: Restore initial power state when we are done.
Message-ID: <Y20gLtU61eFa4LBu@paasikivi.fi.intel.com>
References: <20221109-i2c-waive-v4-0-e4496462833b@chromium.org>
 <20221109-i2c-waive-v4-1-e4496462833b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109-i2c-waive-v4-1-e4496462833b@chromium.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ricardo,

On Thu, Nov 10, 2022 at 03:11:43PM +0100, Ricardo Ribalda wrote:
> A driver that supports I2C_DRV_ACPI_WAIVE_D0_PROBE is not expected to
> power off a device that it has not powered on previously.
> 
> For devices operating in "full_power" mode, the first call to
> `i2c_acpi_waive_d0_probe` will return 0, which means that the device
> will be turned on with `dev_pm_domain_attach`.
> 
> If probe fails or the device is removed the second call to
> `i2c_acpi_waive_d0_probe` will return 1, which means that the device
> will not be turned off. This is, it will be left in a different power
> state. Lets fix it.

Good find.

I think this deserves to be applied to the stable tree. There are quite a
few kernel releases with the problem.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Fixes: b18c1ad685d9 ("i2c: Allow an ACPI driver to manage the device's power state during probe")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..09a6bb89a352 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -467,6 +467,7 @@ static int i2c_device_probe(struct device *dev)
>  {
>  	struct i2c_client	*client = i2c_verify_client(dev);
>  	struct i2c_driver	*driver;
> +	bool do_power_on;
>  	int status;
>  
>  	if (!client)
> @@ -545,8 +546,8 @@ static int i2c_device_probe(struct device *dev)
>  	if (status < 0)
>  		goto err_clear_wakeup_irq;
>  
> -	status = dev_pm_domain_attach(&client->dev,
> -				      !i2c_acpi_waive_d0_probe(dev));
> +	do_power_on = !i2c_acpi_waive_d0_probe(dev);
> +	status = dev_pm_domain_attach(&client->dev, do_power_on);
>  	if (status)
>  		goto err_clear_wakeup_irq;
>  
> @@ -580,12 +581,14 @@ static int i2c_device_probe(struct device *dev)
>  	if (status)
>  		goto err_release_driver_resources;
>  
> +	client->turn_off_on_remove = do_power_on;
> +
>  	return 0;
>  
>  err_release_driver_resources:
>  	devres_release_group(&client->dev, client->devres_group_id);
>  err_detach_pm_domain:
> -	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> +	dev_pm_domain_detach(&client->dev, do_power_on);
>  err_clear_wakeup_irq:
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> @@ -610,7 +613,7 @@ static void i2c_device_remove(struct device *dev)
>  
>  	devres_release_group(&client->dev, client->devres_group_id);
>  
> -	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> +	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
>  
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f7c49bbdb8a1..412ac2b7cb2e 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -326,6 +326,8 @@ struct i2c_driver {
>   *	calls it to pass on slave events to the slave driver.
>   * @devres_group_id: id of the devres group that will be created for resources
>   *	acquired when probing this device.
> + * @turn_off_on_remove: Record if we have turned on the device before probing
> + *	so we can turn off the device at removal.
>   *
>   * An i2c_client identifies a single device (i.e. chip) connected to an
>   * i2c bus. The behaviour exposed to Linux is defined by the driver
> @@ -355,6 +357,8 @@ struct i2c_client {
>  	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
>  #endif
>  	void *devres_group_id;		/* ID of probe devres group	*/
> +	bool turn_off_on_remove;	/* if device needs to be turned	*/
> +					/* off by framework at removal	*/

I don't know why the fields are documented twice. Someone wrote kerneldoc
documentation but forgot to remove the old comments? :-) Anyway, not a
fault of this patch, but these should probaly go.

>  };
>  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
>  
> 

-- 
Kind regards,

Sakari Ailus
