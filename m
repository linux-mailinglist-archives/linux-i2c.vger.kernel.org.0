Return-Path: <linux-i2c+bounces-12607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A1B43397
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 09:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B7EA5E5B23
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 07:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F69A29AB11;
	Thu,  4 Sep 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ak5tC+BF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801E299922
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970387; cv=none; b=V9zHT5jNqJrzUpZqZTWynbeVh9RdQ4/N8TmA8mqYhVmtYgt/B/FmTsSLVqlKbshBkOWVCy3DkZ7POtWzkVBQFZdKX2XjB/cyiNl0U1GLM8/6dcxWTV3g17Dl9Exq3koG35WRh8CIBR21/axA+wLwUFFay5r8pnDyFeoxaAQAQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970387; c=relaxed/simple;
	bh=If26aWe6HDRuUd8BLxK/DNXNMPYO7QPBtdN29DandUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=eh8ROZotbBEWzbph9F+HYpqgqIoZTCVPopQOkD0FvED1F+WYCl4I2tdq6ARiNRTDNgbM7hZQQCO2mdjSxAx5qIH9xfn4SHg7RYDP0IDtkTRF4EQla2xpOcMelLiDwKoS20tnOTiE0e4wTaNyD2O+y2tOgWrHzLm/8FVDVSMvw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ak5tC+BF; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250904071943epoutp012541b7acafa2a230414080aa340047da~iA0E4_ACi1493814938epoutp01h
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 07:19:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250904071943epoutp012541b7acafa2a230414080aa340047da~iA0E4_ACi1493814938epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756970383;
	bh=XIDY5zJ3pMt83TWBBmEEmGxMtm/5CHCj2NnIva/BZ98=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ak5tC+BFukzrUTWfIQGVKoVs3fE3A1pMBMpvIbCCnxwXVljg8dReeZVJljr5b5tuj
	 pvjMRqzqUEwrCTFeY9BdCBIAjRUw9KsLIPoexT2J8J+mQ1iFL+8mJAkRQZuL2hc7K4
	 +NlnWziASrp6fpu9SlQ5thFrSPByo3MeHuUumzng=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250904071942epcas5p1c7fd121345ed8fc30e6c449b18f1e023~iA0ES--qd0357003570epcas5p17;
	Thu,  4 Sep 2025 07:19:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cHW7x4cL9z2SSKX; Thu,  4 Sep
	2025 07:19:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1~iA0C3ZhEO0357003570epcas5p10;
	Thu,  4 Sep 2025 07:19:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250904071939epsmtip1658d4b2730e1a080e4041b37c376d7cb~iA0BI2m9F0339503395epsmtip1d;
	Thu,  4 Sep 2025 07:19:39 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com,
	pritam.sutar@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com
Subject: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu,  4 Sep 2025 12:58:44 +0530
Message-Id: <20250904072844.358759-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>

Add "samsung,exynosautov920-hsi2c" dedicated compatible for
HSI2C found in ExynosAutov920 SoC.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d006..207b95e392e5 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynosautov920-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.34.1


