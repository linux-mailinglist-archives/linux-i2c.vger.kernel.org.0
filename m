Return-Path: <linux-i2c+bounces-3210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA538B3550
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 12:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261081F21F96
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351361448EE;
	Fri, 26 Apr 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P+wi73+7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092041442F5;
	Fri, 26 Apr 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127453; cv=none; b=uyh3bSIxVZKtEVUFGl088Ez1/LauOZtqvaxpne/Y1XnRIm68eK/a493ci4SedCA7hDMOXbX9StCUiKxdzzVnuriCzM8Wz0kJQh8NlStTJFZFnR7Br071/qADyeG1MiSP9DFmyIEezzs4wOjNZaXNNzl/ZxiPXQiUWafh8WHUF9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127453; c=relaxed/simple;
	bh=rg/0VTiRtQxLAJhWTV/+t0EY1c/vG9T2Q18sL8FzcgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ueiQLvISul+uze3nLBPJuq9xlkbC1NDYm3FaIQhvG8X0QoUBVUj3bywSbmrZEp4yVhmdSJ+zjU8/yrYhMb3i29QyrzIBslCHLK27M6B0ubMlUYzeTyyDb3STn7c0s6Mae21i7fdfperFxBPx+PWa05Os4yyV3EBl8huSKKttSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=P+wi73+7; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0a8bc9f803b811efb92737409a0e9459-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PLr5dT4jbrf/zNIVr/8qtwms5d+q2N/tPQjH0HzY6AU=;
	b=P+wi73+7pDPo0ogPZM5EdVtCKpC0IGW6vX9suMLEB1UpHpi2wTDODdtIkZAFjN2K5IpPO9A8gROALCKT0n/JXMHJlGjq/3N8cEIJOwQPGSflWTrhmP8gRmS+9VCjutdoZMdgDKkdWMKYAVH/D1UDBJRMlWHHrKPG0yCqPY377qY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f843e558-30ba-4fca-9b60-a4969f1a73bc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:c34763fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0a8bc9f803b811efb92737409a0e9459-20240426
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1157151064; Fri, 26 Apr 2024 18:30:45 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:44 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zoie Lin
	<zoie.lin@mediatek.com>
Subject: [PATCH 3/3] dt-bindings: eeprom: at24: Add property dovdd-supply
Date: Fri, 26 Apr 2024 18:29:49 +0800
Message-ID: <20240426102949.23057-4-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240426102949.23057-1-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

From: Zoie Lin <zoie.lin@mediatek.com>

Include a new property named dovdd-supply to provide an
additional power supply.

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 8befd09963be..0ecb7ea76d1d 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -193,6 +193,10 @@ properties:
     description:
       phandle of the regulator that provides the supply voltage.
 
+  dovdd-supply:
+    description:
+      phandle of the regulator that provides the supply voltage.
+
 required:
   - compatible
   - reg
-- 
2.18.0


