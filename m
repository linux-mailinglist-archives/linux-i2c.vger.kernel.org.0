Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06BF261F54
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbgIHUB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:01:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15072 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729988AbgIHUBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:01:24 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 088JXZto010145;
        Tue, 8 Sep 2020 16:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MHEf0n9vUOLrK3bD/Vy6e2g7Yf/X+egArwXFxhmjvqY=;
 b=SirpuTCrrbCGkTBQ72J64TLB1rsFu4w5qb7FapGpmyOZcxq3KIXMZD3nHiAubxfLACIr
 qqlV2rUFutxYqOdJGk8L3XsNtfF/bid8qZyJ6Grn+HT7K41imaRppRMVT4Hxe2PcqD/B
 A3IA7RI8fGIYG6bj9nDOWHO8Jk4DOAOB/NSjeL6fRfoS8ei/6H5iTmagOTSFh56TCa6m
 Cc31VUF3LcX8TMNlvHk6xhLv1AGKpgmmR6qYm7fi5T8ofp6Z0QSv5xAAfkvoGhFlNSrI
 KDTc7CBikez6xPutStZBs4HwToPLT9gboy4WDgv09Y6ryQjHbuaxnoS2IxC3bMQhf37m eg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33eg3frswr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:06 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088JeCN5052731;
        Tue, 8 Sep 2020 16:01:06 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33eg3frsw6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:06 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088JwGog025156;
        Tue, 8 Sep 2020 20:01:05 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma03dal.us.ibm.com with ESMTP id 33c2a90cpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 20:01:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 088K10Hm66191720
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 8 Sep 2020 20:01:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D70426A057;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2D3806A047;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.24.203])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v2 1/5] dt-bindings: input: Add documentation for IBM Operation Panel
Date:   Tue,  8 Sep 2020 15:00:57 -0500
Message-Id: <20200908200101.64974-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908200101.64974-1-eajames@linux.ibm.com>
References: <20200908200101.64974-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-08_09:2020-09-08,2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080179
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the bindings for the IBM Operation Panel, which provides
a simple interface to control a server. It has a display and three
buttons.
Also update MAINTAINERS for the new file.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 .../bindings/input/ibm,op-panel.yaml          | 39 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml

diff --git a/Documentation/devicetree/bindings/input/ibm,op-panel.yaml b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
new file mode 100644
index 000000000000..5f068fce93ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ibm,op-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM Operation Panel
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description: |
+  The IBM Operation Panel provides a simple interface to control the connected
+  server. It has a display and three buttons: two directional arrows and one
+  'Enter' button.
+
+properties:
+  compatible:
+    const: ibm,op-panel
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/i2c/i2c.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ibm-op-panel@62 {
+            compatible = "ibm,op-panel";
+            reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a5d6797a206..0d83eada50e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8345,6 +8345,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
 F:	Documentation/ia64/
 F:	arch/ia64/
 
+IBM Operation Panel Input Driver
+M:	Eddie James <eajames@linux.ibm.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/ibm,op-panel.yaml
+
 IBM Power 842 compression accelerator
 M:	Haren Myneni <haren@us.ibm.com>
 S:	Supported
-- 
2.26.2

