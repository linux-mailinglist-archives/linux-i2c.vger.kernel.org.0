Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5CA7916AD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 14:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbjIDMAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 08:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240082AbjIDMAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 08:00:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071021B7
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 05:00:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:593d:4b41:8edd:4ba9])
        by albert.telenet-ops.be with bizsmtp
        id ho0d2A00F4Sq5qr06o0dd2; Mon, 04 Sep 2023 14:00:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fj-002WID-Fu;
        Mon, 04 Sep 2023 14:00:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fx-00AOXQ-7A;
        Mon, 04 Sep 2023 14:00:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] i2c: I2C_MLXCPLD on ARM64 should depend on ACPI
Date:   Mon,  4 Sep 2023 14:00:36 +0200
Message-Id: <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693828363.git.geert+renesas@glider.be>
References: <cover.1693828363.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "i2c_mlxcpld" platform device is only instantiated on X86 systems
(through drivers/platform/x86/mlx-platform.c), or on ARM64 systems with
ACPI (through drivers/platform/mellanox/nvsw-sn2201.c).  Hence further
restrict the dependency on ARM64 to ACPI, to prevent asking the user
about this driver when configuring an ARM64 kernel without ACPI support.

While at it, document in the Kconfig help text that the driver supports
ARM64/ACPI based systems, too.

Fixes: d7cf993f832ad2a4 ("i2c: mlxcpld: Allow driver to run on ARM64 architecture")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0aa97762332d8a87..bef2af50fb159baf 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1391,10 +1391,10 @@ config I2C_ICY
 
 config I2C_MLXCPLD
 	tristate "Mellanox I2C driver"
-	depends on X86_64 || ARM64 || COMPILE_TEST
+	depends on X86_64 || (ARM64 && ACPI) || COMPILE_TEST
 	help
 	  This exposes the Mellanox platform I2C busses to the linux I2C layer
-	  for X86 based systems.
+	  for X86 and ARM64/ACPI based systems.
 	  Controller is implemented as CPLD logic.
 
 	  This driver can also be built as a module. If so, the module will be
-- 
2.34.1

