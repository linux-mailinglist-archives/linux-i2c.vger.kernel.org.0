Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D71B748A50
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 19:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbjGER3l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 13:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbjGER3a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 13:29:30 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBF01995;
        Wed,  5 Jul 2023 10:29:14 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365F7wr6011031;
        Wed, 5 Jul 2023 19:28:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=0cp0phFAXBpBnqUWpQvooHZl0xVcG7c1RiTscXT/M+o=;
 b=oykazVaiSgS7Ds6UFk9nS1pYtqiKZbjUXBkbNDpPe3Lrqf1OzDClGBQ/fhX2ODBc3dcI
 pcW7HhsM3J3slbVHYCNBzGOnmhTWXqUT6CgFV3NZSVHpTfVEq6PDhyuBSfoOZzyoij5Z
 fGIwAOFLVViLIkZeTIdykx1WjcC+xlce8eXsw8jRHeK+cbbK79oL7yuzRXHhViNpf8NC
 aog7j73knzF+bE0M06Nn6R2svhLS8DZNwo6fB4oNPWw6bfqXrmZr50/MIdQxYAJw/aH+
 hFO2BRk6Fvp/BkXo+ZeGpI0UZJY1qwX0YBKq0F8Qey263oZpmBwRYH2Lx+AZ/E3UBMio YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn7wp29a4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 19:28:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A822010005E;
        Wed,  5 Jul 2023 19:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AE9524C432;
        Wed,  5 Jul 2023 19:28:30 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:28:30 +0200
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
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: [IGNORE][PATCH 01/10] dt-bindings: Document common device controller bindings
Date:   Wed, 5 Jul 2023 19:27:50 +0200
Message-ID: <20230705172759.1610753-2-gatien.chevallier@foss.st.com>
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

From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

Introducing of the common device controller bindings for the controller
provider and consumer devices. Those bindings are intended to allow
divided system on chip into muliple domains, that can be used to
configure hardware permissions.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Depends-on: https://lore.kernel.org/lkml/c869d2751125181a55bc8a88c96e3a892b42f37a.1668070216.git.oleksii_moisieiev@epam.com/

 .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml

diff --git a/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
new file mode 100644
index 000000000000..90a7c38c833c
--- /dev/null
+++ b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/feature-controllers/feature-domain-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Domain Controller bindings
+
+maintainers:
+  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+
+description: |+
+  Common Feature Domains Controller bindings properties
+
+  Domain controllers allow to divided system on chip into multiple feature
+  domains that can be used to select by who hardware blocks could be accessed.
+  A feature domain could be a cluster of CPUs (or coprocessors), a range of
+  addresses or a group of hardware blocks.
+
+  This device tree bindings can be used to bind feature domain consumer devices
+  with their feature domains provided by feature-domains controllers.
+  Feature omain controller provider can be represened by any node in the
+  device tree and can provide one or more configuration parameters, needed to
+  control parameters of the consumer device. A consumer node can refer to the
+  provider by phandle and a set of phandle arguments, specified by
+  '#feature-domain-cells' property in the device controller provider node.
+
+  Device controllers are typically used to set the permissions of the hardware
+  block. The contents of the feature-domains configuration properties are
+  defined by the binding for the individual feature-domains controller device.
+
+  Each node can be a consumer for the several providers. The first
+  configuration of 'feature-domains' or the one named 'default' is applied
+  before probing the device itself.
+
+# always select the core schema
+select: true
+
+properties:
+  '#feature-domain-cells':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of cells in a feature-domains controller specifier;
+      Can be any value as specified by device tree binding documentation
+      of a particular provider.
+
+  feature-domain-controller:
+    description:
+      Indicates that the node is feature-domain-controller provider.
+
+  feature-domain-names:
+    $ref: '/schemas/types.yaml#/definitions/string-array'
+    description:
+      A list of feature-domains names, sorted in the same order as
+      feature-domains entries. Consumer drivers will use feature-domain-names
+      to match with existing feature-domains entries.
+
+  feature-domains:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of feature-domains controller specifiers, as defined by the
+      bindings of the feature-domain-controller provider.
+
+additionalProperties: true
+
+examples:
+  - |
+    ctrl0: ctrl@100 {
+        feature-domain-controller;
+        reg = <0x100 0x10>;
+        #feature-domain-cells = <2>;
+    };
+
+    ctrl1: ctrl@110 {
+        feature-domain-controller;
+        reg = <0x110 0x10>;
+        #feature-domain-cells = <3>;
+    };
+
+    foo@0 {
+        reg = <0x0 0x1>;
+        feature-domains = <&ctrl0 1 2>, <&ctrl1 3 4 5>;
+        feature-domain-names = "default", "unbind";
+    };
-- 
2.25.1

