Return-Path: <linux-i2c+bounces-931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AF81B916
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 15:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EAE0B24C1D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 14:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A630768F7;
	Thu, 21 Dec 2023 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3oIk2pK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621E745DA;
	Thu, 21 Dec 2023 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703166695; x=1734702695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MW/VQMh0lV18jKfLyDKMM1MKJVVzFTeS8LzjzUBd4Mo=;
  b=F3oIk2pK9K+aty22CTcVX2VDLZtQ804YcVsu0zeX0KXeF6QqdtlohILk
   k3sHJ6IIyKlrYls8ADagkA8uYEu8lOBqe5vGapIrAYMCx+OIqlgRzPZ9j
   OKDJIOuNZ8IrTpICUVGCDPJAThG7eSSoRmdBwbfhWkulvCLOPP8mh9Omg
   n5DfuM/y4/+X+UOA1QUO4m2ZJ8m5fyCzztCxYBFj00nojRGs4ySugouEC
   l/q7gz2hqgd1FJ/4BdVmWP+NtVt3U1AmwAJ0fQX4R8X7QDaNtwswNKR+X
   l4xXThjfpXO8NIee6tuiWQ/kMV2sIvwJ9BVXE73N3AL54JPXSI4QtYZdQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="399804414"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="399804414"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="920329264"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="920329264"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:51:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rGJSC-00000007rfr-0jfj;
	Thu, 21 Dec 2023 15:51:12 +0200
Date: Thu, 21 Dec 2023 15:51:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 02/22] i2c: acpi: Modify i2c_acpi_get_irq() to use
 resource
Message-ID: <ZYRCz-FiG_w71qhB@smile.fi.intel.com>
References: <20231220235459.2965548-1-markhas@chromium.org>
 <20231220165423.v2.2.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220165423.v2.2.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 20, 2023 at 04:54:16PM -0700, Mark Hasemeyer wrote:
> The i2c_acpi_irq_context structure provides redundant information that
> can be provided with struct resource.
> 
> Refactor i2c_acpi_get_irq() to use struct resource instead of struct
> i2c_acpi_irq_context.

Suggested-by?

...

>  static int i2c_acpi_add_irq_resource(struct acpi_resource *ares, void *data)
>  {
> -	struct i2c_acpi_irq_context *irq_ctx = data;
> -	struct resource r;
> +	struct resource *r = data;

> -	if (irq_ctx->irq > 0)
> +	if (r->start > 0)
>  		return 1;

Checking flags is more robust.

	if (r->flags)
		return 1;

> -	if (!acpi_dev_resource_interrupt(ares, 0, &r))
> +	if (!acpi_dev_resource_interrupt(ares, 0, r))
>  		return 1;
>  
> -	irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
> -	irq_ctx->wake_capable = r.flags & IORESOURCE_IRQ_WAKECAPABLE;
> +	i2c_dev_irq_from_resources(r, 1);
>  
>  	return 1; /* No need to add resource to the list */
>  }

...

> +	if (IS_ERR_OR_NULL(r))
> +		return -EINVAL;

Hmm... Do we expect this to be an error pointer in some cases?

...

> +	ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
> +	if (!ret)
> +		return r->start;
>  
> -	return irq_ctx.irq;
> +	return ret;

What's wrong with the standard pattern?

	if (ret)
		return ret;
	...
	return ...;

...

> +			struct resource r = {0};

'0' is redundant.

...

> +			irq = i2c_acpi_get_irq(client, &r);
> +			if (irq > 0 && r.flags & IORESOURCE_IRQ_WAKECAPABLE)

Why checking just flags is not enough?

>  				client->flags |= I2C_CLIENT_WAKE;

-- 
With Best Regards,
Andy Shevchenko



