Return-Path: <linux-i2c+bounces-13469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3EBD65D2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 23:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A8A64ECE48
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269272F1FF3;
	Mon, 13 Oct 2025 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7D+GZOW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04622EBDE0;
	Mon, 13 Oct 2025 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391083; cv=none; b=aFbsngHQ9CN+7how29492Wqe+gaisgUKtloeLGh9V3QzFEwdSI3pp6KSMqNoCyoqgIrn5D6airIxtfupfFsNwoFyZMoM5hnwSmDMl94WJPuExdTq17inB0aP0dSfDKWCz2W2VpSDLzNTxxECo9QjqPYsnsyTE7pmJ6cCs+S+L1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391083; c=relaxed/simple;
	bh=RC1We2H5PTUbicO6BGAQ4fo/J3wXL6EboZl9psh9moc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlS7+YpMHvMwNNe3QMUP7EjlIR4agh9d2U4MA5r7/aS0pqhISwyecUscUd+wfUWK39j1myuTQJ7E8UZH3PsLcJ+1/ga+xBJPHgGlvQLuSOSO633zZNydnwwh7TAqhOEjZOdObU7NmBIJbzqBLpT/dFGFOFV/p92mTe4vZce/K/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7D+GZOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898BDC4CEE7;
	Mon, 13 Oct 2025 21:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760391083;
	bh=RC1We2H5PTUbicO6BGAQ4fo/J3wXL6EboZl9psh9moc=;
	h=From:To:Cc:Subject:Date:From;
	b=N7D+GZOWzAJ5+4JPUJmlAZBtuQiYa0euidGkAQJP6U9CViEv11KETkZK54VTgMxyb
	 xBPM18kNU5DLKZcTs20WbJYgq28o87hqeziOH2BJMuPpEuzXh6n4F205CTunhL9E8a
	 8TZiG1r2kVe8PZRxgbvshELQOHSKHDbZEQBNdX/9afhgBmDWu81xyzh6Fr7P1Pn7ky
	 8IlsCevOAferwKselVWeTEtsc4zFB88hEc2tK/8UecinTkvY0h9WX6CcthUcp5wj4x
	 yjuZQxMYJ2hiFfEl6xFNq0eCFxS0CAqn2zOtZJATxIGqEpGBNpVvbRClACfBopjrF8
	 J8513RjvSBN3Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Convert apm,xgene-slimpro-i2c to DT schema
Date: Mon, 13 Oct 2025 16:31:18 -0500
Message-ID: <20251013213120.691285-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert APM X-Gene slimpro-i2c binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/i2c/apm,xgene-slimpro-i2c.yaml   | 36 +++++++++++++++++++
 .../bindings/i2c/i2c-xgene-slimpro.txt        | 15 --------
 2 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apm,xgene-slimpro-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-xgene-slimpro.txt

diff --git a/Documentation/devicetree/bindings/i2c/apm,xgene-slimpro-i2c.yaml b/Documentation/devicetree/bindings/i2c/apm,xgene-slimpro-i2c.yaml
new file mode 100644
index 000000000000..9460c64071f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/apm,xgene-slimpro-i2c.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/apm,xgene-slimpro-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene SLIMpro Mailbox I2C
+
+maintainers:
+  - Khuong Dinh <khuong@os.amperecomputing.com>
+
+description:
+  An I2C controller accessed over the "SLIMpro" mailbox.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: apm,xgene-slimpro-i2c
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        compatible = "apm,xgene-slimpro-i2c";
+        mboxes = <&mailbox 0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-xgene-slimpro.txt b/Documentation/devicetree/bindings/i2c/i2c-xgene-slimpro.txt
deleted file mode 100644
index f6b2c20cfbf6..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-xgene-slimpro.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-APM X-Gene SLIMpro Mailbox I2C Driver
-
-An I2C controller accessed over the "SLIMpro" mailbox.
-
-Required properties :
-
- - compatible : should be "apm,xgene-slimpro-i2c"
- - mboxes : use the label reference for the mailbox as the first parameter.
-	    The second parameter is the channel number.
-
-Example :
-	i2cslimpro {
-		compatible = "apm,xgene-slimpro-i2c";
-		mboxes = <&mailbox 0>;
-	};
-- 
2.51.0


