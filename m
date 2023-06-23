Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB7C73BFB7
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 22:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbjFWUdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 16:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjFWUdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 16:33:00 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50FE2735;
        Fri, 23 Jun 2023 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552358; x=1719088358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nhAGSQj8zuC4h0VCcRRvftj9ytkh4m3PuE266HinoA=;
  b=frpIchLikOib8V/lb2V7iW4gDmojJxkKeGOSGg9pGpVnzitbPx76VX+T
   jzw6IZs7TzgqaAt8dR/fBIsbp340yK+RqnhNNlhr/klvgaqaQrVTJZyYq
   fAnUy9JEq62VZlIDgFd5ElAw3yxedQXIRlnAHKzgdJ/qm4N6MX79oJBC+
   FIJ423WByquQr+M4LOKcsotLeAMFijNDc6dArApOb4Vf4JydPV1Xg6sBp
   Uyemd4D7cU+9gK4Oxn3A0YUsOaMF3Zw2Hs8K5OygpDdeX8fqPwM6VUWtw
   6y9WBf1y7HqnUjP3OFSZpaRQFRCpyK9r3lpRFHKzCBK/IVz/hpBhKzRkc
   A==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="221701784"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:32:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:32:28 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:31:57 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <lee@kernel.org>, <ulf.hansson@linaro.org>,
        <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
        <p.zabel@pengutronix.de>, <olivia@selenic.com>,
        <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
        <richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <linux@armlinux.org.uk>,
        <sre@kernel.org>, <jerry.ray@microchip.com>,
        <horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
        <varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
        <alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
        <mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC:     <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
        <balamanikandan.gunasundar@microchip.com>,
        <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
        <nayabbasha.sayed@microchip.com>, <balakrishnan.s@microchip.com>
Subject: [PATCH v2 02/45] dt-bindings: usb: ehci: Add atmel at91sam9g45-ehci compatible
Date:   Sat, 24 Jun 2023 02:00:13 +0530
Message-ID: <20230623203056.689705-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document at91sam9g45-ehci compatible for usb-ehci.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 9445764bd8de..7e486cc6cfb8 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -66,6 +66,7 @@ properties:
           - const: generic-ehci
       - items:
           - enum:
+              - atmel,at91sam9g45-ehci
               - cavium,octeon-6335-ehci
               - ibm,usb-ehci-440epx
               - ibm,usb-ehci-460ex
-- 
2.25.1

