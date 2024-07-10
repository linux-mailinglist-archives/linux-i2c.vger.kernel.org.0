Return-Path: <linux-i2c+bounces-4846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FF92D683
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 18:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86DE289F38
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 16:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9718F195804;
	Wed, 10 Jul 2024 16:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qNJYuxlu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D2194AF8;
	Wed, 10 Jul 2024 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628809; cv=none; b=d1XsUpJcr2DfDLKqVlNVwVq/mQ3n2sNfbqGUwO7764TTKPio3BIdqfVbjwK1CP2n3xA/GUkdug+X0folJ1E6S8euDQBvPywrD3kW/HaRu1mYU6rafsXNgLpQMtIKgL+LB3Gv3AN46rLsjFqaGfJybemui70DPlsAqYwaVBKx2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628809; c=relaxed/simple;
	bh=f4AWJ4v7LBNJ1i5ZPwA6x/8HFvJo4c4qap3ClodWtdU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qgYRvYgGyo5BwRBC0ks50vBJi0sndN48tqJCOBk4RuKl5B563m3tIquKs0UZU5rsroGwOxWOijedv/NxgyrT58eBWAdSDh//xiTrlxz+jQTyorB4PQrN2I2/6zrmA7lT2S0Zb56XiUHZDEMakC4aelfMSoq+2zVywGPOW8gyVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=qNJYuxlu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720628807; x=1752164807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f4AWJ4v7LBNJ1i5ZPwA6x/8HFvJo4c4qap3ClodWtdU=;
  b=qNJYuxlumSVnHLPO1Cg+eE6WBb0QBpH/yL2Bi0n6rOU1JDfpm2ybe6PI
   W8Sfewlpn9LMnzpomRs9q9P11XjtDqufuNZBMKaj4LibBCqFgou10x2cN
   oY74klzkUw9mQaCZa+vXHiYuYITfu6gzkjGmeOl4pjDVQPf5bh3QtWdBv
   kTw0ny14PxTe+krxphbHznDj7xHVMRePBlOSTF+GQUYf8qZcMg0CLB/1U
   WM6T0a0uQP5uQBrsWOIQNYQow2bbMdWCVj1XeUBY1q0D7cYURLRAhTDbT
   bjOwygj9nnJUPoqNdyKckaTpgPwwF5hoe5mhkNd9cGoPPy4DkPU88qHPi
   A==;
X-CSE-ConnectionGUID: XASOd4uNTD+x0ce+O9FQrA==
X-CSE-MsgGUID: cLKmhQ2tRUKqBsKw0SCqzg==
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="29043742"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2024 09:26:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jul 2024 09:26:15 -0700
Received: from ROU-LL-M43238.amer.actel.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jul 2024 09:26:12 -0700
From: <nicolas.ferre@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring
	<robh@kernel.org>, <devicetree@vger.kernel.org>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>
Subject: [PATCH] dt-bindings: i2c: at91: Add sama7d65 compatible string
Date: Wed, 10 Jul 2024 18:26:15 +0200
Message-ID: <20240710162615.332888-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Add compatible string for sama7d65. Like sama7g5, it currently binds to
"microchip,sam9x60-i2c" compatible string for this driver.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index 588478862bd1..e61cdb5b16ef 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
           - const: microchip,sam9x60-i2c
@@ -78,6 +79,7 @@ allOf:
               - atmel,sama5d4-i2c
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
+              - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
     then:
       properties:
-- 
2.39.2


