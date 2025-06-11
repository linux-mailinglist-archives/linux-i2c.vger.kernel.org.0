Return-Path: <linux-i2c+bounces-11359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A80AD5351
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 13:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 782273A24F8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 11:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4674625BF11;
	Wed, 11 Jun 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CbrH4D5i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA942E6125;
	Wed, 11 Jun 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640088; cv=none; b=mAK/9+B1FPV+j/zJ5Yg2R508ULhci9/lOWyjyc6UrxiS6Efux+mBc6iVKLwejzDzZIJPBnBEEPAzU827oh0vTL0AH3Wkfa9zQq8Fe7d8MO06r3JssoKnKTFJnxpFumgyTjnkKbZP3K+sC9cztmZr8ukNSuafxgeILzbk7a5Kd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640088; c=relaxed/simple;
	bh=eczncSLUPb6w9rh7PFvANX6F7sbxAiYrYAHhnJYfBzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HF8jse2CKDcnkBoIONOnj3O9My1Kop/PerGC/lDstVuoAMa2OEimCPEjPB66Z5DUHnvQjBjPBXSA6zCxPkq85ZdmUkWgvYBFZIJuXqsCw5/Ln4i/+JT6zpnlFZCKJpFC1U2FwIW1XzryhcfzwgvExavQ4cLRQo4QYVSZz8uISXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CbrH4D5i; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640084;
	bh=eczncSLUPb6w9rh7PFvANX6F7sbxAiYrYAHhnJYfBzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbrH4D5i9gfkQ8LDHJOb8ZcIk2AtbXEKIaEJQ1iUOEeAzQo0tmYbi0wNVqYpwNTHc
	 /FLSHZhAbzpZJVgD76DnERdKQYBMC3cT5uiYXX5m8RhmUCfda++G8HFSbSwqq4GHfO
	 omBdiPKF3clc3yqaTTdFO5urWwjHnsI9hoA+4PQ11jGJwGMZvHOtRILXznVGlXyNt9
	 m9jcsEz4UDqFMr90aDjeDd+80kQgVx9BuevAlslZQO50hOVB5X9F6n2gKnrU0S9fGQ
	 ZXGiHaYaBABU4m/HDJL01fKZwo6smC9xN/Wb5micmtT0CXvNsBvAvUlqFxmYr9Vvi9
	 9DLm6xZEiRSmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9F0717E0F66;
	Wed, 11 Jun 2025 13:08:03 +0200 (CEST)
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
Subject: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
Date: Wed, 11 Jun 2025 13:07:58 +0200
Message-ID: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
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

Add a new compatible for the MediaTek MT8196 SoC, fully compatible
with MT6765.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c56..8e535c6dbf66 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -44,6 +44,7 @@ properties:
               - mediatek,mt8188-timer
               - mediatek,mt8192-timer
               - mediatek,mt8195-timer
+              - mediatek,mt8196-timer
               - mediatek,mt8365-systimer
           - const: mediatek,mt6765-timer
 
-- 
2.49.0


