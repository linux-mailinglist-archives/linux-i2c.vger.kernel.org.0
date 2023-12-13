Return-Path: <linux-i2c+bounces-763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1793811EFC
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 20:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB3E282A70
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 19:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B65168285;
	Wed, 13 Dec 2023 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UciZAyJp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BDD9C;
	Wed, 13 Dec 2023 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702496102; x=1734032102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNFNGP5i3euntVPkAioPBY5yW1MCBKQIcWUNZfB3GYg=;
  b=UciZAyJpCwrBwtSbpur2KYrw4hB75BarSCSZxm/snWoAUEdP8gzTHCa2
   RgmINWQ8L/vPjdsZYPt9ILZnLh2RyvUWYjeQJiy8h60vl8VTd00x85rmM
   R29DfgqPrXm9S9oZ2s6/8t2QnSaMs8MG1QgR4R9vZPTVrGW6uOYk7v7qt
   o+FvU0Gp3fh5OmXpiBfjeLyv7wpBTAMpOzYTmk0Al9J/zjhKxkALf2vpP
   5PGKRG9urv/+S9mF/f+KnG5kd9X7aH/F+NsIf9wh/xUGNGmmqacla0+su
   9LATk+8ppQ9dxhzXvXxXJSn9oSUasyEgPqM0PbWPAJcDGRe1yMeNh8i+Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="397799684"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="397799684"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774060567"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="774060567"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:34:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDV0R-00000005cq3-3OC5;
	Wed, 13 Dec 2023 21:34:55 +0200
Date: Wed, 13 Dec 2023 21:34:55 +0200
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
Message-ID: <ZXoHXwmwzczAqlLv@smile.fi.intel.com>
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

acpi_irq_get()

> take a resource as an argument.
> 
> Rename the function to acpi_dev_get_gpio_irq_resource to better describe

acpi_dev_get_gpio_irq_resource()

> the function's new behavior.

...

> + * @r: pointer to resource to populate with irq information. It is not modified on failure.

IRQ

I don't think the second remark is even needed. It's usual approach, i.e.
we expect no changes in the output if error condition is met.

...

> + * Irq number will be available in the resource structure.

IRQ

...

> +			*r = (struct resource)DEFINE_RES_IRQ(irq);

Why do you need "(struct resource)" annotation?

...

> +	struct resource irqres;
>  	struct i2c_acpi_irq_context irq_ctx = {
>  		.irq = -ENOENT,
>  	};

Hmm... I'm wondering if we can reuse irqres as a context to the respective
lookup calls.

-- 
With Best Regards,
Andy Shevchenko



