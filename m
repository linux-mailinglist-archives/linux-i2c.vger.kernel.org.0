Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB636B2EEE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 21:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjCIUpm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 15:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbjCIUpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 15:45:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98538F739E;
        Thu,  9 Mar 2023 12:45:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32E9D61CE5;
        Thu,  9 Mar 2023 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2028DC433A1;
        Thu,  9 Mar 2023 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678394713;
        bh=9xUeuaqJETlsyaOBibq9HqTPqXfzlcN4B6jvEtDgTas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bGDw9GshVwKoLdPjIxK7oLw5/ilRPAbxYq2j8YmvhFhgVyAO35+tbtndgxNXvKMRL
         iK53TmvKBXT0GSYoe73SHWiQj99xtJpRqm8vYgegX5YvVkyNzCZAGj1hsPdWIP33PE
         rAon7G0u84acHoFx6kkbNweOuOZIpIqf20ZUU7DB0dGj9L3Ev8F3pU+jxvPZz86glJ
         PPG5D0pWD3Enk3hWsglJwq90cYf39JWVqlFyq9AQCtZ1BLU98XQwy+LjCctHLx69d3
         h1py7sojz8cheFE7AuDBynp+jMZ7+uKsdn4Tfs0mHV2N1a0Fn51PfyiAdKbq5m4ODo
         L1YiQVAUFhr5Q==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.infradead.org
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 3/5] mailbox: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date:   Thu,  9 Mar 2023 20:44:50 +0000
Message-Id: <20230309204452.969574-4-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=conor.dooley@microchip.com; h=from:subject; bh=9jucC2HUrzLki0OwISlZ9w8uDjkgxcnchy6bulfM2rU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs5LlmjGTr4Vo/ArYPZ9o861T3331dyTmHN/2acCb enQzI6pHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI+2xGhq29az7az0/S6le8 qOpTu2PK3jz/N/bBDLOyj37pS3uXlcrw3715goRcWcSTRt239Rt6jzHcW6On9mZh+NuUzZtmN1o qMwEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the Microchip FPGA
mailbox driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 1495965bc394..3f97d5535267 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -176,7 +176,7 @@ config MAILBOX_TEST
 config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) mailbox controller.
 
-- 
2.39.2

