Return-Path: <linux-i2c+bounces-6309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD896ED2B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 10:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68866B22C94
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 08:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972FA145A11;
	Fri,  6 Sep 2024 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awJjkr48"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C941A28C;
	Fri,  6 Sep 2024 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610074; cv=none; b=U+vuEjc9+8STlwRcaZpELu/qo2lqZjC+c4v2FbdoI8Meksak7ycRUDY5LQ83DdCyfpx7CbdMWhJaLioHZ3QiNj0d8whOvYMt1+b2dxlTB0ZSVFyn95nlS7zOYdzGvKv0AS471n5ytVhREc6MSjtbmOWJ+HIATYir3v2KrmHuUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610074; c=relaxed/simple;
	bh=czy23RXD4u/8iEq0yhp5b8a8PaJmDxtU2sbJWwr/0p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNwUwwk4C6DyEsNfssFdaCmrksg1ukHRah884PHqUYYSeQ6fNohAgScLTLOA/RL2o2vEX00JereDTXVktSxJH1idSr7zl1pPyAmRCUaqMel9Ce8Qttq1BJZ09cIZdsSvPIY0gWGtfDwKTFZB23pKh9H5Q9pqoK4m+1IYyE8Xxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awJjkr48; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725610072; x=1757146072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czy23RXD4u/8iEq0yhp5b8a8PaJmDxtU2sbJWwr/0p4=;
  b=awJjkr48k0EJX6H0OPGk3S5eIj6//QRIGAqfzOe0UqPtFdCM9v+KAuqk
   rio3ae+0Ki0kaRkvr1LD8SQ8FY4SWOziQ5jWJipxZc/cxPzw8ThZ405uT
   9gPK1dp7byikVA18kOZjIxxb/E93397hSnLp58ZfVfzTjr4o728nw7drG
   nv9YqNc/ZiYdy6tdoH2ok0051Akha2BjYoVtVzGEL4XVYQJmgHdL5du55
   gd+xyYuZeQs1dvxmp8idVPdIEdlKWhfzyJ132DEBKS2T+3sRxg4s4+4OG
   +d6SslI3LQlAlgAJ+DZhgLaaWT8VkDuoiiIl5dVDjrjnnn7EorRIJbxe0
   A==;
X-CSE-ConnectionGUID: cEpmoIXtSPGekXdYE9TUrQ==
X-CSE-MsgGUID: YEJPymR4Q96hRjl+mffOhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28149642"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="28149642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 01:07:52 -0700
X-CSE-ConnectionGUID: DxtLBt4vRQq+WrxhkbIsKw==
X-CSE-MsgGUID: QwlWCKdwSt+XQ0JMHHfdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65875319"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2024 01:07:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1E0A6E7; Fri, 06 Sep 2024 11:07:49 +0300 (EEST)
Date: Fri, 6 Sep 2024 11:07:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <20240906080749.GE275077@black.fi.intel.com>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906074731.3064-1-kimriver.liu@siengine.com>

Hi,

On Fri, Sep 06, 2024 at 03:47:31PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> 
> ---
> V5->V6: restore i2c_dw_is_master_idling() function checking
> V4->V5: delete master idling checking
> V3->V4:
>       1. update commit messages and add patch version and changelog
>       2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments
> 
> link to V1:
> https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 11 +++++++++++
>  drivers/i2c/busses/i2c-designware-master.c | 22 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e8a688d04aee..2b3398cd4382 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -453,6 +453,17 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			enable |= DW_IC_ENABLE_ENABLE;
> +			/*
> +			 * Wait two ic_clk delay when enabling the I2C to ensure ENABLE bit
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
> index c7e56002809a..132b7237c004 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -253,6 +253,19 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
>  }
>  
> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> +{
> +	u32 status;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return true;
> +
> +	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +			1100, 20000);
> +}

Yeah, I now realize that i2c_dw_wait_bus_not_busy() checks for
DW_IC_STATUS_ACTIVITY not for DW_IC_STATUS_MASTER_ACTIVITY as I thought
so consolidating them makes not that much sense.

This looks good to me,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

