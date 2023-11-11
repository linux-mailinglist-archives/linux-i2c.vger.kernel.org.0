Return-Path: <linux-i2c+bounces-61-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE07E877B
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 988A2B20C45
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C272423B9;
	Sat, 11 Nov 2023 01:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UB6bIQdL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E52113;
	Sat, 11 Nov 2023 01:25:06 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF30448C;
	Fri, 10 Nov 2023 17:25:02 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231111012458epoutp01cf74a2a21b8835178ef800ecf40ba483~WbSEmY9Y61205312053epoutp01Y;
	Sat, 11 Nov 2023 01:24:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231111012458epoutp01cf74a2a21b8835178ef800ecf40ba483~WbSEmY9Y61205312053epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699665898;
	bh=VYwxWKJ0tuYMwGMcDMMxBxBbaVbKD8LhIQXjozkdTmQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=UB6bIQdL0jpN9/aH0461nocOocLPUvJbgdoBgmLeaFo2lhc3OHfmmGOUHEtBRrVrw
	 Tb5LrC17tCS2gAL3CQ5S9j9ckv+nV0Way5XgRSeA6jmyKGMgbKyIc8SmaYGG58X7bX
	 JcDRvmWdr+7lCU8Bl8wm6XFzXbV83IugwLG+LS38=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231111012457epcas5p1bc6708d546a018dc80fecab9ce9ba134~WbSD7O4CR1367913679epcas5p1v;
	Sat, 11 Nov 2023 01:24:57 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SRyfc1JPVz4x9Pp; Sat, 11 Nov
	2023 01:24:56 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8C.BD.08567.7E7DE456; Sat, 11 Nov 2023 10:24:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231111012455epcas5p4679a665890bbb8996c6a82f5aac700f7~WbSBwcPXK2904529045epcas5p4W;
	Sat, 11 Nov 2023 01:24:55 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111012455epsmtrp2b355ad4fa936eeec6c285dfff68b31c0~WbSBvFR0H1553515535epsmtrp2V;
	Sat, 11 Nov 2023 01:24:55 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-64-654ed7e7f489
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.25.07368.7E7DE456; Sat, 11 Nov 2023 10:24:55 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111012449epsmtip1aff01f26a313aef7d3d73ffd91a5d03b~WbR8oxmbv0432804328epsmtip19;
	Sat, 11 Nov 2023 01:24:49 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 09/17] dt-bindings: gpu: arm,mali-midgard: add specific
 compatibles for existing Exynos SoC
Date: Sat, 11 Nov 2023 06:54:48 +0530
Message-ID: <05a501da143d$e062e8b0$a128ba10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQGcPFzzAewXQoiw3+0MUA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzeua9e2OruEPGsuoU08wEb2LrSnS4yt4nbzUbUxWzGZQl27ZUi
	pdQWnEPjmI3lpSDKolTeMDR3IhMVGS8dsoEZEdGCj8GUKUUFaloKGfJa4TLHf9/vO9/3e538
	aNzPI5LQMYYEzmRQ66WUL1F9JSg45NGtDZzs1iJU1tEpQq23SjCU4iwXIXtHE4bujaQC9EPv
	QwqdbriGoenqbBwVNl8jkX3kKYUspZUUuv3MSqL7+3kMOfOXosxHvThqGLggQmVHC0lUYy0m
	0Kg9FUM5EycxVPWgi0TnCicASp30AFTQ7CTQzdo8CjVPZwHU08MD9PtPdgodb2/EUFvpIRHK
	d+TgqNh1gUDWtHISHWhoFqErgykk6s/0SsZqCwjE13rznR/MJtGf2UcBaqnY8n4Q+/Pwfoot
	OL2HbRgtIthfbD0itopPo9jurnovf/Uz9lL+aRF7L6MFY8+VfceWDTaRbNakjM08zwP23B97
	2GMFYxg7XPX6JubL2DU6Tq3lTIGcQROvjTFEh0s/3Ry1LipMKZOHyFXoHWmgQR3HhUsjIjeF
	fBSj9+5XGrhLrU/0UpvUZrN01XtrTPGJCVygLt6cEC7ljFq9UWEMNavjzImG6FADl/CuXCZb
	HeYVbovVedwnSKNDtJt3pYBkUE+lAx8aMgp4qrFOlA58aT+mDsCLlTZCCNwAjh7kKSEYBXDw
	zoPnlqdpjjlLA4CNlqk51SMAqz1/gRkVxYTAmlLr7IM/UyeGNy/97U1M0z7MevjEZZ7RLGR2
	wv7D2cQMJphlMNflnMViRgWL+p5gAn4FXs19OMvjzJuwvHgAF7oIhGN95eQM9mc+hL0jPClo
	FsPHvzXPdgeZX32hc3CKEAwRcLDsIBDwQvik5bxIwBI47GygZnqDDAtLJiQCrYNDJyvn5Gvh
	ZXvebPs4EwQra1cJpRbAQ+MPMcEphqlWP0G9DFqcnXNFl8DsjAxSwCzMuFsHhFXdANDpekYe
	BoG2eVPa5k1pmzeN7f/KRYDgwauc0RwXzWnCjHID983zD9fEx1WB2fMLjqgBtwunQpsARoMm
	AGlc6i++rojk/MRa9bdJnCk+ypSo58xNIMy7+mxcskgT771fQ0KUXKGSKZRKpUL1tlIuXSwe
	OJCv9WOi1QlcLMcZOdN/Poz2kSRjKzdrS+/Q/lOqoJ70zJGifqKrnbSEb0/tlQT/Y5dnharQ
	grvuBVs/tur70jp2vjXSGsfVOzYef1yQr9mn+fpYkvts3uqXUr4YquU/9ywEeQGrdpw5M73j
	eP/L7vobjSWOPLG48Kv6LZ9k7np6qmKJ+gw39UbNes+P0x8sjcmV+ijb7o9enLCfdb/2wnIf
	3XJunB7XhK1MO2Eb4z3qyBfvBQR9T2a0d1cnTSfFrt3YkRa1d6VDvyKHWke7hofwZVpnrtXt
	ub69WuHq3vOgvd+/7v5W/7bWvoMBlyuiPR08jJxM3NAZELT1QsW+k4pky+5t+KIj7uQV+UvC
	72zvtoQSyr09UsKsU8uDcZNZ/S/WOxeFBwUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDTdRzH7/vb7wlq3a/5wDcljnZHIgS6E6+vZ2Fn1v3Os1DTSOrAHfxA
	kA3axFzYsQiBDQQmGmM5xsOEc82rwSBYgcdYkYeBS5Q0JmE8GHAI4eBWPASsOv573fvzfr8/
	nz8+NE/QQ2yik6WnOJlUnCokffGmDmFA2Gjf29x2p3oDMjrvUOjHvmoM5U3WUqjXacfQgDsf
	oEuDQyQyt3ZjaKlJw0MGRzeBet2PSfRZzVck+uWvXAL9lm3C0KTeHxU9GuSh1vFGChlLDQRq
	zq3C0WxvPoYuztdhqP73uwRqMMwDlL/wBKAKxySObtsuk8ixVAyQy2UC6Icve0mk7WnD0M2a
	8xTSj1zkoarpRhzlqmoJdK7VQaGOiTwCjRYtWzy2ChyZbMt91gkNgX7VlALUeS36ta3s1zPZ
	JFthzmRbZytxtkXnoth6k4pk++9+t6zfOMRe15spdqCgE2MbjFmsccJOsMUL29kiqwmwDV2Z
	bFmFB2Nn6gMOMjG+ryRwqcmnOdm2yOO+JwatMekPqDPanD+BElhJNfChIRMBH6tGKDXwpQXM
	twAaP9US3sFm2Gcpoby8Dl5dHP3XNALgz7fcq2mSCYPNNbmrvJ65x4dd/VErLGC6AZzr3KAG
	NO3DvAHHpuUr8jomDbY1WbAVxpkgWD49ia8wn9kFK4fHMC8/C2+UD63qPCYUDt8b/p9rq8Z5
	3nsCoWe4lvCu3QsH3SbC6/GDf3zvoEqAQLemSremSremSrcmUglwE3iOS5dLkiTxonSRlPso
	XC6WyDOkSeHxaZJ6sPpzIcHN4IFhMdwOMBrYAaR5wvX8WxEHOAE/Qaz4mJOlxckyUjm5HWym
	caEfX6T9IkHAJIlPcSc5Lp2T/TfFaJ9NSuz0M/setlx3j7cMRBadu+QsiH+vzmkZO5o4IR2v
	sib7vdhzOPHwwcT+N+feCnRx+EPJ4kzh3OvvXwkK/kDe3BZanJJ4YUofdfyTHEP5ySMHhuf+
	vpKjJTYSyh2aF/Qh+87sJJBNnbhwvu0JrdTMvLxrdsvZ3c+HZRWEHqPL/HfCq9GFiqmA+8c2
	Jhja3Rnaa7GWoHf3vKq4XfioQ7HDM58drCjTdU+HxEUI/C03NfsD3nn6KUdJ+9aXWu807JlS
	RqeohrLabSn+XZLSyKUWjSkT5O8tqM4rV8eKQhVtJT95CMu2rEZzHqw+2qS6X/fhSOnn3+h3
	x5m3xMSSUftdlYFHzuqEuPyEWBTCk8nF/wCXHJsY4gMAAA==
X-CMS-MailID: 20231111012455epcas5p4679a665890bbb8996c6a82f5aac700f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104433epcas5p3c5c99fce5dacb636c39a549d9b9929ee
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104433epcas5p3c5c99fce5dacb636c39a549d9b9929ee@epcas5p3.samsung.com>
	<20231108104343.24192-10-krzysztof.kozlowski@linaro.org>



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
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml =7C 5 +++++
>  1 file changed, 5 insertions(+)
>=20
(...)


