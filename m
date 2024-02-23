Return-Path: <linux-i2c+bounces-1951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FE861968
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 18:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D5681C24816
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 17:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDA513B785;
	Fri, 23 Feb 2024 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tAk4AQFW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A61384A3;
	Fri, 23 Feb 2024 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709130; cv=none; b=CDB6XhNJykIwtpGDmMk9IDFz9Gm4wG53F0EuWmPkyTnxUL6aUCJR2HoRbQGrYpSM4egsZMI3TMIT8Wy0RQuAVOg2Ev5/n6oidj7boBjakDr1KoErJPSj/uV7eOjQscqC9JJCniEohisxmTiHkSsC1iiDYD0Z+uQqu5haZM6SHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709130; c=relaxed/simple;
	bh=ndkSQI5Phz/pugFNXsdTMXAeuRKThwlhw4akLYKlS/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9oJm4GNmNGBvNcSs0LcKwhfHACDPmh1R2ZQ/n85kDC9OPDOgWHb16+Z/PQlY3pPr9l2zCWXlCKn+7YvKvmZbpvzNuj7QLx8eOiIyT4cNT1V+lb2VsXIg1AfUUrGdjvm3QNTqSbGuRdoV4jw+Rn6ELJb9kWp3pb+kasZmkg3eMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tAk4AQFW; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708709113; x=1740245113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ndkSQI5Phz/pugFNXsdTMXAeuRKThwlhw4akLYKlS/k=;
  b=tAk4AQFWYhupwAF9vIBjLZw2txGkWJ0ejHv2revyVhEf6Oyl9Qzlhbj6
   J/3qyIqWMbIENcNSDkrPOlUM/pvdAWfO8YITeadlA0uB1RNqIpeUWGlvF
   UotoFuhwe8a1Yuw6Ysc8s3GlpJL6giSNcnjjkCuOnLB2rX0cXqs0FvOzG
   hdo2v4h5RXych6yVxqT0rkgwsGRv5tuzwuR99bzidKJKn74zZJayLruPh
   ZokjMzsXihH1VtxWfxFLQweIjBa6tt3MXiEBimYHl60bezjWV+poBrWKi
   c5tmcBsbUbZLJcVmQrQHijnNnQo4J1v6ObE2g1KC10qSXWCqdAauil/fd
   w==;
X-CSE-ConnectionGUID: v7hxkNo6SBe1d+wSFbAzdA==
X-CSE-MsgGUID: 5MMVxV7kRIq6fdV2JxxX+g==
X-IronPort-AV: E=Sophos;i="6.06,180,1705388400"; 
   d="scan'208";a="16734401"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2024 10:25:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:25:08 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:25:04 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <andi.shyti@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v4 06/39] dt-bindings: i2c: at91: Add sam9x7 compatible string
Date: Fri, 23 Feb 2024 22:54:59 +0530
Message-ID: <20240223172459.671832-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible string for sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
Changes in v4:
- Made sam9x7 compatible as an enum with sama7g5 compatible
- Removed the sam9x7 compatible from allOf section as it was not needed
  like pointed out
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index 6adedd3ec399..b1c13bab2472 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -25,7 +25,9 @@ properties:
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
       - items:
-          - const: microchip,sama7g5-i2c
+          - enum:
+              - microchip,sama7g5-i2c
+              - microchip,sam9x7-i2c
           - const: microchip,sam9x60-i2c
 
   reg:
-- 
2.25.1


