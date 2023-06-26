Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA8873DCAD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 13:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjFZLBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 07:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjFZLAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 07:00:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FB910DD;
        Mon, 26 Jun 2023 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687777231; x=1719313231;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4I4jFx9s8H+UCd6OuK/ZZ1rbZacxqwP2cPh7/sdpD38=;
  b=L4RYooK0PTLaa2J6q/XqgiTo2MW8XVXi7VOpMtlbD5OYPj1m4foyMmHu
   XLru/lKXYwvx6gxswWEsEoIZjt116BsyAivAG1WvAMIDcK9dTxg/kjSJX
   fAnYi440V5Yw+W0JzTYM8p/oZ2/hQFgO1ucIIvJLoWrvG2ITRGcDKceBw
   aJJxdnWvjJkEXj7Hm+ke3kDIy+TNW6ge6Q2Vl/73/VR5/7/fpv85DVkAy
   hiaVgy+stpalREufFneRc3J1shx6QXTHADqYiQVq9h3WXmAj6fmZgyHNW
   RVe0DOd571vTVAvaWpR/ablUvF0mAuKDmV9Wn12MHjSm5qDCCmHRZjX+2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="351010839"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="351010839"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781390999"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781390999"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 04:00:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E1C50118; Mon, 26 Jun 2023 14:00:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 0/4] ACPI: platform: Fix SMB0001 enumeration on Kontron devices
Date:   Mon, 26 Jun 2023 14:00:22 +0300
Message-Id: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After switching i2c-scmi driver to be a plaform one, it stopped
being enumerated on number of Kontron platforms, because it's
listed in the forbidden_id_list.

To resolve the situation, add a flag and count the resources of the
forbiden device. If the count is non-zero, the device must be skipped.

Changelog v3:
- provided completely rewritten solution (Rafael)
- due to above, added two new patches
- due to above, dropped tags from patch 3

Andy Shevchenko (4):
  ACPI: bus: Constify acpi_companion_match() returned value
  ACPI: bus: Introduce acpi_match_acpi_device() helper
  ACPI: platform: Ignore SMB0001 only when it has resources
  ACPI: platform: Move SMB0001 HID to the header and reuse

 drivers/acpi/acpi_platform.c  | 31 +++++++++++++++++++++++++++----
 drivers/acpi/bus.c            | 21 ++++++++++++++-------
 drivers/acpi/device_sysfs.c   |  2 +-
 drivers/acpi/internal.h       |  2 +-
 drivers/i2c/busses/i2c-scmi.c |  3 ---
 include/acpi/acpi_drivers.h   |  2 ++
 include/linux/acpi.h          |  9 +++++++++
 7 files changed, 54 insertions(+), 16 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

