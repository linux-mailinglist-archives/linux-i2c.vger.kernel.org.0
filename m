Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF2269AFDC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 16:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjBQPzS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 10:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjBQPzR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 10:55:17 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD28644FF;
        Fri, 17 Feb 2023 07:55:16 -0800 (PST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEC67R020741;
        Fri, 17 Feb 2023 15:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version; s=pps0720;
 bh=b71fkatlNICCwbxVOrGgkq1hzsUvLsNK8hi0tK83NxQ=;
 b=PUU1HMuz4Xz+Lza+zLx3WtHeK5aGF85NjPvyetihGLZqdR8XdzumplBJUOmBUibT14vk
 skwDYL2jHPPEAgqvLrArbXJg/JJLxLB+zhM1u7nL4oi0150PAqbJWOjFCRRdusfEgHyk
 0v6DA+xMNUAWdR6Rp3IRL+QAYRvsmr0hSVABEengxfXnuNfto9muW2dfcXa0qNKs2gWl
 tdCfeax4pz6GtgGPmbqQWXiK2KnzPQtwheccQ/8T6AFpau/qwUZCYUkCNr2yhJlRNCMU
 ClUFH+VIkwi8lDFyJy7Cw/iikeYd2lv87WPCoJRZXKOsnUmwn7o2uLSwy/FQTn3JWd1I Ng== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3ntanfsmwb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Feb 2023 15:54:57 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id B92F6805E62;
        Fri, 17 Feb 2023 15:54:56 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id D151F808DAA;
        Fri, 17 Feb 2023 15:54:55 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wsa@kernel.org
Subject: [PATCH v5 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Date:   Fri, 17 Feb 2023 09:50:51 -0600
Message-Id: <20230217155054.99757-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230217155054.99757-1-nick.hawkins@hpe.com>
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: Wr5W0DxXH8HCOVoNRwTTj3t-CMjgToze
X-Proofpoint-GUID: Wr5W0DxXH8HCOVoNRwTTj3t-CMjgToze
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170141
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Document compatibility string to support I2C controller
in GXP.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---
v5:
 *No change
v4:
 *Provide even greater description with the use
  of Phandle
 *Reorder properties so they match the required
  order
v3:
 *Provide better description with use of Phandle
v2:
 *Removed uneccessary size-cells and address-cells
 *Removed phandle from hpe,sysreg-phandle
 *Changed hpe,i2c-max-bus-freq to clock-frequency
---
 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
new file mode 100644
index 000000000000..6604dcd47251
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
@@ -0,0 +1,59 @@
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
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+  hpe,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the global status and enable interrupt registers shared
+      between each I2C engine controller instance. It enables the I2C
+      engine controller to act as both a master or slave by being able to
+      arm and respond to interrupts from its engine. Each bit in the
+      registers represent the respective bit position.
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
+        hpe,sysreg = <&sysreg_system_controller>;
+        clock-frequency = <10000>;
+
+        eeprom@50 {
+            compatible = "atmel,24c128";
+            reg = <0x50>;
+        };
+    };
-- 
2.17.1

