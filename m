Return-Path: <linux-i2c+bounces-13063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06FB8CB85
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 17:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A9907E1024
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Sep 2025 15:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EA321930A;
	Sat, 20 Sep 2025 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="WAf3mWuW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D01EB5C2
	for <linux-i2c@vger.kernel.org>; Sat, 20 Sep 2025 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382286; cv=none; b=baP3C32+ROKeh5UnS1uecX2XlHR7yBTYbZPcrtxX+Hh6Ho9JZATLnTvOGQDGDon967FiP9otcRcFN6hKPTn1g/wkIZCrdODWCmOt7+IdzBVmOnYwvBRgbiKNbKKiEDo7QCXemgcInaJ2aLuZedfx2Nav1RXsJGw8QS6R51n4t14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382286; c=relaxed/simple;
	bh=L4sIzuHH5e728nteRUrwdrI8eR4rd0jT03HRoNtIA4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFWlrePycSTO55qV84cq8mNxK62lesxF4Hb7YaLnpoVrAnTOBWaoGPud1wJAL8d/imc1U8pDEN6x20aDIrC7Lyvr4R1rc0NWGeXAGmkficY605YEBXBNjitTax56ErbcAD9DW88aZ+pFqUF9chAyUeEUKBnT0hU+0pZzaJEKm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=WAf3mWuW; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=WAf3mWuW96hFGq4BJ1iyiYkb4moeL6UPzqDlqymZ+dlV7xLfdfkz1x0WMaBLy6FjKAm3pByUXkuGAhwCyn7rIW4TQs86m6jOp62JAXSuMwcqnlE5O4gvRP+ucHbEoVUegH+eyfc+rZOsEXz+vet+wjpu6Gt0nLEIBOgYSUBk3qc0EXvXzXG9SODBcK1Ns2K3VotnwccF4Obr9ILwxjpsSy/NDkiW5CZPn0KoK2FTsb5zRh+Q+fBx/bdwpf+u1k1ks+7PGDln8ASc4soWqdV+LcQqbMp7IamDU508cMnVoBBVoNeNOysORqg5p8fQ47WDgk9CfwzVjBb+YHtaA8KrWw==; s=purelymail1; d=purelymail.com; v=1; bh=L4sIzuHH5e728nteRUrwdrI8eR4rd0jT03HRoNtIA4U=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:12 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 17:31:04 +0200
Subject: [PATCH 2/2] i2c: mediatek: add support for MT6878 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=1715;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=L4sIzuHH5e728nteRUrwdrI8eR4rd0jT03HRoNtIA4U=;
 b=YZB3LNAadsjA02iG5NTdWh8e13gZGiQwzvjF7fYZg4rXVNL7C+SgjfARtCWlDTmE+QZhBzmlw
 3jFtL39WcEyB6tm9nHVany5eM/8qY8rYRGWCPYF767QM2BTe3vzdSln
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Add support for the I2C units found in the MediaTek MT6878 SoC.
Just like other recent MediaTek SoCs, it uses the v3 register offsets
(which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index ab456c3717db18eef74226de0ee88c49228796f5..085702aee006a6dd0ac89d1382a12fbac2d91c55 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -402,6 +402,19 @@ static const struct mtk_i2c_compatible mt6589_compat = {
 	.max_dma_support = 32,
 };
 
+static const struct mtk_i2c_compatible mt6878_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+};
+
 static const struct mtk_i2c_compatible mt7622_compat = {
 	.quirks = &mt7622_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
@@ -525,6 +538,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
+	{ .compatible = "mediatek,mt6878-i2c", .data = &mt6878_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
 	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
 	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },

-- 
2.51.0


