Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A49D53ECCD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiFFROG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 13:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiFFRNs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 13:13:48 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B793878A;
        Mon,  6 Jun 2022 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654535076; x=1686071076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8B3oBa5J+/nZtfBbVHEcmqTofXo8TT8r9m6GWKF4qqA=;
  b=VOXLQdbqEmDOjfQLktWJcGsVLYc1dwvVlie7eG5SUvbUDdvn9gyVgaPj
   NVIJWWV9F6GN8AS54gAf9qZGQdzBEONDo4/LHw125sVOwcugo/sOnV7YD
   XzwHpbBeKGqMGcVCxRdgN8cED4XCGmPpiiL6OjZKwqgoUqVCGtZmJyF8e
   n2bE7jOAo3vR9rmJnSsgUqwO+b5tDL9pZjo3wp+BiiZbLwJrYo974aUST
   0FsnKdTaaVDmmYCtSqFaLd+bpplGAwVxAuJki9f/rK3taaSyfjlLHcEto
   NAU/lLHBW7DZqQIHply7dTwWsUownZin9C8saFPr/hfOW8LdeBvPEs6ok
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277055858"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="277055858"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="709122657"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 06 Jun 2022 09:41:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E430A11FA; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 11/12] platform/x86: simatic-ipc: drop custom P2SB bar code
Date:   Mon,  6 Jun 2022 19:41:37 +0300
Message-Id: <20220606164138.66535-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

The two drivers that used to use this have been switched over to the
common P2SB accessor, so this code is not needed any longer.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/simatic-ipc.c            | 38 -------------------
 .../platform_data/x86/simatic-ipc-base.h      |  2 -
 2 files changed, 40 deletions(-)

diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
index b599cda5ba3c..26c35e1660cb 100644
--- a/drivers/platform/x86/simatic-ipc.c
+++ b/drivers/platform/x86/simatic-ipc.c
@@ -101,44 +101,6 @@ static int register_platform_devices(u32 station_id)
 	return 0;
 }
 
-/* FIXME: this should eventually be done with generic P2SB discovery code
- * the individual drivers for watchdogs and LEDs access memory that implements
- * GPIO, but pinctrl will not come up because of missing ACPI entries
- *
- * While there is no conflict a cleaner solution would be to somehow bring up
- * pinctrl even with these ACPI entries missing, and base the drivers on pinctrl.
- * After which the following function could be dropped, together with the code
- * poking the memory.
- */
-/*
- * Get membase address from PCI, used in leds and wdt module. Here we read
- * the bar0. The final address calculation is done in the appropriate modules
- */
-u32 simatic_ipc_get_membase0(unsigned int p2sb)
-{
-	struct pci_bus *bus;
-	u32 bar0 = 0;
-	/*
-	 * The GPIO memory is in bar0 of the hidden P2SB device.
-	 * Unhide the device to have a quick look at it, before we hide it
-	 * again.
-	 * Also grab the pci rescan lock so that device does not get discovered
-	 * and remapped while it is visible.
-	 * This code is inspired by drivers/mfd/lpc_ich.c
-	 */
-	bus = pci_find_bus(0, 0);
-	pci_lock_rescan_remove();
-	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
-	pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
-
-	bar0 &= ~0xf;
-	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
-	pci_unlock_rescan_remove();
-
-	return bar0;
-}
-EXPORT_SYMBOL(simatic_ipc_get_membase0);
-
 static int __init simatic_ipc_init_module(void)
 {
 	const struct dmi_system_id *match;
diff --git a/include/linux/platform_data/x86/simatic-ipc-base.h b/include/linux/platform_data/x86/simatic-ipc-base.h
index 62d2bc774067..39fefd48cf4d 100644
--- a/include/linux/platform_data/x86/simatic-ipc-base.h
+++ b/include/linux/platform_data/x86/simatic-ipc-base.h
@@ -24,6 +24,4 @@ struct simatic_ipc_platform {
 	u8	devmode;
 };
 
-u32 simatic_ipc_get_membase0(unsigned int p2sb);
-
 #endif /* __PLATFORM_DATA_X86_SIMATIC_IPC_BASE_H */
-- 
2.35.1

