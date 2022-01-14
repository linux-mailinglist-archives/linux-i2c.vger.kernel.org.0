Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551AC48EC8A
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242843AbiANPQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:16:38 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50624 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242750AbiANPQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173394; x=1673709394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WIRab6h1hcL8MT7Wt72ljqAGomYq1u7lJ21fWjCYfGU=;
  b=XHiQ5kQwMhZG28gNpS2bewo3M2MscZsVQhi0IJuxFQM5G+Qh1dEqsGhw
   y1kNOe3IppxR1Q6IRPou7Jjbn/ejfVQgqIZ5/C7+EM+HhTYd0G7QESXzr
   5OsmVmx+k9ItpIyKCll5JQ3g2mU086Jlhkarjb60vAXkyz9mFXworEPOt
   SXGD6+tnkWwbkmHDSKsKaQ9ckhzgV0TzyEaV7h770stPCC+kEhEamoW6p
   6CaBLencxLAmAHyqkWTK80ibBMAkLxopu+KJSr0nqCcvwNnApWpmDGS62
   Ese5lRY9K2AjwhuVGdqSWXudOxfTQAwGNWNH5JzLx5Cl8ZRtkzN5dMQVR
   Q==;
IronPort-SDR: HbKIBJDyXoXla2Re69L7lEFZqn/vZmN5/+QF+7y6aR8BCvGbcwan8zI6aBYo7C9ViM2zwLelqd
 8RYjH0rUej5VOatEeglxnNq18OIahyzjuCmv3F9cb4Lbj3FEBb2GR50kSur/gHfcNdcKztf8Qr
 p+7m1p67jxhqBvS9BQ/SlDUPnKOwQRnm5Ptc7H7X9rmuPtaDe6j6akQsnJiIVCXWthn9uCVEf6
 xhjxh3hDGjSMtMrNcs+ABl5QWSlhZcqM+Ijljk1DFPAE0DdsNLYtHV18dXedAEGgioyFxhB3vA
 GAYpiISfc9ga40ZpfVwix6Pu
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="142730841"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:16:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:16:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:16:27 -0700
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
        <atishp@rivosinc.com>
Subject: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
Date:   Fri, 14 Jan 2022 15:17:15 +0000
Message-ID: <20220114151727.2319915-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
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

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
2.32.0

