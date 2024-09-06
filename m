Return-Path: <linux-i2c+bounces-6294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606996EA23
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 08:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241ED1C20753
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 06:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5DF13C9A6;
	Fri,  6 Sep 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9UhjLvI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAC13C9A4;
	Fri,  6 Sep 2024 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603421; cv=none; b=VdknsIG2vnCSL+vRYZ4OlxzyL35HycdfKKdaCa2pgTWiv/SG2d1uLNFJjQQvFbarZ6bcruZ/5x7C1Lb7CN2eI5QI7OagqywzftHrr20zi7JP6U9DBBPiVuNLAtFQMz+NgMD9jSfw6oVirYL3Nd6uIYDjm4buSBxh0iszLk8f06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603421; c=relaxed/simple;
	bh=uXBu1G6EZZ4CGjC8AE0FUY3g3PokLQ48Oi3QEXDnL/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goLbxK5wfQ4B/1x0t3UXKjiEvOOLAMuI70Qh96aVHmYYKUm9v4577eaJ9nEhxyUXIhCms/QDmwnZxGANfUS6Xph/dDdUO8ThCMd6fQ1wo7RCMyFuHnE1K8erRrmzNOjMNB2qf8Nqvo/YmUc4yAwZtaFQ5tTcUOYKRclCoh7knzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9UhjLvI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725603420; x=1757139420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uXBu1G6EZZ4CGjC8AE0FUY3g3PokLQ48Oi3QEXDnL/g=;
  b=L9UhjLvIE8WiDzt1TshDRZs4M1L6Sb1i4Bcu9281haa6GtAHcibDkvDH
   86tV0SWcOO6UYykA+SuzyP9VMKpg2h8YaDMK9BSG1yar2LasSJohgKxo8
   +7Z7IyDl6j2X0Iouq5XS7In9vYDp2StIk44EV64e7glwM6euj58dXXRE5
   +b9F7XtE0RkBFktp8WNWsbjYkQDlx1M4Dia4pCyinpwfD2zd8ecrHtwOZ
   gYuXobR59LXFgbf7/wIcZeqdltMkfewE7+tkzn1Or4Qn7gjUUq5BC9PFU
   c1s1bAfMjS7E/CpyraHqKWTYIcVRUkqQHu+/EhRgJcclxE7QOiWfUvpA8
   Q==;
X-CSE-ConnectionGUID: RYVa8br5Q4iMZqEdYcfUPQ==
X-CSE-MsgGUID: it5V40s1S2WCNfrxEHjp/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41855696"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="41855696"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:16:58 -0700
X-CSE-ConnectionGUID: U0n7jqtpQg2I4Bfc0XND/g==
X-CSE-MsgGUID: I7XBDuj/RnWYtNcMONDM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70652767"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2024 23:16:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA4E01C8; Fri, 06 Sep 2024 09:16:53 +0300 (EEST)
Date: Fri, 6 Sep 2024 09:16:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <20240906061653.GC275077@black.fi.intel.com>
References: <20240906054250.2745-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906054250.2745-1-kimriver.liu@siengine.com>

Hi,

On Fri, Sep 06, 2024 at 01:42:50PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> 
> ---
> 
> V3->V4:
>       1. update commit messages and add patch version and changelog
>       2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments
> 
> link to V1:
> https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++
>  drivers/i2c/busses/i2c-designware-master.c | 27 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e8a688d04aee..54acf8554582 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			enable |= DW_IC_ENABLE_ENABLE;
> +

Drop the empty line here.

> +			/*
> +			 * Wait two ic_clk delay when enabling the i2c to ensure ENABLE bit

i2c -> I2C

> +			 * is already set by the driver (for 400KHz this is 25us)
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			fsleep(25);
> +		}
> +
>  		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>  		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
>  					       !(enable & DW_IC_ENABLE_ABORT), 10,
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..6a053f3b5501 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -253,6 +253,24 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
>  }
>  
> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> +{
> +	u32 status;
> +	int ret;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return true;
> +
> +	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +			1100, 20000);
> +	if (ret)
> +		return false;
> +
> +	return true;

You can also do:

	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
					 !(status & DW_IC_STATUS_MASTER_ACTIVITY),
					 1100, 20000);


But this is already done in i2c_dw_wait_bus_not_busy() (reverse of this)
so perhaps consolidate them?

> +}
> +
>  static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
>  {
>  	u32 val;
> @@ -788,6 +806,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  		goto done;
>  	}
>  
> +	/*
> +	 * This happens rarely and is hard to reproduce. Debug trace
> +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
> +	 */
> +	if (!i2c_dw_is_master_idling(dev))
> +		dev_err(dev->dev, "i2c master controller not idle\n");

i2c -> I2C

(the driver log messages are not too consistent though, something to
improve).

> +
>  	/*
>  	 * We must disable the adapter before returning and signaling the end
>  	 * of the current transfer. Otherwise the hardware might continue
> -- 
> 2.17.1

