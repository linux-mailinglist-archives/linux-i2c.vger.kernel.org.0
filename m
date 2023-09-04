Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01257916B4
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 14:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345398AbjIDMAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 08:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245475AbjIDMAq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 08:00:46 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1077F1B9
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 05:00:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:593d:4b41:8edd:4ba9])
        by xavier.telenet-ops.be with bizsmtp
        id ho0d2A00A4Sq5qr01o0dRg; Mon, 04 Sep 2023 14:00:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fj-002WI9-Eu;
        Mon, 04 Sep 2023 14:00:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qd8Fx-00AOXM-5Y;
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
Subject: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Date:   Mon,  4 Sep 2023 14:00:35 +0200
Message-Id: <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
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

The only probing method supported by the Nvidia SN2201 platform driver
is probing through an ACPI match table.  Hence add a dependency on
ACPI, to prevent asking the user about this driver when configuring a
kernel without ACPI support.

Fixes: 662f24826f954d49 ("platform/mellanox: Add support for new SN2201 system")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/platform/mellanox/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 382793e73a60a8b3..30b50920b278c94b 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -80,8 +80,8 @@ config MLXBF_PMC
 
 config NVSW_SN2201
 	tristate "Nvidia SN2201 platform driver support"
-	depends on HWMON
-	depends on I2C
+	depends on HWMON && I2C
+	depends on ACPI || COMPILE_TEST
 	select REGMAP_I2C
 	help
 	  This driver provides support for the Nvidia SN2201 platform.
-- 
2.34.1

