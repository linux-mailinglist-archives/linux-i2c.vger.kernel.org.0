Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B4761F485
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiKGNnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiKGNm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:42:57 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F1D1CB3B
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828576; x=1699364576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3sieVvxo5fjCIEl18822rDrAKgHO+t9aH53z1XXTwOE=;
  b=WS2XTcZ4sHFe+kZ5auhibJzPspbHG33y8szcuF9eLGJMLXGJCHdwcdDV
   OI7cc2SmE6HndBN7hAgRJ39GtTVDfqQVVivQXx6++IGflGF2P20OSjvtG
   iy+IrmUeOv2PKeNDniB0gbbxK2osWgq9mOR5PceSHyQi98UOJX2G5P55T
   WoYKahNy6YJZzfT5jrGtjRHYPcaNYsUu3eJSydJprZgmY4/dON3t9X+xc
   d212UoTn2YRT8JZ6qmT0eDXx1x3qfqM8/UqbMh5Eo46KUYkiJ+b2OpIJl
   dgXQJHi1rbEK06Srtke8eZd0DwsMN/G1Qgu7Wd2DC/Mko3NG2+XW5y3kd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531051"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531051"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971828"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971828"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:42:53 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 00/12] i2c: designware: Slave fixes and generic cleanups
Date:   Mon,  7 Nov 2022 15:42:36 +0200
Message-Id: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Version 3 of the patchset I sent last week:
https://www.spinics.net/lists/linux-i2c/msg59046.html

Changes address the comments Andy made and is rebased on top of current
i2c/for-next.

Changes:
- Added Andy's Reviewed-by
- Patch 09/12 Fixed typo
- Patch 12/12 Updated commit log and code comment

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


base-commit: befeb20d38133cf0d227ae8251ab3d392f295f52
-- 
2.35.1

