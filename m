Return-Path: <linux-i2c+bounces-4599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101C9255D2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 10:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407E3285CC9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 08:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBF213D2BE;
	Wed,  3 Jul 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MVLxkoiF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EE513C8F4;
	Wed,  3 Jul 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996520; cv=none; b=rWHYbAQF3Ra25jl020BBgZJ9FHPma+BkfKykqTk0y5tXTJbCYQKiGcECFFGyWhaAor1fYZLwFBJgbZfpK3psk4+dN1FFx6fXxVfhLOaqK1cf40PxaAFBqiGiRbKYY/CAIVTGPE32jxVG+tFR6vaGYwBuRnY1z4yos8debWclM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996520; c=relaxed/simple;
	bh=hkCQd1grkSXjq749gl/KZxjV8DnGi4H2CmXCRKQAUWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDypP+lGmSnqiNwcn7UaU5GZM4AuGuuf/1xEhfa7VfoPNtv5i+gafn6gVXHpbruwKOxh50OahEfLkQYRPX394WjHOu2YEz14kd+vsdZw9JGsZRzW5YYVXQYNCcX2HsZvnAcV2JiaNPfe2C9Ma0pyBL69kfbQJJoXKCe94+bL/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MVLxkoiF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719996518; x=1751532518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hkCQd1grkSXjq749gl/KZxjV8DnGi4H2CmXCRKQAUWU=;
  b=MVLxkoiFc3AL4nxftdNqHGlq5Msuz9fSwrd/S5UQGF3qHvAcNo3/sZhe
   hg+c1OH4LbY9R3jouKIKIUa8k5oJIGPJSp7tb9H3JpVPLLH3k6RhL5PUy
   F+Gg/KhD7/q+NOpbqxgbselxBHYr2LB0P7JZoa23M4sS0Xnh0IFM4bj2x
   aQalzIoCm2L6WyZE+JAsV2gniIEem21MniXTXqGwRxUHqBZp/ohDemunJ
   pFu0+ivt9+KL/ABxd1EGuWNPqqsXo1PVhCGOzhhslWmpta3ljWm+n06J8
   7tqXQ3vVJd2OPsoal5vZJAtil07RHxtTjFNMaLFp/IFcF4lM/srRNnNpJ
   g==;
X-CSE-ConnectionGUID: s71X572eQVinIeDMsyDqRg==
X-CSE-MsgGUID: 5FRwwSPJSdyu4F+Y3OQNSQ==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="196193660"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 01:48:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 01:48:08 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jul 2024 01:48:05 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 3/3] dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64
Date: Wed, 3 Jul 2024 11:47:04 +0300
Message-ID: <20240703084704.197697-4-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703084704.197697-1-andrei.simion@microchip.com>
References: <20240703084704.197697-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for compatible Microchip 24AA025E48/24AA025E64 EEPROMs.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v3 -> v4:
- change the rule to select compatible

v2 -> v3:
- commit subject changed to reference Microchip 24AA025E48/24AA025E64
- drop pattern: mac02e4$ and mac02e6$ and a-z from regex
- add these two devices down at the bottom
- added Reviewed-by

v1 -> v2:
- change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 3c36cd0510de..4d46b8c5439d 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -18,7 +18,9 @@ select:
   properties:
     compatible:
       contains:
-        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+        anyOf:
+          - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+          - enum: ["microchip,24aa025e48", "microchip,24aa025e64"]
   required:
     - compatible
 
@@ -132,6 +134,10 @@ properties:
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


