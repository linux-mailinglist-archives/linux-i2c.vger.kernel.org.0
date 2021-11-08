Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF47449791
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240720AbhKHPKW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:10:22 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21310 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240749AbhKHPJn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384018; x=1667920018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/8xzAyxtMDUBGNXPY444ukbY+UQvu68Cu6iDF9Q+mi0=;
  b=TL23d7cKYjfHyGkDO3hz2SguJPmnNY7WETXT76/J35dFrnQTQ/YHqs8w
   50rQwTwX3qSl2pZxE53zkt9MTS+kgKKg8I2fADCb3Hx2l88DT+V7ChRoa
   0dSD6ZWC2gZ3c2ZJPTfEEtf5+/cSmzUlJLi6qipJ4sxjGl1veDEV8pDVt
   vpze57tYq2JVOEHXEZWyPiN3hYY0A38SUlN8bKy60MYieD0o4jgMRmMpk
   Ea54zUZii4KzdJlP+dRhwhwmlsKJONOVrVY0OOsLy6gfPdwqyrffNu9gi
   JH0FxN58Wdb5AMVrb2bO3oqg91mwZdRAMLsI9FLJxGP9zwkv9mYAPJY6v
   Q==;
IronPort-SDR: Iy6Xl1zXJ9HR9cVDxBTocnJWAGJp5D3oysgOgLBOM4QnpGCKltOfrvhlpgQfpfbntw5wJ2FryQ
 2/nRrjyVce1pSRRt6JE71JY+GJrVJdsaz4TgWQFxG3i7QDiTfMcRNZYeJFuIFNc0fHVXVVIj1e
 YwkeDWoC0JDnvvv3tla3AQ22oBUGJ1gtrs6jZLSB9fqhs9P32CbQkdrj20rgoniAtjj7w7ROpw
 OzTcZlDuv/wXcF0IIuTpvsubYg1u3Jkia0+ULI6Ww4wnNa44YXNZk5ei6kS4CJt41cYTrAxo3C
 IZe83BoRQEVRSduDsLFYTEmR
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727206"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:06:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:51 -0700
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
Subject: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
Date:   Mon, 8 Nov 2021 15:05:45 +0000
Message-ID: <20211108150554.4457-5-conor.dooley@microchip.com>
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

Add mpfs-soc to clear undocumented binding warning

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..1ff7a5224bbc 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - microchip,mpfs-icicle-kit
       - const: microchip,mpfs
+      - const: microchip,mpfs-soc
 
 additionalProperties: true
 
-- 
2.33.1

