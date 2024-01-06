Return-Path: <linux-i2c+bounces-1178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C00825FF3
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 15:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7E01F227A2
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 14:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F2E79F1;
	Sat,  6 Jan 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W36lyC2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BD8830;
	Sat,  6 Jan 2024 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704552549; x=1736088549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJZn9Bd9/mDRcam41rK8W3n5XGqyC9dgm7NvSJ76+b4=;
  b=W36lyC2ITrVGz6L88dJ12pIfOXh8YQaJUeup4YVvpolrCIslgfx0mBTA
   7EvoRFidmn9vOW9YmJ84nD4oQh5lvYFbTuLkKmwFiJ+/FoDso8bRFSEjN
   kPnKitLS5XIgvGePeDucwgFzucJ+pC5s49/8e3J9Z+N213HknS+D6CEQs
   4NLter4LGbo5b1qUpKkxVIMlF1cLnkIU2nKKpxmZ6SwFkCMrZgcJ7jh+j
   dvcCI11BB4VHDbLp10uzZn1zTLlT0WYPSlJyhN5ht4smpN4CeeURgW/AI
   yFKTntXtiSmtkqKWDB+6hXW15TXxRWlc663sHY3AmmGK8eCOgv4UmepCE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="464062410"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="464062410"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="851384333"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="851384333"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:49:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rM7uA-0000000Bvpg-0Juu;
	Sat, 06 Jan 2024 16:44:06 +0200
Date: Sat, 6 Jan 2024 16:44:05 +0200
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
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 02/24] gpiolib: acpi: Modify
 acpi_dev_irq_wake_get_by() to use resource
Message-ID: <ZZlnNR1-yKLSIWeF@smile.fi.intel.com>
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102140734.v4.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 02, 2024 at 02:07:26PM -0700, Mark Hasemeyer wrote:
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

Missing blank line.
We put a commit message as

$SUMARY
...blank line...
$DESCRIPTION (can contain blank lines)
...blank line...
$TAG block (may not contain blank lines)

> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

...

> +			unsigned long res_flags;

Why not calling it irq_flags?

...

> +struct resource;

This...

> +	struct resource r = {};

> +	return ret ?: r.start;

...does _not_ cover these cases.

Hence ioport.h must be included. Did I miss it?

-- 
With Best Regards,
Andy Shevchenko



