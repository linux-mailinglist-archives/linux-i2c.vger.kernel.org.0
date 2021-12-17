Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A90147873F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhLQJc2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:32:28 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:9407 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhLQJc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733547; x=1671269547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+DGboTmD/BHBbd77YYjxDdqurN/h3bROxrQV18YmPqc=;
  b=VPJz1QSEaxj3UU4ozLgSS0DJ9gu8E8S/OZyzA9+GEQPan5bfxma2kSAz
   dGReRm/U59w7rdj5DorskrnjSOwJoKSHMS7Qf2iLQb7m9fqWTiO143dqh
   cqHTKw87V6dqbvW/pglroCGZwY/U8145DLSz0bOFF74XcPwel4CXoY8UX
   M9BMp+GjqWTarZcHWLcBoYHjBCwlCSnN5yjLIKILhFf4u0RMoHX7wS6RZ
   zZyT8ibBgVRRXsZ0QcWQI5GyzyQCN9RJvd00nA+JTax3yymyQzcnnz55o
   wkkamKmAq+nkP4+bt/uNpo3+2Ki8tl8DYa098fd+xgna7IDLlltwIuxd0
   Q==;
IronPort-SDR: qG6ew+CdqBkxok7fk/Kr//smGeP1WZUnP6rv9n4Y5jw42Y+F4pSHgscnGnnZ0hRqymcl2isCCB
 3tV2Xk4MQcwJxUBV8LUrKlce05Un47t3riNzlMVOVTle8J1P4IAvkHyBT8xKpe6vgMwgAOyl7v
 UPXED8XNyNOPl7Jei7CeUcMMP2m2ELiAcDh40TowS8H3JkuMLdtD6tDctSHzMbgB5TCGtAKK+A
 LqzffjlfIfQ+37nm/O2WNmEpnLhacVXjM1fnPe8ikFwqjriQZJWbNrIx7dy9o5BRb9fDFLSA4J
 JyT0HevO0UE5snL6+wpL8ieJ
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="142745568"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:32:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:32:19 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: [PATCH v2 04/17] mailbox: change mailbox-mpfs compatible string
Date:   Fri, 17 Dec 2021 09:33:12 +0000
Message-ID: <20211217093325.30612-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d6e2231a2c7..4e34854d1238 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -232,7 +232,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mpfs_mbox_of_match[] = {
-	{.compatible = "microchip,polarfire-soc-mailbox", },
+	{.compatible = "microchip,mpfs-mailbox", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
-- 
2.33.1

