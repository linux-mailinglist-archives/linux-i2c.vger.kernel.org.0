Return-Path: <linux-i2c+bounces-648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073DD808A06
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B51E9281027
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AE74184A;
	Thu,  7 Dec 2023 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nP2v77pY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA2810DD;
	Thu,  7 Dec 2023 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958627; x=1733494627;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N5er/hJ+qh7GSj6h7tyxvjap6aYaUiWxo3TcM+VUniE=;
  b=nP2v77pY5hfrhX19mGajbSAfdQGPmSofVEDYkeXB3kYhf/LbWP8Q8XgZ
   g3JE2dXy45CXme9ZdUUkcoAHlb6KgAVBrJtY31CuN/EUSN9AMwOlmBxgX
   40g5ai1RGgk4M7WKYLE8EuU+PL5nnU5iH0WKSByzHRxPp87Ap3+mEKpDk
   p2VPUrd1hA60PmhJKpz28GAWwCjIJCH1kI4JZGhKvoSST3gKFHn3fs6Fx
   hRCOle34b2LgK31cztIrKSUbOmsb4kFdtVmvTOcPPH/YakZ8FSBWDuW4J
   UbG0qIseJ1F/aCkSirquWsfQ76M+8rQhLn8OBVxNPSZ7G/dkGFs0Kh/IQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726044"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756044"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756044"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6EE4F591; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Date: Thu,  7 Dec 2023 16:13:40 +0200
Message-ID: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series now consists the following groups of patches:
- fixing cleanup order in error path and remove (patches 1-4)
- refactoring i2c_dw_*_lock_support() (patches 5-6)
- refactoring module alias and device ID tables (patches 7-10)
- unifying firmware parsing and configuring code (patches 11-15)
- miscellaneous cleanups (patches 16-17,21-24)
- consolidating PM ops (patch 18)
- using device_set_node() for all drivers (patches 19-20)

Changelog v5:
- collected tags (Serge, Jarkko, Andi)
- corrected commit messages in patches 7, 18, 19 (Andi)
- amended grammar in the patch 24 as suggested (Andi)

v4: https://lore.kernel.org/r/20231120144641.1660574-1-andriy.shevchenko@linux.intel.com

Changelog v4:
- dropped first patch as controversial (Jarkko)
- dropped Fixes tag from a few patches (Jarkko)
- moved a hunk in patch 1 to patch 2 where it belongs (Jarkko)
- exported i2c_dw_disable() for modular building (Jarkko)
- added tags (Mario, Jarkko)

v3: https://lore.kernel.org/r/20231110182304.3894319-1-andriy.shevchenko@linux.intel.com

Changelog v3:
- doubled the size of the series
- fixed compilation error (LKP)
- added tags (Andi)

v2: https://lore.kernel.org/r/20231109182823.3531846-1-andriy.shevchenko@linux.intel.com

Changelog v2:
- reworked the series to make it less twisted (Jarkko, Andi)
- added tags to the patches that have been rebased (Andi, Mario, Jarkko)
- introduced a few new changes (PM ops, export namespace)

v1: https://lore.kernel.org/r/20230725143023.86325-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (24):
  i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
  i2c: designware: Fix reset call order in dw_i2c_plat_probe()
  i2c: designware: Let PCI core to take care about interrupt vectors
  i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
  i2c: designware: Replace a while-loop by for-loop
  i2c: designware: Save pointer to semaphore callbacks instead of index
  i2c: designware: Add missing 'c' into PCI IDs variable name
  i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
  i2c: designware: Unify terminator in device ID tables
  i2c: designware: Always provide device ID tables
  i2c: designware: Drop return value from i2c_dw_acpi_configure()
  i2c: designware: Drop return value from dw_i2c_of_configure()
  i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
  i2c: designware: Consolidate firmware parsing and configuring code
  i2c: designware: Unify the firmware type checks
  i2c: designware: Move exports to I2C_DW namespaces
  i2c: designware: Remove ->disable() callback
  i2c: designware: Consolidate PM ops
  i2c: designware: Uninline i2c_dw_probe()
  i2c: designware: Propagate firmware node
  i2c: designware: Use pci_get_drvdata()
  i2c: designware: Use temporary variable for struct device
  i2c: designware: Get rid of redundant 'else'
  i2c: designware: Fix spelling and other issues in the comments

 drivers/i2c/busses/i2c-designware-amdpsp.c  |  14 +-
 drivers/i2c/busses/i2c-designware-common.c  | 167 +++++++++-
 drivers/i2c/busses/i2c-designware-core.h    |  47 +--
 drivers/i2c/busses/i2c-designware-master.c  |  19 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 114 ++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 337 +++++++-------------
 drivers/i2c/busses/i2c-designware-slave.c   |  12 +-
 7 files changed, 339 insertions(+), 371 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


