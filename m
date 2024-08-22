Return-Path: <linux-i2c+bounces-5671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD095B777
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2BD81C230FF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1841F1CBEB2;
	Thu, 22 Aug 2024 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaGXXGcO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780531CBEB7;
	Thu, 22 Aug 2024 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334575; cv=none; b=nPLmb6UYQTCzqXRlkJntaWAh9YrfT3Hj6AdOzp6z8EaGAXxrtN/x4koVIXCRDjmx/mjV7C2S495Gp9g5+NzgOxK0NRJbQkF/UA1BVbcrbclDPTkgFpYyLIE2DzmhU9UagwXD1ma+N4Ehfpp+7apbAf67P60G7ojVINkHdJB6fzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334575; c=relaxed/simple;
	bh=LqJ7DQPFpxfgiOEVr0qSMrvDXb62+WaBmrdVtmy0cxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcqGRwxwtA5v+g2AnA4OGU5nMs7L1EZ8SopM4qAPbgTZPl8fj5/+ecqMpt04jeLtWAtsc2XjHwd6n6EF5aW1P/dAyRJqvvTBCmmtbXFm1O+veCgKV4TXo2gZ3jvmcwuAwQ6MbsNsXbq8N2zT1blBnPl4F9saaQTKVzbYEq7SkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaGXXGcO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334575; x=1755870575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LqJ7DQPFpxfgiOEVr0qSMrvDXb62+WaBmrdVtmy0cxs=;
  b=BaGXXGcOpFYeMs4rlgSaYdGOf0H6sqC909nLIVkswyfU+grG7rHfd5PX
   ErJrMDw3K5amjNnCSHmm0ZTwT98iV2ubJlVw/E62O87yTrFucoSUwdMHZ
   rgb6XXht7G2A8rGqyti5EWeE5A5teDixBgLXnLeEslAWOVXR1M23A3vdl
   tr/379/hS/B+VDxQLfvg+GM6ZwacRD+64q7zft4T211kCrJW4u5ByNgH0
   R3hhdPXxw8ZkEq4gHEnN64Jvk7Juu1W3DJK+1XYDze3nb1sN5W6TwLSN4
   H4w9E4r5gsuGoM+dGGM+8qmA6G3jiVpQkrft5JPjVs9UE1Y7/4Jl1yooL
   w==;
X-CSE-ConnectionGUID: smbKZcz8TBmkfHlk1M28Rg==
X-CSE-MsgGUID: H36BPxgATxmGvMrmWBhVlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22617701"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22617701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:49:34 -0700
X-CSE-ConnectionGUID: rExSLsXBRvKzM/DYRndzqA==
X-CSE-MsgGUID: d9wMAPFZQ7qycJM9TKoADw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66342683"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:49:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8Bb-00000000T9V-0Vns;
	Thu, 22 Aug 2024 16:49:11 +0300
Date: Thu, 22 Aug 2024 16:49:10 +0300
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
Subject: Re: [PATCH v5 03/10] regulator: Split up _regulator_get()
Message-ID: <ZsdB1vsEe0atW88_@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:19:56PM +0800, Chen-Yu Tsai wrote:
> _regulator_get() contains a lot of common code doing checks prior to the
> regulator lookup and housekeeping work after the lookup. Almost all the
> code could be shared with a OF-specific variant of _regulator_get().
> 
> Split out the common parts so that they can be reused. The OF-specific
> version of _regulator_get() will be added in a subsequent patch.
> No functional changes were made.

> +/**
> + * _regulator_get_common - Common code for regulator requests
> + * @rdev: regulator device pointer as returned by *regulator_dev_lookup()
> + *       Its reference count is expected to have been incremented.
> + * @dev: device used for dev_printk messages
> + * @id: Supply name or regulator ID
> + * @get_type: enum regulator_get_type value corresponding to type of request
> + *
> + * Returns a struct regulator corresponding to @rdev,
> + * or IS_ERR() condition containing errno.
> + *
> + * This function should be chained with *regulator_dev_lookup() functions.

kernel-doc will warn here: No "Return" section.

> + */

-- 
With Best Regards,
Andy Shevchenko



