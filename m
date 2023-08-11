Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40C777912B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 15:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbjHKN7d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 09:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjHKN7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 09:59:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DBED7;
        Fri, 11 Aug 2023 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691762372; x=1723298372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5z5uT2CgI6pXLxCuwi7romU3V41fDpKQqrm9GMP/BX0=;
  b=eNIK5dkDSfOm5pfRVDgn/P/aakqIKWc9PeGEhH7JudLXIf/vu4lQUve8
   Yk1qmPGm57hfJw2+KjK+bIsBECF/8KWpynWn4uKTR3m1M20tnmTEaGZQP
   dogasbARYENEIQVcKP9Qi7BRs8ZOe264t1NrjwGWPKcd1sPP45fZ3M+2O
   b0UUrSM44U3gjkK0J83agPrgjA3adGU4FNtLy+nExU8EwNA3eL3C8yD2d
   kxCF4K2eqOxHgPYuokPpzoVFW52pr8XkxTmIsyy6MgXDvZEqO/8GkjKVg
   5+nv6AJjBFK/aCgURaBsfuPABoxNYak88B1tHc0Y7pyabIfuyIFrnTn79
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="351283464"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="351283464"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 06:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798049524"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="798049524"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 06:59:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qUSfo-000ECV-0t;
        Fri, 11 Aug 2023 16:59:28 +0300
Date:   Fri, 11 Aug 2023 16:59:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH 1/2] i2c: designware: fix __i2c_dw_disable in case master
 is holding SCL low
Message-ID: <ZNY+vyEsM/kNKgHt@smile.fi.intel.com>
References: <20230811124624.12792-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811124624.12792-1-yann@sionneau.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 11, 2023 at 02:46:23PM +0200, Yann Sionneau wrote:
> From: Yann Sionneau <ysionneau@kalray.eu>
> 
> The designware IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN

DesignWare

> parameter.
> In which case, if the TX FIFO gets empty and the last command didn't have

"In this case when the..."

> the STOP bit (IC_DATA_CMD[9]), the dw_apb_i2c will hold SCL low until

"the controller will..."

> a new command is pushed into the TX FIFO or the transfer is aborted.
> 
> When the dw_apb_i2c is holding SCL low, it cannot be disabled.

"When the controller..."

> The transfer must first be aborted.
> Also, the bus recover won't work because SCL is held low by the master.
> 
> This patch checks if the master is holding SCL low in __i2c_dw_disable

Grep for "This patch" in the Submitting Patches document and fix this
accordingly.

__i2c_dw_disable()

> before trying to disable the IP.
> If SCL is held low, an abort is initiated.
> When the abort is done, the disabling can then proceed.
> 
> This whole situation can happen for instance during SMBUS read data block
> if the slave just responds with "byte count == 0".
> This puts the master in an unrecoverable state, holding SCL low and the
> current __i2c_dw_disable procedure is not working. In this situation

__i2c_dw_disable()

> only a Linux reboot can fix the i2c bus.

If reboot helps, what magic does it do that Linux OS can't repeat in software?
Please, elaborate more.

...

>  	int timeout = 100;
>  	u32 status;
> +	u32 raw_intr_stats;
> +	u32 enable;
> +	bool abort_needed;
> +	bool abort_done = false;

Perhaps reversed xmas tree order?

	bool abort_done = false;
	bool abort_needed;
	u32 raw_intr_stats;
	int timeout = 100;
	u32 status;
	u32 enable;

...

> +	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
> +	if (abort_needed)
> +		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>  
>  	do {
> +		if (abort_needed && !abort_done) {
> +			regmap_read(dev->map, DW_IC_ENABLE, &enable);
> +			abort_done = !(enable & DW_IC_ENABLE_ABORT);
> +			continue;

This will exhaust the timeout and below can be run at most once,
is it a problem?

Also it's a tight busyloop, are you sure it's what you need?

> +		}

-- 
With Best Regards,
Andy Shevchenko


