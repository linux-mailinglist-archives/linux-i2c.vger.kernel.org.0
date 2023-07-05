Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10104748A3B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 19:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbjGER3a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 13:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbjGER3M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 13:29:12 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7B0173F;
        Wed,  5 Jul 2023 10:29:09 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EZlYN001538;
        Wed, 5 Jul 2023 19:28:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=dUbA/EeMMBkVXrUrRQwz7bP3CmJ9L4dNcrWL4KpdwsQ=;
 b=pGKPFySLNX0ZJNUo/J/Gr9RbtbQWcDZkC9DR1yCBFxW13fxSUOVwT5i02XA/aJMZ1KJk
 LNetlImznyZXoaSXfAqLPIF8AltzGWU6/iLDQ7hovHbBT8pLEZ0JdZEg8VfRyHFyLSyp
 58EgWIwcZ8Tl+mcUAqORrYPJ3SxjtEVwbXnvZzVQ1C+kVz5ugCwMgEBd+tu54W5QdspQ
 Skd1wP99ryWUkSMNeJ318g1WOLKVLG4Gk9LWMdEfrPTunDOu2iT7vgPd1sAhH8KqM2De
 Hn6djro0mKFlWtUWuKmcRMcL784TLJ9khS3gqlnxU2kQHxD0IjIz+TpUN+MFEcdBhcSJ bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn09qp1xb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 19:28:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B97510005E;
        Wed,  5 Jul 2023 19:28:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F9CB24C42F;
        Wed,  5 Jul 2023 19:28:34 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:28:33 +0200
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
        <richardcochran@gmail.com>
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
Subject: [PATCH 04/10] dt-bindings: treewide: add feature-domains description in binding files
Date:   Wed, 5 Jul 2023 19:27:53 +0200
Message-ID: <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
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

Disclaimer: Some error with dtbs_check will be observed as I've
considered the property to be generic, as Rob asked

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
 24 files changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index b767ec72a999..daf8dcaef627 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -50,6 +50,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
index 329847ef096a..2236ac95574b 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
@@ -82,6 +82,10 @@ properties:
     description: if defined, it indicates that the controller
       supports memory-to-memory transfer
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
index e722fbcd8a5f..47ae890f5bd9 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
@@ -28,6 +28,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..326a96741f50 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -99,6 +99,10 @@ properties:
 
   wakeup-source: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 995cbf8cefc6..3eb20d67f0fc 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -93,6 +93,10 @@ properties:
   '#size-cells':
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 allOf:
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 1970503389aa..bc34ae172417 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -59,6 +59,10 @@ properties:
       If not, SPI CLKOUT frequency will not be accurate.
     maximum: 20000000
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
index 04045b932bd2..90d35a2a6504 100644
--- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
@@ -45,6 +45,10 @@ properties:
   '#size-cells':
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 additionalProperties: false
 
 required:
diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 2314a9a14650..f88e3c0e6175 100644
--- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -29,6 +29,10 @@ properties:
       - const: cec
       - const: hdmi-cec
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 6b3e413cedb2..4fa1d14910df 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -36,6 +36,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 14f1833d37c9..63b3d012147b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -45,6 +45,10 @@ properties:
       Reflects the memory layout with four integer values per bank. Format:
       <bank-number> 0 <address of the bank> <size>
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 patternProperties:
   "^.*@[0-4],[a-f0-9]+$":
     additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 27329c5dc38e..59d770544950 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -44,6 +44,10 @@ properties:
 
   wakeup-source: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index f84e09a5743b..d5ad097e94ec 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -67,6 +67,11 @@ properties:
   "#size-cells":
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 2459a55ed540..6ebedee65153 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -79,6 +79,10 @@ properties:
           - const: rx
           - const: tx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
   power-domains: true
 
   resets:
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index fc8c96b08d7d..0e408dc85c13 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -93,6 +93,10 @@ properties:
       select RCC clock instead of ETH_REF_CLK.
     type: boolean
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 24a3dbde223b..b9ac20c8bf05 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -55,6 +55,10 @@ properties:
     description: number of clock cells for ck_usbo_48m consumer
     const: 0
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 # Required child nodes:
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
index 05f4ad2c7d3a..02cefe4ef42b 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
@@ -30,6 +30,10 @@ properties:
   vdda-supply:
     description: phandle to the vdda input analog voltage.
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
index 187b172d0cca..79eb5f5bd252 100644
--- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
@@ -30,6 +30,10 @@ properties:
     type: boolean
     description: If set enable the clock detection management
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 1df8ffe95fc6..893978e7170f 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -70,6 +70,10 @@ properties:
     enum: [1, 2, 4, 8, 12, 14, 16]
     default: 8
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 allOf:
   - $ref: rs485.yaml#
   - $ref: serial.yaml#
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index b9111d375b93..64c5898e51f8 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -65,6 +65,10 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 56d206f97a96..9bc08b7645dc 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -48,6 +48,10 @@ properties:
   clock-names:
     maxItems: 3
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
index bc48151b9adb..f00e5db9ee3b 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -50,6 +50,10 @@ properties:
   resets:
     maxItems: 1
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 8bba965a9ae6..2ac136802467 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -46,6 +46,10 @@ properties:
       - const: tx
       - const: rx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 9ca1a843c820..725c26daabe4 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -59,6 +59,10 @@ properties:
       - const: rx
       - const: tx
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index d3506090f8b1..c372caf154fc 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -171,6 +171,10 @@ properties:
 
   tpl-support: true
 
+  feature-domains:
+    minItems: 1
+    maxItems: 3
+
 dependencies:
   port: [ usb-role-switch ]
   role-switch-default-mode: [ usb-role-switch ]
-- 
2.25.1

