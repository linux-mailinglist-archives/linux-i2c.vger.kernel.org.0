Return-Path: <linux-i2c+bounces-4777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B458792AC36
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 00:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2193A282DAF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 22:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70AE14F9E7;
	Mon,  8 Jul 2024 22:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRv1Ddvn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2BBA46
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 22:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720478588; cv=none; b=ugsV1Qsv+CcFoV9TUeoSqrWZ/cmrDN4XNvbYwZSucEMiW0yiJPnURxjXZ2iNIEoQz9zGCgKXLOGKQBoG2E/blQ3hEsb4NjiFK1kpaQBd7fU7v6B5V5E2aUwx2co8bxZl/4czlfpVlKAWElpnQVJ19u6WTgLwZ5AZpZo3sQ8DcKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720478588; c=relaxed/simple;
	bh=YI/FDJFtajnd8slwfQMrD0EUdlfQnPu/VVa0dm7bxeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJ1/DufVSAR4W4Rt+/x6voVaFLwnPEFlwnk6GtfgD2FCE+aPNKO2DOxhHGlq0UbySuaVFa/YsJFxOhY8G8ZCp/vSFaD5OTdtUUxNAdPyPZ/64I3NeIzwkawAQBZTCHTkH1aD3hGlKT6JZFP1K5ux4U86xsvSAjK+2TLAtPS8dGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRv1Ddvn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA330C116B1;
	Mon,  8 Jul 2024 22:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720478588;
	bh=YI/FDJFtajnd8slwfQMrD0EUdlfQnPu/VVa0dm7bxeI=;
	h=From:To:Cc:Subject:Date:From;
	b=PRv1DdvnJe34BM8D9uEt1Msl7NEerAVg12ECI1JI4fw1XAu4qoEvUdexxgrsMp85C
	 KHIR07QD7fgIT8pzoyv+qg4H7KLk6Me9kcLrKJvOBONZtrNpq449MdKMjmHSN8+okz
	 GjxgdXclF9l3nDMorac2QdWz6gBFhHOsxfA+vaGruUU/i0kTvQAayU+dpIfBC652SM
	 +ZU8zw+AJtQmC+nJFRTnZS7Gsokx8BVXXENXYQbLWHqIVE44cGVpGExd9mnhAawEJn
	 UK5hiyz0xRtKMOQOVsqsFQUZqLRKLuvxL847EXem0Vy/Gws9suxCnBGq6i2bjbZZBK
	 FyIn227TgvSrQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	upstream@airoha.com,
	benjamin.larsson@genexis.eu
Subject: [PATCH v2] i2c: mt7621: Add Airoha EN7581 i2c support
Date: Tue,  9 Jul 2024 00:42:38 +0200
Message-ID: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Ray Liu <ray.liu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- drop patch 2/2
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..4d93c00264fc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -857,7 +857,7 @@ config I2C_MT65XX
 
 config I2C_MT7621
 	tristate "MT7621/MT7628 I2C Controller"
-	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
+	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  MediaTek MT7621/MT7628 SoCs.
-- 
2.45.2


