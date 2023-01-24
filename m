Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889946798CD
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 13:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjAXM6o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 07:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbjAXM6n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 07:58:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6512CC11
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 04:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674565094; x=1706101094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jlsZ6fSin+BTY7nZCXGcsDrCX8qKdgyNCQLdyiXbJvs=;
  b=E4mnkTcye09KRUBVLmI1h9kjA5Im1ewtqWNTl/PF9DdAdzihESK6R/8J
   qzs53wqJMA1S+57YAOc/rlm9sIYEU592G684V75rARFhHu/P929jehxc+
   zggTyfuBa4VVwr0BxChQlDssQxDn1naCmYxcWQ/rMgtyRCtdp75Jq41NM
   Y0DHyWenNEK4+qoxBNZSaNplFNhA0+ilwMs0EXiMcvpiYF1AU65mBN3F8
   ktp0OU3DTabqVHQGljWiYzf3Q9mq080qgQa3R7hIEgntmAghhn2+oLyTo
   eGa0TQ2uXl8ykF6QnmNKIgRlAJcry1TeuVz/5GW0eklFFI05oAzH5TTwm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314187070"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314187070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750816860"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="750816860"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 04:58:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pKIsM-00ELbG-2j;
        Tue, 24 Jan 2023 14:58:10 +0200
Date:   Tue, 24 Jan 2023 14:58:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Change from u32 to unsigned int for
 regmap_read() calls
Message-ID: <Y8/V4pi2tMLVjG8/@smile.fi.intel.com>
References: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
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

On Tue, Jan 24, 2023 at 05:17:32PM +0530, Shyam Sundar S K wrote:
> regmap_read() API signature expects the caller to send "unsigned int"
> type to return back the read value, but there are some occurrences of 'u32'
> across i2c-designware-* files.
> 
> Change them to match the regmap_read() signature.

So, the keyword is "to bring a consistency".

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 11 ++++++-----
>  drivers/i2c/busses/i2c-designware-core.h   |  2 +-
>  drivers/i2c/busses/i2c-designware-master.c | 13 +++++++------
>  drivers/i2c/busses/i2c-designware-slave.c  |  4 ++--
>  4 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index a3240ece55b2..ae808e91b17f 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -388,7 +388,7 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
>  
>  int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
>  {
> -	u32 reg;
> +	unsigned int reg;
>  	int ret;
>  
>  	ret = i2c_dw_acquire_lock(dev);
> @@ -439,7 +439,7 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
>  void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
>  	int timeout = 100;
> -	u32 status;
> +	unsigned int status;
>  
>  	do {
>  		__i2c_dw_disable_nowait(dev);
> @@ -524,7 +524,7 @@ void i2c_dw_release_lock(struct dw_i2c_dev *dev)
>   */
>  int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
>  {
> -	u32 status;
> +	unsigned int status;
>  	int ret;
>  
>  	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> @@ -568,7 +568,8 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
>  
>  int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
>  {
> -	u32 param, tx_fifo_depth, rx_fifo_depth;
> +	u32 tx_fifo_depth, rx_fifo_depth;
> +	unsigned int param;
>  	int ret;
>  
>  	/*
> @@ -608,7 +609,7 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
>  
>  void i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
> -	u32 dummy;
> +	unsigned int dummy;
>  	int ret;
>  
>  	ret = i2c_dw_acquire_lock(dev);
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index a7ec8d5d0e72..903d5928e230 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -265,7 +265,7 @@ struct dw_i2c_dev {
>  	u8			*rx_buf;
>  	int			msg_err;
>  	unsigned int		status;
> -	u32			abort_source;
> +	unsigned int		abort_source;
>  	int			irq;
>  	u32			flags;
>  	struct i2c_adapter	adapter;
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 3be7581ee3fb..55ea91a63382 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -39,7 +39,7 @@ static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
>  
>  static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>  {
> -	u32 comp_param1;
> +	unsigned int comp_param1;
>  	u32 sda_falling_time, scl_falling_time;
>  	struct i2c_timings *t = &dev->timings;
>  	const char *fp_str = "";
> @@ -211,7 +211,7 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_msg *msgs = dev->msgs;
>  	u32 ic_con = 0, ic_tar = 0;
> -	u32 dummy;
> +	unsigned int dummy;
>  
>  	/* Disable the adapter */
>  	__i2c_dw_disable(dev);
> @@ -287,7 +287,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
>  	int cmd = 0, status;
>  	u8 *tx_buf;
> -	u32 val;
> +	unsigned int val;
>  
>  	/*
>  	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
> @@ -505,7 +505,8 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>  	unsigned int rx_valid;
>  
>  	for (; dev->msg_read_idx < dev->msgs_num; dev->msg_read_idx++) {
> -		u32 len, tmp;
> +		unsigned int tmp;
> +		u32 len;
>  		u8 *buf;
>  
>  		if (!(msgs[dev->msg_read_idx].flags & I2C_M_RD))
> @@ -653,7 +654,7 @@ static const struct i2c_adapter_quirks i2c_dw_quirks = {
>  
>  static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
>  {
> -	u32 stat, dummy;
> +	unsigned int stat, dummy;
>  
>  	/*
>  	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
> @@ -714,7 +715,7 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
>  static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
>  {
>  	struct dw_i2c_dev *dev = dev_id;
> -	u32 stat, enabled;
> +	unsigned int stat, enabled;
>  
>  	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
>  	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index c6d2e4c2ac23..cec25054bb24 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -98,7 +98,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
>  
>  static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
>  {
> -	u32 stat, dummy;
> +	unsigned int stat, dummy;
>  
>  	/*
>  	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
> @@ -150,7 +150,7 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
>  static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>  {
>  	struct dw_i2c_dev *dev = dev_id;
> -	u32 raw_stat, stat, enabled, tmp;
> +	unsigned int raw_stat, stat, enabled, tmp;
>  	u8 val = 0, slave_activity;
>  
>  	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


