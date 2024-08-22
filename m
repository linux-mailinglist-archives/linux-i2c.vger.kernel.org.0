Return-Path: <linux-i2c+bounces-5672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70495B7C4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BAD286792
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DFC1CC153;
	Thu, 22 Aug 2024 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuwuYWbe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF921CBE89;
	Thu, 22 Aug 2024 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334862; cv=none; b=bHlyoq73AgF0ekofFu+qDmKxfpTX3OY/NES80wGif1rZru8Z2hLkXJAGLTtVEhrZKV/Ol/Cq9u2DSaLSO2vp+A3guxWzLjHATCpEMWYDttvDFjMXbAXYFIl8qMbJQjkkhGtYpHhJf5WivEivEeNSpyNGhO5mm8z3aKRMKcIXnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334862; c=relaxed/simple;
	bh=9YUyCrtIOi7mWuFM6fXfJzgv/Fnrb9gWjYwYg0/W3NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb1r3h8IFDy6kbGxKQZokTbUTVr/nC+pO5XnhNRTYwBaXcVfSpQaGv2jd5QzqDZbQjR0KPeFc4lmJuHi5tW+lOWr2PZjLWmyLZsJdTCb8hS0eXLxEU6d/W5RUxQef4x57f9gEExjnI9tEVGzAQNp65g2rMk7C6SdQJbGT2OjSAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuwuYWbe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334861; x=1755870861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9YUyCrtIOi7mWuFM6fXfJzgv/Fnrb9gWjYwYg0/W3NI=;
  b=ZuwuYWbeA51dc43qB++0vKjza0eba8LB/WP+P4jtExmmhSfade4Od3HU
   Kms5qYQGBz0CQMS+8ZBskQZTcH8mFQA00ZWknLSySd7w86v7kWNYnt4j+
   VBF8GEkMsux0w0JyPuWhY9ZrurjpfHA0N5oblfA1hX7XprJitvV5JM6Y6
   jk4He8Kx2vTyMJRoOBSbd1ApRbosQY2msr7asM2mTh9UdR+Zj/+yss1pz
   3L/Li+0WAOY31QjRrZyHQFaoMK9GlAgtFG2iMWr5sPa4twxMP45HheB/4
   qkaFUboiirBFkcOuBd47ixrj7NUKkN/RJBMExKtY54Qu8u6CbZxeITBDW
   w==;
X-CSE-ConnectionGUID: dr2XSb1dTsu3I2ddccYnNQ==
X-CSE-MsgGUID: wMjcN1H9TUSpPOpmws27Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22561866"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22561866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:54:21 -0700
X-CSE-ConnectionGUID: cAc/ohFRQYyDttAPJPxQxA==
X-CSE-MsgGUID: CKDH6XyBQuSuoE3L1FfDGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66273292"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:54:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8GP-00000000TFF-2VSn;
	Thu, 22 Aug 2024 16:54:09 +0300
Date: Thu, 22 Aug 2024 16:53:55 +0300
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
Subject: Re: [PATCH v5 04/10] regulator: Do pure DT regulator lookup in
 of_regulator_bulk_get_all()
Message-ID: <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-5-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:19:57PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Convert the existing of_regulator_bulk_get_all() for this purpose.
> This function has no in-tree users, as the original patch [1] that
> used it was never landed. This patch changes the function ABI, but
> it is straightforward to convert users.
> 
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case. An internal OF-specific version of regulator_get(),
> of_regulator_get_optional(), is added for this.

> [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/

Make it Link tag

Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

...

>  	/* first do a dt based lookup */
>  	if (dev && dev->of_node) {

	if (dev_of_node())


> -		r = of_regulator_dev_lookup(dev, supply);
> +		r = of_regulator_dev_lookup(dev, dev->of_node, supply);

	dev_of_node()

>  		if (!IS_ERR(r))
>  			return r;
>  		if (PTR_ERR(r) == -EPROBE_DEFER)

...

>  /**
>   * of_get_regulator - get a regulator device node based on supply name
> - * @dev: Device pointer for the consumer (of regulator) device
> + * @dev: Device pointer for dev_printk messages

dev_printk()

> + * @node: Device node pointer for supply property lookup
>   * @supply: regulator supply name
>   *
>   * Extract the regulator device node corresponding to the supply name.
>   * returns the device node corresponding to the regulator if found, else
>   * returns NULL.
>   */

...

>  /** of_regulator_dev_lookup - lookup a regulator device with device tree only
> - * @dev: Device pointer for regulator supply lookup.
> + * @dev: Device pointer for dev_printk messages.

Ditto.

> + * @node: Device node pointer for regulator supply lookup.
>   * @supply: Supply name or regulator ID.
>   *
>   * If successful, returns a struct regulator_dev that corresponds to the name
> @@ -636,13 +639,13 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
>   * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
>   * in the future.
>   */

...

> +/**
> + * of_regulator_get_optional - get optional regulator via device tree lookup
> + * @dev: device used for dev_printk messages

Ditto.

> + * @node: device node for regulator "consumer"
> + * @id: Supply name
> + *
> + * Returns a struct regulator corresponding to the regulator producer,
> + * or IS_ERR() condition containing errno.
> + *
> + * This is intended for use by consumers that want to get a regulator
> + * supply directly from a device node, and can and want to deal with
> + * absence of such supplies. This will _not_ consider supply aliases.
> + * See regulator_dev_lookup().

Fix kernel-doc warning.

> + */

-- 
With Best Regards,
Andy Shevchenko



