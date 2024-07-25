Return-Path: <linux-i2c+bounces-5059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6193C1A3
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 14:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067F51F2479C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 12:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943E19AD58;
	Thu, 25 Jul 2024 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="WTc3tuKg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EB19AA56;
	Thu, 25 Jul 2024 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909809; cv=none; b=pHW+NJ7fjsIxb50N1thSl3mKnBeaMvO8GZ8vToNUiHCXthdhULCgMz17IOcycuQhfqZutLiNwCdhgOrzjyHkb2YffsZyuzaA/XhyKMV+fWzEWiucpRJ5Sjz8jJtMKIpzXgsWpuZvgBsthE2frzA4ozjDNaFG//P0SUhOBJ8/MX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909809; c=relaxed/simple;
	bh=15hyDjA6CZyVRgtJnFulDkwlNePq5xuT1A/C4/KCaN0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwFAaXlKhATMLn9YbOm9N9QPr4T38kxtekMutJJ1dv3ZGb3PAMmh7rxlgaPzpP7ADDfWjRQsmjE32wlZoKP03oOkHQ4NHS1Z2TiEMpGtTQe1Jzr2Y9crMkJiWZFFR40xmIN9ii8P0qNtBCLiEljSrFPK3yaDMyQIgnJ9pMiPJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=WTc3tuKg; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909808; x=1753445808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=15hyDjA6CZyVRgtJnFulDkwlNePq5xuT1A/C4/KCaN0=;
  b=WTc3tuKgMlDRG52aUutmu0NHdu9LjuvrqfxMBT8rmEsov7DmyLiF9G9Y
   a67oTaygzLMdwAW4vYUpa6/JJYlPq244HjsKKgw9DLAZ9Nc9RP9cR52st
   q/CDkAineU1O4QwLKjBgzaELe0eWZVn6EZTnVZXWW1po4lqVwTD3w0NQB
   w/hs7kFLyMwmzTbDlTCiCyxum/63iWJj7Ja5Vuo+j78fmLdQ17gR5gxH5
   a6bAWeDjAfq2ryCRIVpwA6QXrf+eDNQL6mbk29s2+PAVeyOue+ZNvGgzr
   FNbf1UBDLGqHWZPeba6amhq7aKHyxyZObqoFnYS688qwoI+BCHtLgDAEx
   A==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: NS1Uot/LRn+ZUzEjPoqsLQ==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092683"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:43 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:41 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/17] dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with driver
Date: Thu, 25 Jul 2024 13:16:02 +0100
Message-ID: <20240725121609.13101-11-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX i2c is compatible with the MPFS driver

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index afa3db726229..4ba8a27eb8e5 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -18,6 +18,10 @@ properties:
       - items:
           - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
           - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+      - items:
+          - const: microchip,pic64gx-i2c
+          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+          - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
 
   reg:
-- 
2.30.2


