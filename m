Return-Path: <linux-i2c+bounces-6728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F9978882
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199071F23E0C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064B613AA4C;
	Fri, 13 Sep 2024 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu0gnVMa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167A224CF
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254489; cv=none; b=C8ZLbqP409aeNcImZRcpTIT6Ej4JfehWHlkGBzXC8srkdwhEKyKvTQDp3UjuEXpp4/N2x+xQ2e+j3HEhDaOXTFgolazM0Ejan3kXB7rpagtu21iaZnAQtFzFujfUsFPv6bfHsFYhMsDapU+GXd2ZaI/FXu3YsuKSa1e8pX31eIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254489; c=relaxed/simple;
	bh=cGwV3ex/TpidD+H1KG66vOe85XlUnxyvjLk3Onymyrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQBkmBc7icdYTjzwxUfMArXCdOWPQpuxQxUJQSjfdU0wJgvlqGEyS7Fg0cRLUao6wb8xoWzuOrJ88gUbHYrvWZlHOj8qrPyEDYaQr1rZJK/isSdhdmp3FBB7zt0OO7RgM/2z4Q7EoVnNO39XOTFLGOGoPAcGeudr+SIy0RdjzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu0gnVMa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726254488; x=1757790488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cGwV3ex/TpidD+H1KG66vOe85XlUnxyvjLk3Onymyrs=;
  b=Gu0gnVMa4clbpGq0cEl+sAu9z4SXf5BziuxzAq9QdE9OT4nHqVipKDN+
   cwfzaPsVgWwxnKPRPNoV0psRj9rtnZirM+WHnUC0Wf55ZlFVqvPHWrOvS
   eRu3AauHDUN7A/IcWxh1S/rnG6z0l23GvEmvnGdnze0IFgNfKWtqG5HVk
   fkD/LQw49ex3YDp4jbqkmfZNr5Q78VU5YWuRKZ9qNXPdDcV3c+ZsEieMR
   XpGmX76cM9/qFK4VKyGGqxk6W48dFY+07EQ8GGYXF8UGnJFt7rgErAiD2
   TRgU3ORm07e84cBp897VkrFcbslc9JBkv04nvq0SEhFROcqXyqqcTJJqH
   w==;
X-CSE-ConnectionGUID: jey8lGXuRteFuyU3LXEV6g==
X-CSE-MsgGUID: /FJDCQGjQbORktoHTHgtsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35751841"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="35751841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:08:07 -0700
X-CSE-ConnectionGUID: IZ/BHNlzQxyO+ABFtINugg==
X-CSE-MsgGUID: /QvFF9ShStmf0D01kNCDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91426818"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:08:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBeF-00000008OtS-0rnd;
	Fri, 13 Sep 2024 22:08:03 +0300
Date: Fri, 13 Sep 2024 22:08:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 5/8] i2c: amd-asf: Add i2c_algorithm operations to
 support AMD ASF with SMBus
Message-ID: <ZuSNkuVMnISqMtD9@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-6-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:07PM +0530, Shyam Sundar S K wrote:
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

...

> +/* ASF address offsets */
> +#define ASFLISADDR	(9 + piix4_smba)
> +#define ASFSTA		(0xA + piix4_smba)
> +#define ASFSLVSTA	(0xD + piix4_smba)
> +#define ASFDATABNKSEL	(0x13 + piix4_smba)
> +#define ASFSLVEN	(0x15 + piix4_smba)

0x09
0x0A
0x0D

...

> +static void amd_asf_update_bits(unsigned short piix4_smba, u8 bit,
> +				unsigned long offset, bool set)
> +{
> +	unsigned long reg;
> +
> +	reg = inb_p(offset);
> +	if (set)
> +		set_bit(bit, &reg);
> +	else
> +		clear_bit(bit, &reg);

+ bitops.h

The above is home made assign_bit().
Moreover, why atomic version? Wouldn't __assign_bit() suffice?

> +	outb_p(reg, offset);
> +}

...

> +static void amd_asf_update_bytes(struct amd_asf_dev *dev, u8 bit, bool set)

I didn't get the naming, the above using IO port with _bits, and this is MMIO
with _bytes. Are you sure the naming schema is correct?

> +{
> +	unsigned long reg;
> +
> +	reg = ioread32(dev->mmio_cfg.addr);
> +	if (set)
> +		set_bit(bit, &reg);
> +	else
> +		clear_bit(bit, &reg);
> +	iowrite32(reg, dev->mmio_cfg.addr);

Ditto (bitops and related things).

> +}

...

> +static int amd_asf_reg_target(struct i2c_client *target)
> +{
> +	struct amd_asf_dev *dev = i2c_get_adapdata(target->adapter);
> +	unsigned short piix4_smba = dev->port_addr->start;
> +	int ret;
> +	u8 reg;
> +
> +	if (dev->target)
> +		return -EBUSY;
> +
> +	ret = piix4_sb800_region_request(&target->dev, &dev->mmio_cfg);
> +	if (ret)
> +		return ret;
> +
> +	reg = (target->addr << 1) | BIT(0);

Is BIT(0) == I2C_M_RD in this case? If so, use the latter defined constant.

> +	outb_p(reg, ASFLISADDR);
> +
> +	amd_asf_setup_target(dev);
> +	dev->target = target;
> +	amd_asf_update_bits(piix4_smba, ASF_DATA_EN, ASFDATABNKSEL, false);
> +	piix4_sb800_region_release(&target->dev, &dev->mmio_cfg);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



