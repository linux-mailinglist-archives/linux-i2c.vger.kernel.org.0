Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0276B35DEA2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhDMM0l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhDMM0j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 08:26:39 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CDDC061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 05:26:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ed15:b7e9:afd7:f062])
        by xavier.telenet-ops.be with bizsmtp
        id sCSH2400E1dBBzp01CSHQK; Tue, 13 Apr 2021 14:26:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lWI7V-00FJMe-1a; Tue, 13 Apr 2021 14:26:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lWI7U-002kW9-HP; Tue, 13 Apr 2021 14:26:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Date:   Tue, 13 Apr 2021 14:26:15 +0200
Message-Id: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The HiSilicon Kunpeng I2C controller is only present on HiSilicon
Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
about this driver when configuring a kernel without Hisilicon platform
or ACPI firmware support.

Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b5b4e0d0ff4dd0bc..3ead6d9e130b2ebc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -647,7 +647,7 @@ config I2C_HIGHLANDER
 
 config I2C_HISI
 	tristate "HiSilicon I2C controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on (ARM64 && ARCH_HISI && ACPI) || COMPILE_TEST
 	help
 	  Say Y here if you want to have Hisilicon I2C controller support
 	  available on the Kunpeng Server.
-- 
2.25.1

