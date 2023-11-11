Return-Path: <linux-i2c+bounces-58-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFE7E8740
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5EE1C209A5
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2F1FAA;
	Sat, 11 Nov 2023 01:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ezBaNy7B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717441865;
	Sat, 11 Nov 2023 01:04:21 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21603C15;
	Fri, 10 Nov 2023 17:04:18 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231111010416epoutp022f885e82f5c9ac2a98313780c5706593~WbAAKHHfM2865928659epoutp02z;
	Sat, 11 Nov 2023 01:04:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231111010416epoutp022f885e82f5c9ac2a98313780c5706593~WbAAKHHfM2865928659epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664656;
	bh=Y13ddhaKutoc1gTU3DaFdmPxvu+keYSdBO0VVuF0fNI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=ezBaNy7B8hn0Xt3iLv1EylmwtGXM2mZX5aSaO6kaEv8qCZc4jQlmOyGhT9jcpJdcp
	 jvc4N4X/LHVAwD3RRj4CEvJ1H8gMOkxkCsmQ7SWmid30Z3pQpIqNWwJlMOJku6EjE4
	 bB2zG9kWHv0lZBhLHj77HiIiNa/ccUWnxje0fnec=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20231111010416epcas5p303686a878b2f8ae77c254b1e6816e83d~Wa--jqdZk1973119731epcas5p3k;
	Sat, 11 Nov 2023 01:04:16 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SRyBk2S0lz4x9Pq; Sat, 11 Nov
	2023 01:04:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.9A.09634.E03DE456; Sat, 11 Nov 2023 10:04:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231111010413epcas5p4bfb92540f9151e93a1387f70136ec03e~Wa-9Tk8zt1743517435epcas5p4B;
	Sat, 11 Nov 2023 01:04:13 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111010413epsmtrp1ef39a82df4dd2bd5c3a10b058336d794~Wa-9QvpZG0906709067epsmtrp1M;
	Sat, 11 Nov 2023 01:04:13 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-ea-654ed30e741c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FB.A2.18939.D03DE456; Sat, 11 Nov 2023 10:04:13 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111010408epsmtip27bd5bd231f1419363ad818c56cbe457a~Wa-4JcFYb1782317823epsmtip2Z;
	Sat, 11 Nov 2023 01:04:08 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 06/17] dt-bindings: rtc: s3c-rtc: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:34:06 +0530
Message-ID: <05a201da143a$fc3ebe40$f4bc3ac0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQKOwjMDASoAvJyw3mdzIA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1ATVxT27m52F6ah22DhlmplUrViB0gs0JsK9VG029Zx6MNxhj8YYcs7
	pNmgtFqb0TEEGKUZoSgTQIQBG6HUgAhRCIUo0vIoJYitpuCjViVGER/FhrGJq9Z/3znn++45
	37lzaFxylwqh01VaTqNSZklJf6K1J2xpeMDIek5mv0+j2uFRCp0ZO4ShfHcdhRzD3Rgav2cA
	qPTiFRI1dAxi6FGrEUdV9kERcty7RaJdNU0kOvdQL0ITO80YclfMQ3uvXcRRx+QxCtXuqxKh
	Nn01ge47DBgq8dRjyHL5rAg1V3kAMszeBajS7ibQiNVEIvujYoCcTjNAp484SLR/qBND/TV7
	KFRxtQRH1VPHCKQvqBOh3R12CvW48kXo771eyoy1kkBmq/e9FpdRhM4b9wHU27hxZRj74/RO
	kq1s2MZ23D9IsO3lToq1mAtI9sLZk95838esraKBYseLejG2ufYbttbVLWKLZ2Xs3hYzYJt/
	2caWVc5g7LTltQQmMTM2jVOmcJpQTpWck5KuSo2TfvRp0ntJ0TEyebhcgd6WhqqU2VycNH5d
	Qvja9CzvgqWhW5RZud5UgpLnpZHvxmpycrVcaFoOr42TcuqULHWUOoJXZvO5qtQIFad9Ry6T
	LYv2Ejdlpo1aRWonlXdnpJ3QgWayEPjRkImC12z7qELgT0uYEwD+XHFcJAR3ADw8mY8/Cwb/
	MGJPJX2mW4RQaAew60zRk+AagEO6WcrHIplw2FajJ32FucwJMRyxXSJ8BT8mHh41HMZ9OJBR
	wnr9YS+JpglmEXSV+PvSYkYBXR1jQMAvwb4DVx5LceZNWFc9iQtThMKZv+pEPjyXWQ2bhhyk
	wAmG10/ZHxuCTLs/bLo4AARBPCxz/UkJOBDe6G15gkPg9WI95ZsBMiw85AkR0mnwZn3TE+kK
	2OUwET4KzoTBJmuk0CoA7vn3CiYoxdCglwjsRXCXe5QQ8KvQWFQkEjALTzwswoRVDQM40XgV
	/xaElj/nsvw5l+XPuSn/v/NBQJjBK5yaz07l+Gi1XMVtffbfyTnZFvD4/JZ+0AacE7cjugFG
	g24AaVw6V/xr1DpOIk5RfvkVp8lJ0uRmcXw3iPZu3oiHvJyc471flTZJHqWQRcXExEQp3oqR
	S4PFk7srUiRMqlLLZXKcmtM81WG0X4gOk+6xHZkqnY6mCtP2n1XTc+T55/jzrS22B4kyNn7i
	hR7LF1MbJHnfqwcy59edHNqoB6Y15hf9FxqIgtLOBzGFud8dnxOcFxi7SpV3ejmat7ksW0ev
	7fzELFvSv/6ngfnFjv6Cy2Sn7ejm9s6qHzLzK7rqdzxU/LYicdDGyMGltgMzK/VsRM32owt0
	tPVrrf02YfH8vjigY3woUuumezI8W8pGDMtO/dMAt2YsWTyV2AoffGYaWlDveWOcX6ZQbdiR
	daExiMIu5XZ/qF27zmThN3yu2XaDwmdrlwe8H5EhFQclhOWvXrM9KLF84U1tZPWmab/Xdc5V
	bl1zgvH4WDC32CIl+DSlfCmu4ZX/Aaf9BUgHBQAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTdRjH+3z3/cVg3Jdp8QmLvBF3wALljrs+dZjmiX01f6Rd5515pwu+
	gRcD2lATooiMMbrAHSS0ZPwYzthYwAayllsxl0iI4DF+JZyKbOS5g3YChYAE7Or473XP+3le
	z/PHQ/OEN4kw+mRGNifLkKSLSD5+5ZropVhB/wFuq3M0AtXfHqDQjaE6DCmmdBRy3XZg6O5s
	EUDf3p8gUaPtFoaWr6h4qNp5i0Cu2WkSfaltItHwk0IC3SvQY2iq6gVU8ud9HrI9aqNQfVk1
	gSyFtTiacxVhqHzxMoZMDwYJZK5eBKhoaQYgjXMKR/3WiyRyLpcCNDamB+i6wUWiyl47hm5q
	v6FQlaech2p9bTgqVOoI9JXNSaFrXgWBJktWWuatGhzprSu+Vq+KQHdUZQB1Go/siGabHxeQ
	rKYxl7XN1eDsT+oxijXplSQ7Onh1pd51iP2lqpFi737dibHm+s/Zeq+DYEuXtrIlrXrAmrtz
	2QrNPMY+NoW/wxzlJ6Zw6SdPc7Itb5zgp90zz/CyBqhPfKUXyHxgIItBAA2ZBNh1cRovBnxa
	yLQDaDB04/5gExxqOU/5eQNseDq5xkLGA6BnJGqVSSYWWrSFa6KNzIgAdo8e9It6ABzurCFW
	gwBmF2wp+oG3yhuY49CqWFxhmsaZSOgt56+WBcxr0GsbAn4OgV3fTazdwGPE0D3i/p91tY94
	/ns2w3m3jvDv3Qmbel2kvycUPvzNSZ0HQvU6lXqdSr1OpV43UgNwPXiWy5JLU6XJWfFxcolU
	fiojNS45U2oCaw8Xc9gCdE1LcQ6A0cABIM0TbRT0JezjhIIUydkcTpZ5XHYqnZM7wCYaF4UK
	ItKVKUImVZLNfcRxWZzsvxSjA8LysSDr4DlD0OHnMkDS96ZtUZLd/XVnNO3RFcKyTHPi0+hw
	hThw4S97+JnSd0PTLil9zrfGf+zrCI5sytflHXjdk2z8OOHF91otULzn+cb9Kiy6/SGW474c
	8f5uX/Deo0z2ucq5IyApt2E8/MGCIgg0B0yU96oCnZ82h8Avoiw7Toi1eZ+FzLw8l/bqm/nS
	yYRfjdsHdWGzDaHxnIxMOrZzn7gt0j38s96uW6gtrvrjDjKeNeY9+SB2c47nmZjADseu0812
	6VUjTBzoMS64g/mmScV4X6V29Aafe6WH8HUwh9R1Icqc3wsuTG+psL8dK13euz2Ibbn+z4fb
	lkQNFYHH/r4kwuVpkvgYnkwu+RfoE4uA3wMAAA==
X-CMS-MailID: 20231111010413epcas5p4bfb92540f9151e93a1387f70136ec03e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104420epcas5p4620e3dbb5b70bb9e1f0eb6e2f55a7ebc
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104420epcas5p4620e3dbb5b70bb9e1f0eb6e2f55a7ebc@epcas5p4.samsung.com>
	<20231108104343.24192-7-krzysztof.kozlowski@linaro.org>



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
>  Documentation/devicetree/bindings/rtc/s3c-rtc.yaml =7C 5 +++++
>  1 file changed, 5 insertions(+)
>=20
(...)


