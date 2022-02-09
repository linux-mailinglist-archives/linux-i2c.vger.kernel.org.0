Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEA04AF52B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbiBIPYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbiBIPYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:24:05 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FBAC0613C9;
        Wed,  9 Feb 2022 07:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644420248; x=1675956248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHzrucezh55MZ3ssVxgQFc8eLSNefA8m83ic0IdXwCQ=;
  b=fzIhNPp2I/4m4ixU8mwAdOKuTI+zNPe4+KcTzcp1dWdmntsalb4OC0nc
   QBSiiCNgqfo+e+PhOesVhwGc/ydl9juAO6udq//AUDLL0igjStoU9T6CX
   WUwKfGxlB/SJF0maJJapNYMNn3dDUwOuPT4T8IPqNLELtXTL0qT/2a00E
   t79wOpMZBk/MK+/mlqca1HYwCkQrbbjm3OV0wIwflOdyJnwZwYmlTY7kL
   nKxXGs8ZXbpUgha6DKDil/ADPzA0/IjHyu7VWsOFOqjhIPuMp5sNKT5sk
   POyaCzGNcuruZ2muSzmKBLZu77bINPSZdFhOiGn7wYmvPxdbxiOlsBt1T
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249174889"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="249174889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:24:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="500000128"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:24:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nHooE-002ee9-3z;
        Wed, 09 Feb 2022 17:23:06 +0200
Date:   Wed, 9 Feb 2022 17:23:05 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, wsa@kernel.org, rrangel@chromium.org,
        mw@semihalf.com, jaz@semihalf.com, upstream@semihalf.com,
        thomas.lendacky@amd.com, alexander.deucher@amd.com,
        Nimesh.Easow@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v4 1/2] i2c: designware: Add missing locks
Message-ID: <YgPcWRsaW52Cgii0@smile.fi.intel.com>
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-2-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208141218.2049591-2-jsd@semihalf.com>
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

On Tue, Feb 08, 2022 at 03:12:17PM +0100, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controller by kernel.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
>  drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index bf2a4920638a..9f8574320eb2 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -578,7 +578,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
>  	 * Try to detect the FIFO depth if not set by interface driver,
>  	 * the depth could be from 2 to 256 from HW spec.
>  	 */
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
> +	i2c_dw_release_lock(dev);
>  	if (ret)
>  		return ret;
>  
> @@ -607,6 +612,11 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
>  void i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
>  	u32 dummy;
> +	int ret;
> +
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return;
>  
>  	/* Disable controller */
>  	__i2c_dw_disable(dev);
> @@ -614,6 +624,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
>  	/* Disable all interrupts */
>  	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
>  	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
> +
> +	i2c_dw_release_lock(dev);
>  }
>  
>  void i2c_dw_disable_int(struct dw_i2c_dev *dev)
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 9177463c2cbb..1a4b23556db3 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -905,7 +905,13 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
>  	}
>  
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
>  	i2c_dw_disable_int(dev);
> +	i2c_dw_release_lock(dev);
> +
>  	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
>  			       dev_name(dev->dev), dev);
>  	if (ret) {
> -- 
> 2.35.0.263.gb82422642f-goog
> 

-- 
With Best Regards,
Andy Shevchenko


