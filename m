Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF8F748A47
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 19:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbjGER3e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjGER33 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 13:29:29 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0991992;
        Wed,  5 Jul 2023 10:29:14 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365FgASP003096;
        Wed, 5 Jul 2023 19:28:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=aw+a9oxu/DBhq69Yh+u1WoOOa0pn8inaUz2S9U2iiVA=;
 b=spkRAyPc38MCEtiCx+SwGKvhQ0FVQ9Y+uy0pFuBrSe8QXFUdhaPdgjBKd3Ss/2f25uR5
 MM7mk5xgq6to4YthbPEaFRGfvAOaU+BlsVzk1LMA2E5GKUXc4SQfWfSnD0yfxQxw2edp
 ZpdSC7ZKS5PP8pUVe1ncgQPifd11nUDTItDCEGRnp5L9NAf931knw/qxBXiCgmdoxzLx
 ET26EdL7UsCiJM9eZSxPiXfUiwjr1y9RZFjSL7k/A4NlHkhCz+9ur5bM6IjL7/UD2W/c
 K+jUwtGqzdn/0fe16bAfzRIiD7UqYlp4LDtevSWe9GUAgKlF3OsWeKclVIJntKIzNiMy zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9t2d7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 19:28:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EF6A100057;
        Wed,  5 Jul 2023 19:28:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54E1524C42F;
        Wed,  5 Jul 2023 19:28:33 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:28:32 +0200
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
Subject: [PATCH 03/10] dt-bindings: bus: add device tree bindings for ETZPC
Date:   Wed, 5 Jul 2023 19:27:52 +0200
Message-ID: <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
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

Document ETZPC (Extended TrustZone protection controller). ETZPC is a
firewall controller.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32-etzpc.yaml          | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
new file mode 100644
index 000000000000..327fb0b84c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Extended TrustZone protection controller bindings
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
+    const: "st,stm32-etzpc"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  feature-domain-controller: true
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    description: Peripherals
+    type: object
+    properties:
+      feature-domains:
+        minItems: 1
+        maxItems: 2
+        description:
+          The first argument must always be a phandle that references to the
+          firewall controller of the peripheral. The second can contain the
+          platform specific firewall ID of the peripheral.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - feature-domain-controller
+  - "#feature-domain-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    // In this example, the usart2 device refers to rifsc as its domain
+    // controller.
+    // Access rights are verified before creating devices.
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp13-clks.h>
+    #include <dt-bindings/reset/stm32mp13-resets.h>
+
+    etzpc: etzpc@5c007000 {
+        compatible = "st,stm32mp13-sys-bus";
+        reg = <0x5c007000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        feature-domain-controller;
+        #feature-domain-cells = <1>;
+
+        usart2: serial@4c001000 {
+          compatible = "st,stm32h7-uart";
+          reg = <0x4c001000 0x400>;
+          interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&rcc USART2_K>;
+          resets = <&rcc USART2_R>;
+          wakeup-source;
+          dmas = <&dmamux1 43 0x400 0x5>,
+                 <&dmamux1 44 0x400 0x1>;
+          dma-names = "rx", "tx";
+          feature-domains = <&etzpc 17>;
+          status = "disabled";
+        };
+    };
-- 
2.25.1

