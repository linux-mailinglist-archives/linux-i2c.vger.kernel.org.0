Return-Path: <linux-i2c+bounces-7092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEF989EE8
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 11:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4BB250AA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 09:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6D118BB9E;
	Mon, 30 Sep 2024 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="x3R2DN14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E24818B46E;
	Mon, 30 Sep 2024 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727690159; cv=none; b=qOOwVY992uBr9KyEnoXVKlBLVY2utkksODCOmRCqDq4qFsnWLQp4UADehDgQg44vjtu2LXum9AilpYN55xwXci07CbIdJiHRumMJ4nNAoIEKhZHIjDShU0FntEDYIGfA9GuI47dF2eqSdqX4YM0TrkoMnggZzGHto1On2Knv/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727690159; c=relaxed/simple;
	bh=F7eatHJ8LzhxtrI6xOGtT/HyBoEdBJlHgWoOpFBeduA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jctSRiSidsKJrcLjVcI7KXz0RAvytxHqfhn2WkhgouY+dr0CKUMpHdc3Iiorj5gdIsbKbWTAbwr5kwm/ls+sxcDhRSuhV0qipTlu+nhBROxu2L3fu1NrSX1rHEPyIDtsXfwRyhIQG9BuAkiIpECOlBSfPzg4yswCPCD8+7NwHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=x3R2DN14; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690157; x=1759226157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F7eatHJ8LzhxtrI6xOGtT/HyBoEdBJlHgWoOpFBeduA=;
  b=x3R2DN14jiMwx/cncUn6lX1Hv6V0WpKAhHeMjIlZC1MdsCK3GNA9fs64
   fxvvtTZlGZeaZy81O/BqWCkV4KjmRNKZqEjm3MyxTraT5xw2oFe1WmPUH
   8a/xbmg/4XNlwbk009brWIWnrDjiNekcPf8M1pn8+rLdSKFzCzAZaVTxr
   wdx9+7oo60A5c3Ed7c3umpdmhRnJbsSKDD31XNn7bPnrPMtUdQNAfdsCx
   gqd06kE/Duqqsn2008rXxLY3KFzHfjjsBzJLbNV0AEkTnJDxxK2ipHQwC
   AMTKi4L3n7otiQ2luMXlwjAQISpvbMUbsM7iI1ruMbDW1y5ks1p+7av4Q
   A==;
X-CSE-ConnectionGUID: jBRUFo6rTUOCd1OoCerG2A==
X-CSE-MsgGUID: hy4ywz09RRaYz64k6j1n4Q==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:26 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:24 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with driver
Date: Mon, 30 Sep 2024 10:54:39 +0100
Message-ID: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX i2c is compatible with the microchip corei2c, just add fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index afa3db726229..6ff58b64d496 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -16,7 +16,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+          - enum:
+              - microchip,pic64gx-i2c
+              - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
           - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
 
-- 
2.30.2


