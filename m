Return-Path: <linux-i2c+bounces-3211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C418B3553
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 12:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1FF1F2194F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA349144D1A;
	Fri, 26 Apr 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fEhizmxh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAF14430A;
	Fri, 26 Apr 2024 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127453; cv=none; b=YMZGM7j1GtcNCyoBz0AXLLxqMAE991Jf8oItcX3N71WEK+7U8Am8IWNVQcDHYMbPhZBmv7RJO0kZwhev5cfo5I5b1IHcptX29Jx9i/LHNYNSFQ3xT+EwaDEmX4pexqx05fTur7/kR+aqvt9AXJin3SBNoNoizoRuwYqndyJnk0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127453; c=relaxed/simple;
	bh=WE2u8JxgUgz4uayXvxYedBLBCwUL7G6G7bxOAAhCyy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7dWCikA/xgNQ8v0BW7+gpOPELg15FPdLhvdLAurC595g30WkPydfoPm+aI+3/sNeJW7e7ezhKjllYTyspvmGLjr/SyZ35pxA6nMm3kOQf8fbPfYbfV1H74+q/6mYitX/JluGM2CP83E9tWgEcuIzvNoeLWdZi/WqOFm8wRjypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fEhizmxh; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 09f7de0a03b811efb92737409a0e9459-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ysDYALdPlitNAh4jAqVaMKhwoZEUpnFw/l18q9KZZ+s=;
	b=fEhizmxhZ0h8/G45ea6Z7VF5DawzAmCUTcuqa78IDsWJoCPiCYjw3Udd7Qj6RCdPBCq/Hv/A8JhHw4iiHXkB7j8p30rAuga40NkYO90oaXl+8I2s9eyJS/7lJ9HaKoEf+M313l8EfglpbNejCmYd0022vRh9T8A2rGQC50vBAJA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:22a81262-c785-42ee-87a2-c2403edd05f2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:366c2683-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 09f7de0a03b811efb92737409a0e9459-20240426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 793937326; Fri, 26 Apr 2024 18:30:44 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:43 +0800
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
Subject: [PATCH 2/3] dt-bindings: eeprom: at24: Add support for at24c64
Date: Fri, 26 Apr 2024 18:29:48 +0800
Message-ID: <20240426102949.23057-3-zoie.lin@mediatek.com>
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

Update EEPROM bindings to include Atmel AT24C64

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 1812ef31d5f1..8befd09963be 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -131,6 +131,8 @@ properties:
       - items:
           - const: giantec,gt24c32a
           - const: atmel,24c32
+      - items:
+          - const: atmel,24c64
       - items:
           - enum:
               - renesas,r1ex24128
-- 
2.18.0


