Return-Path: <linux-i2c+bounces-67-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB27E87DA
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98CD1F20F50
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDDB33F7;
	Sat, 11 Nov 2023 01:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="irK0beut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C52900;
	Sat, 11 Nov 2023 01:44:08 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C39422D;
	Fri, 10 Nov 2023 17:44:06 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231111014404epoutp020b8d581ef73de458fc634b320dfe02a0~Wbiv9pyh22699526995epoutp02R;
	Sat, 11 Nov 2023 01:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231111014404epoutp020b8d581ef73de458fc634b320dfe02a0~Wbiv9pyh22699526995epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699667044;
	bh=otHuv89qZxIxsCY6Mk0O3SPKtNIwJZqQ9cjF5vM+cKY=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=irK0beutRQd0PRCoQ1wUE4ULma4qS1NEZ2zI0MeWVG9XRDkkla3ZENQjjuB4TVft/
	 vTk1xHLIxWpIHHabi7dmfOW7CauJQ52H6igte8Es1t+QQSkkcPhnK1/5VhHEPaxaLe
	 dGVo2tVdug5A4jX/H4aDIn097kltV1dbGPmH7iJo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231111014404epcas5p17f56aaa23cca42978abfa98ceb755c1f~WbivvCbrA0641006410epcas5p1E;
	Sat, 11 Nov 2023 01:44:04 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SRz4g0zg8z4x9Pr; Sat, 11 Nov
	2023 01:44:03 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.03.19369.26CDE456; Sat, 11 Nov 2023 10:44:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231111014402epcas5p3d1e90326a5dae4b9014298f55948858c~WbiuBci1V1759817598epcas5p3j;
	Sat, 11 Nov 2023 01:44:02 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111014402epsmtrp2b45a2ab287c559ea023a7a7c3d91eee6~Wbit_uCKa2673626736epsmtrp2E;
	Sat, 11 Nov 2023 01:44:02 +0000 (GMT)
X-AuditID: b6c32a50-9e1ff70000004ba9-47-654edc6259d4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6E.85.07368.26CDE456; Sat, 11 Nov 2023 10:44:02 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111014356epsmtip10b858a5b44dfa0d42e0b32b57d047916~Wbio3_iDQ0127001270epsmtip1j;
	Sat, 11 Nov 2023 01:43:56 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-16-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 15/17] arm64: dts: exynos7885: add specific compatibles
 to several blocks
Date: Sat, 11 Nov 2023 07:13:55 +0530
Message-ID: <05ab01da1440$8c087d40$a41977c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQJhpycaAXfUx8Sw3WzTYA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1ATVxTu3c3uBizOFuh4jR2NaXWKHTChkF5aoE5FZmdKBafTF7UTt7AE
	hpDEJGgxTouoiFCxCK0CAglS0AhFXhHDQwxpkfGJIpZRasEgVG3U8nCoMDZhbeu/75zzfeec
	79y5Qtx3ihIJU9QGTqdmVRLSW2DtDggI/PLmek462fUOquq7RqGz1ysxtMdVTaH+PjuGbk3l
	APT9sJNEtR0XMfTUWoCjCsdFAvVPPSDRziP1JPr172wC/Z5lwZCr7BWUPz6Mo457LRSqKqwg
	UGu2WYCm+3MwVDRbg6HG2wMEaqqYBShnbhKgcodLgK7aDpPI8XQ/QENDFoB+Od5PokOXOjF0
	/sg+CpXdKcKR+VGLAGXvrSbQ7g4Hhbrv7yHQWL6bMmMrFyCLzd2v+X4BgW4UFALUU/fJmgDm
	xEQWyZTXGpmOaZOAOVUyRDGNlr0kc3Og3Z3v3cCcLqulmFt5PRjTVPUNU3XfTjD756RMfrMF
	ME3njMzB8hmMmWhcGkfHp4Ync2wipxNz6gRNYopaGSF5/0PFWkWoXCoLlIWhtyRiNZvGRUii
	YuICo1NU7gNLxFtYVbo7Fcfq9ZLVkeE6TbqBEydr9IYICadNVGlDtEF6Nk2frlYGqTnD2zKp
	NDjUTdyUmny55hKl3SX8aqL1CpUJBslc4CWEdAg0tWVSucBb6Eu3A/jgpA3wwV8A9mX1Pwum
	ATTvvOGWCOcl+YVqPt8B4IFjwzgfjAN4ZqwY8/Ql6UDYeiSb9BT86TYfePX0iMBT8KLXwf0X
	rIQH+9EKaO0dpDxYQK+A3eZx3IN96DDYWXGJ5PFLsLfYOa/F6Tdgtfkezi8uhjOj1fN9/On3
	4KFHuQTPWQT/+NkxbwjSp7xh++wFnF87CvYNbua1fvBuTzPFYxGccHU8c8bAylkRn06Gf9bU
	Ax6/C7v6Dws8FJwOgPW21fykhXDfEyfGK31gTrYvz14Bd7quCXi8BBbk5RE8ZmBek+XZqa4A
	eLjYjH0HxCXPmSx5zmTJc2ZK/p9sAgILEHFafZqSSwjVygLV3Nb/HjxBk9YI5v/fqrhWcPzE
	XJAdYEJgB1CIS/x9LofEcL4+iWzGNk6nUejSVZzeDkLdpy/ARS8naNwfWG1QyELCpCFyuTwk
	7E25TLLI597uskRfWskauFSO03K6f3WY0EuUiWW8ttHKsA9P1GfYt4N48HT2416j0TTnquya
	1owuUJyN8NsgW1e09kKM70ffntlVl/AC3PsFZh9cgItcNtbpmIkOV0Wt+9yvZcuacGVS5NGT
	S0aTlh64vfLHgZ/iI3IaTDnRRObGzzLH5JPLGzYnbfWKlW53HVs/w5bWZMdar8zFhwYwkYQy
	YVttjCNZOdlwLPixtbRnh6rOEFWQMV44kGa6HESOXjfWxbaFOUujHt6ZWvxqO77sA7PfOc6h
	uZl70NpduWtZi3N2uHNEWbSJ2mBKXH439ofcT+ULbUfP3zW+Hr2l94ns67zFwd2/pTgnx1Je
	XFkzskNcR0YuTt+NNxgVjyUCfTIrW4Xr9Ow/J3bdQggFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxiGfc9nadbs2JJwhE67mgXnZrUb2V6MIdsSs7OPaBeWLbKQrZMz
	RNvCWtxkmtHALFBHkVAD1sEB6apUmNJCZUALa4uOAUWkiE461iiKkWHUacJG7QrdFv5duZ/r
	uZ/3x8tDhWN4Mi9PU8hqNUqVlOBjLp907aZPp3awW46Mi6B1bIKEP0+eRGDZvI2EwTEvAqcf
	lQN4LHyTgK3uAAKjrmoUcv4ADoOP7hGwtPksAa/+ZcDh7yV2BM7Xi6FpNoxC991OElprOBx2
	GZow+DhYjkDz4ikEOm5cwaGTWwSwPPIngA3+eQyOd39HQH+0CsBQyA7ghTNBAtaNehA43FxJ
	wvpbZhQ23e/EoKHChsPDbj8JfXNlOLxtiikL3Q0YtHfH+jrmqnF4vboGwIttH772PHPuYQnB
	NLQeZNyPGzHmR0uIZBz2CoKZutIbywffY/rqW0lm+shFhHFaixnrnBdnqiJbGFOHHTDOoYNM
	bcMCwjx0rFVQWfxtOawq7wtWuznjE/6ejvHzeEGUPNBzz0bowWXCCHg8mkqjTTUaI+DzhFQP
	oL8ZmSCNICGWp9CT7Uf/ZRHd8uQ2GZduAbqv5NTygKA20V3NBmKJE6lrAnpoamdcCsSkydCy
	lEBtp6tGXPgSi6hsOuyJLucY9Rzta5pFl1hApdMebpSI82p68PhNbIlR6gV65trM/2xruovG
	XyShF2ZsePzwG3TdfSMed5LoOwN+8igQWlZUWVZUWVZUWVasNALMDtawBTp1rnq3vECuYb+U
	6ZRq3X5Nrmx3vtoBln/dxg1d4DfuicwLEB7wApqHShMFl9LeZYWCHGXRV6w2/2PtfhWr84IU
	HiZNEsjrTuQIqVxlIbuPZQtY7X9ThJeQrEcyKnt/mFB/YOL7XH2rt4oGnk3oCJw9EUlO1QuN
	s9Hvx8n2YdsuB+rOXpVa4/y7WMb5Mh+c7zxepOAmRnYYRS1wfXbuy+sqMnZu/miQ+zZrCEvb
	PhYOi82Lns/6v0YdJ4vJQwrrvg2Bl159CrNxinWLvevP7dpqeSZTwRxQmN+OPP3+pGCg9rQ7
	0U7K9koupctbPKXb3pHYq8X9efkVen1VYZ9Y84ql51C6IqW9uVQoeXNNatD34t60yJnGsEb5
	uVkl6g6JR+naP+q4/uHMtgeFrp/a2FWi6xLlMe7qL2WVXUU36LJfT1+Wm15PcmaxAqJkWiW7
	c0H9lrHR0Fp0WIrp9ijlG1GtTvkPV9o3E+QDAAA=
X-CMS-MailID: 20231111014402epcas5p3d1e90326a5dae4b9014298f55948858c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104453epcas5p312b9462b8b747ac856c337929dcfdcbe
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104453epcas5p312b9462b8b747ac856c337929dcfdcbe@epcas5p3.samsung.com>
	<20231108104343.24192-16-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:14 PM
> Exynos7885 reuses several devices from older designs, thus historically w=
e
> kept the old (block's) compatible only.  This works fine and there is no =
bug
> here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to Exynos7885 in front of all old-SoC-like
> compatibles.  This will also help reviews of new code using existing DTS =
as
> template.  No functional impact on Linux drivers behavior.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  arch/arm64/boot/dts/exynos/exynos7885.dtsi =7C 45 ++++++++++++++--------
>  1 file changed, 30 insertions(+), 15 deletions(-)
>=20
(...)


