Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7F45B0A02
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 18:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiIGQ0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 12:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiIGQ03 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 12:26:29 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8426CD09;
        Wed,  7 Sep 2022 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662567988; x=1694103988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U7Mj6tTEbM4kCJ9BRBmFdkl2gYamUuWgTW8z+HK//c0=;
  b=SuK0AVs5eTtq6DMc6kK4EPcswWXHv7hX/duK1CT94yeifxpeHyLPy1Jg
   dqVxE8to5P5faSb7DNcvj8Xg9XUuJnNYG/T0kwbHNl078EIMY66MYVrC9
   5MpLcp5lJQ23ieH8MGD6sFr7jbp/FALdF/CE+xpCq2b4ZuosNs9l3LD5z
   9W0wjnZHpYmNDaR7x6Y35E2SVEdq2KkrMz6EHCjMaurDJsk/DlC+w4r/K
   uWek6YcdgLS0rPYHPlX14IID862lYlHsj8T3uiCpauZXGp51PkN4m7ViJ
   gl0VdrBngpVPGM85xWO8ZdfWcw1Sxc6947/C5N6IdzKP4/yTTsleqniV3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="383220005"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="383220005"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 09:26:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="740346553"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 09:26:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oVxsc-009icI-2Z;
        Wed, 07 Sep 2022 19:26:22 +0300
Date:   Wed, 7 Sep 2022 19:26:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sudarshan Ravula <sudarshan.ravula@intel.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        pandith.n@intel.com, lakshmi.sowjanya.d@intel.com
Subject: Re: [PATCH v1] i2c: designware: Add support to get I2C related
 timing parameters from firmware.
Message-ID: <YxjGLi6J4jBBZkcG@smile.fi.intel.com>
References: <20220907160920.22006-1-sudarshan.ravula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907160920.22006-1-sudarshan.ravula@intel.com>
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

On Wed, Sep 07, 2022 at 09:39:20PM +0530, Sudarshan Ravula wrote:
> Similar to I2C designware platform driver add i2c_parse_fw_timings() in
> PCI driver, to get I2C related timing parameters from firmware.
> 
> Signed-off-by: Sudarshan Ravula <sudarshan.ravula@intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 608e61209455..c001719209be 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -243,6 +243,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	int r;
>  	struct dw_pci_controller *controller;
>  	struct dw_scl_sda_cfg *cfg;
> +	struct i2c_timings *t;
>  
>  	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
>  		return dev_err_probe(&pdev->dev, -EINVAL,
> @@ -272,12 +273,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  		return r;
>  
>  	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
> -	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
>  	dev->base = pcim_iomap_table(pdev)[0];
>  	dev->dev = &pdev->dev;
>  	dev->irq = pci_irq_vector(pdev, 0);
>  	dev->flags |= controller->flags;
>  
> +	t = &dev->timings;
> +	i2c_parse_fw_timings(&pdev->dev, t, false);

Note that this is safe to drop above assignment with 'false' given here since
i2c_dw_adjust_bus_speed(), which is called after, will set that default and if
nothing is read from firmware the value of bus_freq_hz will be 0 as guaranteed
by kzalloc().

> +
>  	pci_set_drvdata(pdev, dev);
>  
>  	if (controller->setup) {
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


