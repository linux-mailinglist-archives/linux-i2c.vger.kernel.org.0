Return-Path: <linux-i2c+bounces-4444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9991B947
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621BA285197
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D8014884F;
	Fri, 28 Jun 2024 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XBgXdQKx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6314389A;
	Fri, 28 Jun 2024 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561745; cv=none; b=e+btwUF1N+gVVh7AmcupT9+RrGn0RgIdvDsdzzUipAh76IsIsZBrdY0bolqbbSzWzmbvVjxuVV4ouNrcNEKm2SdBoYrYbhLPf0go8MYIvSoHRUXmWGdhMVzbCuxBFjbfO2CZEy3VsHWpfE2gs1z84UUWHmLBIwEbLh7ZeXBjdWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561745; c=relaxed/simple;
	bh=Wz982HVz9O6n/+m0EQwgU9OvazVwR3c3TSHhRofjE8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ci5e/7KXyDFSgMkYdRuLtGhE/UuFqELfTqynxxRJRKXdlM6JV/9ShRWUYo3KtTuupN40Z9tBtCtJtz3yZvNGpjxwdgdUzg0a9vkmiW45NWmkrcnK/dmuz+6QqG81eiWsArSfmehrTq2om+QDNqCbctgPz/6Uh3Ne6cSRBDwOJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XBgXdQKx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719561744; x=1751097744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wz982HVz9O6n/+m0EQwgU9OvazVwR3c3TSHhRofjE8U=;
  b=XBgXdQKx4zUkNsaqojn9HqM2HzqroInjHIXlcoXkY74EaA0kyP7vrPrp
   0tHjEovCsNyOHm8XKuC84vKpGH9wgvJKgrM1QgxqlvNIEJZRyhYXr6ANM
   Plp9wKAJKdsiJre5eYUhSA8bp84eXNqKZYTpTOmyEis4OE7/rIji0fiEd
   3zuPZT335MDehMs9AhRFFH+I//Ar47Rdzo8D8Z7CHJIAkdngq19qrVyQy
   Z18D7EHl1yIbknah9aw6YdAUkg5IryLS6vgOEqyj8gLWuzW+q0LuKR0IT
   lCyG3EGvy9omFl+3s8hN4b5qt7agRj2WGDWi33ocm9yb4xQ/p82lHOZUO
   Q==;
X-CSE-ConnectionGUID: yumzE5LRQZWNGcwzrru4aA==
X-CSE-MsgGUID: KD5gqNbzR0+ZM1jMBVwfDA==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="28620945"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 01:02:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 01:02:13 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 01:02:09 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>, Connor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64
Date: Fri, 28 Jun 2024 11:01:46 +0300
Message-ID: <20240628080146.49545-4-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628080146.49545-1-andrei.simion@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible for Microchip 24AA025E48/24AA025E64 EEPROMs.

Reviewed-by: Connor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v2 -> v3:
- commit subject changed to reference Microchip 24AA025E48/24AA025E64
- drop the pattern: mac02e4$ and mac02e6$ and a-z from regex
- add these two devices down at the bottom
- added Reviewed-by

v1 -> v2:
- change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 3c36cd0510de..699c2bbc16f5 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -132,6 +132,10 @@ properties:
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128
+      - items:
+          - const: microchip,24aa025e48
+      - items:
+          - const: microchip,24aa025e64
       - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
 
   label:
-- 
2.34.1


