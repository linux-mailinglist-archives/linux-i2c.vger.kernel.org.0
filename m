Return-Path: <linux-i2c+bounces-1177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832ED825FEF
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 15:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B092835C5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FA779F5;
	Sat,  6 Jan 2024 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNb9v6Lz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF2D79D0;
	Sat,  6 Jan 2024 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704552542; x=1736088542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WIkTRh0rEAEx1IV0OlVa7qZ0mU0jqtNw0XlETmXqXN0=;
  b=RNb9v6LzKEpP0A69mh3ufv/817AoxDJKJyF7rJfCO66fBC1I4Wh3vNFF
   nrZdzMJercZARDUKPMw7B+QgLjWKfINnT1uSCRTwFVE40ru8VowRBNsFx
   X9KO87xSyCfKM4wmBZ4MEuMS7G4xgSbAw0mdbEnBvcjmdPFi1TAZirnKN
   KxfI5vUfsUK9OH0LS0I1pwW/7zp1UxWbOMazolqRnL8wsYRgHGVtU3OwD
   E379KlzISUNDIFgXwDAMwwyuqh2wWfgD5lWfC6pGGhqiFQd6s8bpZF2oB
   PAnDtNWyg3xLEuyC/uLVAv/AxmlZumNFiJ5GuUryn82LqBXF571j5/dnc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="4417952"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="4417952"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="784453178"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="784453178"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:48:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rM7yp-0000000Bvtd-16vY;
	Sat, 06 Jan 2024 16:48:55 +0200
Date: Sat, 6 Jan 2024 16:48:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 03/24] i2c: acpi: Modify i2c_acpi_get_irq() to use
 resource
Message-ID: <ZZloVhod_hbhDTGP@smile.fi.intel.com>
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102140734.v4.3.Ib65096357993ff602e7dd0000dd59a36571c48d8@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 02, 2024 at 02:07:27PM -0700, Mark Hasemeyer wrote:
> The i2c_acpi_irq_context structure provides redundant information that
> can be provided with struct resource.
> 
> Refactor i2c_acpi_get_irq() to use struct resource instead of struct
> i2c_acpi_irq_context.

...

>  	ret = acpi_dev_get_resources(adev, &resource_list,
> -				     i2c_acpi_add_irq_resource, &irq_ctx);
> +				     i2c_acpi_add_irq_resource, r);

Up to you, but you can make it a single line.

	ret = acpi_dev_get_resources(adev, &resource_list, i2c_acpi_add_irq_resource, r);

>  	if (ret < 0)
>  		return ret;

...

> +++ b/drivers/i2c/i2c-core-base.c

> +			struct resource r = {};

Needs ioport.h.

...

> +			irq = i2c_acpi_get_irq(client, &r);
> +			if (r.flags & IORESOURCE_IRQ_WAKECAPABLE)

Ditto.

>  				client->flags |= I2C_CLIENT_WAKE;
>  		}

...

> +++ b/drivers/i2c/i2c-core.h

> +int i2c_acpi_get_irq(struct i2c_client *client, struct resource *r);

> +static inline int i2c_acpi_get_irq(struct i2c_client *client, struct resource *r)

Needs a forward declaration (besides the inclusion block is a total mess
in this file).

-- 
With Best Regards,
Andy Shevchenko



