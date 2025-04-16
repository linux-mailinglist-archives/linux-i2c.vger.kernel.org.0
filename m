Return-Path: <linux-i2c+bounces-10416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3FA8B830
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 14:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996D3445CE0
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ABD248875;
	Wed, 16 Apr 2025 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zz4KKZpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F269323BD08;
	Wed, 16 Apr 2025 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804988; cv=none; b=efl8EFKzosUQBWA53Wxtyd0alw5hLcRl0W9i2F0G3TDIULR7lL1z8lbGsOf926YpD+vBWRq3Lv2EZdHyRSfLuEXvmDaPA59ErtohfxzaWMsmeMmI+GI7m0hH08UZ9bgl+R4JzlIs7DDkJP/x8s1dAJ4pfeh7bohJbqEn5zRu7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804988; c=relaxed/simple;
	bh=a3Pe3Q3KK3rIPOMbZY0oB2O3qG07DQXIJk6fVXXFwog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cc8tALv18lWoREsIXd+4h1RdfKQcu/OF5kCdcJta7vhvcIm9WOnFeNatsAYegKjeB++cQU2I6YovCdt+w8gD22gonYBUEykCUc1zYdeiSglKAGuvhGR0m1Wqn/nKQsz7Z3Xmkq630iYc5hAegZ0r2g/zT7YD5pmL4xm6R+eq7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zz4KKZpB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804985;
	bh=a3Pe3Q3KK3rIPOMbZY0oB2O3qG07DQXIJk6fVXXFwog=;
	h=From:To:Cc:Subject:Date:From;
	b=Zz4KKZpBr6XhCNIn3G4W9V2tJq9uR/eIDxV0hl5bjgYugc+BAJY2ao9E1qy2Z6BcU
	 EZWE+A/SgOnY34qNpfgCOVMVi1AER5BBl6RTN0hw65QDK68s++1pY+06+gJiZ/jFxd
	 N99gie7UbqpU/dqvQEjw3m3FyUb2opbmSKy7JDk/N0i/8lDZ440wXrLkl5SYD8aeY8
	 4PWkCf2Rup1TGTwOVU5zS/ESoTYxCBkNT/D6rvpP9b0MskvEgemk/hANBy6cUBHPMY
	 VlvFl2YgdFtOu8SKYmX8gAhOpHuYJKrm96CASatd8HYp2wiyggiBp1tC5ca0+KrMqx
	 Q0MdBvKB+WvIQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AACAA17E35EB;
	Wed, 16 Apr 2025 14:03:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: qii.wang@mediatek.com
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity 1200 MT6893
Date: Wed, 16 Apr 2025 14:03:03 +0200
Message-ID: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
chip's multiple I2C controller instances are fully compatible
with the ones found in the MT8192 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index fda0467cdd95..23fe8ff76645 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -52,6 +52,7 @@ properties:
           - const: mediatek,mt8173-i2c
       - items:
           - enum:
+              - mediatek,mt6893-i2c
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
 
-- 
2.49.0


