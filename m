Return-Path: <linux-i2c+bounces-14564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6ACBFECD
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 22:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DF9A301FF8C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 21:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A108633891B;
	Mon, 15 Dec 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMNMYp94"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E85338580;
	Mon, 15 Dec 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765834093; cv=none; b=o0uvVEqVHCyoD91b0hYel4ZQgSlfZeF1zkKL99bw1HtPoppIkX0UNKIImX0skuqpxwUX/MDcx1vjw7Xcp611puNxNfKmDAwS8dFJPBk5g8XyoGGNKl+I7ziMpbgwZ5+igyafkRBGtnCGqiC5hJKeg97kFZcYgdosqDCMapndpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765834093; c=relaxed/simple;
	bh=MwEPe6yOtotUQ0GRK4y2j5mze7HbrjZNWC8je5U2g4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=taO9/r4LaaD/7e5c5X+Gbk8npEEMvpUSZTntblvpSfi+FnA1XsNXDfCoDlvd/ofXLGOdhmPV8Ke9QqeS/uZB+G+ElLOBLhZfzKiPuZRRK0k18TCNVzb7ZJnOnjsqqMeJ8w+GlOtCPNuxs4Nz33fNQGikScwJVbgLiYdvOSk54mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMNMYp94; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03545C4CEF5;
	Mon, 15 Dec 2025 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834093;
	bh=MwEPe6yOtotUQ0GRK4y2j5mze7HbrjZNWC8je5U2g4A=;
	h=From:To:Cc:Subject:Date:From;
	b=NMNMYp94q3rH02CLHtiICX4yi2SW3CvsA9RB0BVOaoPypPzYeGLxD9YTdO8dLJ/Xz
	 zANEhXvJS3ikKvKMzRJdTlYXKfgTuq98Q4iL43IGeYuChH5/VffYjp+EuwvO/rG0/D
	 ps6+N3X7L+Lqxbpovqf9oBd6OO6Xys+qkgdwD9+KdevYiRSym3goCVBSpxJaC38Cfp
	 7TEg5ew4/RR5IjwrBciHfMUyn/GBbKEEVuxU1wedYwqUQuG1ioTjzbRiFhDf3aV8ih
	 8xBlVxdyCb8kHbZi0Rf6+1ch9RvNJDRK00D8x+GEG9oCQoYV5J/BqNwP+jYSZcGJOO
	 rwBhjzqREnkDw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for brcm,iproc-nic-i2c
Date: Mon, 15 Dec 2025 15:28:05 -0600
Message-ID: <20251215212805.3322218-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brcm,iproc-nic-i2c variant has 2 reg entries.

The second one is related to the brcm,ape-hsls-addr-mask property, but it's
not clear what a proper description would be.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/i2c/brcm,iproc-i2c.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
index 2aa75b7add7b..daa70a8500e9 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
@@ -16,7 +16,8 @@ properties:
       - brcm,iproc-nic-i2c
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-frequency:
     enum: [ 100000, 400000 ]
@@ -41,8 +42,15 @@ allOf:
           contains:
             const: brcm,iproc-nic-i2c
     then:
+      properties:
+        reg:
+          minItems: 2
       required:
         - brcm,ape-hsls-addr-mask
+    else:
+      properties:
+        reg:
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.51.0


