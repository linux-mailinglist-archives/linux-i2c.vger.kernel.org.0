Return-Path: <linux-i2c+bounces-6912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA397D94E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 19:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E584C1C20BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF1A2AEF1;
	Fri, 20 Sep 2024 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTLWDshG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8938396
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726853986; cv=none; b=CTcTDJHNbPOzfjh5fbJQURuUb8TxcgYXlrni4LhfugM2W/k6q+ASsOF7/JiyDBfMooLul4FMHSaK5Cugg3U0A5NIiHMVJwf6vcujjRhNskrQpUgs+jmAnbt6rrcgxxtTneuHhP2HA2DvHgZNUximSTQsz58hGiXMUmM8JxPxQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726853986; c=relaxed/simple;
	bh=Vu2qAXis80qmmcK6TZsjhmrqYXACnTm1eZRQXtvzeJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh1Me416wpu30I+9uSsEPvWIUP7/dQSUyHBme4zGpvzaU1SU+era06am7IMEqBT7H5AKijOTyTHynEyhTYadcsXYW3WgwSRpnkBLGLENqa1V1/OF8cn0+VU+hFBeT932uHxBXkseoFA/R4W1vKagm+QbyNv0O7RbezvlI+R0tHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTLWDshG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726853985; x=1758389985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vu2qAXis80qmmcK6TZsjhmrqYXACnTm1eZRQXtvzeJs=;
  b=ZTLWDshGisAEmZW5kw3ZSg91qdbwYrTVJG+6tiKv/DI4jwCJndhQUTsi
   53WwoTKXUiHRJR3UBT7jwSReQ1Cg1pk6dkHdpQdkju7MdcSI4gMUNC3Tr
   HXhxWILRE87GY8ygtt7aO0FSKYl8J8h4qhtrXLnh9r+Er6r11cjxR+ULN
   SefR5UGCX446v+paOr9Sm5VdjaLQT4S4X3cAuJ4jGrbuwWtf6G7YYC8MA
   zogSHKLT/UB/BIUaiSStJd86xVOtqTBEH/xjbE8UsteGkd0dF3DaxjRvf
   pPb3dNyB3oYpOxLrRkYV3hoUWWwTRjZ+Z1/kehLcnvVMYkSjXRLU1m/KN
   A==;
X-CSE-ConnectionGUID: SAmtn+gRS0qR2WYs6pt5+w==
X-CSE-MsgGUID: CptnV9CgQGe2TdSTI3INHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28766870"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="28766870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:39:44 -0700
X-CSE-ConnectionGUID: wT0T5WPNTVKDJYdsTC+xLg==
X-CSE-MsgGUID: JfSUyiSrRbWZz1mqAmQnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="74775295"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:39:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srhbY-0000000AzZ0-1rG0;
	Fri, 20 Sep 2024 20:39:40 +0300
Date: Fri, 20 Sep 2024 20:39:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 5/8] i2c: amd-asf: Add i2c_algorithm operations to
 support AMD ASF with SMBus
Message-ID: <Zu2zXHWGKXXu6HXJ@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-6-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:10PM +0530, Shyam Sundar S K wrote:
> Implement the i2c_algorithm operations to enable support for AMD ASF
> (Alert Standard Format) with SMBus. This enhancement includes:
> 
> - Adding functionality to identify and select the supported ASF functions.
> - Implementing mechanisms for registering and deregistering I2C slave
>   devices.
> - Providing support for data transfer operations over ASF.
> 
> Additionally, include a 'select' Kconfig entry as the current patch

> utilizes reg_slave and unreg_slave callbacks, which are controlled by
> IS_ENABLED(CONFIG_I2C_SLAVE).

utilizes .reg_slave() and .unreg_slave() callbacks, which are controlled
by CONFIG_I2C_SLAVE.

...

> +static u32 amd_asf_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BYTE |
> +		I2C_FUNC_SLAVE | I2C_FUNC_SMBUS_WRITE_BLOCK_DATA | I2C_FUNC_SMBUS_PEC;

Second line is not indented properly. Also I would suggest to use more logical
grouping and line wrap.

	return I2C_FUNC_SMBUS_WRITE_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
	       I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_PEC | I2C_FUNC_SLAVE;

> +}

...

With the above changes being applied,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



