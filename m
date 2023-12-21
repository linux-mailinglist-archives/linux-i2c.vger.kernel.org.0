Return-Path: <linux-i2c+bounces-932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F181BA6A
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 16:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B117B2357B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB9B4D5A3;
	Thu, 21 Dec 2023 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meFCWKZ+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D031D6A9;
	Thu, 21 Dec 2023 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703171837; x=1734707837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EOkAr+xks6NnAFalQxZEayj9BKUN4na1y02YSzTzR8k=;
  b=meFCWKZ+2wnslpRTe9fOgJ3Cp3m1TWmThPYt8dkFTdhSRdPVqda22qu2
   vJsitH3b3xlQG56J0KPqAbZpuvYR8ogrF5fV3fp4Y1/lXFd47RrtWzcvy
   8JB6u5lXURh/45ymmLM5Z24lnZQctSsRBQQu6quK9f+yYx4uybPtanXIO
   TLJc9NT5dMiq9V0yJ2+8TrfXAplgJwFCbhRIBMdRQ4XoFS0Am57WyfR/k
   thsiE06bTtHUI2P0BmNE7O9IzWSlZ5pGtH0a+0KUo35Ky/MOR7VxStgkY
   UFDCQC7Y94KvN1cvrEYZHuoeBkrqyt5CbwyuqTUJTXu0MISTwvzg5G8T4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3077406"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="3077406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 07:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="867338199"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="867338199"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 07:17:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rGKnL-00000007sec-42uD;
	Thu, 21 Dec 2023 17:17:07 +0200
Date: Thu, 21 Dec 2023 17:17:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/22] gpiolib: acpi: Modify
 acpi_dev_irq_wake_get_by() to use resource
Message-ID: <ZYRW84GX-SOEKDIG@smile.fi.intel.com>
References: <20231220235459.2965548-1-markhas@chromium.org>
 <20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220165423.v2.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 20, 2023 at 04:54:15PM -0700, Mark Hasemeyer wrote:
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

> +			*r = DEFINE_RES_IRQ(irq);
> +			r->flags = acpi_dev_irq_flags(info.triggering, info.polarity,
> +						      info.shareable, info.wake_capable);

Looking at this I am wondering if we can actually to have

			unsigned long irq_flags;
			...
			irq_flags = acpi_dev_irq_flags(info.triggering, info.polarity,
						       info.shareable, info.wake_capable);
			*r = DEFINE_RES_NAMED(irq, 1, NULL, irq_flags);

as we don't need to duplicate IORESOURCE_IRQ.

-- 
With Best Regards,
Andy Shevchenko



