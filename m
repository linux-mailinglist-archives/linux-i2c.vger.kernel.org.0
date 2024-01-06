Return-Path: <linux-i2c+bounces-1189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A929E82609E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052EB283AD7
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5988B8838;
	Sat,  6 Jan 2024 16:29:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ED4C13E;
	Sat,  6 Jan 2024 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="483846627"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="483846627"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 08:29:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="784463483"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="784463483"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 08:29:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rM9TP-0000000Bx2q-0X74;
	Sat, 06 Jan 2024 18:24:35 +0200
Date: Sat, 6 Jan 2024 18:24:34 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Joe Perches <joe@perches.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <ZZl-wrHfidYJwpOk@smile.fi.intel.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106160935.45487-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+ Cc people from tags of 72921427d46b ("string.h: Add str_has_prefix() helper
function"). See below why.

On Sat, Jan 06, 2024 at 05:09:29PM +0100, Hans de Goede wrote:
> It is not necessary to handle the Dell specific instantiation of
> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
> inside the generic i801 I2C adapter driver.
> 
> The kernel already instantiates platform_device-s for these ACPI devices
> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> platform drivers.
> 
> Move the i2c_client instantiation from the generic i2c-i801 driver to
> the Dell specific dell-smo8800 driver.

...

> +/*
> + * NOTE: If new models with FEATURE_IDF are added please also update
> + * i801_idf_ids[] in drivers/platform/x86/dell-smo8800.c
> + */
>  static const struct pci_device_id i801_ids[] = {

I believe this comment can be enforced with some defines / static_assert().
But I haven't given any thought about it, just an idea.

>  };

...

> + *  Copyright (C) 2023 Hans de Goede <hansg@kernel.org>

2024?

...

> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> +		return 0;

Bah, we have str_has_prefix() and this, much older one...
Steven? Others? I mean we can do something about this duplication, right?

-- 
With Best Regards,
Andy Shevchenko



