Return-Path: <linux-i2c+bounces-59-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF947E8750
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124FE280E7F
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295D41FC4;
	Sat, 11 Nov 2023 01:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="U+L+4PTj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCB1FA7;
	Sat, 11 Nov 2023 01:05:58 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451803C15;
	Fri, 10 Nov 2023 17:05:57 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231111010554epoutp04f7569e2d3721674989d865169f3460f5~WbBbRaams1256512565epoutp04n;
	Sat, 11 Nov 2023 01:05:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231111010554epoutp04f7569e2d3721674989d865169f3460f5~WbBbRaams1256512565epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664754;
	bh=OK8Hf2MbmRbpLCdwcqyPVCkRDEUDM0EEeuyfYvSMGTE=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=U+L+4PTjL59ltw6vj+gMs4+z64S4fj2NS+3S7mV7B4wJvjLR/HHM7WWxZJa+pxkqW
	 sCAQH/Z/WS3V0scJ/84csTBV8OnBUSgrUmjbrl4siQwq4Nc2yGLGDk2EhLmQDH+3ab
	 3/YqslduUZ5rwhbGVE+5AqObwFiycNzHXHtqa8IQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231111010553epcas5p150c65d73f66f8136d1d1c4d351930d8d~WbBaovr9k1169411694epcas5p1z;
	Sat, 11 Nov 2023 01:05:53 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SRyDc2FP5z4x9Px; Sat, 11 Nov
	2023 01:05:52 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FE.9B.09672.073DE456; Sat, 11 Nov 2023 10:05:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231111010551epcas5p1c47f739ffde8a0ad15a53d3ae8cdcbd1~WbBYO1i6c2981529815epcas5p1b;
	Sat, 11 Nov 2023 01:05:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111010551epsmtrp13205f26379a782b1c828ca176b302eb8~WbBYMXP960847408474epsmtrp15;
	Sat, 11 Nov 2023 01:05:51 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-24-654ed370aee6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.37.08755.F63DE456; Sat, 11 Nov 2023 10:05:51 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111010545epsmtip1244a785fcd85e95ac50649a118f3b13b~WbBS-XRnp2920829208epsmtip1Q;
	Sat, 11 Nov 2023 01:05:45 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 07/17] dt-bindings: serial: samsung: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:35:44 +0530
Message-ID: <05a301da143b$365fe090$a31fa1b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQF2IoecAc/Y/8+w4f3vwA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHd997/YFZ8Vk13DHDoIQRUKCVghcUtmzEPQdxLE6nZgY7+gQE
	2q4tImMTorP8qOKQH9saKBQQGUNx5ccQLTDoRKMBCUVIgCC/BoLWMQGDyFhLYeO/z/3e7zn3
	nHNz2Dh3huXIjpEoablEFMdjbiDq2zzcvWTd+2l+l5GDyrp6WOhubwmG0szlLGTqasXQ0Fw6
	QHnDY0xUZejA0HJ9No6KjB0MZJp7zkTnSquZqO+VioEen63EkLlwG8qaHMaRYbqOhcpyihio
	QaUj0LwpHUO5r69iSD/6iIFqil4DlL40C5DWaCZQd2MBExmXLwE0OFgJ0J1fTEz0Y2cThh6U
	XmShwj9zcaSbqSOQKqOcgc4bjCzU9jSNgSayLJaFRi2BKhst+WqfZjNQf3YOQO3XPn/fg7rx
	4iyT0lYlU4b5YoK6qRlkUfrKDCY18Oi2Rb/3KdVcWMWihtTtGFVTlkKVPW1lUJeW+FRWbSWg
	au4nUz9oFzDqhd4pnDwauyeaFolpuTMtiZSKYyRRQbzQAxEfRvj58wVeggC0i+csEcXTQbyQ
	sHCvvTFxlgHznE+J4hIsUrhIoeD5BO+RSxOUtHO0VKEM4tEycZxMKPNWiOIVCZIobwmtDBTw
	+Tv9LMbjsdFq3ceyHvbp3+oCUkEeKxPYsSEphM+uNOCZYAObS94CsKT+Dst2+BvA/qb01cM8
	gFd/nWWshVyceYhZmUsaALxQR9t4EkDdZaWVmaQXbChVMa3BW8hbHNjdPEJYL+zIEFiUnwas
	vJkUw/y8Cys6QbrBf+734VbmkAFwVje8ypvgvZ/GVjw4uR2W66ZxWxHOcGG8fKWgLeQHsKy4
	gmXzOMAnfxhXqobkzQ0wteb2aqMh8P74FGbjzXCqvXZVd4RPLqkszLYwBUteO9rkaPjsajWw
	8XuwxVRAWC046QGrG31sT9nDi4tjmC2SA9NVXJvbDZ4z9xA2fhtmq9WMteQVWQ62cXYBODy2
	iH8PnDXrmtSsa1KzrhnN/w8XA6ISvEXLFPFRtMJP5iuhE//77EhpvB6s7J5naAMYefyXdyvA
	2KAVQDbO28J5KAyjuRyxKOlrWi6NkCfE0YpW4GeZfDbuuDVSalleiTJCIAzgC/39/YUBvv4C
	ngNn+nyhmEtGiZR0LE3LaPlaHMa2c0zFTkaVD+TyK1xCO2cht2Kf6wm1e1jPxpDA3CHpO0W+
	z9NoM6/q55jPxmKhMJ+8+1HTl0mjsvgDX7jfFKl3OWmbr/TpuTtqiCnJxpjrLknxhxY5yRho
	mjMv8VteDUiDsU4Ht/ztLx+iTM7v+9rdT9rv3L8tb3xh+U35bvza7Df3XLOWlra6ulTpD59O
	vpzm/2CmfyZDlthrb+Bj796obVFeV+cfDz+UkZMf1vZVof3d3cemncy+LX3hbcm1vUdMwoIR
	9eHFY/SRlA6mZ7M2+Gh7oIN9feJyyikH75dpvgcr7gTEbTrjrTl4psFHd/KEW8e25k++26H9
	9o1OzejkxMSDLJ8EFY9QRIsEnrhcIfoX+HkwjQQFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxiHd27vR+lsdlfdOANHsIlLKINBdNnZMlCnIzeZY+J0ZGQLlHHH
	xyg0LW6dCBKYbYHwJUyxGS2Vptsq46Og1ioYS0UNimUUhQ0GRKAsNEBFnTUCo8AW/nvy/n7v
	854/DpcjcBAB3PSsHFaWJc4Ukjz8QpcwKCy7P5aNuNLJR4a+AQrdvH8WQ6pZI4WcfTYMjT5W
	A/Tj+ASJGjt6MbR8oYqDdPZeAjkfz5GoqKGZRIPPlAQaKzRhaLZuKyqfHuegjpnzFDJU6whk
	Uepx9MSpxlDN858xZH5wj0BtuucAqRcfAaS1z+Ko3/oTiezLFQCNjJgA6j7nJFHt3U4M3W4o
	o1DdVA0H6T3ncaQsNhLoRIedQl1uFYFc5SsVr1WLI5N1xdfuriLQn1XVAN34LX53CNOyUEgy
	2sZcpuNJPc5c0oxQjNlUTDLD966szG/FMVfrGilmtPQGxrQZjjMGt41gKhYjmPJ2E2DaenKZ
	01ovxiyYgw7QCbz3U9jM9G9Z2VvRSby0pqlWTNrPVfRZYgtABVUC/LiQ3gnLPA6sBPC4Avoy
	gH91ezhrQSC831q5XtoMf11yrbKAngKw3ZTiY5IOg5YGJenjLfQQH/YMf7ImugOgy1uB+QI/
	eh/UnVIBH2+mk+HtgZuEj3F6O1zqGVw9xqffhY/04+v8Mrx1ZgL3MYcOhZNDk/+zUT+z/rhg
	6J00EmuHP4CG+l+otY4//Pu6naoEAs0GlWaDSrNBpdmwUg9wE3iNlcolqRJ5pDQyi/0uXC6W
	yI9kpYZ/lS0xg9VPJwqxgIum+XAbwLjABiCXI9zCd+zczwr4KeLvj7Ky7ETZkUxWbgOBXFzo
	z/efLksR0KniHPYblpWysv9SjOsXUIB170oCcUsLr1/Pq87Po0KVsScc1JfBX7S801LyteXt
	9M+Lut4bymvoLRTWfjT2ad3wS8uH7M2bch7wdx9rjTm991KT2W1N5BU4Hi6J9FLjniBNRBr+
	IZ2/q8nzVPiqNp65Wrr/mVARnvRP88z0SBPuPWATqEQ7MuYyrzU/1VvPHTyWcVfhcr5xppbe
	Yd1WtK1zjB/mlKgXT70SOZhQHJX85ouks/Ls4T357sWFO4Hxx6X75iWl0cUXkx/mpF7b+sf8
	CyKH1j9BEZU4R/9+NDhk9OTE3subegLKaw5LDrriZlW6qe0fB2gn03Ox0KFOUTQF1Z8NRKnt
	TkWFp/KH6IyYQzFCXJ4mjhRxZHLxv6c487fjAwAA
X-CMS-MailID: 20231111010551epcas5p1c47f739ffde8a0ad15a53d3ae8cdcbd1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104425epcas5p4c3a9e59951fa56f85b1076e788070176
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104425epcas5p4c3a9e59951fa56f85b1076e788070176@epcas5p4.samsung.com>
	<20231108104343.24192-8-krzysztof.kozlowski@linaro.org>



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
> Re-shuffle also the entries in compatibles, so the one-compatible-enum is
> the first.
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
>  .../devicetree/bindings/serial/samsung_uart.yaml   =7C 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
(...)


