Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE82449780
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240737AbhKHPJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:09:56 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21281 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240709AbhKHPJi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384013; x=1667920013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hDzbk5UeWi75vpLTsgGDucT5R3FXBFXBWzcilIahZ0M=;
  b=gmM3G126Sbp9XaRS8p28vaS5zsAy4vDC1GjYj7yLvWCFl/dktyua3x+r
   S3P2xFCXs+DkjT9AQyQ/THujfSAcb7ZUkkn6i+sXzml/0z3JA3Rm1xgYn
   DLqtm0aeLf+AlQ7ZNKx7aW4oSrL+sQG1xqckN/jIgpim0HfErUCRopHlp
   lwKDXpY2pzYMgnnmDFhSi9jWYXpvavlxj6qF7PvegcuUUobN5dlZjfnSa
   LmSNGzx43g2q/XNRdX1HICB5S3Nr4eT1Z9x/e58DaikxJniT3z1L9n3bL
   kktvovCoI0zHwren93lgNHH/lgSRokAIZ2fCgEDshMps28W6p+nao1/uW
   g==;
IronPort-SDR: 43iBNWnpZL9C8OdV7+SUTsmGhfztBhN8vH43OennFO3C+mKCxQsXG13xMzGW4gLGgqqJuh89j7
 PvaB2hf7ZRmBY8/9ES5I5xfpi4qYPo/H0mIqtTVs8dqbsVXRPgIeIYF1x3YTkE9+eyh2uxELPf
 PmNwo1MEmwNZvvXFhCj3nWrX2CiGNJgE8iJtr0RUCVVpPNfSppfOxyAO+J8NPNC+qEmA7L3Hl7
 HWSIUWglgQ1IAGnxOqCEsAJzTu3DcVJfUaoJS+Mk6EmdjWi1DI/Ab6b8YUfQCawAtJp9obSotV
 GBW1UrMukPL4rjbE2vitDs2+
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727168"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:06:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:44 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat string
Date:   Mon, 8 Nov 2021 15:05:44 +0000
Message-ID: <20211108150554.4457-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update 'compatible' strings for system controller drivers to the
approved Microchip name.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
 .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
 drivers/mailbox/mailbox-mpfs.c                                | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
index bbb173ea483c..b08c8a158eea 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    enum:
+      - microchip,polarfire-soc-mailbox
+      - microchip,mpfs-mailbox
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
index 2cd3bc6bd8d6..d6c953cd154b 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
@@ -19,7 +19,9 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    enum:
+      - microchip,polarfire-soc-sys-controller
+      - microchip,mpfs-sys-controller
 
 required:
   - compatible
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d6e2231a2c7..9d5e558a6ee6 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 
 static const struct of_device_id mpfs_mbox_of_match[] = {
 	{.compatible = "microchip,polarfire-soc-mailbox", },
+	{.compatible = "microchip,mpfs-mailbox", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
-- 
2.33.1

