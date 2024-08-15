Return-Path: <linux-i2c+bounces-5424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9D952DE4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E29B27E4B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223551714DB;
	Thu, 15 Aug 2024 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PQLC0Dzy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538317A598
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723785; cv=none; b=NmsWf7N5Dt3ZF2C8vqrzEKsZirGoPinItRmwO5B/d3n6+Do5w5y65tYKKlerFcNq0G4p5h87jnh+JU5RPzTFgyFgjfBZnQ/f18rG1moPwWNwYY949Niz3TYHoczj9U5xPRRiy3qYR9gi3ffjJcZKf/xvp208dwolJDJRinPPX4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723785; c=relaxed/simple;
	bh=NfNdMYWEA9SnNDDzCeI08I7NGAbQp29CyqUII+RCRPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceuANdyT6CDUCYslpfKUxQD5s0+l7J4Wr74fjCeksHQ0dzV2bRqfLMCjDyT595laUsqlOoDANpZWSJ++F6A4yYmGJnn0yyf/q+A5KfAN/ve1xtcnKr8svOG+GDUa9t/miCPCmQTwuRQSVtfuG4FtAF+P+/3l5/dSauKO+3uuYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PQLC0Dzy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=09w6kDaqu00DkGye5dLu0ngPbArU6KUpsKaCt+tBKbc=; b=PQLC0D
	zym0zfnqm3Iridmo+bBbOli2GppghRjLbs9pGZQyAeRKhkEUr19Yz31WSLU5XVqQ
	lv9cL2kVY0HAVCInHf7D5prM+1mjCluW8xJWMoDRel3Jp0wYQzyb+UuuRXbi/K2I
	hD/iDiuELdB24twxE+RE6WHgDgeChU3oGNUSOhvhpymOfKk/t9up/cDpEZJFgDti
	16gy2t6O6H1REL39eAP6AdEG12Wu8RG4IxuRBS7CTXIAGwGbqN+5Oewb1UieaZKo
	DopjqEqKqBBGDVm5ZY9fQsXoACw8Gk8sWMETIlHN0amYVroA+VA/ku6Z3sxiyxUB
	fdeJ4Fo44EJka+tQ==
Received: (qmail 2282032 invoked from network); 15 Aug 2024 14:09:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 14:09:39 +0200
X-UD-Smtp-Session: l3s3148p1@uyKNt7cf+tBehhrc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH dt-schema 3/3] schemas: i2c: add generic interrupt name for I2C controllers
Date: Thu, 15 Aug 2024 14:09:35 +0200
Message-ID: <20240815120935.5871-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"smbus_alert" is a generic interrupt name for controllers, so document
it. Introduce also "irq" for the primary interrupt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 7eb6b0f..da277a2 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -90,6 +90,22 @@ properties:
       low-pass analog filter). Typical value should be above the normal i2c bus
       clock frequency (clock-frequency). Specified in Hz.
 
+  interrupts:
+    description:
+      If not using interrupt-names, the first interrupt will be treated as the
+      primary interrupt for the controller.
+
+  interrupt-names:
+    anyOf:
+      - {} # Any name is allowed.
+      - items:
+          enum:
+            - irq
+            - smbus_alert
+        description:
+          Generic names are "irq" for a primary interrupt and "smbus_alert" for
+          the SMBusAlert signal. Other names are left to individual bindings.
+
   mctp-controller:
     type: boolean
     description:
-- 
2.43.0


