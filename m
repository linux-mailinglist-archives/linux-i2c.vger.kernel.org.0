Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89AE763062
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjGZIrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjGZIq3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:46:29 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E368B4499;
        Wed, 26 Jul 2023 01:38:58 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q6OQui031765;
        Wed, 26 Jul 2023 10:38:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=34yPvoLTlPLJCslgaO4PDf+qGm0nJhlXJCOkUcjHHF0=;
 b=5tUMCocX0JFM1AfTTdcuXVoOojB9vLRGwGRUSqqdBC0xdhrDmkGSiwfQauzclZBs0Bc1
 +zTBpw0UooGMSgSqy4T0Al+M0BRE9GUL8UVIxtgl1j9PUapYj5bh3gxwiSMnuWg05ly4
 0eEzjJ6xOYjO2VfgK14zuWEYFkDPBMLxN3jef1ul8YwIaFBegmYKZ8PMP04+fmjwxqYV
 54hg7zyr44foRzMsRxb1ETVTx9sZyPUhzQvwwo0XZIWAjg56Q7YmpZPs6wWLpPEia/Wl
 cJlh0pyVj5rNGLCYTXRQAwQpvnXlHJMhbjzTZqWqz54wf780EcsmH2BIWqWg5umJxpUZ JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2x6k8xg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 10:38:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99B4010005C;
        Wed, 26 Jul 2023 10:38:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C4DA20FA39;
        Wed, 26 Jul 2023 10:38:18 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 10:38:18 +0200
From:   Gatien Chevallier <gatien.chevallier@foss.st.com>
To:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v3 02/11] dt-bindings: treewide: add feature-domains description
Date:   Wed, 26 Jul 2023 10:38:01 +0200
Message-ID: <20230726083810.232100-3-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_01,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

feature-domains is an optional property that allows a peripheral to
refer to one or more feature domain controller(s).

Description of this property is added to all peripheral binding files of
the peripheral under the STM32 firewall controllers. It allows an accurate
representation of the hardware, where various peripherals are connected
to this firewall bus. The firewall can then check the peripheral accesses
before allowing it to probe.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V2: 
	- Add missing "feature-domains" property declaration
	  in bosch,m_can.yaml and st,stm32-cryp.yaml files

 Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml  | 4 ++++
 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
 .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml   | 4 ++++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
 .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
 Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
 .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
 Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
 26 files changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
index 0ddeb8a9a7a0..87a578327fc0 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
@@ -46,6 +46,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index b767ec72a999..042a1e005ab2 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -50,6 +50,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
index 329847ef096a..9f60915e6130 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
@@ -82,6 +82,10 @@ properties:
     description: if defined, it indicates that the controller
       supports memory-to-memory transfer
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
index e722fbcd8a5f..15d33d41098f 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
@@ -28,6 +28,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..8a1a21faab8c 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -99,6 +99,10 @@ properties:
 
   wakeup-source: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 995cbf8cefc6..d59ac9282a28 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -93,6 +93,10 @@ properties:
   '#size-cells':
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 allOf:
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 1970503389aa..39ee55aa4dd8 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -59,6 +59,10 @@ properties:
       If not, SPI CLKOUT frequency will not be accurate.
     maximum: 20000000
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
index 04045b932bd2..184d0a44d1de 100644
--- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
@@ -45,6 +45,10 @@ properties:
   '#size-cells':
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 additionalProperties: false
 
 required:
diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 2314a9a14650..41db21373301 100644
--- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -29,6 +29,10 @@ properties:
       - const: cec
       - const: hdmi-cec
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 6b3e413cedb2..81e1cd5e30cc 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -36,6 +36,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 14f1833d37c9..4ef01ee4a5e5 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -45,6 +45,10 @@ properties:
       Reflects the memory layout with four integer values per bank. Format:
       <bank-number> 0 <address of the bank> <size>
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   "^.*@[0-4],[a-f0-9]+$":
     additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 27329c5dc38e..156aed282fb8 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -44,6 +44,10 @@ properties:
 
   wakeup-source: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index f84e09a5743b..d19981ef3fce 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -67,6 +67,11 @@ properties:
   "#size-cells":
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 2459a55ed540..5a8b53d5c35f 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -79,6 +79,10 @@ properties:
           - const: rx
           - const: tx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
   power-domains: true
 
   resets:
diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index 67879aab623b..144cbcbefa37 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -118,6 +118,10 @@ properties:
   phys:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index fc8c96b08d7d..133e1edbd561 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -93,6 +93,10 @@ properties:
       select RCC clock instead of ETH_REF_CLK.
     type: boolean
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 24a3dbde223b..89fa65f31d20 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -55,6 +55,10 @@ properties:
     description: number of clock cells for ck_usbo_48m consumer
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 # Required child nodes:
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
index 05f4ad2c7d3a..b73a97f89fe4 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
@@ -30,6 +30,10 @@ properties:
   vdda-supply:
     description: phandle to the vdda input analog voltage.
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
index 187b172d0cca..c45e6285653c 100644
--- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
@@ -30,6 +30,10 @@ properties:
     type: boolean
     description: If set enable the clock detection management
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 1df8ffe95fc6..b80d5a8ff4e8 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -70,6 +70,10 @@ properties:
     enum: [1, 2, 4, 8, 12, 14, 16]
     default: 8
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 allOf:
   - $ref: rs485.yaml#
   - $ref: serial.yaml#
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index b9111d375b93..30339447cc24 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -65,6 +65,10 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 56d206f97a96..f59770ead3e3 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -48,6 +48,10 @@ properties:
   clock-names:
     maxItems: 3
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
index bc48151b9adb..480ce8704fda 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -50,6 +50,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 8bba965a9ae6..3331f6cd1b75 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -46,6 +46,10 @@ properties:
       - const: tx
       - const: rx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 9ca1a843c820..a0664a0fcabf 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -59,6 +59,10 @@ properties:
       - const: rx
       - const: tx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 0a5c98ea711d..95b615ee3a07 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -172,6 +172,10 @@ properties:
 
   tpl-support: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 2
+
 dependencies:
   port: [ usb-role-switch ]
   role-switch-default-mode: [ usb-role-switch ]
-- 
2.25.1

