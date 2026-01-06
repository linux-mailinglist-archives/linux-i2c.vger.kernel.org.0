Return-Path: <linux-i2c+bounces-14922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E334DCF9EE4
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 419573393A98
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 17:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25A735CBD1;
	Tue,  6 Jan 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="G7UGRfUH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0635CBAF
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721655; cv=none; b=WCTvwrXTsqLBhGE8/0GO/bJ7bJLirLFEoB/FMswcY4tlGcbtc1heDx5DkEqvZ0AmiEgHGISiLZVyKxRIndOsfVhMRfxBF+J9GuN69J5oK4rk42wVsaHoVpzXaLJ841tlh/syIe1MhErfNy81oONnfWDX9om/ibor1g27XzdHP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721655; c=relaxed/simple;
	bh=MbVFYzKb3p55yAB5esiLZ2t69mWojzLGTDb2pjZ9IBo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=BRheH7xTSxD5GhEFTMIJmxehzhOiPA23HtJupr30OJlKy/izjvHzC6nQYMOjciqqAzVB+TLZsv4AIF7I2w8oZy/2n3xlxiSf0iETr6689UQdvyTZ6eAY/SjwnYqD7bguAdEDtzn/GK6e6McWX8vPWP+TAmbWy10c0VjiwY8MGkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=G7UGRfUH; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260106174724epoutp029faa4bb8412c3f326e838630757dce9a~INXhWGS0H0806808068epoutp02j
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 17:47:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260106174724epoutp029faa4bb8412c3f326e838630757dce9a~INXhWGS0H0806808068epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767721644;
	bh=1SqUiju7JTdymTLUcCbYNFwbrvaMPwFX7LS7wmO+6Ho=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=G7UGRfUHUAvO1gj600K007nX0IGVnyUCf2F1+N0FSyR+z1uUF7D7h5IBC3riAqaED
	 5qgMuTLhEqoCC3teLE8wXagNlsi+sUTApLKdBegHkSbx8HLkV4H+uePf/B/hnFmQlQ
	 eOCK8nfLQ9rkPiM22dWHuPmWRmvRZMXrXKTN1vYg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260106174723epcas5p1165352a485d67b66d18fffe3500895f1~INXgVPH7i2622426224epcas5p1M;
	Tue,  6 Jan 2026 17:47:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dlzBy42Kzz6B9m4; Tue,  6 Jan
	2026 17:47:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260106174722epcas5p16f744ceb5059e7695cca08317f6e8c62~INXe6Llxa2622426224epcas5p1L;
	Tue,  6 Jan 2026 17:47:22 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260106174719epsmtip2257206d5a8046c710d6d9f8795ccb86d~INXcqoSLM1550115501epsmtip2C;
	Tue,  6 Jan 2026 17:47:18 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: <20250904072844.358759-1-faraz.ata@samsung.com>
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Tue, 6 Jan 2026 23:17:04 +0530
Message-ID: <00c001dc7f34$828b0c90$87a125b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GsosmcDA=
Content-Language: en-us
X-CMS-MailID: 20260106174722epcas5p16f744ceb5059e7695cca08317f6e8c62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com>

HI Andi/Rob

I want to follow up on the below dt-binding patch submitted.
Please let me know if the patch is under review or anything else needs to b=
e done.

Reference  - https://lore.kernel.org/all/83338b57-2e8e-4b77-9e93-fadfb0f6a5=
fc=40kernel.org/

> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Thursday, September 4, 2025 12:59 PM
> To: andi.shyti=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: linux-i2c=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; rosa.pila=40samsung.com;
> pritam.sutar=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com
> Subject: =5BPATCH=5D dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
> compatible
>=20
> Add =22samsung,exynosautov920-hsi2c=22 dedicated compatible for HSI2C fou=
nd
> in ExynosAutov920 SoC.
>=20
> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml =7C 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> index 7ae8c7b1d006..207b95e392e5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> =40=40 -38,6 +38,7 =40=40 properties:
>                - google,gs101-hsi2c
>                - samsung,exynos2200-hsi2c
>                - samsung,exynos850-hsi2c
> +              - samsung,exynosautov920-hsi2c
>            - const: samsung,exynosautov9-hsi2c
>        - const: samsung,exynos5-hsi2c    =23 Exynos5250 and Exynos5420
>          deprecated: true
> --
> 2.34.1



