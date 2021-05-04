Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9DF3727CA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 11:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhEDJHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 05:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhEDJHy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 05:07:54 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C4BC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 02:06:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0Z6a2500N3aEpPb01Z6arB; Tue, 04 May 2021 11:06:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr0j-002j3B-Ov; Tue, 04 May 2021 11:06:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr0j-00H702-CC; Tue, 04 May 2021 11:06:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] i2c: I2C_HISI should depend on ACPI
Date:   Tue,  4 May 2021 11:06:32 +0200
Message-Id: <22d124a7f12f2c8b280a9cc7f3b766351c9a8d64.1620119167.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The HiSilicon Kunpeng I2C controller driver relies on ACPI to probe for
its presence.  Hence add a dependency on ACPI, to prevent asking the
user about this driver when configuring a kernel without ACPI firmware
support.

Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop dependency on ARCH_HISI, as this is a public IP which doesn't
    specifically depend on ARCH_HISI.
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b5b4e0d0ff4dd0bc..226c0b79eac030fa 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -647,7 +647,7 @@ config I2C_HIGHLANDER
 
 config I2C_HISI
 	tristate "HiSilicon I2C controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on (ARM64 && ACPI) || COMPILE_TEST
 	help
 	  Say Y here if you want to have Hisilicon I2C controller support
 	  available on the Kunpeng Server.
-- 
2.25.1

