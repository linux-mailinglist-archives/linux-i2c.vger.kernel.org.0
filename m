Return-Path: <linux-i2c+bounces-13669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24871BF089D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2CE53B97B7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 10:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B2B2F6196;
	Mon, 20 Oct 2025 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UG2Tn5tc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56B2F5313;
	Mon, 20 Oct 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956203; cv=none; b=cv8fRJKRd/meiKt1PVEbOmTiVktjs8+mGHvImumDVdVh6DmFmIEh7HQoJ7EQfIPC8dOE1/DruKjyuXrTygvYUyuFTyf5Z5Gse/Of3bCZNmicH7f4EWNHjaldPtEB6IAjNxBYzM1zvaobkJT9rh0K64dz407FrnOxjl5AIqSqRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956203; c=relaxed/simple;
	bh=O4zsHeZ8S8EDdAZy6SzWfWIxqoZoJ9xVjHhVZHJynGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj1YNSgc0ravEjj3tfpquW2xOe+E2y8YT+9u1vsllA8fMzyzYLdwxdgPHBKOQ6KeNnGuJdvLYtnP3g/yNHHhbrJ+COJLCvQEiSrUuqPs41ZmjHoV3vCvVANqdi96yVJGzs04ziKvcZKduShPmUmW/A5S6vXPNC7OwDuq5Ay/XEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UG2Tn5tc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760956201; x=1792492201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O4zsHeZ8S8EDdAZy6SzWfWIxqoZoJ9xVjHhVZHJynGg=;
  b=UG2Tn5tcb6S4jqGWaqzFe+inu8+FqyAXRkZz4FIfSFwrdm/iIXNv+PdU
   wqbrHwSNUF+k9cj8rYE7E55p1XUq6L6EYGmGlyr4fyTe2/77sLS/OxOH0
   DsdVwCXgpYGJV9Iy7f10F7pOJYHRHvtCMeoDJYHzL48G/pYXjgySboik9
   cJ7NVOJ9b9vNLg0n5eeGw5whCPDlPzUeezmqm7Yxq3EftZBIZYorjaarz
   06Yj83Lb87H8xCLqKvvdoSFivhSXAfwaJISWdaEdRzj03WkwQ1HOFuWCE
   Y/gOur6hUfh+uj8Nf6lRsdjV7PN84SDlXGu2rXTIl8KwcvhLpqq4J30TJ
   w==;
X-CSE-ConnectionGUID: UqaeKbMIQxSly8xXodAGCg==
X-CSE-MsgGUID: aGn5afrjTx2ahTWZmwgj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="88537926"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="88537926"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:30:01 -0700
X-CSE-ConnectionGUID: zWABuonbRbS1ip2ImfbO1g==
X-CSE-MsgGUID: RU7DY4gOTKKSh/QSk7sUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183707922"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2025 03:29:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 67B9895; Mon, 20 Oct 2025 12:29:58 +0200 (CEST)
Date: Mon, 20 Oct 2025 12:29:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: designware: Disable SMBus interrupts to prevent
 storms from mis-configured firmware
Message-ID: <20251020102958.GL2912318@black.igk.intel.com>
References: <20251011073057.2959-1-guojinhui.liam@bytedance.com>
 <20251011073057.2959-2-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251011073057.2959-2-guojinhui.liam@bytedance.com>

Hi,

On Sat, Oct 11, 2025 at 03:30:57PM +0800, Jinhui Guo wrote:
> When probing the I2C master, disable SMBus interrupts to prevent
> storms caused by broken firmware mis-configuring IC_SMBUS=1; the
> handler never services them and a mis-configured SMBUS Master
> extend-clock timeout can flood the CPU.
> 
> Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
> ---
>  drivers/i2c/busses/i2c-designware-core.h   |  1 +
>  drivers/i2c/busses/i2c-designware-master.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 347843b4f5dd..d1122ff0a1b7 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -78,6 +78,7 @@
>  #define DW_IC_TX_ABRT_SOURCE			0x80
>  #define DW_IC_ENABLE_STATUS			0x9c
>  #define DW_IC_CLR_RESTART_DET			0xa8
> +#define DW_IC_SMBUS_INTR_MASK		0xcc
>  #define DW_IC_COMP_PARAM_1			0xf4
>  #define DW_IC_COMP_VERSION			0xf8
>  #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7a72c28786c..eeb60536da32 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -997,6 +997,11 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	return 0;
>  }
>  
> +static inline void i2c_dw_disable_smbus_intr(struct dw_i2c_dev *dev)
> +{
> +	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
> +}

I wonder instead of this wrapper, can you just do this in
i2c_dw_init_master() right after the adapter has been disabled?

> +
>  int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
> @@ -1063,6 +1068,12 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  		return ret;
>  
>  	__i2c_dw_write_intr_mask(dev, 0);
> +	/*
> +	 * Mask SMBus interrupts to block storms from broken
> +	 * firmware that leaves IC_SMBUS=1; the handler never
> +	 * services them.
> +	 */
> +	i2c_dw_disable_smbus_intr(dev);
>  	i2c_dw_release_lock(dev);
>  
>  	if (!(dev->flags & ACCESS_POLLING)) {
> -- 
> 2.20.1

