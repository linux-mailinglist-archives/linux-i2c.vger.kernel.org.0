Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4711E7E7169
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344938AbjKIS2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344994AbjKIS2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:39 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DCA3C03;
        Thu,  9 Nov 2023 10:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554517; x=1731090517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VybPoNP5md15sgQ1g0rtbYZ5wBZmF9p9FbvqUQhY8So=;
  b=RZiNyVzikUZ/8421TgRadYOXQlioHwesRSS8BiAQgmQbAizYsij4XJS+
   ChToDPE4DOJr2D3zMDr+gt/rfxM59u+wgh9kjOh5BnERDSaCNyagZHy19
   7pC7zGgvkgT2e4udxULajRuKlshULFfho+6hWoyT//t01YjNfMIYJ+Ybe
   th8GZmrlaiBF1vJD42SZiZx/zUB6o7U8vH4kEBk/eCXTRxrN+G+rD/8pg
   YD12K3k3SqeuldP2YG071EwZoMecv+8DX8IzHGCM58fTTdo6F8g8cWbez
   ld88ySpRHrOTY8CNtoxoaDYQquqzaKwa+DJHAx5hFVRyEJUJ7xQLNVlJe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389853909"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389853909"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936938974"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="936938974"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 10:28:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3F370706; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 00/12] i2c: designware: code consolidation & cleanups
Date:   Thu,  9 Nov 2023 20:19:10 +0200
Message-ID: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The series now consists the following subseries of patches:
- refactoring module alias and device ID tables (patches 1-2)
- unifying firmware parsing and configuring code (patches 3-7)
- miscellaneous cleanups (patches 8-11)
- consolidating PM ops (patch 12)

The last one might be considered as rft, however I don't think we
have any hardware where the behaviour will be changed, anyways, good
to test.

v1: https://lore.kernel.org/r/20230725143023.86325-1-andriy.shevchenko@linux.intel.com

Changelog v2:
- reworked the series to make it less twisted (Jarkko, Andi)
- added tags to the patches that have been rebased (Andi, Mario, Jarkko)
- introduced a few new changes (PM ops, export namespace)

Andy Shevchenko (12):
  i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
  i2c: designware: Always provide device ID tables
  i2c: designware: Drop return value from i2c_dw_acpi_configure()
  i2c: designware: Drop return value from dw_i2c_of_configure()
  i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
  i2c: designware: Consolidate firmware parsing and configuring code
  i2c: desingware: Unify the firmware type checks
  i2c: designware: Move exports to I2C_DW namespaces
  i2c: designware: Get rid of redundant 'else'
  i2c: designware: Fix spelling and other issues in the comments
  i2c: designware: Remove ->disable() callback
  i2c: designware: Consolidate PM ops

 drivers/i2c/busses/i2c-designware-amdpsp.c  |  10 +-
 drivers/i2c/busses/i2c-designware-common.c  | 150 ++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h    |  25 +--
 drivers/i2c/busses/i2c-designware-master.c  |  19 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  62 +------
 drivers/i2c/busses/i2c-designware-platdrv.c | 183 +++++---------------
 drivers/i2c/busses/i2c-designware-slave.c   |  10 +-
 7 files changed, 216 insertions(+), 243 deletions(-)

-- 
2.40.0.1996.gbec44491f096

