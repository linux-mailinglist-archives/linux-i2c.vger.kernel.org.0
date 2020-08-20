Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80BE24C304
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 18:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbgHTQMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 12:12:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61620 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729513AbgHTQMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 12:12:08 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07KG3gcx106903;
        Thu, 20 Aug 2020 12:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p4zPpqWUijmECTtxSBrlDcEiyLdOJEP1sRcpTvKaaYQ=;
 b=neeziy8Inkoi8duXwtfdAFoS4/raQ/C/R/83hO3co8xGg3KBfUGBd9Wm+SNggmLlnlIL
 O6UTN2ufn8+p4/80UlHNYpPpXXgz2pRrJES3rv2P8MAA70MfTB3sdBE8au8UB3w5vxlC
 CQH5X6ksWdDjlapM2ZC9WUFwC+QuSKMOv9U5ai628Q55Wx+ETlkFGdugcH/ulNbQgMnW
 9vTVib3QIIw4w9C4PMsggYjh6J3APOnT5ZAOZSsdvPpKhcWCmIhwZPJTxeOCI9rXSXel
 WSm/eW2p3PG/FJUvtKrE3rUF9M6TU0thdtYF+LUq/jUIZLtDModWx5kIm6F4ad3nXw/O QA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3317abb9bs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:11:58 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07KG4ERY109718;
        Thu, 20 Aug 2020 12:11:58 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3317abb9b2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:11:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KG9atp016038;
        Thu, 20 Aug 2020 16:11:56 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma02dal.us.ibm.com with ESMTP id 3304cd2wqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 16:11:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07KGBtEU37159196
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Aug 2020 16:11:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BE505112062;
        Thu, 20 Aug 2020 16:11:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2854E112061;
        Thu, 20 Aug 2020 16:11:54 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.70.74])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 20 Aug 2020 16:11:54 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, eajames@linux.ibm.com
Subject: [PATCH 1/5] dt-bindings: input: Add documentation for IBM Operation Panel
Date:   Thu, 20 Aug 2020 11:11:48 -0500
Message-Id: <20200820161152.22751-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200820161152.22751-1-eajames@linux.ibm.com>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-20_03:2020-08-19,2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=1 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008200130
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the bindings for the IBM Operation Panel, which provides
a simple interface to control a server. It has a display and three
buttons.
Also update MAINTAINERS for the new file.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../bindings/input/ibm,op-panel.yaml          | 38 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml

diff --git a/Documentation/devicetree/bindings/input/ibm,op-panel.yaml b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
new file mode 100644
index 000000000000..86a32e8f3ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
@@ -0,0 +1,38 @@
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ibm-op-panel@62 {
+            compatible = "ibm,op-panel";
+            reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ac79fdbdf8d0..a9fd08e9cd54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8278,6 +8278,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
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

