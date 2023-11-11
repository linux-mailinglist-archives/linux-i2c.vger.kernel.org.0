Return-Path: <linux-i2c+bounces-62-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2E7E8788
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D3E1F20EF5
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4FE2586;
	Sat, 11 Nov 2023 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CtRMXEfb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E01FB4;
	Sat, 11 Nov 2023 01:26:21 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91633C15;
	Fri, 10 Nov 2023 17:26:19 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231111012617epoutp04377f31f3d2dd7e9ac26446e2412dc093~WbTOjmQsp2728827288epoutp04S;
	Sat, 11 Nov 2023 01:26:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231111012617epoutp04377f31f3d2dd7e9ac26446e2412dc093~WbTOjmQsp2728827288epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699665978;
	bh=ysUHVcErCHd7yT06bf/TDYqwVhr/d0lpIon7D94ZXuI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=CtRMXEfbtRXNjM91sqn5ONm1Iq9PvrcSKqGbpUnlvBEMk0n3wQf8u/GoiUXWxANAk
	 YCr2keX+9sW2yJrX6DK1AK8AkPP26hJjY+0fG5OozoOEE4AKR3JvePNDfWHvENyMbb
	 DBHuL/rYw91yMKL1Rb5SYKb8zg2rICZKIzojEOLQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20231111012617epcas5p39b260ff99aafe5af9b2cdd752576757c~WbTOIhDa10998709987epcas5p3j;
	Sat, 11 Nov 2023 01:26:17 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SRyh75KZ8z4x9Pv; Sat, 11 Nov
	2023 01:26:15 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	85.22.19369.738DE456; Sat, 11 Nov 2023 10:26:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231111012614epcas5p11e347203a09dc35e08b6ecc2873edfb3~WbTLsaHmY1807318073epcas5p1n;
	Sat, 11 Nov 2023 01:26:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111012614epsmtrp25044af81a2c4e4fd4e7d98a6dadee631~WbTLp15MX1793417934epsmtrp2I;
	Sat, 11 Nov 2023 01:26:14 +0000 (GMT)
X-AuditID: b6c32a50-c99ff70000004ba9-9b-654ed83793ea
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3D.A7.08755.638DE456; Sat, 11 Nov 2023 10:26:14 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111012609epsmtip19750c18cd500d734cbbda9560c106fbf~WbTGjr1VI0453404534epsmtip1p;
	Sat, 11 Nov 2023 01:26:09 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'David
 Airlie'" <airlied@gmail.com>, "'Daniel Vetter'" <daniel@ffwll.ch>, "'Maarten
 Lankhorst'" <maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'"
	<mripard@kernel.org>, "'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Rob
 Herring'" <robh+dt@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski+dt@linaro.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Andi Shyti'" <andi.shyti@kernel.org>, "'Jonathan Cameron'"
	<jic23@kernel.org>, "'Lars-Peter Clausen'" <lars@metafoo.de>, "'Lee Jones'"
	<lee@kernel.org>, "'Ulf Hansson'" <ulf.hansson@linaro.org>, "'Tomasz	Figa'"
	<tomasz.figa@gmail.com>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Linus Walleij'" <linus.walleij@linaro.org>, "'Thierry Reding'"
	<thierry.reding@gmail.com>, =?utf-8?Q?'Uwe_Kleine-K=C3=B6nig'?=
	<u.kleine-koenig@pengutronix.de>, "'Alessandro Zummo'"
	<a.zummo@towertech.it>, "'Alexandre Belloni'"
	<alexandre.belloni@bootlin.com>, "'Greg Kroah-Hartman'"
	<gregkh@linuxfoundation.org>, "'Jiri Slaby'" <jirislaby@kernel.org>, "'Liam
 Girdwood'" <lgirdwood@gmail.com>, "'Mark Brown'" <broonie@kernel.org>,
	"'Jaehoon	Chung'" <jh80.chung@samsung.com>, "'Sam Protsenko'"
	<semen.protsenko@linaro.org>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add
 specific compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:56:08 +0530
Message-ID: <05a601da143e$0fab3fa0$2f01bee0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQH9NZaMAeO4JMOw3SwXwA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1RTZRjHz3t3dzc44rmOJW+TPHTNTqiDzTZ4ScmdkLqnJOchjGPniAvu
	2dSxzQ2M5I8MZaIc0YWFouO3EBOFw68Q2awxQ8KfOBUzRAITE1aywFA4Nnat/O/zPs/3+zzv
	87zn5XMEXp6Iv1mXwRh1Ki1FBOKtneHh4ui+DxmJO+81VHX1Og+dv1mBoT2eah5yX3ViaGAi
	D6CvB4cJVGe/hKFnrRYOKnVd4iL3xB8E2lVZT6C+J2Yuuptjw5DHGooKRgY5yP6whYeqCku5
	qM1cjqNJdx6GDk3XYKhx6AYXNZVOA5Q38xdAJS4Pjq61HyOQ69kBgPr7bQD9eMJNoMOXHRi6
	ULmfh6y/HeKg8kctODLvreaiXLuLhzpH93DR/QKfZKq9BEe2dl+95lELF922FALUdfJjRTjd
	4M0h6JK6bNo+WYbTp4v7eXSjbS9B/3KjwxfvXkeftdbx6IH8LoxuqvqCrhp1cukDMxK6oNkG
	6KaebLqoZAqjvY0LleSGrSs1jCqNMYYxulR92madOpb6IDElLkUeJZGKpTEomgrTqdKZWGr1
	GqX43c1a34KpsO0qbaYvpFSZTFTk2yuN+swMJkyjN2XEUowhTWuQGSJMqnRTpk4doWMy3pJK
	JMvlPuGmrRpbUw4wPOVlnbrVztsJLhD7QAAfkjJY8OUZsA8E8gVkB4DeK9UEexgHcHdt2fPM
	JIB3nRP4PsD3W7rdobNuAWn3OcriWc0IgHb3AGc2QZBi2FZp9lcSkmeC4LWzv+KziQAyHraU
	9HJnOZjUwipnrZ9xcjG8eWSPn4PIGDg4OgJYnge7jwz7vRxyKawuf8hh7x0Gp+5V+/VC8h34
	7VcPOKwmBD445+LNNobk6UB48W7d81uvhj8PK1lvMPy9q5nHsgh6PXaCldCwYlrEhjVwrKYe
	sLwKfu8+5q/CIcNhfXsk22ku3P90GGOdQTDPLGDVi+Euz3Wc5QXQkp/PZZmGQ73dBLu2XgB7
	rdRBEFb8wozFL8xY/MIsxf83LgO4DYgYgyldzaTKDVKxjvnsv+dO1ac3Av/vW6JsAycaZiKc
	AOMDJ4B8DiUMuiJbwwiC0lSf72CM+hRjppYxOYHct3kLR/RSqt73fXUZKVJZjEQWFRUli3kz
	SkqFBD3MtaYJSLUqg9nKMAbG+K8P4weIdmLHY+IDXAcvFu2tDHHMFQ+uTySSwfauIv5tRZsX
	X3xUrk63bFtWOGeVRDCxdtP4Gv0i8fqswwOR6UmdQ4pFWcaUglO71WRiQsXRN8ZidXbvk+Ad
	3z3Snctu79JKsHl/Luu78t66hfU9roTCSUvowPtd3ujmswnj+ReLRRe6hYr65R2OLbW5zXlF
	Y+etCXfiNDVXW7IbHI5blx5vdPSDO68eJ+J6kuLH5Su2K3+as2m58N4RSbXa2vr6KcU3DXGJ
	+hXB2/4ueRzoSVpbGtJ/WZwcP5YckXStpWFIeP+xSLkxNURhOLwFCLU1/JaPKPXSH1pzXzF/
	ovx03km8b4F8w/xVYP7LFG7SqKRLOEaT6h8kpMf6BgUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVwDGd+6bZs2ulYy7SoxpqEltKLCQ5fjYZra4XNkcMjene2TWcVdk
	tJBe63xkw7GsFEwLFUGp0grUChUntKCAoFkpCkIQtsprMG1GFUftZhA2CIwBzRb+++X7vvM7
	549DoaJeXEwd0BzktBplhoQQYFfbJGtjXxl8l4ufOCOD9r57JOwYqEBgbshBQl+fB4H3pwwA
	FvvHCFjT2oPAhatmFNq8PTj0Tf1BwO8qrxBwcFaPwwc5TgSGyqKhadyPwtaJBhLai2w4bNSX
	Y3DaZ0DgqbmLCHT91o9Dt20OQMP8MwCt3hAGf24+R0DvQgGAo6NOAG9d8hHwzN0bCOyuNJKw
	7OEpFJY/bcCgPs+Bw+9bvSRsC+bi8JFpcTLTbMWgs3nRVx804/AXcxGAty9/uFXG1k7mEKy1
	5hjbOn0eY5ssoyTrcuYR7Eh/y2LemcLeLKsh2fsnbiOs257N2oMenC2Yj2dN9U7AuruOsaet
	Mwg76Vq7k/5IsCWVyzhwiNPGvbZPkFY5Is2aJg+7FpzocdBO5AOKYuhEptMXnQ8ElIi+DpgW
	0x08H0Qs5muYgbpCMsyrmep/HpHh0UPAOC6cQ5cKgo5lGiv1xBJH0kNCpmskOTzqAcz0VNty
	EUFvYxqsPy1bV9PpzMSt62CJMVrKDJTmLudCeiPjD46DMK9iOkvHsCVGaTkTGAr8z47yCTT8
	onXMTMCBhy9+g6k6+RgNb6KYx+1eshCILCtUlhUqywqVZcWR8wBzgpe4LF6tUvMJWQka7isF
	r1TzOo1K8Xmm2gWWP90GWSO45vxT4QEIBTyAoVBJpLA38R1OJExVHjnKaTM/0+oyON4D1lCY
	JEoYNW5MFdEq5UHuS47L4rT/tQgVIT6OSAPDPC7VteeGxFhHwf7ubZnPlPoTL5dsToztHo15
	MT3ayec0tSdTxiMp8rdaZ1vK1f5PD48XFe3cNdEWI3almZRP7nkexJXYqmUXX98zSCrulo5t
	jOdjpJc39579sZ++gfatDz0V1fq+vjm5fV/V9nRvxem8Jx2HtF21sk+iVK92G4ufd/8t+LbQ
	0LIp6blIhF2fMvbFVu+6a1X12V0/iJPke369gw8Rv9eRKuJk35Zi7ax47yaDRtQXnSiPWzDn
	G5NjzYpveGzHleFdH8svjLwZ8O/Q8QlNH7xf/Tb9wnAFNS8oce3+yxLvd5O7kwZs+6WrQtI5
	Klhn1x2l3stulmB8mjJhA6rllf8CPDX7XeMDAAA=
X-CMS-MailID: 20231111012614epcas5p11e347203a09dc35e08b6ecc2873edfb3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104434epcas5p2abc47223e02c2556e3ae5ab9c30dcc9e
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104434epcas5p2abc47223e02c2556e3ae5ab9c30dcc9e@epcas5p2.samsung.com>
	<20231108104343.24192-11-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:14 PM
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine =
and
> there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to each SoC in front of all old-SoC-like compati=
bles.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>=20

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

> ---
>=20
> I propose to take the patch through Samsung SoC (me). See cover letter fo=
r
> explanation.
> ---
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  =7C 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>=20
(...)


