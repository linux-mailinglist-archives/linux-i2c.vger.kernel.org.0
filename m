Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BAE763043
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjGZIq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbjGZIq2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:46:28 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659884EC8;
        Wed, 26 Jul 2023 01:38:58 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q7Va8P008022;
        Wed, 26 Jul 2023 10:38:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+UNuTiEun7FhBdsfcJqf/qnk8DNj8pRVH/wzdvv/e68=;
 b=4VfijQiCAGoIOVR4ZEre3LMsXnWRT82xkx0GxR88KgvWtydYfRHzk3VwCG8qfEs+8Mef
 LAVqksmTmDX5eXE9s2qw+5O/YZoeDAg5nATTvkFKboek0hhOsTfhRp1RjeI5vTy7h/rQ
 Npfbnh0T3S4IRS6z/XNmIUC+wHg+swW23KDUkUip7W1XfNjkcT3GcLAI70SzQTBpMx0X
 NmGOsAWOUwu8MQyju/HT5F/E3cvjXgJf0O1azw/oAEoQa3v1Z/CYofFMx8ZdNaL+ElFk
 J9vRJM8Pi/y/bbd3rqTsyftgnLy5auJFA6dUQ4Jwt+N0DCCU0s5XFBVrnNzKlelGCXn4 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2y640hfq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 10:38:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 798DB10002A;
        Wed, 26 Jul 2023 10:38:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D95720FA38;
        Wed, 26 Jul 2023 10:38:19 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 10:38:19 +0200
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
Subject: [PATCH v3 03/11] dt-bindings: bus: document RIFSC
Date:   Wed, 26 Jul 2023 10:38:02 +0200
Message-ID: <20230726083810.232100-4-gatien.chevallier@foss.st.com>
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

Document RIFSC (RIF security controller). RIFSC is a firewall controller
composed of different kinds of hardware resources.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V2: 
	- Corrected errors highlighted by Rob's robot
	- No longer define the maxItems for the "feature-domains"
	  property
	- Fix example (node name, status)
	- Declare "feature-domain-names" as an optional
	  property for child nodes
	- Fix description of "feature-domains" property

 .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
new file mode 100644
index 000000000000..7aeb38296616
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Resource isolation framework security controller
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description: |
+  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
+  designed to enforce and manage isolation of STM32 hardware resources like
+  memory and peripherals.
+
+  The RIFSC (RIF security controller) is composed of three sets of registers,
+  each managing a specific set of hardware resources:
+    - RISC registers associated with RISUP logic (resource isolation device unit
+      for peripherals), assign all non-RIF aware peripherals to zero, one or
+      any security domains (secure, privilege, compartment).
+    - RIMC registers: associated with RIMU logic (resource isolation master
+      unit), assign all non RIF-aware bus master to one security domain by
+      setting secure, privileged and compartment information on the system bus.
+      Alternatively, the RISUP logic controlling the device port access to a
+      peripheral can assign target bus attributes to this peripheral master port
+      (supported attribute: CID).
+    - RISC registers associated with RISAL logic (resource isolation device unit
+      for address space - Lite version), assign address space subregions to one
+      security domains (secure, privilege, compartment).
+
+properties:
+  compatible:
+    contains:
+      const: st,stm32mp25-rifsc
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
+  "#feature-domain-cells":
+    const: 1
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
+        description:
+          The phandle of the firewall controller of the peripheral and the
+          platform-specific firewall ID of the peripheral.
+
+      feature-domain-names:
+        minItems: 1
+
+    required:
+      - feature-domains
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
+
+    rifsc: bus@42080000 {
+        compatible = "st,stm32mp25-rifsc";
+        reg = <0x42080000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        feature-domain-controller;
+        #feature-domain-cells = <1>;
+        ranges;
+
+        usart2: serial@400e0000 {
+              compatible = "st,stm32h7-uart";
+              reg = <0x400e0000 0x400>;
+              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&ck_flexgen_08>;
+              feature-domains = <&rifsc 32>;
+        };
+    };
-- 
2.25.1

