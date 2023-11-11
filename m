Return-Path: <linux-i2c+bounces-55-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A174B7E8714
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31F24B20C33
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 00:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06F4185B;
	Sat, 11 Nov 2023 00:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pnM6769J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3C1849;
	Sat, 11 Nov 2023 00:55:49 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B024496;
	Fri, 10 Nov 2023 16:55:47 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231111005544epoutp03d2206ec9368f53264d1ab1eb1e4ab302~Wa4i8p8yg2368123681epoutp03m;
	Sat, 11 Nov 2023 00:55:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231111005544epoutp03d2206ec9368f53264d1ab1eb1e4ab302~Wa4i8p8yg2368123681epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664144;
	bh=tyQ3oO6IXzD6oc5DWP5nha9j9dt1yoRAX7U33QwZFuc=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=pnM6769JvdQ2KlYf83drAm7PJF+aOrlABeiplW7O3o5W+5hDnZ8douSlWFhPzWOuW
	 VdfCqUTFB4hSTJvOKMww8o9Ifptf7KYiFCO0EAHtqxkouGPf1EF5UMJHwskkWqtcLw
	 71m08SfkGuJUrumO8wM8wSW7UzECwbbEnt/xt2uY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20231111005543epcas5p3e2376e4e804646a00b5112e8f7a53908~Wa4iQaOHi2744627446epcas5p3h;
	Sat, 11 Nov 2023 00:55:43 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SRy0s6g4yz4x9Pv; Sat, 11 Nov
	2023 00:55:41 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	84.DB.10009.D01DE456; Sat, 11 Nov 2023 09:55:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231111005540epcas5p1dd9d6746bd293ae86b582c8770fac213~Wa4fV_M3s2063720637epcas5p1q;
	Sat, 11 Nov 2023 00:55:40 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111005540epsmtrp212a3137ba5366921dc6aac34f7b06787~Wa4fUhJpv0060400604epsmtrp2c;
	Sat, 11 Nov 2023 00:55:40 +0000 (GMT)
X-AuditID: b6c32a4a-261fd70000002719-ea-654ed10d8fa2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.94.07368.C01DE456; Sat, 11 Nov 2023 09:55:40 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111005534epsmtip238d4e217372bd20a02cbfe5bbfff9454~Wa4aAJ8OK2710327103epsmtip2T;
	Sat, 11 Nov 2023 00:55:34 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:25:33 +0530
Message-ID: <059f01da1439$ca3f04f0$5ebd0ed0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQGfqS2MAmdQtOuw2/KhUA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTfd3sfhVl3LRg/cHO1CVFcCsWV+kFk87ndCVnc3GZgG9iUG4pC
	2/QW3fQPjY9SYTw6n2uEirC6dU5dQQaVAsEqGozCLOILeaw4JozJFBZnKytc5vjvd875/b7f
	OefLEQrEY1SkMFtrZA1aVY6UDMVrL0Qvlok63mflro5YVNXRSaHLXScwlD9ip5C3owVDPWNm
	gA71+Uh0yn0NQxO1FgGyea4RyDv2J4n2VJ4h0a1/TATq3e3A0EjZq6h4sE+A3EPnKFR1wEag
	OlMFjsa9Zgwd9J/EkPPXmwSqtvkBMgeeAFTuGcHRDdcxEnkmSgDq7nYAdOkHL4mOXm/E0NXK
	IgqVPTgoQBWj53Bk2m8n0D63h0IXhvMJ9FtxkPLUVY4jhyv4Xs2whUB3LQcAav1x44po5uzj
	3SRTfmoH4x4/jjP11m6KcTr2k8y9mw3B/JUPmKayUxTTU9iKMdVVO5mq4RaCKQnImeIaB2Cq
	23YwR8qfYsxj54L1dNqW5RpWlckaJKxWrcvM1mYlSZM3ZKzOiFfK42RxCWiZVKJV5bJJ0jUp
	62XvZOcEFyyVbFXl5AVT61UcJ419a7lBl2dkJRodZ0ySsvrMHL1CH8Opcrk8bVaMljUmxsnl
	S+ODxE1bNPVf3yf0T6gvDpfb8F3AQxaAECGkFbC2ogsvAKFCMX0eQN/FEQEf/AXgnbNXp4Nx
	AC2Hvn8h8duPUHzBDaC5KgD4YBBA0+5jUyySlsG6ShM5WQinz4vgjaZ+fLIQQq+Bxc27pnAY
	nQsLRs3YJMbpKOiyOalJLKIT4JOCM4DHc+CVb3xTfAH9BrRXDAn4NiTw6YCdmMTh9Co4MVFK
	8px58PeLnqn2IF0fCu1dZooXrIG3T1/HeRwGH7bWTOcj4eMRd1AsDGIGnvBH8mkN/OMk3wOk
	34bN3mP4JEVAR8MzrljeajYseubDeKUImk1inh0F94x0ThvNh5bCQoLHDCx3tk6ZiukOAN3V
	m0uBxDpjSOuMIa0zhrH+b3wc4A4Qweq53CyWi9cv1bLbXny4WpfrBFP3t2RdHejrfRTTAjAh
	aAFQKJCGi9oVKaxYlKn6cjtr0GUY8nJYrgXEBzdvEUTOVeuCB6w1ZsQpEuQKpVKpSHhTGSed
	JxraV5YpprNURnYLy+pZw386TBgSuQsTDRjUaeKlDtLmtHaqenamqpMi2mad/Fv48q2fhGG6
	oyVpmRmzm7CPvmodlL0uHa/Na7BmS0r1t4tTAs4Q7t0VtVUbfas/W5W4sKckypnuiUpct+iT
	5PkP39Pcarke2PYL0RilNEUMpMUuXtDeRS3Ov/dzWOXRrXuXfd5eedO8/XJz4u1ott8496Xm
	hsMRj/Qrh7qHP8z6dGzUK+nNeTB6X9pwaWGSnEvynB6a/2wcFQcajW3JPv3D9gWpdaRMoRjy
	t367KepuUWP6iVntK/MWfZfff3dvhiQ6YZb3jnrDK9iz8TnPQ7c/X5sqtCOta7NVJg7MUy5i
	/TL1a/6BdPLj0f5mKc5pVHFLBAZO9S/RKkMLCAUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTdxTG87+9L6Wj2ZWy9Cpm0zqyARFkUTyaxRgj212Gc8smJH7YrHJT
	HW0trS9TnCMaK7RaICBildZCU6Tg3AplLVrcoI51bCCx6pR2zGlhBIYzIBPX2gF1C9+ePM9z
	fud8OHxeQj+xiL9LuYdTK6VyCSnA27okryyP73+PW6GPiMDaf5OCH27XYXB83EaBv78Tg8HH
	JQhO3XtAQrOnF4NoWwUPzN5eAvyPH5JwtP4SCb881RLw2xE7BuO1i8Hwxz0eeEadFFgrzQS4
	tBYcpvwlGFSFGzBw3L9FQIs5jKAkMonA5B3H4Ub7ORK80TIEwaAdwfdNfhJq+jow+Kn+JAW1
	Q1U8sDxy4qAttRFwzOOloGvsOAHDhpnKdLsJB3v7DK91rIKAgYpKBN0X89ansF9NHCFZU3MR
	65k6j7NuY5BiHfZSkg3cujLj+z5gr9Y2U+ygvhtjW6xfsNaxToIti6xgDa12xLb0FLGnTdMY
	O+F4+X16q+DNfE6+ax+nzli3TbBzpLGDUD2kPgv/dYUsRh5Sh+L4DL2SCdtOUzok4CfQlxHT
	V32TigVJzO2vy59rEdP4bPh5aQgxkxea8NmApJczrnrtHCmRviNkegKbY6WfEWP/20DMBnH0
	RsbwbfHMAJ8voguY8t9zZ22cTmbazY65BUJ6DTOpu4RiegHjO/Ngjs+j05jQndD/2mYZ5cUO
	WsJMh2xEbO8GJhotJ2MdMTNyzUuVowTjPJRxHso4D2WcN3Ie4Xa0kFNpFDLFjkxVppLbn66R
	KjR7lbL0HbsVDjT3damvu9Cv5mfpnQjjo07E8HmSROH1lTlcgjBfeuAgp979iXqvnNN0oiQ+
	LhELM2vO5ifQMukeroDjVJz6vxTjxy0qxlQBofnFun1v5ZZVVgpecGgiH/pCecNnl0zlbrW4
	97cJvO5aV46gMDKiHX73ney0z49OHdqyzrOmKMvy6t2wpOnwYHxgk0iPsuxyZ/yoc+nGAsHk
	RyFx4kJx2kSetXzbKn/KibRo6hleUPblN/0Hoe1T8cnXspStuQ1JPl11XdUJx6mMBVp5d83a
	DIXNl1x4kareUIQ7q5rFqeIno4qec6o+XYe78I3tlt6373oE7rqUawObBl3Tq/SN13vZzZdF
	efrIWs2FgcOK9S+V5gzVoQOm5GzrdzcKsxP/bDD8s0xpIFY/lW8Jamj3j6sP3X8klj0JHlNc
	pbYvLfZ3LQ6EPpbgmp3SzFSeWiP9FxJSPbrkAwAA
X-CMS-MailID: 20231111005540epcas5p1dd9d6746bd293ae86b582c8770fac213
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104411epcas5p3d0306bbffc3dbc48b3d91fc2a57cdf7f
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104411epcas5p3d0306bbffc3dbc48b3d91fc2a57cdf7f@epcas5p3.samsung.com>
	<20231108104343.24192-4-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:13 PM
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
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>=20
> I propose to take the patch through Samsung SoC (me). See cover letter fo=
r
> explanation.
> ---
>  .../bindings/i2c/samsung,s3c2410-i2c.yaml     =7C 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
(...)


