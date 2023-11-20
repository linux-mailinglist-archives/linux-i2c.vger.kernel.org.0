Return-Path: <linux-i2c+bounces-310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB07F15FD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E951C217FA
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0423F15E9D;
	Mon, 20 Nov 2023 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FePmihkh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0675CA;
	Mon, 20 Nov 2023 06:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491609; x=1732027609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1WcAH3qnIrokblei/Ut5XpiAyV1OZfCsJMBPI5VHzoQ=;
  b=FePmihkhWLlwuVJHepgjMGQSyy9Ymb5Tx1Cu0wLUfJwPq57+n8aOUnC4
   OcVYuG0LkDDeam3jRFS+FGbzkxq0iVvX3mRGB2ICS/+4HsweDXVeU4cJu
   Gx4no+bQ3ItK+joHszPI/jZvCsD9DlTvM9E5KpSs7Mn2HhctAXlp9YN6v
   qE0c57iX1RKnwi8/BN+4mshUnuNYn+/tKTHWPfV+rhKg00tP++atLygAE
   Anzk1O6xsDQVlYieQBKDubb26Uq8+NgIVdzeCh4MJ7ZInlQg9I2AYdMdi
   d9iEMxsYdLl3x1GsLn+G+qIPJ8pcmJBFC28DvVOgnOpp22dPAdz2E5EQo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956435"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956435"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193126"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193126"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 20E086B; Mon, 20 Nov 2023 16:46:43 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 00/24] i2c: designware: code consolidation & cleanups
Date: Mon, 20 Nov 2023 16:41:42 +0200
Message-ID: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
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

The "Consolidate PM ops" might be considered as rft, however I don't think
we have any hardware where the behaviour will be changed, anyways, good
to test.

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

 drivers/i2c/busses/i2c-designware-amdpsp.c  |  10 +-
 drivers/i2c/busses/i2c-designware-common.c  | 167 +++++++++-
 drivers/i2c/busses/i2c-designware-core.h    |  47 +--
 drivers/i2c/busses/i2c-designware-master.c  |  19 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 114 ++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 337 +++++++-------------
 drivers/i2c/busses/i2c-designware-slave.c   |  12 +-
 7 files changed, 337 insertions(+), 369 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


