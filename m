Return-Path: <linux-i2c+bounces-6186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9F96BF0A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85D7AB27495
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AAD1DA611;
	Wed,  4 Sep 2024 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/nY2qyn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33A1D2204;
	Wed,  4 Sep 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457234; cv=none; b=ts7pTGcJE2s8eEiedBekZ+Rd8YDRUovNxSLRcvudHVdiTkC+82uGEpXHXfBsnEx+qmS3Fz5Seh0tZepacwB29u/EvMpXI+z8dHkMc6uBt0PCbwNCXmGZEXPlrDWKcxLffMz2tAlR4WZ8GG8qWd8fjwW148Go8d+Wxw1HdvTg/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457234; c=relaxed/simple;
	bh=L+X9BbS+Ny+x3K1rDq6+5DqeLuJotN8s3i83EQ+4fy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQbA7noqTGBSbBYTESV3QuPxzUseMkZgqncf9KaFO9bDt42bUPOOxwUTBNme/HmhA8iFi6ekhKUCyzkIHZ9n+DGJBss211s65nzqSMrwJtMy2sD0U9cCkbHELP9QZChYuadNMxoZMiIkZ/b90LsClUK0HaLcWhDt+HwHCZtqk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/nY2qyn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725457233; x=1756993233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+X9BbS+Ny+x3K1rDq6+5DqeLuJotN8s3i83EQ+4fy8=;
  b=K/nY2qynikhGMakakBE5nOSBBJCIFmMMxDQDCcnlajTwdI1yt2k6VSsX
   Es0gozuJpQ4sTB33f0R+KCzIGZufDs4ACbjs7cE4cYD/A2/rFwCcQEPyL
   J8K0dwFUI4C0BndZCiWmvGnyQ2uHDbKfvehfVKSOUe+qez+5r3MZyNnnC
   8khpTZ2N4kTOq8aTAUey/CtpuMr1lxyB0tX3uXdw7ACHPqL1Qy9Xls2WJ
   fJFUFGKCtAFKN8B5KKqhKX9Cg+s5NnKngvRk/kpHw9QUnZAyv3ryULm3f
   VOU6mSUJjT6fM/SUA493XsDZ4Z1SvsgbwsEXJb+3QLGCf+5pYCExsBtd6
   g==;
X-CSE-ConnectionGUID: ParfX6ZRSee/2s1691lAdA==
X-CSE-MsgGUID: MlhjlBmcTheZ6WM0D4VzEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24273797"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24273797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:40:32 -0700
X-CSE-ConnectionGUID: Y21Wb7DAQuuM4Kja5IT+hw==
X-CSE-MsgGUID: FZl6wWkYTIasBVxJwoLAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="69692115"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:40:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqFF-000000054n4-0TIS;
	Wed, 04 Sep 2024 16:40:25 +0300
Date: Wed, 4 Sep 2024 16:40:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Message-ID: <ZthjSK9N9z11YXi2@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> The I2C device tree component prober needs to get and toggle GPIO lines
> for the components it intends to probe. These components may not use the
> same name for their GPIO lines, so the prober must go through the device
> tree, check each property to see it is a GPIO property, and get the GPIO
> line.
> 
> Instead of duplicating the GPIO suffixes, or exporting them to the
> prober to do pattern matching, simply add and export a new function that
> does the pattern matching and returns the length of the GPIO name. The
> caller can then use that to copy out the name if it needs to.

> Andy suggested a much shorter implementation.

No need to have this sentence in the commit message, changelog area is fine.
But if you wish... :-)

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

...

> +/**
> + * gpio_get_property_name_length - Returns the GPIO name length from a property name
> + * @propname:	name of the property to check
> + *
> + * This function checks if the given property name matches the GPIO property
> + * patterns, and returns the length of the name of the GPIO. The pattern is
> + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> + *
> + * Returns:
> + * The length of the string before '-<GPIO suffix>' if it matches
> + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> + * -EINVAL if the string doesn't match the pattern.

Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-doc.

> + */

-- 
With Best Regards,
Andy Shevchenko



