Return-Path: <linux-i2c+bounces-56-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0A7E8729
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8101F20F4D
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 00:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AD91FAA;
	Sat, 11 Nov 2023 00:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XjAjBgvq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE781861;
	Sat, 11 Nov 2023 00:58:00 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71FA422D;
	Fri, 10 Nov 2023 16:57:57 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231111005755epoutp011d21acc0c4dbbebb5fffcb42672f9b4b~Wa6dVu1UY1970019700epoutp01i;
	Sat, 11 Nov 2023 00:57:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231111005755epoutp011d21acc0c4dbbebb5fffcb42672f9b4b~Wa6dVu1UY1970019700epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664275;
	bh=B4DS7GYDmEcj1GlZgxRqsLrP7yYRyuSdQG1LT92Uka4=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=XjAjBgvqkhEZEsV55TVYKM+TXWdZWEDsMYg+tvv20aeio95p9ZIltMFlVuh1/ocHX
	 nrQFJavog0wzIPwVPFmjQTnzUNcNDf344Yatv28FG1Z0V+CiwA/HQ505oxcjSxyLlM
	 ueqrsoxTb4UhYCvwJPHZd3GXUQ12Y2LlrJ8nCbrk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111005754epcas5p48dc26e3247e22b826ba79751e5f750a6~Wa6cNAgXG2925329253epcas5p4C;
	Sat, 11 Nov 2023 00:57:54 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SRy3N6GJLz4x9Pv; Sat, 11 Nov
	2023 00:57:52 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8C.2A.09634.091DE456; Sat, 11 Nov 2023 09:57:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231111005751epcas5p36fd668ed88edc7b401899d167f1304c6~Wa6ZK9Cfa2862628626epcas5p3d;
	Sat, 11 Nov 2023 00:57:51 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111005751epsmtrp2c05199891aa55def4bb99570177aa3bc~Wa6ZJiGYh0060400604epsmtrp2y;
	Sat, 11 Nov 2023 00:57:51 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-61-654ed190f306
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2D.94.07368.F81DE456; Sat, 11 Nov 2023 09:57:51 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111005745epsmtip2694890a6735cd8afdca478991f6d4423~Wa6UArs0e1304513045epsmtip2R;
	Sat, 11 Nov 2023 00:57:45 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:27:44 +0530
Message-ID: <05a001da143a$18508600$48f19200$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQIJIkcXAUX8Bruw4bJlkA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVRTZRjvvXe7m55GF8TjO6LamekJFdyErReTsuTUTVdCSpzq5BpwAw4w
	1i6oSX5BfB/AiZby/bEzcloqoE10wRlLQUz5mMQpEVAEERwaw3MQOLRxsfzv9z6/3/P8nud5
	z8PHPSZ4XvxYdRKtVavixcRizvlmnzd8D3V8TEumTvggfcdNHmr5swpDmXYDD9k6LBjqm8wC
	6OjAIIFOma9jaO68Dkfl1utcZJscJ1Ba9WkC9TzN4KL+VCOG7KXeKP/+AI7Mo+d4SF9YzkWm
	jEoOemLLwtCRmRoM1d7t5qK68hmAsmYdAJVZ7RzU1VBCIOtcAUC9vUaALp+0EejYjd8wdK06
	j4dKh47gqPLxOQ7KyDZwUbrZykPNY5lcNJzvlEw1lHGQscFZr35Mx0V/6woBuvJz+EYf6sxE
	KkGVnUqhzE8qONSFol4eVWvMJqhb3Zec8dZQqrH0FI/qy72CUXX6/ZR+zMKlCmYlVH69EVB1
	bSnUj2VTGDVR+2oI+XnchhhaFUVrRbQ6MjEqVh0dJN6yTblJKZNLpL7SQPSmWKRWJdBB4mBF
	iO/7sfHOBYtFO1Xxyc5QiIphxGvf3qBNTE6iRTGJTFKQmNZExWsCNH6MKoFJVkf7qemk9VKJ
	ZJ3MKfwqLqZt0M7TDPB3N5sucA6ACl4OWMSHZACsNadxc8Bivgd5EcCzF5uAi/Ag/wHw6oMt
	LPEEwOOdA5xnGbaxfpwlzAC2z6Ry2Md9AFtv18yrCNIXmqozCBfhSV4UwK7GO06Cz19EBsPi
	g0IXXEJq4L3uJS45h1wB56YaCRcWkIHwZHMBYLE7bD0+OF8SJ1dDQ+UozjYhglP3DFwX9iTf
	gxPFfxCsZhkc+d3Kc9lC0rwYjsyMLHQdDNuysxaSl8AHV+oX5veCE3Yz4eoHkhSsmvFiwzHw
	Yc1pwOJ3YJOtZL57nPSBpxvWslZuMG96EGMzBTArw4NVr4Bp9psLpi9DXW4ul8UUHMrtB+ym
	OgA84LiKHQKiouemLHpuyqLnpin637kCcIxASGuYhGiakWmkanrXf98dmZhQC+avb9WHJtDb
	/8jPAjA+sADIx8WegvYABe0hiFJ9u4fWJiq1yfE0YwEy5+p1uNfSyETn+aqTlNKAQEmAXC4P
	CPSXS8XLBKPppVEeZLQqiY6jaQ2tfZaH8Rd5HcAy+d93ui/zns65lZfbE1RoCVP6p7578HH/
	+Oan4Q79S8zImr/gtHdVypmIHbsjtn9p7Cf2aE3uuzWHrIrXhpeGPjR9d6K4c4fkxTHhrxnt
	W6vuxolvr14e0XMYm90KVur3Bl0zb3esk9e772vy1DmYPZfat+3z6S20fOIdXPNpRXTJZzos
	M+hrhcFtXNHS0fJRVdfygz8Mf3BX9JbyTuv4UJokxX9/MffG1Aubn04XGN1y+uw7w0ZXfWFM
	r+P5XT2mEE56C78Rnr1hwC9PrFYe1i/teCVM5jBtX69+/dEGW9jhjdJdRjsYbJddjwkF2M5w
	aY1AWCFfs3LvT2HpfvccR3NW/iLmMDEq6Spcy6j+BdzQmo0GBQAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTZRzH7/n+2pdx0y+TOx5BjFYqQfwyzUcDrqMf973kCq2uDutqJ18G
	JxtzQ6zGhVoi0MngwEaj/YpFMujIjRlRk90YoiegXENFRLHABdtRNqBbJxKw6vjvfZ/36/P6
	PH88NC4cJqPpQlkJp5CJi0QUnzjfK3osST38Kpd6vD4cmYdHeOjSja8wdGq2hYc8wy4M3Z2v
	BOjMvUkKtTuGMLR0vg5HBvcQiTzzv1Pok+YOCt38u4JEEycsGJrVbUI1v93DkcNn5yFzvYFE
	XRUmAi14KjHU8PAbDFl/vU4im+EhQJWLcwDp3bME+rn7Swq5l9QAjY9bALrY5qFQ49ULGBpo
	Ps1DuvsNODI9sBOooqqFRCcdbh7q9Z8ikbdmGQl26wlk6V72dfrrSDRWVw9Q/7dvPf8U+13g
	BMXq21WsY8FIsD9ox3ms1VJFsbev/7Q8v7yP7dG189i7n/VjrM1czpr9LpJVL6ayNZ0WwNqu
	qFiNPoixAevmHCaXn57HFRWWcoqUzPf5BfrAWSAfpT9QaybJY6CRVw3CaMjsgB7/BF4N+LSQ
	+RHAcyMBMlTEwBvnav+FNsDWR15eCLoP4B1vG7FSUEwS7GquoFZyJDMqgFduvxaCBgG069zL
	WpoOY16ETcc3rjAbGBmcmdaAlUwwW+BSsGd1V8Dshm29ahDKEfDyF5OrfpxJhFOjU//nFpMP
	Dz0oDganWsjQ3SwYaBqkQkwUnO5z82qBULtGpV2j0q5RadesGAFhARs5uVIqkR5Mk6fJuKPJ
	SrFUeUQmST5YLLWC1V+XEN8F7hgeJbsARgMXgDQuihRc25HNCQV54g8/4hTF7ymOFHFKF4ih
	CVGUIK2xKU/ISMQl3CGOk3OK/1qMDos+hj1xmHq9VWN9MmnnzHR6vtStnLGUKMu9vk+3Xcyh
	99QZU96wvXNLVbtOHK7q973iE43yd01sHXu5I9209fOI1MSbmZ2xBqPTMPeg19awv8N5yJII
	n7n0V3mcqsy72R5nY+y5A/HTpzV7xe3OsgOZWIzK3vPs9xm/ZDuXtvHzY6Iz+yV/4vNjMn5S
	WeC5W0O73HOt8c6zzS/RCwPFhYpqE77z48IqoU6eI43VGU/G+td32QwZbdeUg33Gw46yMxEj
	+eLUAkWP++j2rNLIrJQ3E1/Y8nQ2u7h7U3Bfwrvm0qi3t2cfKC51BHJdGeESuP+qc2/01+vi
	Z4WPX3D8oemL2rNeRCgLxGkJuEIp/gcK6mv/5AMAAA==
X-CMS-MailID: 20231111005751epcas5p36fd668ed88edc7b401899d167f1304c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104415epcas5p45b4bec9400bef99cd35ef137b91eda96
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104415epcas5p45b4bec9400bef99cd35ef137b91eda96@epcas5p4.samsung.com>
	<20231108104343.24192-5-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:14 PM
(...)
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
> While re-indenting the first enum, put also axis,artpec8-dw-mshc in
> alphabetical order.
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
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  =7C 25 ++++++++++++------
> -
>  1 file changed, 16 insertions(+), 9 deletions(-)
(...)


