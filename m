Return-Path: <linux-i2c+bounces-9878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1AA6716D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 274514216B1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6B7208966;
	Tue, 18 Mar 2025 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kgr/KZTf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9658202997;
	Tue, 18 Mar 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294205; cv=none; b=nJqkuxaQMVSdU0gEH5FgrdyigBb/UZL4VxQy2m07hnTG276KCKLmVLS7Xhey6pYDqCFIwx6mgOiQLuhdIyG8SR8q3whdeenNlikSamj1BKyxL3VYBIXEnrV8MeBgc6FZwhzO1+UdA5rmUq11DMcyzcDuSaDfGvBk560pclFNYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294205; c=relaxed/simple;
	bh=1bduQFxHNDJHH+XUDBUYfgAKzwoXT5S+0mhmSaW8BUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZq6wWY/H3Ltlt6m3KtSZ8P7UTK0N6nHB4TMyd52yeuxhOVEzcM7Ltr06c0r4rwZRb7NMrW6zH9T5UCSHNEHnf00ohFKz6SDUjor90z2Mt/xmstG+53cipPd5d+TgzSkLhjlyFqmJ3ueDQHem2HroBYTdkcnuSPh1Di7cO1zWyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kgr/KZTf; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaPef3042356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 05:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742294185;
	bh=4WrALZSSvQpY3ltsBfh5xUenzUCqSY3FBHWeams2PvQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kgr/KZTfdwbx2bJYn9o9tI12vF0tDli4C9/u1DK9+MQBKOQfCraj8/SpX7ANx43jx
	 RqWuXJkGHz/cZHceeopc4asIqVjyBRS6S4TMiGrplvbc8P/XJFGlhoCnlSAidlsmLm
	 vW0yOE2Ydt3Z4YwSZKqjiufuEl/eLQCVUcEDyS2E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaPYE007077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 05:36:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 05:36:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 05:36:24 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.98])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IAaOXR042184;
	Tue, 18 Mar 2025 05:36:24 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <vigneshr@ti.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <jmkrzyszt@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH 1/2] dt-bindings: i2c: omap: Add mux-states property
Date: Tue, 18 Mar 2025 16:06:21 +0530
Message-ID: <20250318103622.29979-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318103622.29979-1-j-choudhary@ti.com>
References: <20250318103622.29979-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add mux controller support for when the I2C lines are muxed after
signals come out of SoC and before they go to any client.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 8c2e35fabf5b..58d32ceeacfc 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -47,6 +47,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     deprecated: true
 
+  mux-states:
+    description:
+      mux controller node to route the I2C signals from SoC to clients.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -87,4 +92,5 @@ examples:
         interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <1>;
         #size-cells = <0>;
+        mux-states = <&i2c_mux 1>;
     };
-- 
2.34.1


