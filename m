Return-Path: <linux-i2c+bounces-9330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31329A2B8CB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 03:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EEF316735E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 02:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA751632F2;
	Fri,  7 Feb 2025 02:19:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D5161310;
	Fri,  7 Feb 2025 02:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894786; cv=none; b=gCQCxnclVLnZ94QjexR8ZiLbmSsPCZWxS+l+/+V43TleNvGzHlkBPlhjq/jzdPtmjqBuhImJ87JWhBXVIbwzPaFCggGbxRWNLX1r5/0HHKyE7YieCIuRLAyVRVrv2ZkMvgRrN2IISSXmY0VVkhH+E5wYO3oNvwpo4RYQv/V1+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894786; c=relaxed/simple;
	bh=mR78WEcwQE9h+YiUBVq108IK/R6zBBQX4BEJDUYIW2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrUoWerNdvEqI2lUOe4V0nsRS8YQFWQpK71Lwlwk28QD4z6ca+x1yRDLmrSWltK45r8W03VMNWw/k+cFVvxXXVk5YB3HPg7TPhddXa3SSAt3gARizkyxecvllNZ5Vhkrr5zOPywg+ZImtdTtrKhQKoXH6QqhRJUDDlsKXZe/e74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5172JTAm093059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 10:19:29 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 7 Feb 2025
 10:19:29 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 1/2] dt-bindings: i2c: add atciic100
Date: Fri, 7 Feb 2025 10:19:22 +0800
Message-ID: <20250207021923.2912373-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207021923.2912373-1-ben717@andestech.com>
References: <20250207021923.2912373-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5172JTAm093059

Document devicetree bindings for Andes I2C controller.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../bindings/i2c/andestech,i2c-atciic100.yaml | 40 +++++++++++++++++++
 MAINTAINERS                                   |  5 +++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml

diff --git a/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml b/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
new file mode 100644
index 000000000000..cf96a9186176
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/andestech,atciic100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes I2C Controller
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: andestech,atciic100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@f0a00000 {
+        compatible = "andestech,atciic100";
+        reg = <0xf0a00000 0x1000>;
+        interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..544251a03c7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1635,6 +1635,11 @@ S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
 
+ANDES TECHNOLOGY I2C DRIVER
+M:	Ben Zong-You Xie <ben717@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
+
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Arve Hjønnevåg <arve@android.com>
-- 
2.34.1


