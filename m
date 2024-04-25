Return-Path: <linux-i2c+bounces-3139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC68B1E49
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E69BE1F21EBD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8801084E0B;
	Thu, 25 Apr 2024 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mi/OYYS+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B036BB5D;
	Thu, 25 Apr 2024 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038271; cv=none; b=gOQacb2nu1H9L6IJewSmvReW6pWBtuX4LxtYQSyWYcXCC2mBxJbVM12/dBJNYSV+NxXQHZ5ToP7kKTkzZn31YteSY+xRbPVlg6WyIMIvSVlRAl4mwB+ZdrzKqqcaZoDqnluqr+waCFH7PC+78DszC/ElUTkg+5Jnfs2P3N9C+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038271; c=relaxed/simple;
	bh=RIWhI1bFnANBxSRse/8d8uJ97qpTjDGgsn4giEnnhWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oulRzRw2sQc6JPslAFJxhBz+jx+WXXnFf7qUbzl5lJNFtUINy6H1YOkIWDwU6y1jULGuENzdxmCeFhReWzOTFuPS26YSoi/D8JRTa43latOlGEalX0eysHjpbcjPPMn7zH7L3viFQVznNXWsqRoI0GpyAsKhcrsEOOaeGdb9Pzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mi/OYYS+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714038270; x=1745574270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RIWhI1bFnANBxSRse/8d8uJ97qpTjDGgsn4giEnnhWQ=;
  b=mi/OYYS+YXk+8m0Vm4/WrniwnniqAuk86OhPjKURlWFNWOTO9WST4KaB
   BSIe28y23I0pXh6ODPIevtpGlKm0etH60uTBDw49Zx/QwovN1gPXbzTYa
   1Zzormos+rTnMFtmGbCujMUB59rMOFn6OUTHhDBMf//H1gUEIsylSJQ2e
   tRpJXMzE0Iw8CbGiUZdXTWvfyedULW6Ybq8tkIRoU2YptNg0Y0yQbLpvr
   m77BDWMSIGpnWmQhki7Dikz6F7vQ2marCVUad2tkc+df5nLhA7Q4ObFmM
   pr0h7goGMWJ5PVgMPG8MzOOW3fYbG8byatiFEgZ8m9EIJmu6sHNyNPZI2
   g==;
X-CSE-ConnectionGUID: sEl50lsvQCGBkGsdIFp+5A==
X-CSE-MsgGUID: Kx2gl+b6Qx2dxq52kPuIcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13497987"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="13497987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:44:30 -0700
X-CSE-ConnectionGUID: 7CAGqqmSSGC/zC+FQUQB4Q==
X-CSE-MsgGUID: 0lQA6bR/SsSeVZZKLLskbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29501528"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:44:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzveQ-00000000x2c-16BM;
	Thu, 25 Apr 2024 12:44:22 +0300
Date: Thu, 25 Apr 2024 12:44:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] net: txgbe: Utilize i2c-designware.h
Message-ID: <Ziol9s5w9fHjOcY9@smile.fi.intel.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
 <20240425002642.2053657-5-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425002642.2053657-5-florian.fainelli@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 05:26:42PM -0700, Florian Fainelli wrote:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

...

> +++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
> @@ -8,6 +8,7 @@
>  #include <linux/clkdev.h>
>  #include <linux/i2c.h>
>  #include <linux/pci.h>
> +#include <linux/platform_data/i2c-designware.h>

Same comment, make this a separate group, it will be easier to see the quite
specific niche headers, that are not related to the generic libraries / or
subsystem-level ones.

>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/pcs/pcs-xpcs.h>

...

> -	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
> -		 pci_dev_id(pdev));
> +	snprintf(clk_name, sizeof(clk_name), "%s.%d",
> +		 I2C_DESIGNWARE_NAME, pci_dev_id(pdev));

Why do you make it %s? It was constant literal and is, no need to use %s.

-- 
With Best Regards,
Andy Shevchenko



