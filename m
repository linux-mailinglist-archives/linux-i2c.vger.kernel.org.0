Return-Path: <linux-i2c+bounces-764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9C811F17
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 20:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90031C2131D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 19:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9896F6829F;
	Wed, 13 Dec 2023 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lL9acd/5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB40E0;
	Wed, 13 Dec 2023 11:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702496431; x=1734032431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TB6pdHRQrOCaGMVFpuGPsB29t4yb42FXCMwWcj1ZwFY=;
  b=lL9acd/50tmS4n/6fGFTtWucnFVoEQCDfLYwD7PcbN9NzMmT4AaSVdTB
   sul3FnkseHcKHYeunYtKenLYEdMD7PnIFbYK24xFbPTq0Zq0ybTp7uFjp
   03ZQkZYe8n0WA0RUTNHlI9ySgPUTHeo+GQ05naxJCVgtu47VLxKZVAPhw
   xMiapz95LrC8QBSx+SOUJHjo3YRYTHM9q1na040jXRgf2uOwIq8tDk/03
   qJDsIy0UQ0J2yTl0qWfuUbcT8Q+quiY9Dj7yGQc0H32zTzDelB85yfn+N
   +KgN+4p7Vbh+vrllAUkaU9Elbqe7ctPx17xbQS3MrRLNzPIh9yTjgIMyg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="380003847"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="380003847"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="802985825"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="802985825"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:40:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDV5l-00000005cxH-1HEp;
	Wed, 13 Dec 2023 21:40:25 +0200
Date: Wed, 13 Dec 2023 21:40:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 1/6] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by to
 use resource
Message-ID: <ZXoIqfXVYiYAuL86@smile.fi.intel.com>
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 13, 2023 at 11:00:19AM -0700, Mark Hasemeyer wrote:
> Other information besides wake capability can be provided about GPIO
> IRQs such as triggering, polarity, and sharability. Use resource flags
> to provide this information to the caller if they want it.
> 
> This should keep the API more robust over time as flags are added,
> modified, or removed. It also more closely matches acpi_irq_get which
> take a resource as an argument.
> 
> Rename the function to acpi_dev_get_gpio_irq_resource to better describe
> the function's new behavior.

I have got only one patch out of 6.
Also the series is missing a cover letter.

Please, fix both issues in the next version of the series.

-- 
With Best Regards,
Andy Shevchenko



