Return-Path: <linux-i2c+bounces-5688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CAE95B89E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1448D283187
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D41CBEB0;
	Thu, 22 Aug 2024 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWfApddV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8E1CBEB5;
	Thu, 22 Aug 2024 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337427; cv=none; b=VDIYMvMU+8Cx4E3X8f+zo72iwziCR2dERDShlVgCY7N1+bGsiYAUepBJlgmhMo2cYKKP8FP2ifTKN+55Co14QR77Zo9gB/HkV7g1yfLX56N4HtXEVaGiNI6XaGMkEfpD830ZMeMX48lcFsyqWPSxdPmTnrJ5SdoWiz7eDFm1pyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337427; c=relaxed/simple;
	bh=SgGSm8FSzrhUcZoCD0EacsxaNLj+jUld7Z8yQeRQg0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyUC8CaAbDSeEYkQTp7hwOne7bEgah7QorZJUMgS53MCHVP2UMtcS7CkC37OQ91Bdg0T3QgE9CKwnth04aafjwXGFqF2lKr38S7/eiTSYvbSIsL2VvtXW5w0r/ZFssGIj4Fhg/dVZjshtBK3OJC5938UBqp4g/V+7j0FI2gfK/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWfApddV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724337426; x=1755873426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SgGSm8FSzrhUcZoCD0EacsxaNLj+jUld7Z8yQeRQg0s=;
  b=fWfApddVrELFagTSNtt9JLepk/bWaUta4jmSOaMcxYPpgnJ8DbzhZMff
   0QvfcbNjJx2sSbzU46SZU2cyKooHBatYiLmrRNVnfgaExRAd4GfM7KxS8
   ZzMqxde7GyKjaCTuqTV4NUr+o4UEM4X1IUPVRXLLQ60SUDuvbRo6guux4
   lGK/XxsLBTUU/HSyJ3ouQWG3j7RKBFFyFJA4t891DNiyxkfalVYyPT4KD
   hDdUoXPnDeCuydN862WGqd4Xb4qWE1wNhB8s1+u6IdTKCNf7ejrOvR4nx
   lfWVFrk1Me+tCqxUKIOZEFzoB3uQmgahJeXyEog8nVs91vZ51NN1UThFT
   w==;
X-CSE-ConnectionGUID: TjSOKXcPQqGD4PG+f7MgoA==
X-CSE-MsgGUID: 3wr9VBggSOO2bZ/8jj5z/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22909439"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22909439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:36:59 -0700
X-CSE-ConnectionGUID: IStEf+XORPuVTv0irBHBLg==
X-CSE-MsgGUID: xlNHxf70R66ubW8bBhDxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61145009"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:36:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8vj-00000000Tv1-1dqJ;
	Thu, 22 Aug 2024 17:36:51 +0300
Date: Thu, 22 Aug 2024 17:36:51 +0300
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
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Message-ID: <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:
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

...

> +/**
> + * gpio_property_name_length - Returns the GPIO name length from a property name
> + * @str:	string to check

It's property name, so, I would name this 'propname'.

> + * This function checks if the given name matches the GPIO property patterns, and
> + * returns the length of the name of the GPIO. The pattern is "*-<GPIO suffix>"
> + * or just "<GPIO suffix>".
> + *
> + * Returns:
> + * The length of the string before '-' if it matches "*-<GPIO suffix>", or

What about "x-y-gpios"? It's unclear what will be the behaviour.

> + * 0 if no name part, just the suffix, or
> + * -EINVAL if the string doesn't match the pattern.
> + */
> +int gpio_property_name_length(const char *str)

gpio_get_... ?

> +{
> +	size_t len;
> +
> +	len = strlen(str);

If it has a thousands characters...?

> +	/* string need to be at minimum len(gpio) */
> +	if (len < 4)
> +		return -EINVAL;

Do we really need it here? See below as well.

> +	/* Check for no-name case: "gpio" / "gpios" */
> +	for (const char *const *p = gpio_suffixes; *p; p++)
> +		if (!strcmp(str, *p))
> +			return 0;

> +	for (size_t i = len - 4; i > 0; i--) {
> +		/* find right-most '-' and check if remainder matches suffix */
> +		if (str[i] != '-')
> +			continue;
> +
> +		for (const char *const *p = gpio_suffixes; *p; p++)
> +			if (!strcmp(str + i + 1, *p))
> +				return i;
> +
> +		return -EINVAL;
> +	}

This can be combined with the above

	for (const char *const *p = gpio_suffixes; *p; p++) {
		/*
		 * Find right-most '-' and check if remainder matches suffix.
		 * If no separator found, check for no-name cases.
		 */
		dash = strrchr(propname, '-');
		if (!strcmp(dash ? dash + 1 : propname, *p))
			return i;
	}

> +	return -EINVAL;
> +}

-- 
With Best Regards,
Andy Shevchenko



