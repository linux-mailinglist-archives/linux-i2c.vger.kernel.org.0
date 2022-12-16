Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0CE64F10B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 19:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbiLPSh3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 13:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiLPSh1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 13:37:27 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A652B243;
        Fri, 16 Dec 2022 10:37:27 -0800 (PST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGF2Ihk005981;
        Fri, 16 Dec 2022 18:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version; s=pps0720;
 bh=adn195NCb1uZjLG8wFHLk0+CnYqQOfEgaJMZuHUP/Jg=;
 b=FqGTAYJGeWalOZ7pHLhn4vJUE/34zoxEOMGH3gVtUs51H4Oya4PYO0ENijPyd+ctcJJz
 aNfFuxNRJdXEpo8MgKcFHM6FvigkVfQAiwJCaTAKvT3Po/hWnxT6aqqAjybYtjIg21xQ
 lywKq+5Ikha2N/hFmA5QjsbBOKJHdQ8Bt5JlA8d4mXk4e2L3NCe3MisK9AciyBhLpK3b
 eKuqk3gM9aHfuafU5tFZGJvb3w3XlDhlM/xSf1jL1/+xvqZ42pmbELHCfUYvL/Y6nTqE
 CIWqpeW5rx439Lbjtht0myoHIS+aLPXfjrPjaMyPe2u99dwH6nk9MjVlILAvaCqS9gbn Uw== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3mgqmqudwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 18:37:07 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 9B438801707;
        Fri, 16 Dec 2022 18:37:06 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 1830780619A;
        Fri, 16 Dec 2022 18:37:06 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/6] dt-bindings: i2c: hpe,gxp-i2c
Date:   Fri, 16 Dec 2022 12:35:28 -0600
Message-Id: <20221216183532.78933-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216183532.78933-1-nick.hawkins@hpe.com>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: vG9MzKLuqemFIP0SeQINUPDUWETx9rBV
X-Proofpoint-GUID: vG9MzKLuqemFIP0SeQINUPDUWETx9rBV
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160162
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Document binding to support I2C controller in GXP.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
new file mode 100644
index 000000000000..fa378e991fdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/hpe,gxp-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HPE GXP SoC I2C Controller
+
+maintainers:
+  - Nick Hawkins <nick.hawkins@hpe.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: hpe,gxp-i2c
+
+  '#address-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  hpe,i2c-max-bus-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Desired frequency in Hz of the bus.
+    default: 100000
+
+  hpe,sysreg-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Pandle to syscon used to control the system registers.
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@2600 {
+        compatible = "hpe,gxp-i2c";
+        reg = <0x2500 0x70>;
+        interrupts = <9>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        hpe,sysreg-phandle = <&sysreg_system_controller>;
+        hpe,i2c-max-bus-freq = <10000>;
+
+        eeprom@50 {
+            compatible = "atmel,24c128";
+            reg = <0x50>;
+        };
+    };
-- 
2.17.1

