Return-Path: <linux-i2c+bounces-1143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 194618253A5
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 14:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F001F22065
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 13:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0392DF91;
	Fri,  5 Jan 2024 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DMjz1c0y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97382D620;
	Fri,  5 Jan 2024 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 4059PG95028841;
	Fri, 5 Jan 2024 14:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=/1plcJCEt4zxfV0bqQNtY/GftB/Ck2iRRS68imm6alM=; b=DM
	jz1c0ydeFJrkFQ4pJ2SIywze9yA4oTsWh+Khiq16bjyv5h2QGpfz0gGkzg0Nfs1w
	tQQ1hFfMKiiDD06BteK4zrufwxFmj2pIsuSVPYtIRK50DnQhBMmBpql+CCN0B6yR
	rOCkgXIoA2uQggC2qnxe8iqohzdKAji+tZyCPRgGbik7kjaag/gLHOlxSDmjeu4N
	LyryHKnhhFvPimbX6BITfGqLp8LmW6RYzpfsrpr6ouGndcHzdfUFU90ojpLU+KqB
	ZVtqxrVSHn5OetUlvUveqxspua4XAlJg9pVoEQYpSvh16vHbDSXum8IYU/kL5GbA
	bKTyRJipvbF/u/dpUBjQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9dst5tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 14:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2260810003D;
	Fri,  5 Jan 2024 14:04:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8FF6229A90;
	Fri,  5 Jan 2024 14:04:35 +0100 (CET)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 14:04:35 +0100
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
	<gatien.chevallier@foss.st.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 03/13] dt-bindings: bus: document RIFSC
Date: Fri, 5 Jan 2024 14:03:54 +0100
Message-ID: <20240105130404.301172-4-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
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
 definitions=2024-01-05_06,2024-01-05_01,2023-05-22_02

Document RIFSC (RIF security controller). RIFSC is a firewall controller
composed of different kinds of hardware resources.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in V9:
	- Added "simple-bus" to RIFSC's compatible list
	- Added Rob's review tag

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

 .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
new file mode 100644
index 000000000000..20acd1a6b173
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
+select:
+  properties:
+    compatible:
+      contains:
+        const: st,stm32mp25-rifsc
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: st,stm32mp25-rifsc
+      - const: simple-bus
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
+    // In this example, the usart2 device refers to rifsc as its domain
+    // controller.
+    // Access rights are verified before creating devices.
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rifsc: bus@42080000 {
+        compatible = "st,stm32mp25-rifsc", "simple-bus";
+        reg = <0x42080000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <1>;
+        ranges;
+
+        usart2: serial@400e0000 {
+              compatible = "st,stm32h7-uart";
+              reg = <0x400e0000 0x400>;
+              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&ck_flexgen_08>;
+              access-controllers = <&rifsc 32>;
+        };
+    };
-- 
2.35.3


