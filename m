Return-Path: <linux-i2c+bounces-12616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C27B4380E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1194A486328
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424E72FCC16;
	Thu,  4 Sep 2025 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TKdel1x1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F982FC877
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980576; cv=none; b=eKhnLkT22dQUWSjjbspCsaSEQrrbq8c/Qeee59uwFdULeLtOBZtnFMr4kXh4m2jf7verRHhZAcwFqcF+6ckltSLyL/JaoaOzAgYd+VcRaBgoERNjlTJksMHOm+nyoDk9iyWIGSaKTQRDWApJe828QlLPUNxnv71xqcthQE9GLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980576; c=relaxed/simple;
	bh=Z98sXNyNxBFjNP43LUOxz/hSd9EZq/hjQKXFmNZmhcE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cWP0LK+L2bpSoG54HdjZqAcJeHzgu2W46AXnuf626alnV+7W1cGaZcqWGIW5423ik2s38W/dquqmk6tqKGMhIiUvy4KVd4iqGlOSiN/4f87jMHl3gq+d50Y67vAvGSHGbCKVZql/+EKi/+9ZTE+eFnLeQVz2daQiESvuMXxLdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TKdel1x1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250904100931epoutp02de6560a837961b39a15a60d140428603~iDIU8OCfE2817628176epoutp02C
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 10:09:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250904100931epoutp02de6560a837961b39a15a60d140428603~iDIU8OCfE2817628176epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756980571;
	bh=NNCOKsku3jGQZIW1rjPQqO4AY7LjBwEb5L1n61T6Nys=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TKdel1x1yl5ccpn7yLkSFUxqKvDArpwhaUI0O5tQwYpnuKS1xqd5QncgYmKJ64WJi
	 fd5+Ug/oGuxgcFxw1Xa6r1Ap3GowITAOZ8gdvfAk7dALvWetvR3lJCzbz3+p0NcMeF
	 Y5STV2TB+FF6iwW+rhXN8bUAx2PZhFv0P4le8NtE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250904100930epcas5p2c91a6734fdedf9d2765cc8288c91234c~iDIUcNZEF0566805668epcas5p2W;
	Thu,  4 Sep 2025 10:09:30 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cHZvs3Nxbz3hhT3; Thu,  4 Sep
	2025 10:09:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250904100928epcas5p3b02d748847905e62c897bc576b7ef948~iDISWDEAh0328503285epcas5p3x;
	Thu,  4 Sep 2025 10:09:28 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904100926epsmtip1f3e09235bbd83a12c3fd0c487201e546~iDIQuo_AL1187611876epsmtip1M;
	Thu,  4 Sep 2025 10:09:26 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Faraz Ata'" <faraz.ata@samsung.com>, <andi.shyti@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: <20250904072844.358759-1-faraz.ata@samsung.com>
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu, 4 Sep 2025 15:39:25 +0530
Message-ID: <435b01dc1d83$ff8bde30$fea39a90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GscgrbFA=
Content-Language: en-us
X-CMS-MailID: 20250904100928epcas5p3b02d748847905e62c897bc576b7ef948
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com>

Hi Faraz,

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
This is not complete; any new compatible should be complemented with driver=
 changes
(User of the compatible) followed by dts change.
Always send a complete set, also mentioning how the patch was tested.
Best is to get patches reviewed internally before sending to community.
=20
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



