Return-Path: <linux-i2c+bounces-11-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AA7E8130
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74C4BB20D93
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E5D3A287;
	Fri, 10 Nov 2023 18:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWQuGxOD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E139878
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:24:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933C71DF64;
	Fri, 10 Nov 2023 10:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640658; x=1731176658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iMLEVEwDpe0uU/yEiANhauWEw+kQk3zn+3BbIbhPfjc=;
  b=ZWQuGxODaTgEDh3Qo7RhT2KPRNjVwlVhEo/E1dFl1/NVQ1wz2euKU7Q7
   1rGUeYcxXfaZARcLSsuGiSjL4k57HVXSVF+X4Lv3W/ZkJ0iRFB+B9a+JO
   05Ax8/gS6GguVlkbxnjhxydBkKdLdKUNZKDX+Rdom0haJU5H+7Uu78Ph/
   QwWgnXinHxMZCJP1S8ev3EIEVXHlpmNVhFesPP0Mo4zg30qAG5PvAQOz3
   QIsc62HESYF2XYKvOedApptJgAXB554pgAUeB9C9wwIn8bTRBAfPRfUOj
   Ci50WK1QjtlL/ARXDex+q3PQEYcO+HKcCyObHPIuEzINllvybdsLaBu/O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251902"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251902"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663737"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663737"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 46CA872F; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 00/25] i2c: designware: code consolidation & cleanups
Date: Fri, 10 Nov 2023 20:11:20 +0200
Message-ID: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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
- fixing cleanup order in error path and remove (patches 1-5)
- refactoring i2c_dw_*_lock_support() (patches 6-7)
- refactoring module alias and device ID tables (patches 8-11)
- unifying firmware parsing and configuring code (patches 12-16)
- miscellaneous cleanups (patches 17-18,22-25)
- consolidating PM ops (patch 19)
- using device_set_node() for all drivers (patches 20-21)

The "Consolidate PM ops" might be considered as rft, however I don't think
we have any hardware where the behaviour will be changed, anyways, good
to test.

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

Andy Shevchenko (25):
  i2c: designware: Delete adapter before disabling in
    i2c_dw_pci_remove()
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
 drivers/i2c/busses/i2c-designware-common.c  | 166 +++++++++-
 drivers/i2c/busses/i2c-designware-core.h    |  47 +--
 drivers/i2c/busses/i2c-designware-master.c  |  19 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 118 ++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 337 +++++++-------------
 drivers/i2c/busses/i2c-designware-slave.c   |  12 +-
 7 files changed, 338 insertions(+), 371 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


