Return-Path: <linux-i2c+bounces-11360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAFCAD534F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 13:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44AE33B2C0A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 11:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C3126C3B0;
	Wed, 11 Jun 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XcSTDEvY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B1425BEFF;
	Wed, 11 Jun 2025 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640089; cv=none; b=HWrtCcNNvZ67ZTOxJoa4GSwc0HmOpv1D7c+U2iRhdcA4qmKDD1Ml6unqfkVbsNxqPdKCwfQI53pWkLTELZ7yBmw5WMNBNoykVTK5fmMq+Cq/DhuNmqhFUvsWsBeP/k4Fwz6D6LmfeBJXkLwhpbSaoM5ARKez0sH0TLi42Mleze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640089; c=relaxed/simple;
	bh=8YPt+10PF3qsZ6u8IevYC2mBMTIJyfGubd5NrtU+ZO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0qYohbrHn7Fybcv2Y6pESK+2VtYzwSyzFB7m+0vEBdMpGEcvfAtKAc9kwypspHYK86Ew2ZHQHI/uD5Y6LhA1r6B4JfeyjNYtZ8LyqFRIIOjjlCLqB2SiTFfbmlWe6Sy2SpTL9kzOdyM8tkbNwtrIPP8IV4LLESD5M6kcpYp+6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XcSTDEvY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640085;
	bh=8YPt+10PF3qsZ6u8IevYC2mBMTIJyfGubd5NrtU+ZO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcSTDEvYeZPzaeqiIX9F1HfT4Ii2n0GuwJQFqHIfokyBqkxfuenyD8lpT6oh3xcQs
	 PFSXwrGIv6kDhbiQRLlVKe7Vm44J5zCnE7YBV7GCNY4vipJEuxdPVTJU3i+dvKYvnV
	 FSX3ozOskQctWNGsxqDcz8hVxgn9wt2u9hCekVRNAXhGu+7C898me3e8bWRheC6L2E
	 vb2m73aIATsBym84a4sK43D58EhkJ8hj4jtM7Ed0qAn1LvopCwCoIaIhdeKY1q3Kor
	 42nHPnlsfi0ML7HqzEzn4dBdZqssxD+oUywb1x8EewIDLGy1/Swge2fotHFk+NrZNe
	 F+9FTidKuDHQQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFE7917E1290;
	Wed, 11 Jun 2025 13:08:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/3] dt-bindings: serial: mediatek,uart: Add compatible for MT8196
Date: Wed, 11 Jun 2025 13:07:59 +0200
Message-ID: <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the MediaTek MT8196 Chromebook SoC,
which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index c55d9a0efa19..823ade89d60d 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -48,6 +48,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8196-uart
               - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
-- 
2.49.0


