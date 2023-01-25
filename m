Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93EC967B9CF
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 19:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbjAYSrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 13:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235400AbjAYSrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 13:47:07 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C84C5B595;
        Wed, 25 Jan 2023 10:47:06 -0800 (PST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PIbl6a004596;
        Wed, 25 Jan 2023 18:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version; s=pps0720;
 bh=n6E5Pwizgz6wzPbcddDl9uPT4LbCzpGaS1glkpucmyI=;
 b=nLrh/bucrhSeEPpApPneEFmztiE6K6Ta6mdjEBXW9GscHjcSTc4Xm9hQ1dIAsheRFKsD
 6KoV+Rx21wqMKi7R2QEi65k4Y31z6yHXlnAfnPA4Lt6qQI48jVB5P5mPdU8bG30gVw8R
 RjVx4R3nFZaR0qr5DTPaoaFBK2YDBgNpCtRHEr6O63dEylRPPdtJwdbDTClhh6WRKvSr
 QIFbsNFLvpJ3nwKlHSLa4S/gehA94QYsViey5UzlqfBophCa8Wz2LNr6tJZEO7Qp1GHc
 2zc3WYIa64PjjsZfM1Wqkx25l9CQly9Ygd+IsIwC+WZ7HAOV+Z1DUaTnnR6SWEsdeYzs 5A== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nb9v682rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 18:46:45 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 6E9F213198;
        Wed, 25 Jan 2023 18:46:44 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id EB09C807E37;
        Wed, 25 Jan 2023 18:46:43 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: [PATCH v4 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Date:   Wed, 25 Jan 2023 12:44:35 -0600
Message-Id: <20230125184438.28483-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125184438.28483-1-nick.hawkins@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: EPGXs413IDLSsGvEFsacG81uWEaccF6h
X-Proofpoint-GUID: EPGXs413IDLSsGvEFsacG81uWEaccF6h
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_12,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250166
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

