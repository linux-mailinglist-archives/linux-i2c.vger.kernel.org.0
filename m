Return-Path: <linux-i2c+bounces-1024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DD81F0C9
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 18:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF61283025
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 17:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620DE4644C;
	Wed, 27 Dec 2023 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJcskC8o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6AF46524;
	Wed, 27 Dec 2023 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703697433; x=1735233433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2K3uY8b+MqHzdwOGeEWgpRZaazlE1adyV7pu9tW3Sx8=;
  b=FJcskC8otDJ/Tn6ogbDHMnX6EgNqfUyyIeOUjGtqSItsz3xxEjViNZLX
   CfYFkjaklQ9GGFrO77muR/WyfP+RVSrOKdE3Gnk8OAr9LrxdF4WHn5QJe
   /jMGKysrGAckOqU3JRGKep52cGvP1xerp/IwBkZY2oVbiKhLsTRwXqt6B
   l2SGOv/xJKqjjuVrWCQ0Dwd1SOO7KrYjuszCIwYAYWWMJmPVeOMhBmO9x
   OfGqBGr/W6LEn4U+kTnc7ON5MOla1i+f5WQA/r/RK395JqDNjBbDKhl5H
   o+Q9Ch/T4EtzELP2AeiutYHOyPQTxtULof2zDYZaWq1TItWilEuF7oTwH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="376610460"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="376610460"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="896957026"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="896957026"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:17:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rIXWj-00000009TNK-0vG1;
	Wed, 27 Dec 2023 19:17:05 +0200
Date: Wed, 27 Dec 2023 19:17:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 03/24] i2c: acpi: Modify i2c_acpi_get_irq() to use
 resource
Message-ID: <ZYxcEGz4yCJj0O5H@smile.fi.intel.com>
References: <20231226192149.1830592-1-markhas@chromium.org>
 <20231226122113.v3.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226122113.v3.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 26, 2023 at 12:21:07PM -0700, Mark Hasemeyer wrote:
> The i2c_acpi_irq_context structure provides redundant information that
> can be provided with struct resource.
> 
> Refactor i2c_acpi_get_irq() to use struct resource instead of struct
> i2c_acpi_irq_context.

...

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

No blank line.

...

>  	ret = acpi_dev_get_resources(adev, &resource_list,
> -				     i2c_acpi_add_irq_resource, &irq_ctx);
> +				     i2c_acpi_add_irq_resource, r);
>  	if (ret < 0)
>  		return ret;
>  
>  	acpi_dev_free_resource_list(&resource_list);
>  
> -	if (irq_ctx.irq == -ENOENT) {
> -		ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, &irqres);
> -		if (ret)
> -			return ret;
> -		irq_ctx.irq = irqres.start;
> -		irq_ctx.wake_capable = irqres.flags & IORESOURCE_IRQ_WAKECAPABLE;
> -	}
> -
> -	if (irq_ctx.irq < 0)
> -		return irq_ctx.irq;
> +	if (!r->flags)
> +		ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
>  
> -	if (wake_capable)
> -		*wake_capable = irq_ctx.wake_capable;
> +	if (!r->flags)
> +		return ret;
>  
> -	return irq_ctx.irq;
> +	return r->start;

Wondering if we can refactor above as

	if (r->flags)
		return r->start;

	ret = acpi_dev_get_gpio_irq_resource(adev, NULL, 0, r);
	if (ret)
		return ret;

	return r->start;

Note also the 'if (ret)' check, the check for flags to return ret seems
counter intuitive and possible prone to errors in the future.

-- 
With Best Regards,
Andy Shevchenko



