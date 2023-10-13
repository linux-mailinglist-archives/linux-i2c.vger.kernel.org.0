Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387C57C7DB3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 08:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjJMGaT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 02:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjJMGaS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 02:30:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973D6C0;
        Thu, 12 Oct 2023 23:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697178615; x=1728714615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t8hb8DajnLzTWBUQiRCBFwi/7VzTbtHdAUnkV0j8nuk=;
  b=Y68TCcLZtyQzc3HF/hYbc0Zpv0pTBzpqyOusFXD7QmPl4Nm145P9AKTe
   pe5PpZEMnrzaiWXbH2jnZSU7VUaQI0eNjUvD1lk3UFGwq2yNfLTlckGgn
   019W/MFHNmgxNIDTOgdrxuAF4mhnFvLzZz+yJPuDUdekVbuinc75vNX7M
   eLMPrhOhTUqqwxiqnbjHE4ea5oSzOX6QEh1cVaBpuPo1BdOMrrGS2Tk2/
   XlNg0sQXBZcv2n6aB4MhODUup3v0aWDjYJndOobHfoowdJ42VGbPEGpAj
   PmToh3tWBgXjbEYK4V4D/tZ03VwPNxCCDDnPtmiT64KIVRaQsqY23vRUR
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,221,1694728800"; 
   d="scan'208";a="33444547"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2023 08:30:11 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8B47D280084;
        Fri, 13 Oct 2023 08:30:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] eeprom: at24: add ST M24C64-D Additional Write lockable page support
Date:   Fri, 13 Oct 2023 08:30:08 +0200
Message-Id: <20231013063008.2879314-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
References: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ST M24C64-D behaves as a regular M24C64, except for the -D variant
which uses up another I2C address for Additional Write lockable page.
This page is 32 Bytes long and can contain additional data. Add entry
for it, so users can describe that page in DT. Note that users still
have to describe the main M24C64 area separately as that is on separate
I2C address from this page.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is a copy & paste of [1] for ST M24C64-D. I reused the same pattern and
also used Marek's commit message.

[1] https://lore.kernel.org/all/20231010190926.57674-2-marex@denx.de/

 drivers/misc/eeprom/at24.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 616e63efc9864..f61a80597a22d 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -196,6 +196,8 @@ AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24cs32, 16,
 	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
+/* M24C64-D Additional Write lockable page (M24C64-D order codes) */
+AT24_CHIP_DATA(at24_data_24c64d_wlp, 32, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24cs64, 16,
 	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
@@ -227,6 +229,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c32d-wl",	(kernel_ulong_t)&at24_data_24c32d_wlp },
 	{ "24cs32",	(kernel_ulong_t)&at24_data_24cs32 },
 	{ "24c64",	(kernel_ulong_t)&at24_data_24c64 },
+	{ "24c64-wl",	(kernel_ulong_t)&at24_data_24c64d_wlp },
 	{ "24cs64",	(kernel_ulong_t)&at24_data_24cs64 },
 	{ "24c128",	(kernel_ulong_t)&at24_data_24c128 },
 	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
@@ -258,6 +261,7 @@ static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c32d-wl",	.data = &at24_data_24c32d_wlp },
 	{ .compatible = "atmel,24cs32",		.data = &at24_data_24cs32 },
 	{ .compatible = "atmel,24c64",		.data = &at24_data_24c64 },
+	{ .compatible = "atmel,24c64d-wl",	.data = &at24_data_24c64d_wlp },
 	{ .compatible = "atmel,24cs64",		.data = &at24_data_24cs64 },
 	{ .compatible = "atmel,24c128",		.data = &at24_data_24c128 },
 	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
-- 
2.34.1

