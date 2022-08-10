Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1301258EDD5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Aug 2022 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbiHJOEL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Aug 2022 10:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbiHJOEK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Aug 2022 10:04:10 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90046D556;
        Wed, 10 Aug 2022 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140249; x=1691676249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=essceR54I1P1+uwnMKusOBNBSYj2G5avgwzUHp9FtEE=;
  b=maxWKfJ7NkDpa3HvXwkrz4jAxN+MBn77S3CrPD9n2EKmD1BRg5XCPkFy
   1UFJxSeIYH7Od4i83EaHEF0wzLu8bnJSOlaJM1eRXXTyzror4u6uxR/7E
   x47ijTIotaAVGBPICI1tVLs18LbmvF/sP/WGihv+k4ac68TnTANUyVe6p
   4YjkOBhRo3kXTC/CBqPjL8NCtO1FLfZkvaVGEpedml33OA8Hn98fZfqFZ
   WY784DZay/slOWziwM9cHI89qmF1QO+84Gi61XYMs0Tl5f6KVmlgxRrM0
   me+R8irhT9dbK8jWtWpu3w+LHz4FasYsWIG/L07bFGula2WDQ0bf4leAy
   g==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108428032"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:04:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:03:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:48 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Arnd Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        <linux-i2c@vger.kernel.org>
Subject: [RESEND PATCH 2/2] MAINTAINERS: add the Polarfire SoC's i2c driver
Date:   Wed, 10 Aug 2022 15:02:44 +0100
Message-ID: <20220810140243.2685416-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: linux-i2c@vger.kernel.org

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd0f10a110e7..148c9b03759a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17524,6 +17524,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
-- 
2.36.1

