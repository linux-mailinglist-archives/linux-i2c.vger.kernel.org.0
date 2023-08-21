Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E04C782D51
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 17:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbjHUPcX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 11:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbjHUPcX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 11:32:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF63F1;
        Mon, 21 Aug 2023 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692631939; x=1724167939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+hIMjI03uwL2llenz588/DRHQXH+NN8ZzzsZwNOX7w=;
  b=lRg1Hfsw/JSOFaawlxLLT6jnfUpOgOKZR3z8Afuj3l5PvO1H+IScf2sq
   CKZJcYQ/B/tPKC4zeq0A7kyJ6zTJxGOvqEg2/M/KLR1f9bo9cwGRXs9OP
   xYRbECKbpK1RyTCcp3JXrijDbbRjwoJ/rSIrDxLTbXvPcDzQcrBcA2DC2
   cBjDRg+zhTppCe0ErkxQB6tTetyfkjuiS00UNMnRcuoleGoiCrn74nODn
   YXjifAisfVnmrdQf2UnhxTeJCdmuPPRUiy+sOn07KwY3tRMIVt5brA5Td
   Ol1RkwN6AzFduqs9gcLBl0m/miqiyDlts8zwst78Bc4Xvfe67IW+FvMAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376368145"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376368145"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:32:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="805955498"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="805955498"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 08:32:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY6t5-002VUo-0p;
        Mon, 21 Aug 2023 18:32:15 +0300
Date:   Mon, 21 Aug 2023 18:32:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH v2] i2c: designware: fix __i2c_dw_disable() in case
 master is holding SCL low
Message-ID: <ZOODfgHq5BXDZnzG@smile.fi.intel.com>
References: <20230821140103.5272-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821140103.5272-1-yann@sionneau.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 21, 2023 at 04:01:03PM +0200, Yann Sionneau wrote:
> From: Yann Sionneau <ysionneau@kalray.eu>
> 
> The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> parameter.
> In this case, when the TX FIFO gets empty and the last command didn't have
> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
> a new command is pushed into the TX FIFO or the transfer is aborted.
> 
> When the controller is holding SCL low, it cannot be disabled.
> The transfer must first be aborted.
> Also, the bus recovery won't work because SCL is held low by the master.
> 
> Check if the master is holding SCL low in __i2c_dw_disable() before trying
> to disable the controller. If SCL is held low, an abort is initiated.
> When the abort is done, then proceed with disabling the controller.
> 
> This whole situation can happen for instance during SMBus read data block
> if the slave just responds with "byte count == 0".
> This puts the driver in an unrecoverable state, because the controller is
> holding SCL low and the current __i2c_dw_disable() procedure is not
> working. In this situation only a SoC reset can fix the i2c bus.

Thank you for an update!
My comments below.

...

>  void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
> -	int timeout = 100;

I would leave this untouched to make patch less invasive and
easier to backport.

> +	unsigned int raw_intr_stats;
> +	bool abort_done = false;
> +	int abort_timeout = 100;
> +	int dis_timeout = 100;
> +	unsigned int enable;
> +	bool abort_needed;
>  	u32 status;
>  
> +	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
> +	regmap_read(dev->map, DW_IC_ENABLE, &enable);
> +
> +	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;

> +

This blank line is not needed.

> +	if (abort_needed) {
> +		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);

> +		do {
> +			regmap_read(dev->map, DW_IC_ENABLE, &enable);
> +			abort_done = !(enable & DW_IC_ENABLE_ABORT);
> +			usleep_range(10, 20);
> +		} while (!abort_done && abort_timeout--);

Now as you split this loop, it may be replaced by regmap_read_poll_timeout()
call.

> +		if (!abort_done)
> +			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
> +	}

...

Other than above, looks good to me.

-- 
With Best Regards,
Andy Shevchenko


