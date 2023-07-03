Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10F6745BE8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjGCMOO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjGCMOO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:14 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4A1109;
        Mon,  3 Jul 2023 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386453; x=1719922453;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B+0o99RwmPnmItgZGhKKF+qA0QI/Xs8dXHq+Uwdmz44=;
  b=YDq+87bh7Hn4iSR5aWLx3cT7sktDxusqJegRlcgNHE4hpPPzM8pwwass
   eSqAAkE1kuAlfzLLfQL3FwA1wQbeMPNXj7jyncNlmJkuhpQFlr8MvOeIY
   umDcCid1x4uKAjj6QdQ6oS5bDNjJMSZa2z8RM83BhcZHB8DlFtpX6xTP3
   R7CW7ooDKGAchiQe6c7ZtDZ4b11yVxjqV5L7yWiJTzkaOFHhJQH86KV/v
   2zUGVZSwS+i7fIXwa+ZmUELq5p2rjThPbbIBnc3RuztPsLgMGNnM3a+4k
   sfBXE3i49uCOUq63Thr/79vPn/RdZ06qide1AecI0BJeqRLoiWsuBZF0c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361726060"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="361726060"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="788508190"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="788508190"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 05:14:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E199C170; Mon,  3 Jul 2023 15:14:12 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 0/5] ACPI: platform: Fix SMB0001 enumeration on Kontron devices
Date:   Mon,  3 Jul 2023 15:14:06 +0300
Message-Id: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After switching i2c-scmi driver to be a plaform one, it stopped
being enumerated on number of Kontron platforms, because it's
listed in the forbidden_id_list.

To resolve the situation, add a flag and check if there are resources
privided for the forbiden device. If it is the case, the device must
be skipped.

Changelog v4:
- dropped applied patch
- added kernel doc for new helper (Rafael)
- rewritten the commit message for the reason of a new helper (Rafael)
- added a couple of patches for ACPI scan.c that can be applied later on

Changelog v3:
- provided completely rewritten solution (Rafael)
- due to above, added two new patches
- due to above, dropped tags from patch 3

Andy Shevchenko (5):
  ACPI: bus: Introduce acpi_match_acpi_device() helper
  ACPI: platform: Ignore SMB0001 only when it has resources
  ACPI: platform: Move SMB0001 HID to the header and reuse
  ACPI: scan: Use the acpi_match_acpi_device() helper
  ACPI: scan: Provide symbol declarations

 drivers/acpi/acpi_platform.c  | 30 +++++++++++++++++++++++++++---
 drivers/acpi/bus.c            | 25 +++++++++++++++++++++----
 drivers/acpi/scan.c           | 22 +++++++++++++---------
 drivers/i2c/busses/i2c-scmi.c |  3 ---
 include/acpi/acpi_drivers.h   |  2 ++
 include/linux/acpi.h          |  9 +++++++++
 6 files changed, 72 insertions(+), 19 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

