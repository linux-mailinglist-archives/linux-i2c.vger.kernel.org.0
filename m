Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42BE44B0F5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 17:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbhKIQTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 11:19:08 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42639 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhKIQTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 11:19:07 -0500
Received: by mail-ot1-f51.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso28869300otg.9;
        Tue, 09 Nov 2021 08:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jdrgxIgEzKrmMk735DkPidLrZORkq7ypaLQEh4/MLAg=;
        b=vFSjgq6ifpIC91fN9cgOOcsrq9Nc4TvNV2cl9fwTmCf2/rZSibyvr3J1iOgNiFVtnS
         3bclhX/jFRVOYeJn8PT3WekcLU2P4X6Pp+gGFgbhJo+GETP5hMtpBaW2rYNs+85F69zS
         peEQ9sJCl31+4G2OY8UDi35jYH+jlPYZnMzPTJtkZcnK9ClP1h2N0KEWzz6TarB6wcv7
         NCYU8zbwA876qKmZx1GedOBxJM3h1U/KMBrV5BtE9CC0A0QT693byCQR1NK3EkslLRa2
         tYP8yJISeb97KBgHodqIj+oZqFlxlLWDtEQHJFxk04H1/PippIPr3nc0KEbetKjcHGUd
         2i+Q==
X-Gm-Message-State: AOAM530vTxCsOfC9Gbm9VpT2c0JrdfAjNt78LQabtSBmLMIdWahuQTUM
        5kEacTtzmo6fH1GOf44brjr3RvkYaw==
X-Google-Smtp-Source: ABdhPJx5paQeA7EMGcTnVq36aOpDr1x3ukMEDilCqgp63O7QfuU8otNG1WVqDiSL9yguQi6genpGYA==
X-Received: by 2002:a05:6830:1e6d:: with SMTP id m13mr6952498otr.304.1636474581451;
        Tue, 09 Nov 2021 08:16:21 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m12sm4146662ots.59.2021.11.09.08.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:16:20 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, George Cherian <gcherian@marvell.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: Remove Netlogic XLP variant
Date:   Tue,  9 Nov 2021 10:16:18 -0600
Message-Id: <20211109161619.2206494-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
support"). With those gone, the single platform left to support is
Cavium ThunderX2. Remove the Netlogic variant and DT support.

For simplicity, the existing kconfig name is retained.

Cc: George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/i2c/busses/Kconfig      | 6 +++---
 drivers/i2c/busses/i2c-xlp9xx.c | 7 -------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index dce392839017..e9dd1640ffde 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1170,11 +1170,11 @@ config I2C_XLR
 	  will be called i2c-xlr.
 
 config I2C_XLP9XX
-	tristate "XLP9XX I2C support"
-	depends on CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST
+	tristate "Cavium ThunderX2 I2C support"
+	depends on ARCH_THUNDER2 || COMPILE_TEST
 	help
 	  This driver enables support for the on-chip I2C interface of
-	  the Broadcom XLP9xx/XLP5xx MIPS and Vulcan ARM64 processors.
+	  the Cavium ThunderX2 processors. (Originally on Netlogic XLP SoCs.)
 
 	  This driver can also be built as a module.  If so, the module will
 	  be called i2c-xlp9xx.
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 6d24dc385522..4e3b11c0f732 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -572,12 +572,6 @@ static int xlp9xx_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id xlp9xx_i2c_of_match[] = {
-	{ .compatible = "netlogic,xlp980-i2c", },
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, xlp9xx_i2c_of_match);
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp9xx_i2c_acpi_ids[] = {
 	{"BRCM9007", 0},
@@ -592,7 +586,6 @@ static struct platform_driver xlp9xx_i2c_driver = {
 	.remove = xlp9xx_i2c_remove,
 	.driver = {
 		.name = "xlp9xx-i2c",
-		.of_match_table = xlp9xx_i2c_of_match,
 		.acpi_match_table = ACPI_PTR(xlp9xx_i2c_acpi_ids),
 	},
 };
-- 
2.32.0

