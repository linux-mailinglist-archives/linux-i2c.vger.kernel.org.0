Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70051675D8F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 20:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjATTEY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 14:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjATTEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 14:04:22 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6F7A266;
        Fri, 20 Jan 2023 11:04:21 -0800 (PST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KJ2Aha015174;
        Fri, 20 Jan 2023 19:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version; s=pps0720;
 bh=PVPQCJsDpuWkC88LJUGMueCIN9wFdiVBHpz2S+5INNY=;
 b=alegycdDXE5Y+6aBVwF8OF98xfRdu1x0Empw1DREq4o03LZcllFBnEEte6ilfIESm163
 fctdSZvj8LGk3pROkVKzRLOoaIj7OKbvzvKLllNkGbSVLVBMEjNyomNsNPAcddivn9Zl
 NdWsg3GeO+1jQNZJjjtb8wtR4JI2Q11Ih065022Y5R/6KB+pN/dEzIv2N26KV8Z6py+l
 wCeBAUDo0bd0sbjxg5aZ3LgnGbdZ4wd6glcfcA2qVO/TKF3ZwAUXKi65FvNBLmV5aGW2
 V2d5S/q6Xw16q1kuvZthlHdhvtvNvoakXuyzkWzuGI/guaxID/trED2OQ+OwtCATHXN2 Wg== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n7upv382t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Jan 2023 19:03:56 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 45C4F807EF3;
        Fri, 20 Jan 2023 19:03:56 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id C2D30802F29;
        Fri, 20 Jan 2023 19:03:55 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Date:   Fri, 20 Jan 2023 13:01:56 -0600
Message-Id: <20230120190159.23459-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230120190159.23459-1-nick.hawkins@hpe.com>
References: <20230120190159.23459-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: nYyt_fUe4lXPewQFHPFtAr9xTIa_EsW-
X-Proofpoint-ORIG-GUID: nYyt_fUe4lXPewQFHPFtAr9xTIa_EsW-
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_10,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301200180
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

v3:
 *Provide better description with use of Phandle
v2:
 *Removed uneccessary size-cells and address-cells
 *Removed phandle from hpe,sysreg-phandle
 *Changed hpe,i2c-max-bus-freq to clock-frequency
---
 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
new file mode 100644
index 000000000000..63bc69e92d0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
@@ -0,0 +1,57 @@
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
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+  hpe,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to a global status and enable registers shared
+      between each I2C controller instance. Each bit of the
+      registers represents an individual I2C engine.
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

