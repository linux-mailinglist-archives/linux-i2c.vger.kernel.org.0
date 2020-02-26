Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBFB16FFD7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 14:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgBZNVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 08:21:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:39882 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgBZNV2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Feb 2020 08:21:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 05:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; 
   d="scan'208";a="231395660"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 26 Feb 2020 05:21:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 94465252; Wed, 26 Feb 2020 15:21:22 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i2c: i801: Fix iTCO_wdt resource creation if PMC is not present
Date:   Wed, 26 Feb 2020 16:21:19 +0300
Message-Id: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

This series aims to fix the issue reported by Martin Volf [1] that prevents
the nct6775 driver from loading.

I added Fixes tag to the last patch but not stable tag because the other
two patches it depends are not really stable material IMO. Please let me
know if there is a better way to organize these :)

I tested this on Intel Whiskey Lake based system (CNL derived) and on Comet
Lake-V based system (SPT derived and the iTCO_wdt still works and I can see
the expected resources in /proc/ioports and /proc/iomem.

The previous version of the patch series can be found here:

  https://lore.kernel.org/linux-hwmon/20200225123802.88984-1-mika.westerberg@linux.intel.com/

Changes from the previous version:

  * Call request_region() also for iTCO_vendorsupport
  * Drop the core populating ICH_RES_IO_SMI completely from i2c-i801.c

[1] https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/

Mika Westerberg (3):
  watchdog: iTCO_wdt: Export vendorsupport
  watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
  i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device

 drivers/i2c/busses/i2c-i801.c          | 45 +++++++-------------------
 drivers/watchdog/iTCO_vendor.h         |  2 ++
 drivers/watchdog/iTCO_vendor_support.c | 16 +++++----
 drivers/watchdog/iTCO_wdt.c            | 28 +++++++++-------
 4 files changed, 39 insertions(+), 52 deletions(-)

-- 
2.25.0

