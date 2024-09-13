Return-Path: <linux-i2c+bounces-6727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3121978834
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 20:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C46287CD9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 18:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B863312D1F1;
	Fri, 13 Sep 2024 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3NyAQ4F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C112C526
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726253654; cv=none; b=GI0uWzIs5mDId4/2Onlj6ZCoFsVTVXO9KMOOYpvlN0lXWmsZDfVTfmX3g4lvDXxUfbdRP8yaChiJH85ZF7uzHqChJmhbd3ubsDgJ29cgQ710ZD35of0ov7jwVbnQlkax7oSE2oppUyfJrT+jkKPuSufZLdLrPkkhNy6k4CuytOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726253654; c=relaxed/simple;
	bh=WyhdZmj+6ks3FbvTvH0f9o2tk3b49mRtTXyDtje/QKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYIZrljqLSvBchSPl0uQ3ZgySPihITljwB+J+yUtT6CPIvKH/2hWhFAaeud9oZ0DU48mmwDbwXvtk6elmRMrkRPaXF8VaDkqyi76xdWXSv3aSsz4YD7SCp6oiVC2Q6H55EQlPXnw4O6oflYIy8G/UNDyEf7MDQ75QAO7WXhLywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3NyAQ4F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726253654; x=1757789654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WyhdZmj+6ks3FbvTvH0f9o2tk3b49mRtTXyDtje/QKg=;
  b=S3NyAQ4FlgHSxd2IaKBycGZpEfbhm+AXxNGM0WZ7lxZ0vtUVEYyq8TZH
   hlAyR46vwPOcd/pJPWsU/TzQE747Hj+hxYIHOyHP8ArfQsUhfqvwRuykl
   Pfk4ix+0PA4UNTPFUBlTUJd7ccz3u9DqPOjq4JfDErsVp18S4YGKWCmTU
   sOjR1qWtKQmfSOKPnVbUFBda1WS/Ue9J29tpa3UNNjp+rkanXSAPlAecN
   ewPcSyVcRIotRKFW/FIRMjtwny6Vs03GjjNyTwz9zOILp4uyqhVZjicU/
   SbPD2rs+1GXytX0fX/cYeN0GP2glKty4S/Wwqng7aTONABhktEcOu7HjT
   Q==;
X-CSE-ConnectionGUID: rU9dOIPlRgS3D8tHHqjgAw==
X-CSE-MsgGUID: IkVBdCsBShqAEvUUUC8YJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28948830"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28948830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:54:13 -0700
X-CSE-ConnectionGUID: I0A7jAaBR5S4hlQRbVx40A==
X-CSE-MsgGUID: LhxAMN53Tk67UpsfFr92cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68660233"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:54:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBQm-00000008Oef-2b7P;
	Fri, 13 Sep 2024 21:54:08 +0300
Date: Fri, 13 Sep 2024 21:54:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <ZuSKUCC1XqBURdib@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:05PM +0530, Shyam Sundar S K wrote:
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

> Note that the git diff view is presented in two separate lines in order to
> suppress the checkpatch.pl "CHECKS".

This paragraph should be in comment block rather than commit message body...

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

...somewhere here.

...

> +int piix4_sb800_region_request(struct device *dev,
> +			       struct sb800_mmio_cfg *mmio_cfg)

One line?

...

> +EXPORT_SYMBOL_GPL(piix4_sb800_region_request);

Use namespaced exports (with _NS) from day 1.

...

> +void piix4_sb800_region_release(struct device *dev,
> +				struct sb800_mmio_cfg *mmio_cfg)

> +EXPORT_SYMBOL_GPL(piix4_sb800_region_release);

Same comments as per above.

...

> +EXPORT_SYMBOL_GPL(piix4_transaction);
> +EXPORT_SYMBOL_GPL(piix4_sb800_port_sel);

_NS

-- 
With Best Regards,
Andy Shevchenko



