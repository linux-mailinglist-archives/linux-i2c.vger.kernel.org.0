Return-Path: <linux-i2c+bounces-11361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 682CFAD5353
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 13:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF9C3AB266
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 11:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC9B273D77;
	Wed, 11 Jun 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b1HJJ3t/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479325BF1B;
	Wed, 11 Jun 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640090; cv=none; b=pf9WITGsO9ll7Wr497gqWhJAkPxAksQLwzftO1GSIiWgwF8UsL/KqtqHmaJNnWweH0zPHJUk0TqM7l/iQ/MRa1ccVR8mEMNM5qh1wSr+egVkq78UwdBpdN7TeIhe2x3M4cb7gfczaefC8g/n+b0Naxy6GF0mCdZUbh1PLfgPTmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640090; c=relaxed/simple;
	bh=eaITpXuq+NtwwWLjQnEGdFQTRjmcpmnkjrOTyBXqJB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5z2Lf6qesxrGsYoFcDL07U+uyT6zq+9nZf7LPhbFwLWby2eNPOkO//sNv+mJf0SYzcYkkMRth+HznUtqqje/p3o0sly9bsjSYl0ARgI0eVhPCkGUvoz3RXrAJhXued/5kXHW9ZCF7Z5dL0w8WPqK+CCp7lUmYBZIl9qGYKh8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b1HJJ3t/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640086;
	bh=eaITpXuq+NtwwWLjQnEGdFQTRjmcpmnkjrOTyBXqJB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1HJJ3t/ZvwPoU23FmBr/UWl/DwxGDMZ9LuMNlka4psK9nmRf+kaHi/mDwa5DldTh
	 bYZvxIb3Z/euiUiXq1S7LTq4AA7cpT0RqRw+NrCvUtXpaRjPJs0lYlEoJwIKHbvjYQ
	 SZs4sXyDX3XWa0w2NyMYoATELkd+4wTGgLUwflHkYMOWyCDnIRCu/O8t3qqRiwm9m4
	 Gs/tgpgLdV9PJTMM4FVTNbT1xMy8TAUChyPO5Mu5FpteNdrUA00hvjJoGLv8A+pKz6
	 0C7lURQulStmJR+zxNxfCIN8rX4Muj8pRqClT7LjCPbOtMrOugRK6m8o7iPJg/2XBU
	 3FAFJzGe8+HqQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBDD917E15C3;
	Wed, 11 Jun 2025 13:08:05 +0200 (CEST)
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
Subject: [PATCH 3/3] dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles
Date: Wed, 11 Jun 2025 13:08:00 +0200
Message-ID: <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
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

Add support for the MediaTek MT8196 Chromebook SoC and for its
close relative, the MediaTek Dimensity 9400 MT6991 SoC.

Those chips' multiple I2C controller instances are compatible with
the ones found in the MT8188 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645..03f621fbf108 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -50,6 +50,11 @@ properties:
           - enum:
               - mediatek,mt6795-i2c
           - const: mediatek,mt8173-i2c
+      - items:
+          - enum:
+              - mediatek,mt6991-i2c
+              - mediatek,mt8196-i2c
+          - const: mediatek,mt8188-i2c
       - items:
           - enum:
               - mediatek,mt6893-i2c
-- 
2.49.0


