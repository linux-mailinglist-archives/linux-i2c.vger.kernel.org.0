Return-Path: <linux-i2c+bounces-11659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94602AEB7F7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65A486411DC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE0226738B;
	Fri, 27 Jun 2025 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIs50R/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0301DA5F;
	Fri, 27 Jun 2025 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028338; cv=none; b=BInvQHS/gVFBy2TMfAfG6pNUZWzeahYDp/u4+6KlkB8xc+OKnBhPtbIw9SUFHzYQ8jlGSas+sFfEU+ujV4KfBDH7KzA+8Px6N6kfE9U9y4VO7XXWPw/BR5onSMRC1OMMKXJ+Lul79j/PNBxthUy19KH/URVHFGMPvsgvZHEIfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028338; c=relaxed/simple;
	bh=rPpLOEQQwdotiHt6e4oezetzCql9PBIVoPZCc/ss7uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYx1V5zl6Ei7bbSSHqxJXcpP95C88GEmp5yCHLLYbohnwER4r9ifI2ThrjcNMfnhfB5r9jDSbKxp+nIuphpBVikpqXeP+xH/WlTYaI8TSn/gHC+YH6tAQ8tPFsiNPlAOOVveYCszhfuMeFihJcIQlHXk2DkKpGfnPinyoetyvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIs50R/Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751028337; x=1782564337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPpLOEQQwdotiHt6e4oezetzCql9PBIVoPZCc/ss7uc=;
  b=CIs50R/YZKLjLaDdMxgG7h8EjPvD1UhjzMcYBudZ/laSqZ63kxvDGkf9
   Z4W7GLkVIF+EbJnxsQp8Jf+F/IDNUjQfg9gYRQkPJAtnyvSQ932CmkHm/
   kXccvPxN1iASKWTP3U2x/vGeUDghGm/rdU2+hWc4pQlNkOWIv7C8w79AV
   fHD43ZQR+SZoH9v0UfY/rPYn2ba8wLvKZO0iZo29ahCHnvkEEI7KTLu0b
   3DwELEX2ynNiXzGjEFOwLVaqn/dJ5P0/VjRYBuNxlx86G/cFnX+f8obti
   JE1/e7TtRQXnzTW7equfa0AO+1TZ7nVSKTfgTzQU+uZbVUJ+gkpcEgU2H
   A==;
X-CSE-ConnectionGUID: ZJA13E/lT5iqU66VEuVLYQ==
X-CSE-MsgGUID: sAeHDCkOSjiz7p+yjf3/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70771872"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70771872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:45:37 -0700
X-CSE-ConnectionGUID: EPtZAuW2QOqH0dRtzoEBFw==
X-CSE-MsgGUID: 9VdxH/9gSBGf0DL1NQs1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152319927"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:45:32 -0700
Date: Fri, 27 Jun 2025 15:45:28 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <aF6SaLLw7HlSxagh@black.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626135610.299943-4-heikki.krogerus@linux.intel.com>

Hi Heikki,

Thanks for picking this up.

On Thu, Jun 26, 2025 at 04:56:08PM +0300, Heikki Krogerus wrote:
> From: Raag Jadav <raag.jadav@intel.com>
> 
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.

...

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index bfbfe1de7f77..0227fcba2168 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +void xe_i2c_pm_suspend(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);

I just realized the power modes will need (__force u32) casting to make
sparse happy. If you're planning another version, can you please include
it? If not, we can have a quick fix later on.

> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	if (d3cold)
> +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);

Ditto.

> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}

Raag

