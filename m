Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1373C0EA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 22:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjFWUp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 16:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbjFWUoc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 16:44:32 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2483A9D;
        Fri, 23 Jun 2023 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687553022; x=1719089022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7A5k+DM4C0yHEGOw3X3WeFKFst9s9Hdj/1DbnHsMRc=;
  b=ChFHqrMpfO/1DiXQYzqreJM2C0zdA0Uq78oo+XbmFDiMIKjAQ6kezaup
   EbZMczLom1Ak0ereCM18aAMm2QUlUgI/AevqsRnpqD+1NRADVcwlPXbh9
   YvNheCmOnBZnnyhu2jxn1dGPitewiY0Ic0jEXUQCsZZtpVI05GdEZKQTi
   u+M8lWK/Eu5aVQHa71mC7kpi6QVwIWiZjk0Qgnw0XDY/uwpDmlLnDASI3
   fN0Wg1r1XMQapinQ+vY0yYqORe6y9gm4EmQOFAUzn71X7fSnjY4JPP6K8
   CzojP3gQ+yio9dl25va4BQLoJR6T72hoZJXa2DBVeaTjQicYciS8nVpKN
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="231890879"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:42:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:42:39 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:42:12 -0700
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
Subject: [PATCH v2 23/45] dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
Date:   Sat, 24 Jun 2023 02:00:34 +0530
Message-ID: <20230623203056.689705-24-varshini.rajendran@microchip.com>
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

Add microchip,sam9x7-ssc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/misc/atmel-ssc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
index f9fb412642fe..67c1227a01bd 100644
--- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
+++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible: "atmel,at91rm9200-ssc" or "atmel,at91sam9g45-ssc"
+	       or "microchip,sam9x7-ssc"
 	- atmel,at91rm9200-ssc: support pdc transfer
 	- atmel,at91sam9g45-ssc: support dma transfer
 - reg: Should contain SSC registers location and length
-- 
2.25.1

