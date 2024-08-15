Return-Path: <linux-i2c+bounces-5443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73548953CCE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A514C1C2563E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 21:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A01615381F;
	Thu, 15 Aug 2024 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MN5zuBtT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE215381A
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758021; cv=none; b=FyGDPZXSQDTG1fOtIM1bR91zz6GJTuMl5CmVb+Ews3O5SxVl8a2vHLPgHFtHjhkCO2t7cBUspuMjosAc5e2pZFY3qihik3aU1dg+Vd1UHB29o9qe1r/cITcLAvY3QCH+tNH5o8WX+j7pW32AXiM5qWxFnedpkiWrywYDH/2Cb+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758021; c=relaxed/simple;
	bh=EXxKVP9wze1+GWixvMjhq/LYI1QHRZcPF6P1jWQ2DBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdmyLcezkC0QBSmmFLWDq8+fdP0d/YdK/vw/uvRzVHMWscWjJLJyMwhdh+wGsnaqn4auPru4e62felCzx5LHqW5zNiWDgL48r4pflYO/7JX2m60IsOfv05WPmQx6OBHC+6XTcwFiR+pObkae8dJXlXCIooVBtUgIdKll9lm8mK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MN5zuBtT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=qq3ScW5pg08u1UFPZa79aJfX7ldEfNzfsS0vXLeKG/4=; b=MN5zuB
	tTnANhH5KeMJxk0ZsRnE5DYlsTHLT3FEdEz/rC4ZNERU/PnS1/lfl5YTbnMU1giV
	92QxVqpEXzOyNvKv9V/W64/sJkyQprTP1aA74hfaaXjf/l3RIrNmwhjOvCiAtcF6
	U8ka+AVy/3BWPK/xad6ncOsK/GXBLGpnJJGLjersNWEpiMXCXc+JVOrIjc0AyUV4
	vDNKlfVLTWNS8sWT5isbuERS3bVEmMLT/GOfsl6/gtfcOiytrnM6QnvqjRQU1kdG
	MXEpH32OfUf3DHPELB1lofQsR0giujMNyHR3P1tcYwUamjfOS80ZdyvP8cYR9wDN
	l4c2DqI0JOXEA2Vg==
Received: (qmail 2404152 invoked from network); 15 Aug 2024 23:40:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 23:40:17 +0200
X-UD-Smtp-Session: l3s3148p1@6DdIsL8faI0gAQnoAH4zAClVBN/DeGcx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 dt-schema 3/3] schemas: i2c: add generic interrupt name for I2C controllers
Date: Thu, 15 Aug 2024 23:40:13 +0200
Message-ID: <20240815214013.6519-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
References: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"smbus_alert" is a generic interrupt name for controllers, so document
it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 6dc73f8..97d0aaa 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -90,6 +90,21 @@ properties:
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
+      - contains:
+          enum:
+            - smbus_alert
+        description:
+          Generic name is "smbus_alert" for the SMBusAlert signal. Other names
+          are left to individual bindings.
+
   mctp-controller:
     type: boolean
     description:
-- 
2.43.0


