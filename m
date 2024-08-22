Return-Path: <linux-i2c+bounces-5670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990B95B714
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B6621C21923
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1671A1CB32D;
	Thu, 22 Aug 2024 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INGK0nNU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE21E87B;
	Thu, 22 Aug 2024 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334463; cv=none; b=hEV3/ZHA3eQVQtpgcWG2jvS7iRKgI/Rm0V8mBZcjR3tbUtbSw9+P+tkJG8IG039Uj/lEICPuE/XqNhe1KDPNIWNBirS70sQLx5M2gixv4yFB/gAMZgSQm1W6Lw9uFmwDCTtXI23kmp9YnEJaEdCFFweg++llLyNPDzuhGnKl/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334463; c=relaxed/simple;
	bh=gERz56/N7TCq6I811PLRHpo7iVU0CMV6axNB79Zx+8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iowsDCD/qU4B1cUGHsdotZCLVk7lJsvXruHnD4skrvUn80qaEebOEXqsMOL9gVD/EJjpK6ola4+cMNoL5BSG6oblipXoFYKe1+h5PnMv9dnJ6Jxek/Ez1ZcfjCfsCiF+8PnzcFlDxZyfNKwbYZ8iHnXSIgYgVCvETa23dQ2aQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INGK0nNU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334463; x=1755870463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gERz56/N7TCq6I811PLRHpo7iVU0CMV6axNB79Zx+8Y=;
  b=INGK0nNUOoWqpvN31n15YwcrJRuUhl9+Rbf+999Vv2emnTaCiPPqIxzz
   cV0hnwiKVQZYgg/x0pUh8mV6JgobDMZaBAvoE64DuNKWTBwTZPqoPyiW5
   8nFvPmDZu4z7ewO1M6iLqKOKPXqCMF6+l6Y+92JjQF8TYaDXs11R0xhew
   zBhtjyjOPop+06lB8bHpQbjMgWH3YvL5XPzLrJLhq533mT/FEX6L5FVJ+
   jA+N7GriZCp7ORdMuKp68pm/poM+ba6uXiHs6gsS23SWdX0PHCvNdq+FH
   faFyyps+59hZfg/suVcj2rPfrHx/z69men3EyrMWfakbosO6uYloY5cNQ
   w==;
X-CSE-ConnectionGUID: xRa17gSHRU+matFfzcH+cQ==
X-CSE-MsgGUID: mHNTbX5eSkWBUt2M7OTqlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22903154"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22903154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:47:42 -0700
X-CSE-ConnectionGUID: 6BZ2mrHpTuKonItbJ9JQUw==
X-CSE-MsgGUID: Qmx3MU8CSxO5tx3hGOy4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66132920"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:47:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8A2-00000000T7v-0IEx;
	Thu, 22 Aug 2024 16:47:34 +0300
Date: Thu, 22 Aug 2024 16:47:33 +0300
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
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZsdBddTDuvNasHNq@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
> There's still a bit of OF-specific code in the regulator device lookup
> function.
> 
> Move those bits of code over to of_regulator.c, and create a new
> function of_regulator_dev_lookup() to encapsulate the code moved out of
> regulator_dev_lookup().
> 
> Also mark of_find_regulator_by_node() as static, since there are no
> other users in other compile units.
> 
> There are no functional changes.

...

> +/**
> + * of_get_child_regulator - get a child regulator device node
> + * based on supply name
> + * @parent: Parent device node
> + * @prop_name: Combination regulator supply name and "-supply"
> + *
> + * Traverse all child nodes.
> + * Extract the child regulator device node corresponding to the supply name.
> + * returns the device node corresponding to the regulator if found, else
> + * returns NULL.

At the same time you may fix kernel-doc warnings (no "Return" section) in these
three (on your wish you may fix others in a separate change, but it's not
related to this series).

> + */

...

> +/** of_regulator_dev_lookup - lookup a regulator device with device tree only

Something went wrong with the indentation.

> + * @dev: Device pointer for regulator supply lookup.
> + * @supply: Supply name or regulator ID.
> + *
> + * If successful, returns a struct regulator_dev that corresponds to the name
> + * @supply and with the embedded struct device refcount incremented by one.
> + * The refcount must be dropped by calling put_device().
> + * On failure one of the following ERR-PTR-encoded values is returned:
> + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
> + * in the future.
> + */

-- 
With Best Regards,
Andy Shevchenko



