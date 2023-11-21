Return-Path: <linux-i2c+bounces-369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88077F30BF
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 15:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCC8282DBA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 14:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C455C02;
	Tue, 21 Nov 2023 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLtDj+9z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD30790;
	Tue, 21 Nov 2023 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700577020; x=1732113020;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EYbERcSH0gLOBcfmdnbFd03o8uUuoWmbxlspp5sE7vw=;
  b=VLtDj+9zr2+SI3JwG1kbtzDFe+jdQA7C/rYUg9JbWv0ZvKjtPquwPuAQ
   O8SPm7gf/6VPox2UXVpRY05pD9nSovcQ0GmtYAiaaT95tymZKv6xaUmie
   JKJyOuzY1WZSRfpUk0R4XtuhO0MrrCVVQDfUFVMFtv7+RZyNiebANIf8b
   PZ9U1Kys5mw5rVBqTY0JaKX+Xc4YCHNuBDvfQ2OO9XrDYCQi0A4pAD7MR
   ovoxbwfQj4Txi0n5qp9xvOHj6SQDySMZEaWZb0hINyc22nVkL1R+LCsfL
   s6j2d1GPXPoR9zP4qgGgMuRoP/vk/NYAg/knt7QV9VFYmVkNicIw0gLCh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390705860"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="390705860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 06:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766666125"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766666125"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 06:30:16 -0800
Message-ID: <480142d3-c3f3-45b6-af2f-6aecd2039b15@linux.intel.com>
Date: Tue, 21 Nov 2023 16:30:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] i2c: designware: code consolidation & cleanups
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/23 16:41, Andy Shevchenko wrote:
> The series now consists the following groups of patches:
> - fixing cleanup order in error path and remove (patches 1-4)
> - refactoring i2c_dw_*_lock_support() (patches 5-6)
> - refactoring module alias and device ID tables (patches 7-10)
> - unifying firmware parsing and configuring code (patches 11-15)
> - miscellaneous cleanups (patches 16-17,21-24)
> - consolidating PM ops (patch 18)
> - using device_set_node() for all drivers (patches 19-20)
> 
> The "Consolidate PM ops" might be considered as rft, however I don't think
> we have any hardware where the behaviour will be changed, anyways, good
> to test.
> 
> Changelog v4:
> - dropped first patch as controversial (Jarkko)
> - dropped Fixes tag from a few patches (Jarkko)
> - moved a hunk in patch 1 to patch 2 where it belongs (Jarkko)
> - exported i2c_dw_disable() for modular building (Jarkko)
> - added tags (Mario, Jarkko)
> 
> v3: https://lore.kernel.org/r/20231110182304.3894319-1-andriy.shevchenko@linux.intel.com
> 
> Changelog v3:
> - doubled the size of the series
> - fixed compilation error (LKP)
> - added tags (Andi)
> 
> v2: https://lore.kernel.org/r/20231109182823.3531846-1-andriy.shevchenko@linux.intel.com
> 
> Changelog v2:
> - reworked the series to make it less twisted (Jarkko, Andi)
> - added tags to the patches that have been rebased (Andi, Mario, Jarkko)
> - introduced a few new changes (PM ops, export namespace)
> 
> v1: https://lore.kernel.org/r/20230725143023.86325-1-andriy.shevchenko@linux.intel.com
> 
> Andy Shevchenko (24):
>    i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
>    i2c: designware: Fix reset call order in dw_i2c_plat_probe()
>    i2c: designware: Let PCI core to take care about interrupt vectors
>    i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
>    i2c: designware: Replace a while-loop by for-loop
>    i2c: designware: Save pointer to semaphore callbacks instead of index
>    i2c: designware: Add missing 'c' into PCI IDs variable name
>    i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
>    i2c: designware: Unify terminator in device ID tables
>    i2c: designware: Always provide device ID tables
>    i2c: designware: Drop return value from i2c_dw_acpi_configure()
>    i2c: designware: Drop return value from dw_i2c_of_configure()
>    i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
>    i2c: designware: Consolidate firmware parsing and configuring code
>    i2c: designware: Unify the firmware type checks
>    i2c: designware: Move exports to I2C_DW namespaces
>    i2c: designware: Remove ->disable() callback
>    i2c: designware: Consolidate PM ops
>    i2c: designware: Uninline i2c_dw_probe()
>    i2c: designware: Propagate firmware node
>    i2c: designware: Use pci_get_drvdata()
>    i2c: designware: Use temporary variable for struct device
>    i2c: designware: Get rid of redundant 'else'
>    i2c: designware: Fix spelling and other issues in the comments
> 
>   drivers/i2c/busses/i2c-designware-amdpsp.c  |  10 +-
>   drivers/i2c/busses/i2c-designware-common.c  | 167 +++++++++-
>   drivers/i2c/busses/i2c-designware-core.h    |  47 +--
>   drivers/i2c/busses/i2c-designware-master.c  |  19 +-
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 114 ++-----
>   drivers/i2c/busses/i2c-designware-platdrv.c | 337 +++++++-------------
>   drivers/i2c/busses/i2c-designware-slave.c   |  12 +-
>   7 files changed, 337 insertions(+), 369 deletions(-)
> 
To all (some I've ack'ed already):

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

