Return-Path: <linux-i2c+bounces-65-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706C7E87BF
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430FE2811DB
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F25129AB;
	Sat, 11 Nov 2023 01:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C01VRMxX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DB1FA7;
	Sat, 11 Nov 2023 01:41:12 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0894FB0;
	Fri, 10 Nov 2023 17:41:10 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231111014108epoutp025cf069482209ecac106f479c4a218b7d~WbgL2S2Ym2420424204epoutp02x;
	Sat, 11 Nov 2023 01:41:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231111014108epoutp025cf069482209ecac106f479c4a218b7d~WbgL2S2Ym2420424204epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699666868;
	bh=Pe6Fds5GElggiaMTYlCtkoP8TFPdG6vBCd2eWn4ioxE=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=C01VRMxXNe1fpIYsj0wtwM11986L6ZlVEolZhU3K+yXjHqYS3kt9vSqVrn/Wrou3d
	 GUS+lkA2b7/BNkp1X3kVSqGiLRj0wGWdXZYXHBbXDOwjzBtT2ViO78EPCGEYl/IFds
	 78pFbVQDcIBjC+oPrPRXAyv5LN2y7j6FyyKwbkp0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111014107epcas5p49c7feef7178320dec37c857c4f3bc10a~WbgLLPwvm0693506935epcas5p46;
	Sat, 11 Nov 2023 01:41:07 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SRz1G3CZbz4x9Pt; Sat, 11 Nov
	2023 01:41:06 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.8C.09634.2BBDE456; Sat, 11 Nov 2023 10:41:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231111014105epcas5p3eeaaaef5a4610e600554195a2bf8cdd2~WbgJj-0Ys0517805178epcas5p37;
	Sat, 11 Nov 2023 01:41:05 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111014105epsmtrp2b6b86f09b7550fcb0e9f8cf48c89dbe2~WbgJivU4v2673626736epsmtrp2i;
	Sat, 11 Nov 2023 01:41:05 +0000 (GMT)
X-AuditID: b6c32a49-159fd700000025a2-bc-654edbb2e2e1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.63.18939.1BBDE456; Sat, 11 Nov 2023 10:41:05 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111014100epsmtip201b68c72310a94ac4a3923633daab63a~WbgEYL2_43024830248epsmtip2j;
	Sat, 11 Nov 2023 01:41:00 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-14-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 13/17] arm64: dts: exynos5433: add specific compatibles
 to several blocks
Date: Sat, 11 Nov 2023 07:10:59 +0530
Message-ID: <05a901da1440$22c61400$68523c00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQHmV3IqAgzqAAiw3J2JwA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBTVxjtfXl5CUzTeUYcbiM6mTgo0LKkhXix0tZ1niNanI7a2rGYwisB
	Q4gJuCuiJEQQBAQtlAQjDFSKgyaBspSiEApIlYKAqCAoVKgsiqAWxdKEIOXf+c53zv2WOx+b
	wR1j8dihskhaIRNLBYQ9XlLjuszdcG8z7XVf54Bym9tYqP72BQzFjeSxUGtzNYa6n2sASn/Q
	R6DCypsYmipJYaBs800man3+hEAncooI1PFKzUQ9xwswNKJ1QkkDDxiocrCYhXLPZDNRqVqP
	oxetGgylTeZjyNDbzkTG7EmANG/GAdKZR3B0qzyLQOap0wB1dRUA9PvPrQT6oek3DP2Rk8hC
	2kdpDKQfLcaR+mQeE6kqzSxUMxTHRP1JFslEuQ5HBeWW90xDKUx0L+UMQHWXtn/uSl0eO05Q
	usJDVOWL8zhVltnFogwFJwmqs/1XC9+wharSFrKo7oQ6jDLmRlO5Q9VM6vQbLyrJVAAoY+Mh
	6pxuAqPGDIsDyB27V0pocTCt4NOyoIjgUFmIn2Djl4FrAn1EXkJ3oS9aLuDLxOG0n2Ctf4D7
	+lCpZcEC/l6xNMpCBYiVSoHnpysVEVGRNF8SoYz0E9DyYKncW+6hFIcro2QhHjI6coXQy+sj
	H4tw125JebsJk8ey99//xcw8Bu4Q8cCODUlveK9TY8H2bC5ZAWD3qzZgC54BeFrVz5oN7qqu
	zFoMnb0zljIAp4ZuzgQDAF5rOzutIkh3WJqjnk44kBUceKvqIW5N2JHrYFVtDrDi+WQgTB1X
	WTCbjZPOcNjgYqU5pC+MrWkhbHgebMjom7YyyA9gnn6QYeuCDyf+ymNasQO5GqZXJ7BsGkf4
	d615um1IFttDU0w/y2ZYC9Nzr+M2PB8+rjPN8Dw4NlJJWHuAJAUvTPJstAQO5xcBG/4MXm3N
	wq0SBukKi8o9baXeg4mv+zCbkwM1aq5N7QxPjLTNFFoIUxISmG8f1w0orTSXbAGwo9kzGfAz
	58yYOWfGzDmzZP5f9zzAC8D7tFwZHkIrfeRCGb1v9ruDIsINYPr63DaUgq6epx7VAGODagDZ
	DIED509vf5rLCRYfOEgrIgIVUVJaWQ18LHtPYfAWBEVYzlcWGSj09vXyFolE3r4fi4QCR86g
	ShvMJUPEkfRumpbTirc+jG3HO4ZtcWr4qtLXY6Cw8ceKmInbmxa12LeOlny/a1y/XrT6ua7i
	4cvtG9ofqZ84ce7HhH247DUqL3ZZmrp1uQkUfXcw0KSRDp5yVsTWubUs+imrLI27rqfnzsV6
	M5FRXxZ29/FCfVQYX3JkG94Z4Lzz2xuaS8aXlx+oq0Q88ZZtV4tGeb3Mr0PoJRuM2uhG1Ymm
	PXdTk9fAK9eQpOliRv5m7TuH9TeMtQmsTzRna3r27+iIi/83e16yeSzb5VysXp4a7X+5a+sX
	dosnjrYlJveedAzZq4sf1uY9G/1n6aq4np26JVLPpqfp5/NHFpy6vsoYtMc/eSOMr//mMGdU
	pVlx5F1x94Goo3b7BLhSIha6MRRK8X/fC5vpBgUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjG9z89N9DGQ2X1iOBMmcmEgOj48A7NtriMnBkz3MZihm6sk8Nl
	UMAWF4ZLZNhRLpHLuGxrRqG0qViL1SJQCEVXytThKs4CJYJIkIsDIRN0gjAGNFv49sv7PO/z
	Ph9eWiC6RfjRSakZvDxVmiIhvfGmDskrIZfvvc+HXbsfDPo7PRTc6KvFQDVtoMB1x47B0NM8
	BBXDD0kw2ZwYLDeVCqDa4STA9XSGhDM6MwnuhVwCHuQYMZiu8oeiiWEB2CYbKdCXVRNgzdXi
	8MyVh0H54jkMLCO9BDRULyLIW5pDoHFM43C39WcSHMvFCAYHjQh+veAi4cfb7Rjc0p2loGqs
	XADavxpxyM03EPCdzUFBx5SKgPGiFct8qwYHY+tK3pWpUgLulZYhuF5/5O1d3KXZHJLTmE5x
	tmc1ONeiHqQ4izGf5AZ621bmNz/grlaZKG6o8DrGNehPc/opO8EVL4VxRVeMiGvoOsX9oJnH
	uFnL9sNMjPf+OD4l6StevvvNz70TX1j6UPoylXn2fjeZjf4gC5AXzTLhrGVgZIW9aRHTjNi6
	S3W4R9jG9l0uoTy8mT3/zzjlMY0htq1zDK0KJBPCWnW5a0m+TL+Q7RqIWmUR40SsatF3lb2Y
	d9mrnbo1/2bmU3ZC9dsK0zTO7GQfW15bHQuZN1hlh6eQkPFhb/70cK2DgAlmR/tH/2eDdlLg
	6bODnR81EJ6zB9gKeyHl8WxhH3U6qBIkUq+LUq+LUq+LUq9bqUG4Eb3MpytkCbLj6XtCFVKZ
	4mRqQujxNJkFrT1c0IdWZDAvhdoRRiM7YmmBxFfYHX6IFwnjpF9n8fK0WPnJFF5hR9toXLJF
	GJiSHydiEqQZfDLPp/Py/1SM9vLLxvYdMEfJ6470meq310MEHY4u6t2/VyoPzn3b474tNsW+
	OpcZURub2x0yGHvI4czaRcVsEn0UXzl8ra46c0HZE2kj8qYm/XTWJLfvF77ny/eOYzCyrNvd
	3BIfnfz3vgcF/bXl+ngr7iAeL5RGLNFBLtF7CnHzMUGE3+mKgGPashZtVvpMZnJ24y9z7xT6
	bNXkzMTd4HIc3z9/4gwQx+D7jX/6o6P6mrvo3OKTwzu+3JQQZf7YXRFZclTmDivYkNCEkjdG
	Jr4U+Cjgs9mt8eL2DT7K0Qsj7eauE5OvF1dm7PQfKomWvbVXM3TxBHySlvQ8WNSrSl08882E
	uM3nYGB0rVKCKxKle4IEcoX0X1zC613fAwAA
X-CMS-MailID: 20231111014105epcas5p3eeaaaef5a4610e600554195a2bf8cdd2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104448epcas5p31e7f949e5c335addeb7f21b76130c53f
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104448epcas5p31e7f949e5c335addeb7f21b76130c53f@epcas5p3.samsung.com>
	<20231108104343.24192-14-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:14 PM
> Exynos5433 reuses several devices from older designs, thus historically w=
e
> kept the old (block's) compatible only.  This works fine and there is no =
bug
> here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to Exynos5433 in front of all old-SoC-like
> compatibles.  This will also help reviews of new code using existing DTS =
as
> template.  No functional impact on Linux drivers behavior.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  arch/arm64/boot/dts/exynos/exynos5433.dtsi =7C 60 ++++++++++++++--------
>  1 file changed, 39 insertions(+), 21 deletions(-)
>=20
(...)


