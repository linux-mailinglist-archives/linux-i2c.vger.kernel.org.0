Return-Path: <linux-i2c+bounces-1145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC28253BD
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 14:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F9C284D1F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 13:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1A62E824;
	Fri,  5 Jan 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VpuhUfrx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713D2D626;
	Fri,  5 Jan 2024 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 405A2inw032007;
	Fri, 5 Jan 2024 14:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=f8yYjC7/bXFz3P4Kx664vSO5R+Y8zJivOeI8ipIFK/I=; b=Vp
	uhUfrxXK21O27qztVZANQdYQw7aYYlWHd/ZUmdhmx5yPbfDR+PMDqV/tyQwN01zm
	zMU3lO/Iqfcx4bIzvn2rStmJQesk3J+JghAxNF8SmgMyr2ERfu3nkDDn8FH9Clu7
	fs8aWuDP3cyE+0IzrT7SfKcs8cs1I1ffET6cAisRr7rS9A2p3hj157OOzHCXMjvC
	tb5u7qoWCZbBYU+Blj726Y3hnc/YrkKCObOqthud74ixFwFp9gJeb8+llPm75BQ2
	yxKbuzaWfDcPivtGZkZEITZZZaW2qKO7ATZmH4zt+XubdKpBd6TJl3VCSJL3ugJ6
	tbx+Z1O2yU2UdcHc9Y2w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9eq25uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 14:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34A99100038;
	Fri,  5 Jan 2024 14:04:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24794229A8E;
	Fri,  5 Jan 2024 14:04:34 +0100 (CET)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 14:04:33 +0100
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
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH v9 01/13] dt-bindings: document generic access controllers
Date: Fri, 5 Jan 2024 14:03:52 +0100
Message-ID: <20240105130404.301172-2-gatien.chevallier@foss.st.com>
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

From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

Introducing of the generic access controllers bindings for the
access controller provider and consumer devices. Those bindings are
intended to allow a better handling of accesses to resources in a
hardware architecture supporting several compartments.

This patch is based on [1]. It is integrated in this patchset as it
provides a use-case for it.

Diffs with [1]:
	- Rename feature-domain* properties to access-control* to narrow
	  down the scope of the binding
	- YAML errors and typos corrected.
	- Example updated
	- Some rephrasing in the binding description

[1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in V9:
	- Added Rob's review tag

Changes in V6:
	- Renamed access-controller to access-controllers
	- Example updated
	- Removal of access-control-provider property

Changes in V5:
	- Diffs with [1]
	- Discarded the [IGNORE] tag as the patch is now part of the
	  patchset

 .../access-controllers.yaml                   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml

diff --git a/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
new file mode 100644
index 000000000000..99e2865f0e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/access-controllers/access-controllers.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Domain Access Controllers
+
+maintainers:
+  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+
+description: |+
+  Common access controllers properties
+
+  Access controllers are in charge of stating which of the hardware blocks under
+  their responsibility (their domain) can be accesssed by which compartment. A
+  compartment can be a cluster of CPUs (or coprocessors), a range of addresses
+  or a group of hardware blocks. An access controller's domain is the set of
+  resources covered by the access controller.
+
+  This device tree binding can be used to bind devices to their access
+  controller provided by access-controllers property. In this case, the device
+  is a consumer and the access controller is the provider.
+
+  An access controller can be represented by any node in the device tree and
+  can provide one or more configuration parameters, needed to control parameters
+  of the consumer device. A consumer node can refer to the provider by phandle
+  and a set of phandle arguments, specified by '#access-controller-cells'
+  property in the access controller node.
+
+  Access controllers are typically used to set/read the permissions of a
+  hardware block and grant access to it. Any of which depends on the access
+  controller. The capabilities of each access controller are defined by the
+  binding of the access controller device.
+
+  Each node can be a consumer for the several access controllers.
+
+# always select the core schema
+select: true
+
+properties:
+  "#access-controller-cells":
+    description:
+      Number of cells in an access-controllers specifier;
+      Can be any value as specified by device tree binding documentation
+      of a particular provider. The node is an access controller.
+
+  access-controller-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of access-controllers names, sorted in the same order as
+      access-controllers entries. Consumer drivers will use
+      access-controller-names to match with existing access-controllers entries.
+
+  access-controllers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A list of access controller specifiers, as defined by the
+      bindings of the access-controllers provider.
+
+additionalProperties: true
+
+examples:
+  - |
+    clock_controller: access-controllers@50000 {
+        reg = <0x50000 0x400>;
+        #access-controller-cells = <2>;
+    };
+
+    bus_controller: bus@60000 {
+        reg = <0x60000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        #access-controller-cells = <3>;
+
+        uart4: serial@60100 {
+            reg = <0x60100 0x400>;
+            clocks = <&clk_serial>;
+            access-controllers = <&clock_controller 1 2>,
+                                 <&bus_controller 1 3 5>;
+            access-controller-names = "clock", "bus";
+        };
+    };
-- 
2.35.3


