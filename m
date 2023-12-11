Return-Path: <linux-i2c+bounces-728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5280D67D
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 19:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21D31F21AF8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 18:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2930552F97;
	Mon, 11 Dec 2023 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="H4e85eK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04A2DB;
	Mon, 11 Dec 2023 10:32:33 -0800 (PST)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BBCH5Gc001748;
	Mon, 11 Dec 2023 19:31:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=K4S42End9GlJG/xlalEur3v0z36FAVmluyBEBPsJCZg=; b=H4
	e85eK6yVU2gNtcahpvEKHkrlfrSMrfArw/7vuQqGoJZDiiB0/1yv4n9L0TDsaRik
	Q0CC6oaoZ9mmao8mruGiWbLgoregeJN/cxcVCGFZkZOyQiFYHgEx53qo4kNg8U6m
	P5M40nYaL36j2zNPOE90w31n9227qR4/a/CmamtD+DUZnHe+tMfC+x6iFHLOOcre
	IUAehZ/FDE2Iuculb2/AYtxzGN6xxbnIuEFNbu7Kc2r2Uz8Cn8b9otJy/9KOyXg5
	Wu2nGLyTYATUlozVWOo8Jyuir1jM1Q7BIC2oP35e4dYs2M4HBu3cQSB0JIc+078p
	4a4YPYgWIlyc0ByW8QFw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uw42nduf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 19:31:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5815100062;
	Mon, 11 Dec 2023 19:31:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93C2322FA2D;
	Mon, 11 Dec 2023 19:31:30 +0100 (CET)
Received: from localhost (10.252.9.5) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Dec
 2023 19:31:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v7 02/13] dt-bindings: treewide: add access-controllers description
Date: Mon, 11 Dec 2023 19:30:33 +0100
Message-ID: <20231211183044.808204-3-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
References: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_08,2023-12-07_01,2023-05-22_02

access-controllers is an optional property that allows a peripheral to
refer to one or more domain access controller(s).

Description of this property is added to all peripheral binding files of
the peripheral under the STM32 firewall controller. It allows an accurate
representation of the hardware, where various peripherals are connected
to a firewall bus. The firewall can then check the peripheral accesses
before allowing its device to probe.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V6:
	- Minor changes in commit message
	- Renamed access-controller to access-controllers

Changes in V5:
	- Discarded review tags as the content has changed
	- Renamed feature-domains to access-controller

Changes in V4:
	- Added Jonathan's tag for IIO

Changes in V2:
	- Add missing "feature-domains" property declaration
	  in bosch,m_can.yaml and st,stm32-cryp.yaml files

 Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 4 ++++
 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 4 ++++
 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 4 ++++
 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 4 ++++
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 4 ++++
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 4 ++++
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 4 ++++
 Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml | 4 ++++
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 ++++
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 ++++
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 4 ++++
 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 4 ++++
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml          | 4 ++++
 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml    | 4 ++++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++++
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 4 ++++
 .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 4 ++++
 Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 4 ++++
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 4 ++++
 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 4 ++++
 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++++
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++++
 Documentation/devicetree/bindings/usb/dwc2.yaml               | 4 ++++
 26 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
index 0ddeb8a9a7a0..27354658d054 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
@@ -46,6 +46,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index ac480765cde0..822318414095 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -51,6 +51,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
index 329847ef096a..ff935a0068ec 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
@@ -82,6 +82,10 @@ properties:
     description: if defined, it indicates that the controller
       supports memory-to-memory transfer
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
index e722fbcd8a5f..ddf82bf1e71a 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
@@ -28,6 +28,10 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..39fad8f7df44 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -99,6 +99,10 @@ properties:
 
   wakeup-source: true
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 995cbf8cefc6..ec34c48d4878 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -93,6 +93,10 @@ properties:
   '#size-cells':
     const: 0
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 allOf:
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 1970503389aa..c1b1324fa132 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -59,6 +59,10 @@ properties:
       If not, SPI CLKOUT frequency will not be accurate.
     maximum: 20000000
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
index 04045b932bd2..b15de4eb209c 100644
--- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
@@ -45,6 +45,10 @@ properties:
   '#size-cells':
     const: 0
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 additionalProperties: false
 
 required:
diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 2314a9a14650..1d930d9e10fd 100644
--- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -29,6 +29,10 @@ properties:
       - const: cec
       - const: hdmi-cec
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 6b3e413cedb2..34147127192f 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -36,6 +36,10 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 14f1833d37c9..deef455bfd21 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -45,6 +45,10 @@ properties:
       Reflects the memory layout with four integer values per bank. Format:
       <bank-number> 0 <address of the bank> <size>
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   "^.*@[0-4],[a-f0-9]+$":
     additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 27329c5dc38e..d41308856408 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -44,6 +44,10 @@ properties:
 
   wakeup-source: true
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index f84e09a5743b..b0e438ff4950 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -67,6 +67,10 @@ properties:
   "#size-cells":
     const: 0
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   pwm:
     type: object
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 2459a55ed540..5644927be810 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -79,6 +79,10 @@ properties:
           - const: rx
           - const: tx
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   power-domains: true
 
   resets:
diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index f9ffb963d6b1..c4887522e8fe 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -118,6 +118,10 @@ properties:
   phys:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index fc8c96b08d7d..f2714b5b6cf4 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -93,6 +93,10 @@ properties:
       select RCC clock instead of ETH_REF_CLK.
     type: boolean
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 24a3dbde223b..ceea122ae1a6 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -55,6 +55,10 @@ properties:
     description: number of clock cells for ck_usbo_48m consumer
     const: 0
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 # Required child nodes:
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
index 05f4ad2c7d3a..6ceaffb45dc9 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
@@ -30,6 +30,10 @@ properties:
   vdda-supply:
     description: phandle to the vdda input analog voltage.
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
index 717f6b321f88..340d01d481d1 100644
--- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
@@ -37,6 +37,10 @@ properties:
     description: If set, the RNG configuration in RNG_CR, RNG_HTCR and
                   RNG_NSCR will be locked.
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 1df8ffe95fc6..1de03af4ead1 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -70,6 +70,10 @@ properties:
     enum: [1, 2, 4, 8, 12, 14, 16]
     default: 8
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 allOf:
   - $ref: rs485.yaml#
   - $ref: serial.yaml#
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index b9111d375b93..8978f6bd63e5 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -65,6 +65,10 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 59df8a832310..b46a4778807d 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -48,6 +48,10 @@ properties:
   clock-names:
     maxItems: 3
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
index bc48151b9adb..3dedc81ec12f 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -50,6 +50,10 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - "#sound-dai-cells"
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 8bba965a9ae6..3f1a27efff80 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -46,6 +46,10 @@ properties:
       - const: tx
       - const: rx
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index ae0f082bd377..0b303bf5c02c 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -50,6 +50,10 @@ properties:
       - const: rx
       - const: tx
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 0a5c98ea711d..88c077673c8b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -172,6 +172,10 @@ properties:
 
   tpl-support: true
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
 dependencies:
   port: [ usb-role-switch ]
   role-switch-default-mode: [ usb-role-switch ]
-- 
2.35.3


