Return-Path: <linux-i2c+bounces-6906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6897D84C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 18:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4AB1F223DB
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E9617E012;
	Fri, 20 Sep 2024 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2Rbesg9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56217E00B
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849475; cv=none; b=G3fNhLznmJSSqLXLo6Xm76W3Zu3I7oqT2UMyAdS1aqkuo+LQl9MYkQnEvIfAi1WzQq9eCTc6Lhf3DD0BDeAz3m92dMmYirL+zLPxxbC63yIgCFpjjke3Z38iqlQRW6naC5HJm6ZIG9PG4tAQT8uZN5pZve/s1m8YyYM7PSxpARs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849475; c=relaxed/simple;
	bh=eRSRoYHP+v/Aj6R6sTogyxqBHBUnxDa9lT9INX16xKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqkkzU2WLRN20lrx8qgVvtHV9egykabEYj9I2rA17Fx2Dxc9InZDDxF4PDRCiktY1/QLUBLffVWQZAZoMs0NC/ixWROqp/Kdi6ZruTCUU79rpvh4Yvn9AYlV73ktuS50qsY5uRCv/w5ZeNWU+aNe/istYmJujaxwWeXN9FRqHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2Rbesg9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726849474; x=1758385474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eRSRoYHP+v/Aj6R6sTogyxqBHBUnxDa9lT9INX16xKs=;
  b=U2Rbesg9YBFvdOYdM19gc97foo5mTMUe36jP+f0CEgseRocQKMlDWwpw
   +IT0VUduj7CzyRSnsopf0ANereih0CfYKEnIw9LdqnjkO69rIDvZ52eBK
   hQpbk+IpRi/Ejkxl8cyTr80AjFkPb/A6Ua+lBOoneGyOsMVltdpCin+qJ
   GbwOToCPfQXd+V5UQtQL+x6v3rcV5CK5cl6phIcApsx3mh4z/ete1Xmgt
   IR6dSEhf5b0YpgeOY7aFtmln/os6MmPnw017bBNW+CkbSGoy7Jl5IC9iv
   Uc1Ekg9Wk7h2EPdVPQIKAwqE//gIM6/r3Jy3g1uo25Jh7TNnYauQQ9xuW
   A==;
X-CSE-ConnectionGUID: Bdku6rMrTJqpYNAeHbe5qg==
X-CSE-MsgGUID: v3BzNCZmTRCSOIFXqLc6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36433995"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="36433995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:24:33 -0700
X-CSE-ConnectionGUID: CUwxLN7WTwi4oFmrEg6Aig==
X-CSE-MsgGUID: kZb2Y40FSe2ZgYn4OuitZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="101207069"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:24:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srgQm-0000000AyQP-2x0v;
	Fri, 20 Sep 2024 19:24:28 +0300
Date: Fri, 20 Sep 2024 19:24:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <Zu2hvDyo0sth1vLn@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-4-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:08PM +0530, Shyam Sundar S K wrote:
> Export the following i2c_piix4 driver functions as a library so that the
> AMD ASF driver can utilize these core functionalities from the i2c_piix4
> driver:
> 
> - piix4_sb800_region_request(): Request access to a specific SMBus region
> on the SB800 chipset.
> 
> - piix4_sb800_region_release(): Release the previously requested SMBus
> region on the SB800 chipset.
> 
> - piix4_transaction(): Handle SMBus transactions between the SMBus
> controller and connected devices.
> 
> - piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
> chipset.
> 
> By making these functions available as a library, enable the AMD ASF
> driver to leverage the established mechanisms in the i2c_piix4 driver,
> promoting code reuse and consistency across different drivers.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -static int piix4_sb800_region_request(struct device *dev,
> -				      struct sb800_mmio_cfg *mmio_cfg)
> +int piix4_sb800_region_request(struct device *dev,
> +			       struct sb800_mmio_cfg *mmio_cfg)

Now can be one line.

...

> -static void piix4_sb800_region_release(struct device *dev,
> -				       struct sb800_mmio_cfg *mmio_cfg)
> +void piix4_sb800_region_release(struct device *dev,
> +				struct sb800_mmio_cfg *mmio_cfg)

Ditto.

-- 
With Best Regards,
Andy Shevchenko



