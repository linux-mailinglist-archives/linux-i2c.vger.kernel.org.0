Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2395A44B8
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfHaOYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 10:24:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:34961 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727915AbfHaOYF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 10:24:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Aug 2019 07:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,451,1559545200"; 
   d="scan'208";a="382352062"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2019 07:24:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6630310B; Sat, 31 Aug 2019 17:24:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 0/2] watchdog: Correct iTCO for Cannon Lake and beyond
Date:   Sat, 31 Aug 2019 17:24:00 +0300
Message-Id: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Starting from Intel Cannon Lake PCH the NO_REBOOT bit which is required by
the iTCO driver was moved from private register space to be part of the
TCO1_CNT register. This series introduces a new iTCO version (6) that gets
set for Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and Ice Lake
which are affected by this move.

The previous version of the series can be found here:

  https://lore.kernel.org/linux-watchdog/20190809124553.67012-1-mika.westerberg@linux.intel.com/

Changes from v1:

  * Include <linux/bits.h> for BIT()
  * Re-organize code so that v4 support is before v6
  * Move check for acpi_has_watchdog() to i801_add_tco()
  * Added tags from Jean and Guenter.

Mika Westerberg (2):
  watchdog: iTCO: Add support for Cannon Lake PCH iTCO
  i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond

 drivers/i2c/busses/i2c-i801.c | 142 +++++++++++++++++++++-------------
 drivers/watchdog/iTCO_wdt.c   |  26 ++++++-
 2 files changed, 112 insertions(+), 56 deletions(-)

-- 
2.23.0.rc1

