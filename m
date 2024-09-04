Return-Path: <linux-i2c+bounces-6175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649396BDC2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2321F220FD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A155F1DA2F9;
	Wed,  4 Sep 2024 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amMPTUsR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6531DA114;
	Wed,  4 Sep 2024 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455036; cv=none; b=saQBCTVVS4CV7NCKhmK1D3faaRP3O7teUPHG3TbwB2YGoi/a14lVL7PsZIW/qQucgbIVxdIA7eZ0dYzu2VJW7CIOFQiC9tkV7wz8yc0lkiK4G8dVZ5hC2106VNFAOtiEYyXqc/W0xnMlJWOiaHszXTG8kkg4OkC1tA1UMAm2o0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455036; c=relaxed/simple;
	bh=Lb17jyW+/eBb159TT79zQOd3wYy8PCRTcs7fuozS9Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYQlK398/lWjMqt24S7j4+jqyhhdxSYrFmB8HHyaXMWbOmrY9gZgfWtuhPhoHe9i+fMmVrPp8/DFKSGf1/iFfZi6/87l1cCpLnvQUWH7Gq7wpR5NG5PlUGYMIoNF8Js+7z4vU8l60rvogKTtBUvNj6E7Vqw6LxdVF2zL62uXq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amMPTUsR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455035; x=1756991035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lb17jyW+/eBb159TT79zQOd3wYy8PCRTcs7fuozS9Zw=;
  b=amMPTUsRLfNBwMdXb6flq9mMN5YnWo4TwXgE8E1kak4RbCDPjSuGSEP7
   FEUsi87uvr5mEBn/MsQFdXFW5uXc+jG5m1CglH+7AIxJ4CFJPpUxN9Jap
   kLoGYryvmLgr+9zzIbVazjvtiIzilQVvgJiBOfkHTukRsyhVhEmdGM6Pf
   Xjqq7CD9qDAHUynQIP69DljrTdnT2vz8hcRoFt4nfNjpfBMRjUHT7lT/T
   ptgrbYPTZVKBjErbgI+AyXYZR/JRgv8U834as8PN2u899YWFfnPATms2u
   feEER/43b3rNtHpaJvx92rJHD42ejzyfu69CimKLmgv2CXvbugeGWuEwG
   A==;
X-CSE-ConnectionGUID: WOsvmOqXR7CziLOq2xj1ZA==
X-CSE-MsgGUID: KqfbgKHEQUmMtXmzKc59zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23676494"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="23676494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:55 -0700
X-CSE-ConnectionGUID: uJ0/BKc7S2uY7qJd8AsSzA==
X-CSE-MsgGUID: 5z4Z2P36S9KLE1W2boxnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69670390"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpfn-000000054F5-1ejW;
	Wed, 04 Sep 2024 16:03:47 +0300
Date: Wed, 4 Sep 2024 16:03:47 +0300
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
Subject: Re: [PATCH v6 02/12] of: base: Add
 for_each_child_of_node_with_prefix_scoped()
Message-ID: <Zthasx8VNCw_yj5q@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:04PM +0800, Chen-Yu Tsai wrote:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.

...

> +#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
> +	for (struct device_node *child __free(device_node) =		\
> +	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
> +	     child != NULL;						\
> +	     child = of_get_next_child_with_prefix(parent, child, prefix))

I'm wondering if we may drop _scoped from day 1. Yeah, probably a bit confusing
as the rest of APIs without that suffix do require reference count handling on
the loop abrupt.

-- 
With Best Regards,
Andy Shevchenko



