Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478D060E0F5
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbiJZMkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbiJZMjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:39:43 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18636EE27
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787973; x=1698323973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RaBnxfMBfcpqXLK3EOjdo2cpz5a9PVwJCLVsFWs+tJw=;
  b=fDQJj5zLc603gylvLj/HBxNQLKO3NPK8yX5AmA0Www5Tn95hJtI3534Y
   XImHLiVoLp67/AlEGPUJI42vJg8KN0AA6iTibbYYzkKQV5OBciQFBNmsw
   L6AJc/z9u+2qZuBixTqRnaieUQ/JMqAkT9WgN7HqlWppV0vvtrkEiIq+I
   0NHjYdzBbA2ZB/XrPmmEdSXIgoWM23A/awbb58qQVps+hBsRXRALvQsCB
   IeP521Gya86hhcDjD/HBOgHP6kKIIc0Yp/1c+RpUAI6bPaFUejl3R6fR3
   QSuscRUNMHrqVdgFU6xJsgWnRwtRZnJDq/jIVt722/5APR5fd8ZNOFASI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625006"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908617"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908617"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:29 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 00/11] i2c: designware: Slave fixes and generic cleanups
Date:   Wed, 26 Oct 2022 15:39:01 +0300
Message-Id: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

I discovered recently while doing other cleanups.that reads and writes
from I2C bus to i2c-designware-slave.c don't work correctly.

First two patches are fixes to slave code and meant for normal development
cycle since it looks these issues have been always here.

I Cc'ed Michael Wu <michael.wu@vatics.com> who has fixed
i2c-designware-slave.c before and Tian Ye <tianye@sugon.com> who recently
reported a write issue.

Could you test first two patches (or the whole set) that my patches won't
cause regressions to your existing test cases or does the 2nd patch fix
the write issue?

Rest of patches are minor changes and cleanups to both master and slave
parts.

Patchset is done on top of commit fd142e074e89 ("Merge branch
'i2c/for-current-fixed' into i2c/for-next") but may apply on top of
v6.1-rc1 too.

Jarkko Nikula (11):
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

 drivers/i2c/busses/i2c-designware-common.c |   5 -
 drivers/i2c/busses/i2c-designware-core.h   | 235 ++++++++++-----------
 drivers/i2c/busses/i2c-designware-master.c |  44 ++--
 drivers/i2c/busses/i2c-designware-slave.c  |  77 +++----
 4 files changed, 164 insertions(+), 197 deletions(-)

-- 
2.35.1

