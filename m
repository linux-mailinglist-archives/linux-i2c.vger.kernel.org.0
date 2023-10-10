Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027A97C041C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343570AbjJJTKA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343723AbjJJTJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:09:59 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4756B94;
        Tue, 10 Oct 2023 12:09:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1A58E86B74;
        Tue, 10 Oct 2023 21:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1696964991;
        bh=Q5nGLC812cVs9QIdCMSC4RAGrUm1dNZi2Pv8A9ffWGU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i5EJ5pW6OpnLEzDsNdFA9m8BjnO2B9oFI82ZUOKNVtZWiTibaXle0XCf2/XR0zCbh
         /DZIR87agoTObDTQF3Yg2mnrj4kSZoBt80iUp4Rrz4rFWsN+k/Kan3h4dsk3sgt0bj
         Ouc57asca3c2pVKuZBADaP/1oyBKEq023R0Lh0MZOUR1qIL1FhloNtR9Bq+cyIlOTV
         OO8To5utmKN/Fm9Ptnrnz1TWBOjIQNxB+uq2ibhGTg3b1TldeltEMvOQcfLvNMlxTm
         PmwnOsAc83QBKI26Agan36UYv6WDmFsH79naF1/K9Aun9zBL7iXRmfSCjvX60c/IZp
         QbnwmB2rr4VxA==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] eeprom: at24: add ST M24C32-D Additional Write lockable page support
Date:   Tue, 10 Oct 2023 21:09:26 +0200
Message-Id: <20231010190926.57674-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010190926.57674-1-marex@denx.de>
References: <20231010190926.57674-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ST M24C32-D behaves as a regular M24C32, except for the -D variant
which uses up another I2C address for Additional Write lockable page.
This page is 32 Bytes long and can contain additional data. Add entry
for it, so users can describe that page in DT. Note that users still
have to describe the main M24C32 area separately as that is on separate
I2C address from this page.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
---
 drivers/misc/eeprom/at24.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 7dfd7fdb423e6..616e63efc9864 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -191,6 +191,8 @@ AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0);
 AT24_CHIP_DATA(at24_data_24cs16, 16,
 	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16);
+/* M24C32-D Additional Write lockable page (M24C32-D order codes) */
+AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24cs32, 16,
 	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
@@ -222,6 +224,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c16",	(kernel_ulong_t)&at24_data_24c16 },
 	{ "24cs16",	(kernel_ulong_t)&at24_data_24cs16 },
 	{ "24c32",	(kernel_ulong_t)&at24_data_24c32 },
+	{ "24c32d-wl",	(kernel_ulong_t)&at24_data_24c32d_wlp },
 	{ "24cs32",	(kernel_ulong_t)&at24_data_24cs32 },
 	{ "24c64",	(kernel_ulong_t)&at24_data_24c64 },
 	{ "24cs64",	(kernel_ulong_t)&at24_data_24cs64 },
@@ -252,6 +255,7 @@ static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c16",		.data = &at24_data_24c16 },
 	{ .compatible = "atmel,24cs16",		.data = &at24_data_24cs16 },
 	{ .compatible = "atmel,24c32",		.data = &at24_data_24c32 },
+	{ .compatible = "atmel,24c32d-wl",	.data = &at24_data_24c32d_wlp },
 	{ .compatible = "atmel,24cs32",		.data = &at24_data_24cs32 },
 	{ .compatible = "atmel,24c64",		.data = &at24_data_24c64 },
 	{ .compatible = "atmel,24cs64",		.data = &at24_data_24cs64 },
-- 
2.40.1

