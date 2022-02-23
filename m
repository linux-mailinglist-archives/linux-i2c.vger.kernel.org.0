Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B8A4C15D0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 15:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbiBWOyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 09:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbiBWOyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 09:54:00 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2AA888C5
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628012; x=1677164012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eFU7kmJtE3YQ0rR/MRLoa9sGxLjf6lcphDKGNYI8N8M=;
  b=UTadm1ZIQojZnHhAyDcznzZY2Nin4rBopdDulg4qMuf1t933uecEESuo
   F544ZeOdUXzlVyD3pl4HWT507Vr8IKbUi7CARg+TWS+IEeQp9rq6469XW
   QtfVt9LzH+jGyLAITpfp7RBM55jwSQbJmngn9b+fcfVrZZOkXLkkEEqJm
   ewLe48gU+L2EG70iOM9yLW7KWk0jLEHZTR3fi6niMPTqKwxadwfSJt85+
   2pjJy+zdVW7wVG3E9ESm8YTa1IdUIS+XWjg0fdK783mmj9SQyAweNuXDx
   Hhtouh1wIB5OTcJdVe0xkQ5biczLGCMzUJoGRWxpAieXxx7Ljfdm6tMKq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232599717"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="232599717"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:53:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="707056031"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:53:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMt0R-007Sqz-De;
        Wed, 23 Feb 2022 16:52:39 +0200
Date:   Wed, 23 Feb 2022 16:52:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Lock the adapter while setting the
 suspended flag
Message-ID: <YhZKNqpeD9M9xxk6@smile.fi.intel.com>
References: <20220223134839.731138-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223134839.731138-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 23, 2022 at 02:48:38PM +0100, Hans de Goede wrote:
> Lock the adapter while setting the suspended flag, to ensure that other
> locked code always sees the change immediately, rather then possibly using
> a stale value.
> 
> This involves splitting the suspend/resume callbacks into separate runtime
> and normal suspend/resume calls. This is necessary because i2c_dw_xfer()
> will get called by the i2c-core with the adapter locked and it in turn
> calls the runtime-resume callback through pm_runtime_get_sync().
> 
> So the runtime versions of the suspend/resume callbacks cannot take
> the adapter-lock. Note this patch simply makes the runtime suspend/resume
> callbacks not deal with the suspended flag at all. During runtime the
> pm_runtime_get_sync() from i2c_dw_xfer() will always ensure that the
> adapter is resumed when necessary.
> 
> The suspended flag check is only necessary to check proper suspend/resume
> ordering during normal suspend/resume which makes the pm_runtime_get_sync()
> call a no-op.

Both patches look good to me and seems like a nice clean up. Not sure if the
first one should be backported (and hence have a Fixes tag).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c  | 31 +++++++++++++++++----
>  drivers/i2c/busses/i2c-designware-platdrv.c | 31 +++++++++++++++++----
>  2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index ef4250f8852b..9553d7075223 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -213,14 +213,30 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>  	},
>  };
>  
> +static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	i_dev->disable(i_dev);
> +	return 0;
> +}
> +
>  static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  	i_dev->suspended = true;
> -	i_dev->disable(i_dev);
> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  
> -	return 0;
> +	return i2c_dw_pci_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused i2c_dw_pci_runtime_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	return i_dev->init(i_dev);
>  }
>  
>  static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
> @@ -228,14 +244,19 @@ static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = i_dev->init(i_dev);
> +	ret = i2c_dw_pci_runtime_resume(dev);
> +
> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  	i_dev->suspended = false;
> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  
>  	return ret;
>  }
>  
> -static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
> -			    i2c_dw_pci_resume, NULL);
> +static const struct dev_pm_ops i2c_dw_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
> +	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
> +};
>  
>  static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  			    const struct pci_device_id *id)
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2bd81abc86f6..8e45f65bab73 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -368,12 +368,10 @@ static void dw_i2c_plat_complete(struct device *dev)
>  #endif
>  
>  #ifdef CONFIG_PM
> -static int dw_i2c_plat_suspend(struct device *dev)
> +static int dw_i2c_plat_runtime_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> -	i_dev->suspended = true;
> -
>  	if (i_dev->shared_with_punit)
>  		return 0;
>  
> @@ -383,7 +381,18 @@ static int dw_i2c_plat_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int dw_i2c_plat_resume(struct device *dev)
> +static int dw_i2c_plat_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
> +	i_dev->suspended = true;
> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
> +
> +	return dw_i2c_plat_runtime_suspend(dev);
> +}
> +
> +static int dw_i2c_plat_runtime_resume(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> @@ -391,7 +400,19 @@ static int dw_i2c_plat_resume(struct device *dev)
>  		i2c_dw_prepare_clk(i_dev, true);
>  
>  	i_dev->init(i_dev);
> +
> +	return 0;
> +}
> +
> +static int dw_i2c_plat_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	dw_i2c_plat_runtime_resume(dev);
> +
> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  	i_dev->suspended = false;
> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>  
>  	return 0;
>  }
> @@ -400,7 +421,7 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
>  	.prepare = dw_i2c_plat_prepare,
>  	.complete = dw_i2c_plat_complete,
>  	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
> -	SET_RUNTIME_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume, NULL)
> +	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>  };
>  
>  #define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


