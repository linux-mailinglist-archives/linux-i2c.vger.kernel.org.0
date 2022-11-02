Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D250616367
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiKBNLi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKBNLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:11:37 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ADC28E1D
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394696; x=1698930696;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TpBSyoB3CzN6KiwqNR1iDCjwnfKSzaaYSJW1935I1kk=;
  b=JZ3qwO/Croq5aT5Y+TYXE045jhtmzAlAbxOagePqUJMhg3XcGwVbldh9
   evH0O4eU5fOCGxx5KzGZJdt7hMjzkW4qjwr52kGizRj1gnwNGFA/25IwQ
   NeurB1Oi8G+7JI/eex9/7Bkd5vqC2HDKq7EIXpjtZba/sQdtNwIpCOKqp
   jRGV9PzI6U69WK7avBBnhW6H5cMtzqe8jdIR6YGN6wMMNifjlknfyNLNa
   WZVAhsJ52W2TZHUdyFTkPNGj/F8rEvDC5dBf0A1mSS6oOyQp6RBZKtiiz
   RP2kQkV9Ob6K+drKDOaTbQmhnTSDLO3nPmVQo2oEpfyZZfCVTa1UvJfGR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310507663"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="310507663"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234696"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234696"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:28 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 00/12] i2c: designware: Slave fixes and generic cleanups
Date:   Wed,  2 Nov 2022 15:11:13 +0200
Message-Id: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Version 2 of the patchset I sent last week:
https://www.spinics.net/lists/linux-i2c/msg58933.html

Changes address the comments Andy made and is rebased on top of current
i2c/for-next.

Luis Oliveira is not Cc'ed since I forgot his address is no longer working.

Changes:
- Patch 07/12 is using GENMASK(31, 0) instead of ~0
- Patch 10/12 Two leftovers from v1 removed and updated commit log
- Patch 11/12 Removed accidental "struct i2c_bus_recovery_info rinfo" missalign
- Patch 12/12 New patch commenting ASCII values of register value constants

Jarkko Nikula (12):
  i2c: designware: Fix slave state machine for sequential reads
  i2c: designware: Empty receive FIFO in slave interrupt handler
  i2c: designware: Define software status flags with BIT()
  i2c: designware: Remove needless initializations from
    i2c_dw_reg_slave()
  i2c: designware: Remove unused completion code from
    i2c-designware-slave
  i2c: designware: Simplify slave interrupt handler nesting
  i2c: designware: Do not process interrupt when device is suspended
  i2c: designware: Move debug print in i2c_dw_isr()
  i2c: designware: Simplify master interrupt handler nesting
  i2c: designware: Remove common i2c_dw_disable_int()
  i2c: designware: Align defines in i2c-designware-core.h
  i2c: designware: Add comment to custom register value constants

 drivers/i2c/busses/i2c-designware-common.c |   5 -
 drivers/i2c/busses/i2c-designware-core.h   | 235 ++++++++++-----------
 drivers/i2c/busses/i2c-designware-master.c |  44 ++--
 drivers/i2c/busses/i2c-designware-slave.c  |  77 +++----
 4 files changed, 163 insertions(+), 198 deletions(-)

base-commit: d28187f693ac5222d3b30955415143cd8e3b5edf
-- 
2.35.1

