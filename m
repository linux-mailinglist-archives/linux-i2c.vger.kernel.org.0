Return-Path: <linux-i2c+bounces-15193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F29D25230
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 16:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFD6B303AC3D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391933A0EBC;
	Thu, 15 Jan 2026 14:55:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4C35C1BA;
	Thu, 15 Jan 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488919; cv=none; b=lxvR/CKjGdgpwd9H3tJsZUitq05/HOg9t0PjUjWIQ+0NSoELikilmTz8FSRCZvU6vVp91vg4qMACr9O37WpxqQJ+lUe3aGrUtueO8DRp69JcnvborHR3xi34fIc3lFNS95Lq9KZ09IOyoNM0BjbAD1Mr+2T5ClCpDYjY36X2YbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488919; c=relaxed/simple;
	bh=H4BaOdHYwN+G+4tYAtMFqwQDViH5IBNZ4Z3fnksL3Vw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+cLVBVs6t+AwVxtBG8lPycWxAeRGHt1wDlI7eWHW4Tn+kTQbqJR0i7MAwNdOhnPUKJa2guhPwSXHXTrv8FRX+o372b835kH9VgtVJJBsVPesiZ/VlE+wH4yf0GVTvRMGPhLVKApyLZy2ck9LS2mswjIuGOLqEeR2Vxictf+P2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 60FEqmJS039368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:52:48 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jan 2026
 22:52:48 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 1/4] dt-bindings: i2c: add support for Andes I2C controller
Date: Thu, 15 Jan 2026 22:52:41 +0800
Message-ID: <20260115145244.435890-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115145244.435890-1-ben717@andestech.com>
References: <20260115145244.435890-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60FEqmJS039368

Document device tree bindings for Andes I2C controller.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../bindings/i2c/andestech,atciic100.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml

diff --git a/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
new file mode 100644
index 000000000000..dcbcafc8d6bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/andestech,atciic100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes I2C controller on QiLai SoC and AE350 platform
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - andestech,qilai-i2c
+          - andestech,ae350-i2c
+      - const: andestech,atciic100
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
+    i2c@30800000 {
+        compatible = "andestech,qilai-i2c","andestech,atciic100";
+        reg = <0x30800000 0x100000>;
+        interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1


