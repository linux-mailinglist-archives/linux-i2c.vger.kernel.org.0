Return-Path: <linux-i2c+bounces-749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C708A80F077
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 16:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E05BB20FC2
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 15:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202B677651;
	Tue, 12 Dec 2023 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="71l+5CnO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402DADB;
	Tue, 12 Dec 2023 07:26:05 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BCCOnGn001179;
	Tue, 12 Dec 2023 16:25:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=QpG4L46teLbBYcxt3AXNM5BujFv4AEDCEiVswfgeH2s=; b=71
	l+5CnOazG6/owrN9/LPpceyoq14h8BUl/wClZ6vlstNujryKkM6aDgjhcYQtywWs
	FrHGo/LqhoPTh783vbnHTfsaTe2FocR9mDik120YyxjrLRTz2iaBPacfIv3XlROD
	vK74aSPwPnapnTnj8rVvUZtCriJBABL7XM7Tu99qpBHR9SZzYONZ5agfTUE27fH2
	4tQY8GEWIN5MeYee+1KHiEsqCxNlJL6X5DGnxjrijiiwZ73/+ENZxaJJZAYRxsEZ
	iY6gkadX2zEHIWMNQXTB+YSXUA0BLcd89So8iKQHm4y7iz2H9k4Ogdk3udACYraD
	vcXxT7I3wTFu7C/kJLsw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmc8g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D59610005A;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12E8922D195;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:25:18 +0100
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
Subject: [PATCH v8 04/13] dt-bindings: bus: document ETZPC
Date: Tue, 12 Dec 2023 16:23:47 +0100
Message-ID: <20231212152356.345703-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_09,2023-12-12_01,2023-05-22_02

Document ETZPC (Extended TrustZone protection controller). ETZPC is a
firewall controller.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V6:
    	- Renamed access-controller to access-controllers
    	- Removal of access-control-provider property
    	- Removal of access-controller and access-controller-names
    	  declaration in the patternProperties field. Add
    	  additionalProperties: true in this field.

Changes in V5:
	- Renamed feature-domain* to access-control*

Changes in V2:
	- Corrected errors highlighted by Rob's robot
	- No longer define the maxItems for the "feature-domains"
	  property
	- Fix example (node name, status)
	- Declare "feature-domain-names" as an optional
	  property for child nodes
	- Fix description of "feature-domains" property
	- Reordered the properties so it matches ETZPC
	- Add missing "feature-domain-controller" property

 .../bindings/bus/st,stm32-etzpc.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
new file mode 100644
index 000000000000..9ca0ad39bc19
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Extended TrustZone protection controller
+
+description: |
+  The ETZPC configures TrustZone security in a SoC having bus masters and
+  devices with programmable-security attributes (securable resources).
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+properties:
+  compatible:
+    contains:
+      const: st,stm32-etzpc
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    // In this example, the usart2 device refers to rifsc as its access
+    // controller.
+    // Access rights are verified before creating devices.
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp13-clks.h>
+    #include <dt-bindings/reset/stm32mp13-resets.h>
+
+    etzpc: bus@5c007000 {
+        compatible = "st,stm32-etzpc";
+        reg = <0x5c007000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <1>;
+        ranges;
+
+        usart2: serial@4c001000 {
+            compatible = "st,stm32h7-uart";
+            reg = <0x4c001000 0x400>;
+            interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&rcc USART2_K>;
+            resets = <&rcc USART2_R>;
+            wakeup-source;
+            dmas = <&dmamux1 43 0x400 0x5>,
+                    <&dmamux1 44 0x400 0x1>;
+            dma-names = "rx", "tx";
+            access-controllers = <&etzpc 17>;
+        };
+    };
-- 
2.25.1


