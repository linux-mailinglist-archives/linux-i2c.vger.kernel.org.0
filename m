Return-Path: <linux-i2c+bounces-4199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DEF9124ED
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D76828692C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E105152531;
	Fri, 21 Jun 2024 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="chXBISbe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA9150987;
	Fri, 21 Jun 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972189; cv=none; b=DzBrvl+49AxwZ4PXE76GmdXd0F20KIziSHXMViuOtMR8wvgu5VqL4tSHxpOu1o2eZXcsQjlCe43NAvW20F6a9n6v0Lej7j7Ydo4UxQn7KXQWwPFk2N1ZVh3BxZ6ci4S4H7jp5A8XtBzgCMSLK1UyTIebKm3mCPecxyFsXZj0EOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972189; c=relaxed/simple;
	bh=DLGtNfIqLfdnmgMX86fYOxnAcJeOzt5lc4nHJ/M0G/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aik+/GPQdwsXPYJqXHEaYpvFomSgiY2YJ/aGkGLErDzpCe59uEJbYBTvs9l4U/JcANhdB4htJ8fGw0bdyxt0bnWFbroJlyvm16vq6r7cbSb0uln3pXofM6qhHapQvqn3Z4Wyw/a5kb21GKIx3zaIv9nGSiftF04wZVAfjRc6kxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=chXBISbe; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718972189; x=1750508189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DLGtNfIqLfdnmgMX86fYOxnAcJeOzt5lc4nHJ/M0G/c=;
  b=chXBISbeGxIVidBX/HVwg4LxUOfQo94L/TZHoViBy2kyS5enRPFaf2DG
   GfFJGixsizscTXLjfO/XhErQmIlrUowVWZxy3okMu+F9GVxz9Som2Lp9b
   T7akHSDI0QBBHpkswt1I59mpC8EXoxONkdrkVRR0gl6KpIuM10NIKZ51Y
   p7KKsMxHjykUtnwm6VZwMW6/Zv07gU3mmFeU4TqMW6dxgpNA8FUzEwjhC
   SaL1W1x/nVJCnaD45uG8z1q28L4c6sUwx/lYp+U5029AXIySwSCA73xr6
   WpwBtpie+O3g6+vRbn+8hlPal1IEpFIfx6EfToL567iRJEZNA8vwI0ry3
   w==;
X-CSE-ConnectionGUID: gjF6r6nLSZ2qzzloD0+0Lw==
X-CSE-MsgGUID: r7oD/OZUSXaXe1SQ6ixGXg==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="28341533"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 05:16:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 05:16:13 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 21 Jun 2024 05:16:10 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6
Date: Fri, 21 Jun 2024 15:13:40 +0300
Message-ID: <20240621121340.114486-4-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621121340.114486-1-andrei.simion@microchip.com>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update regex check and add pattern to match both EEPROMs.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- change patter into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 3c36cd0510de..f914ca37ceea 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -18,7 +18,7 @@ select:
   properties:
     compatible:
       contains:
-        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+        pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"
   required:
     - compatible
 
@@ -37,8 +37,8 @@ properties:
       - allOf:
           - minItems: 1
             items:
-              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
-              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[a-z0-9]+|spd)$"
+              - pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"
           - oneOf:
               - items:
                   pattern: c00$
@@ -54,6 +54,10 @@ properties:
                   pattern: mac402$
               - items:
                   pattern: mac602$
+              - items:
+                  pattern: mac02e4$
+              - items:
+                  pattern: mac02e6$
               - items:
                   pattern: c04$
               - items:
-- 
2.34.1


