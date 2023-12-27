Return-Path: <linux-i2c+bounces-1023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C09ED81F0BF
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 18:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A5A1F22FFE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 17:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81146446;
	Wed, 27 Dec 2023 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsijAqtz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630EB46424;
	Wed, 27 Dec 2023 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703697168; x=1735233168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qalwygJ87p9QV791YnIvbzqccRFudEl4NadPNjBhtRE=;
  b=dsijAqtztvz0TaekfuLAAD8Sf/VoXF0RoxvdOirjbR9q7PHwYHZEaL63
   9ICGisz+bibQzwjRMlflofhnctraxfF1NLAoYAHbK+fcfZreCnT9DV6o2
   tLXOV20TGPHHjE75XJ0dr385MCjHrbJ398j/qe6ywr8ochBejVfsC4sRF
   IOMzXLbLJWVirGUP8XcZ/wKpWQ/6Dz6xkzI/JUIkyoatCQ9GBYuyNUc6E
   91uaYSyZ5DuwsjUjObKWwmBdHH0kY34caQpQPt7/wk4QOGsCPq3WSy8DQ
   iuB7adArxq7IeQgT4ykDYLOWqYpOFo7qTRprh8Bb7sVdmDsP4iDx1OsEe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="462886380"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="462886380"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:12:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="868901508"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="868901508"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:12:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rIXSR-00000009TKB-0D1R;
	Wed, 27 Dec 2023 19:12:39 +0200
Date: Wed, 27 Dec 2023 19:12:38 +0200
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
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 02/24] gpiolib: acpi: Modify
 acpi_dev_irq_wake_get_by() to use resource
Message-ID: <ZYxbBkimS1VIuU0a@smile.fi.intel.com>
References: <20231226192149.1830592-1-markhas@chromium.org>
 <20231226122113.v3.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226122113.v3.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 26, 2023 at 12:21:06PM -0700, Mark Hasemeyer wrote:
> Other information besides wake capability can be provided about GPIO
> IRQs such as triggering, polarity, and sharability. Use resource flags
> to provide this information to the caller if they want it.
> 
> This should keep the API more robust over time as flags are added,
> modified, or removed. It also more closely matches acpi_irq_get() which
> take a resource as an argument.
> 
> Rename the function to acpi_dev_get_gpio_irq_resource() to better
> describe the function's new behavior.

...

> +			res_flags = acpi_dev_irq_flags(info.triggering, info.polarity,
> +							   info.shareable, info.wake_capable);

Broken indentation of the second line.

...

> +			*r = DEFINE_RES_NAMED(irq, 1, NULL, res_flags);

So? The whole exercise with the first patch is to have here:

			*r = DEFINE_RES_IRQ_NAMED_FLAGS(irq, NULL, res_flags);

...

> +	struct resource r;

I prefer to see

	struct resource r = {};

even if it makes no difference. This allows to have robust code.

> +	ret = acpi_dev_get_gpio_irq_resource(adev, name, index, &r);
> +	return ret ?: r.start;

Btw, this function requires header to include ioport.h. I'm not sure
if it's good for ACPI. I would prefer safest approach, i.e. exporting
this from a C code, i.e. gpiolib-acpi.c.

-- 
With Best Regards,
Andy Shevchenko



