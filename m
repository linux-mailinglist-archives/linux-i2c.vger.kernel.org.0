Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D891A761BB6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbjGYOaZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjGYOaY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:24 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5BDE9;
        Tue, 25 Jul 2023 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295423; x=1721831423;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BdjNY87k9c70DGi9vp4hzc7IlKm+wC98ibqbhI3AI64=;
  b=k9s+0x4gWSzxv5sLCgfZmHnlZ7oBCYSSXQ9S7rX35T2cNBvnTopiXDf4
   1LFTB2WUFzCZHQj1jRFlVqDrippv9fzfnu7Rin1q7SKzqVPupLmWT1NJn
   nQkzLFBu/e5IUQBj20FUVe48hUIm/S2qdoV2Y8oPrSwtz4cVUhO5CQAvn
   aMAVca8GkgsuF5Ee8oBiN97fVIbYblHWDYzKT8hsWh4M9TflDAOIK3YIn
   TrOEpx8mHxZvBM1o3ojzr1z72Hm9PFVJ8QNq4EnzyMVBxnBmEV23elkMO
   Hpk8VVnxhNVkojXOJJQl1fCXknZuDNlCtcKuoV5VEUH5nAkio8KmYZm9u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742858"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742858"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491422"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8D39B176; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 0/9] i2c: designware: code consolidation & cleanups
Date:   Tue, 25 Jul 2023 17:30:14 +0300
Message-Id: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mainly this is about firmware parsing and configuring code
consolidation. Besides that some cleanups here and there.

Andy Shevchenko (9):
  i2c: designware: Move has_acpi_companion() to common code
  i2c: designware: Change i2c_dw_acpi_configure() prototype
  i2c: designware: Align dw_i2c_of_configure() with
    i2c_dw_acpi_configure()
  i2c: designware: Propagate firmware node
  i2c: designware: Always provide ID tables
  i2c: designware: Consolidate firmware parsing and configure code
  i2c: desingware: Unify firmware type checks
  i2c: designware: Get rid of redundant 'else'
  i2c: designware: Fix spelling and other issues in the comments

 drivers/i2c/busses/i2c-designware-amdpsp.c  |  10 +-
 drivers/i2c/busses/i2c-designware-common.c  |  84 +++++++++++---
 drivers/i2c/busses/i2c-designware-core.h    |  25 ++---
 drivers/i2c/busses/i2c-designware-master.c  |  15 ++-
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  13 +--
 drivers/i2c/busses/i2c-designware-platdrv.c | 117 ++++++--------------
 drivers/i2c/busses/i2c-designware-slave.c   |   6 +-
 7 files changed, 131 insertions(+), 139 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

