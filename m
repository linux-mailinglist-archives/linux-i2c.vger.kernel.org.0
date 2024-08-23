Return-Path: <linux-i2c+bounces-5746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2E95CFD2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE791F238DD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C970D1891DE;
	Fri, 23 Aug 2024 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GldC4y8Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0EB18BB9A;
	Fri, 23 Aug 2024 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422410; cv=none; b=Ll+hTG4cyt91FhxXUUOT1G4XKBBupGTmZjVMBcuGyd54CU6BNelqmiMLCA2h/gTNgcaLBpY9DLgeXG6m+Zfhy96pCUVe5clLkfojEur2/tjTQY/bOwrpyQH7iAnjDKc56v35/GOqF2gRYJTLFO8mtNe6zXuEauugkl2AH/NxGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422410; c=relaxed/simple;
	bh=a+VW+8QoBbMiCVC5Oj2GpnDDg+LAHSi55S3BmDqtBL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhQPd/eP4ehTRe5ogp4F0rr2wpe6chpPZvehCuLF2KL28N2v/8OAXgsY3G486Lrilro/EaYPk7h3R17Mz6ZVZFZTGnWjRHAHujm7RAA64GAMA7N6pQ8PuX8bExixs+iIcaB+rGJoNu1DWcUFOvykeqcyAeW5nynMz5Ho3IOr9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GldC4y8Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724422409; x=1755958409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+VW+8QoBbMiCVC5Oj2GpnDDg+LAHSi55S3BmDqtBL0=;
  b=GldC4y8YuK6dhllfZI1vKqtf8id27g5+FM+xV/XlJJ6WyTSsfkM1E2fm
   lH+PJ49OIFjjPJFErg79aBwNDplU4lYSZ9Uc/VxAcyqnni8yGQj5IFHFG
   ZXByn05VfS2zhfK5hoc0EIc69Oq6olPNqvhV1hQqZQz0Cf579xDuoMsLy
   yZZOy1vJqReU6DH0kvd9/gt+7TSt02Bf5AdumUBF9cy7b8TpL4mWgOL4U
   RwNRQA23bMBmptWLDJJXGRozpbhwzKqF2MxxM+OHzlffy+kH74OWJrprG
   ix56YVvDbBdbp+RwITAV6vFdxgPT8iVqsJpgFhs8mQzdOdooc+YiQlbc6
   Q==;
X-CSE-ConnectionGUID: /Bl3bjs4TqWmWkoPOuK+zw==
X-CSE-MsgGUID: Gh5ZojHkQBmWs867nHPUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33460159"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33460159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:13:29 -0700
X-CSE-ConnectionGUID: j/Gc6aD8Sk+oDC9kHpgLkw==
X-CSE-MsgGUID: MdynuL4qTbqCTas1Zy2gPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61779274"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:13:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shV2X-00000000ofo-1dm9;
	Fri, 23 Aug 2024 17:13:21 +0300
Date: Fri, 23 Aug 2024 17:13:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net 3/3] i2c: designware: support hardware lock for
 Wangxun 10Gb NIC
Message-ID: <ZsiZALjnoUpb0H_I@smile.fi.intel.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <20240823030242.3083528-4-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823030242.3083528-4-jiawenwu@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:02:42AM +0800, Jiawen Wu wrote:
> Support acquire_lock() and release_lock() for Wangxun 10Gb NIC. Since the
> firmware needs to access I2C all the time for some features, the semaphore
> is used between software and firmware. The driver should set software
> semaphore before accessing I2C bus and release it when it is finished.
> Otherwise, there is probability that the correct information on I2C bus
> will not be obtained.

...

>  i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o

>  i2c-designware-platform-y 				:= i2c-designware-platdrv.o
> +i2c-designware-platform-y 				+= i2c-designware-wx.o

These lines have TABs/spaces mixture. Please fix at least your entry to avoid
this from happening.


...

>  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
>  #endif

^^^

> +int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev);

See below.

...

>  		.probe = i2c_dw_amdpsp_probe_lock_support,
>  	},
>  #endif

^^^

> +	{
> +		.probe = i2c_dw_txgbe_probe_lock_support,
> +	},

Do we all need this support? Even if the driver is not compiled? Why?

...

> +#include <linux/platform_data/i2c-wx.h>
> +#include <linux/platform_device.h>
> +#include <linux/i2c.h>
> +#include <linux/pci.h>

This is a semi-random list. Please, take your time to understand the core you
wrote. Follow IWYU principle.

...

> +static int i2c_dw_txgbe_acquire_lock(struct dw_i2c_dev *dev)
> +{
> +	void __iomem *req_addr;
> +	u32 swsm;
> +	int i;
> +
> +	req_addr = dev->ext + I2C_DW_TXGBE_MNG_SW;
> +
> +	for (i = 0; i < I2C_DW_TXGBE_REQ_RETRY_CNT; i++) {

Retry loops much better in a form of

	unsigned int retries = ...;
	...
	do {
		...
	} while (--retries);

BUT... see below.

> +		writel(I2C_DW_TXGBE_MNG_SW_SM, req_addr);
> +
> +		/* If we set the bit successfully then we got semaphore. */
> +		swsm = readl(req_addr);
> +		if (swsm & I2C_DW_TXGBE_MNG_SW_SM)
> +			break;
> +
> +		udelay(50);

So, can a macro from iopoll.h be utilised here? Why not?

> +	}
> +
> +	if (i == I2C_DW_TXGBE_REQ_RETRY_CNT)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

> +int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev->dev);

Why do you need this dance? I.o.w. how pdev is being used here?

> +	struct txgbe_i2c_platform_data *pdata;
> +
> +	pdata = dev_get_platdata(&pdev->dev);
> +	if (!pdata)
> +		return -ENXIO;
> +
> +	dev->ext = pdata->hw_addr;
> +	if (!dev->ext)
> +		return -ENXIO;
> +
> +	dev->acquire_lock = i2c_dw_txgbe_acquire_lock;
> +	dev->release_lock = i2c_dw_txgbe_release_lock;
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



