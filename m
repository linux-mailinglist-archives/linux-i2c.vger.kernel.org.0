Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447DD606B7E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 00:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiJTWqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 18:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiJTWqV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 18:46:21 -0400
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F270139C16;
        Thu, 20 Oct 2022 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
        s=tartarus; h=In-Reply-To:Subject:Date:To:From:Resent-To:Resent-Message-ID:
        Resent-Date:Resent-From:Sender:Reply-To:Message-ID:Cc:MIME-Version:
        Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Sender:Resent-Cc:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5HLtj6M5N8x5SCdnb3ABMngx/UZALXblAVL++swe094=; b=eutvSdRkC+80sIpaXSyOkRBg9Y
        DXIqVrzREhej/NOftb2AAYNc2wRlx6CpqzMEYRG17Hck7T1nz/EJoImtJbfGGQ4jOrgp0fROEYr8X
        mnIQaimqtEUvAHuEzwlUkxmAM+7e1ORKhGJnkv9Gq0arPNaTEuEGFCOoCZEd3dnNIEbA=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1oleIs-009ObH-2C; Fri, 21 Oct 2022 00:46:18 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 10 Oct 2022 20:33:51 +0200
Subject: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
In-Reply-To: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_MID,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org
Message-Id: <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>

This fixes maybe_unused warnings/errors.

According to a comment during device tree removal, only ACPI is supported,
thus let's actually require it.

Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/i2c/busses/Kconfig     | 1 +
 drivers/i2c/busses/i2c-mlxbf.c | 9 ---------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 264e780ae32e..e50f9603d189 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -764,6 +764,7 @@ config I2C_LPC2K
 config I2C_MLXBF
         tristate "Mellanox BlueField I2C controller"
         depends on MELLANOX_PLATFORM && ARM64
+	depends on ACPI
 	select I2C_SLAVE
         help
           Enabling this option will add I2C SMBus support for Mellanox BlueField
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index e68e775f187e..1810d5791b3d 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2247,7 +2247,6 @@ static struct i2c_adapter_quirks mlxbf_i2c_quirks = {
 	.max_write_len = MLXBF_I2C_MASTER_DATA_W_LENGTH,
 };
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] = {
 	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
 	{ "MLNXBF23", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2] },
@@ -2282,12 +2281,6 @@ static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
 
 	return 0;
 }
-#else
-static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
-{
-	return -ENOENT;
-}
-#endif /* CONFIG_ACPI */
 
 static int mlxbf_i2c_probe(struct platform_device *pdev)
 {
@@ -2490,9 +2483,7 @@ static struct platform_driver mlxbf_i2c_driver = {
 	.remove = mlxbf_i2c_remove,
 	.driver = {
 		.name = "i2c-mlxbf",
-#ifdef CONFIG_ACPI
 		.acpi_match_table = ACPI_PTR(mlxbf_i2c_acpi_ids),
-#endif /* CONFIG_ACPI  */
 	},
 };
 
-- 
2.37.2.609.g9ff673ca1a

