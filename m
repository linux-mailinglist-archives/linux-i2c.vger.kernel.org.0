Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21EA679525
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 11:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjAXK1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 05:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjAXK1m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 05:27:42 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC26B3EC77
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674556060; x=1706092060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrK7BSxEqRO14euxA1sedBpI7Frdc8RVhNqfdolOKcM=;
  b=aI20P8qxkeA12rBYiTX6nyQpJEAMljoCOlKncpzhoyb4AMUvUKLAQQc3
   T/5ytFg+eP+qPc7dDHg7+qa56BoxTToGYI0xk2hYlaY0USbuPV9YcPqEB
   MvZM9q7nvZoxkgB8K8ZL/Ko+STO7ATajimaDDvI5IA+NmJi6uzcWeBUgm
   UWuroTxyN8q1ss64DEgScBJn53RI1G04FHyxLXAZglNCfaLKQh0q3IFhk
   WhID8CrFrEPfWzSEy77ZT8y3kwUt5pY7TfjuvHSRz0RV0iVfkyc3dmfZo
   5DpARxwrfMRS7p0GVXAG5YUWJi6Fy2BRCYwaLOkaEzE0vekKeLkbOuOEP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328354553"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="328354553"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907431314"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="907431314"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 02:27:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pKGWf-00EI1X-0P;
        Tue, 24 Jan 2023 12:27:37 +0200
Date:   Tue, 24 Jan 2023 12:27:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y8+ymCM3nQ0/b6sH@smile.fi.intel.com>
References: <20230124100650.1327656-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124100650.1327656-1-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 24, 2023 at 03:36:50PM +0530, Shyam Sundar S K wrote:
> On some AMD platforms, based on the new designware datasheet,
> BIOS sets the BIT(11) within the IC_CON register to advertise
> the "bus clear feature capability".
> 
> AMD/Designware datasheet says:
> 
> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> Description: In Master mode:
> - 1'b1: Bus Clear Feature is enabled.
> - 1'b0: Bus Clear Feature is Disabled.
> In Slave mode, this register bit is not applicable.
> 
> On AMD platform designs:
> 1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
> of SCL/SDA stuck low.
> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
> recovery procedure.
> 
> Currently, the way in which the "master_cfg" is built in the driver, it
> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
> cannot initiate the bus recovery if the stuck low is detected.
> 
> Hence add a check in i2c_dw_probe_master() that if the BIOS
> advertises the bus clear feature, let driver not ignore it and
> adapt accordingly.

Fine with me (see one nit-pick below)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2->v3:
> - Use regmap_read() instead of ioread32()
> - Move the proposed changes to i2c_dw_probe_master() and protect the
>   regmap read calls with acquire/release lock calls.
> 
> v1->v2:
> - Update the commit message
> 
>  drivers/i2c/busses/i2c-designware-core.h   |  1 +
>  drivers/i2c/busses/i2c-designware-master.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 95ebc5eaa5d1..a7ec8d5d0e72 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -37,6 +37,7 @@
>  #define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
>  #define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
>  #define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
> +#define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
>  
>  #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
>  
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 45f569155bfe..5db71e0a424a 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -865,6 +865,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
>  	unsigned long irq_flags;
> +	u32 ic_con;
>  	int ret;
>  
>  	init_completion(&dev->cmd_complete);
> @@ -884,6 +885,24 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;

> +	/*
> +	 * On AMD platforms BIOS advertises the bus clear feature
> +	 * and enables the SCL/SDA stuck low. SMU FW does the
> +	 * bus recovery process. Driver should not ignore this BIOS
> +	 * advertisement of bus clear feature.
> +	 */

Move this comment closer to the actual regmap_read() call.

Perhaps you may add here the following

	/* Lock the bus for accessing DW_IC_CON */

> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(dev->map, DW_IC_CON, &ic_con);
> +	i2c_dw_release_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
> +		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
> +
>  	ret = dev->init(dev);
>  	if (ret)
>  		return ret;
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


