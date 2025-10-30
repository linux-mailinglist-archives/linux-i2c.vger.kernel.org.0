Return-Path: <linux-i2c+bounces-13898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF7C1EDD7
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 08:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85ABD188D002
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 07:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7BD337BAB;
	Thu, 30 Oct 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pBsx3SMj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B115CD74;
	Thu, 30 Oct 2025 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761811009; cv=none; b=mMGhrULSjMIS3Kifgq1MNoTxj9V17QLSa3j7tQfhByaeqQwPQ/whzLyG9r8ftND91rj7EtEDSYAIhVDxxtRXChho6mERV7l08rLX7oXSCcfT4IEVgfqo67CnjX6/1sCRsep3l5dslCfTQmoEJVEg6HzxlvV3isXhethorlAEXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761811009; c=relaxed/simple;
	bh=IiJIHtx4LNQ3qF/KRvZQ+MHK5HTeIwkOeW1dOjSZDFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cODaZ6fNsh8cTuG9kmAFfiOxWW597NhOjWQqd6zR1a9QG0vTBPSBtAStxbKBV64kt+aBxuiLw493y23SCY+hoGpLr73y/VDJ+f3yXltiUwO7YUGBa8G+TFt3gXluHAl775/h+/6TScd4YQ5StEVowHvrdkxUrHdz2En34pkgZh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pBsx3SMj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761811004;
	bh=IiJIHtx4LNQ3qF/KRvZQ+MHK5HTeIwkOeW1dOjSZDFs=;
	h=From:Date:Subject:To:Cc:From;
	b=pBsx3SMjSEC7MviEGO95wmcJHfj/QHCzMV5mPbg2jTiLtL3KTJMqot4SkEM95Nucu
	 nzqrx6dmA10b9IV7XzYc5Z3YuRdvcOdn761vEoxBfEZ76m4XxuuOwd+qs2piGTBj+B
	 MBcMHBUERxTAYltU/EgekrkEY/C1Tvn+daLNFvgSNhZ/nvXX1CRYWPiKamWeE3YXdk
	 fKFAyQGquPfQEzCatN9BlBSWxVblZ6ZvdKrRa9EHkE4gprzEMBfmlj7E/wLCZeEe5t
	 omEWFcI61+gXYPj+S2U1YKFMXmq5ipY2Q+eOVv9SvsYCBNef+NRb9V0FzmYxFWJCTf
	 xFafOHvGCw5kg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 250C517E0CF8;
	Thu, 30 Oct 2025 08:56:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Oct 2025 08:56:29 +0100
Subject: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
X-B4-Tracking: v=1; b=H4sIACwaA2kC/yWNQQ7CIBBFr0Jm7SRAbYRexXRBYayzgCqgadL07
 hJZvpf89w8olJkKTOKATF8uvKUG6iLAP11aCTk0Bi31qKS2GKtRxmKouHAKnNaCrD3egjFXGmw
 YXYA2fmV68P4P3+fOmd6f1q9dwuIKod9i5DqJRHvF/jFImM/zB9YNynCZAAAA
X-Change-ID: 20251029-mt8189-dt-bindings-i2c-7d884e39d5ad
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761811004; l=1109;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=IiJIHtx4LNQ3qF/KRvZQ+MHK5HTeIwkOeW1dOjSZDFs=;
 b=XbTvX83Kx4NFoKuoYVDYvyO2jrZ+6lSryjDVRAiL9yZSEGCjOm1sh87rkoRpIj55MypbtBG07
 wXWsB68KKBTBx2/9vta16iPk7IiYriiM8xfF5JWu81zhBvdx+jOC9xn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add compatible string for MT8189 SoC.
Its multiple I2C controller instances are compatible with the ones
found in the MT8188 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 3562ce0c0f7e4889d34410a9d32e1c8e6ddaae0a..ecd5783f001b3e1c2a29aa6575141093ead4e6a2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - mediatek,mt6878-i2c
               - mediatek,mt6991-i2c
+              - mediatek,mt8189-i2c
               - mediatek,mt8196-i2c
           - const: mediatek,mt8188-i2c
       - items:

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251029-mt8189-dt-bindings-i2c-7d884e39d5ad

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


