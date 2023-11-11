Return-Path: <linux-i2c+bounces-60-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6527E875E
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D970028132E
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016281FCA;
	Sat, 11 Nov 2023 01:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VFjS3Alk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766641FB3;
	Sat, 11 Nov 2023 01:09:22 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB5B4229;
	Fri, 10 Nov 2023 17:09:20 -0800 (PST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231111010918epoutp013bd552d728f7f7077a6e8f32d02214b3~WbEZRFc9x0401904019epoutp01g;
	Sat, 11 Nov 2023 01:09:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231111010918epoutp013bd552d728f7f7077a6e8f32d02214b3~WbEZRFc9x0401904019epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664958;
	bh=I76DPDgh0o5Xfv2AD6gxtqhB4FD5xMiDgU5bECKCc8s=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=VFjS3AlkZLsXc8Co/0oiwXolaA0ISt8A/tnNlzgRbHN/r/jW80FDGKxhKJWdRgY+T
	 hV7rAC0zmO79aEogXdaFpXfFgS/4gl6VqxQenWGusoL+EtUhRcMCi8XTmWNjk2oetm
	 kBJYr6EJvTzh9D1FX63m9zMOtRv6B1FK/LLC7iRs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231111010917epcas5p191d87fb391a3ef1fc14f0f945c926871~WbEYIWY7s2822528225epcas5p1Q;
	Sat, 11 Nov 2023 01:09:17 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SRyJW5V52z4x9Pq; Sat, 11 Nov
	2023 01:09:15 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A1.41.19369.B34DE456; Sat, 11 Nov 2023 10:09:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231111010914epcas5p47647fd6b128e540aa43c15ced560da65~WbEVYrbCn1816018160epcas5p4s;
	Sat, 11 Nov 2023 01:09:14 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111010914epsmtrp12bc19c220ab08a3d1e980c20adf9688f~WbEVXNZTL0906709067epsmtrp1E;
	Sat, 11 Nov 2023 01:09:14 +0000 (GMT)
X-AuditID: b6c32a50-9e1ff70000004ba9-52-654ed43b53f9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D3.C4.07368.A34DE456; Sat, 11 Nov 2023 10:09:14 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111010908epsmtip2fa981f89c5d85784a526aa6192200bf5~WbEQLvKq-1719617196epsmtip2h;
	Sat, 11 Nov 2023 01:09:08 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 08/17] dt-bindings: samsung: exynos-pmu: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:39:07 +0530
Message-ID: <05a401da143b$af73f890$0e5be9b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQHRnrl8Ao0+UJ6w2TdhAA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzOuW3vLTU1V2DxrPhoujmnBmhdwcMUWTZ0V4sONZkO3VihNxSB
	0rVlm3MZilDLmw5BILwh6ACDUlBEXgIbMB+IFCRaJjp0YJHNMRg40JVe3Pjv+335vt/jOzlc
	luMkIeCGqnS0RiUPF+E89sW2dW+7bjbvpsXVnW+g0p4+AnXeKcbQyfEyApl7WjF0f9IAUMaD
	YRxVNt7E0MuLRhYqaL/JQebJ33F0oqQKRwPP9Rw0FFOOofG8FShl5AELNVprCVSaXsBBdfoi
	NpoyGzB0avYMhqp/7ecgU8EsQIa5vwDKbx9no976XBy1v0wFaHCwHKCfKsw4yupuwtD1kmQC
	5T0+xUJFz2rZSB9fxkFxje0Eahs7yUG/pdgkM/X5bFReb+tXM2bkoHvGdIA6zu1/bx11fiIG
	p/Irj1KNU4Vs6nLOIEFVl8fjlKW/wcZ37aGa8yoJ6n5iB0aZSqOp0rFWDpU6J6ZSasoBZbp2
	lDqdP4NRE9Wr/MmAsC1KWq6gNUJaFRypCFWFeItk+wI/CPTwFEtcJV5ok0iokkfQ3iJfP3/X
	7aHhtoBFwi/l4VE2yl+u1Yrct27RREbpaKEyUqvzFtFqRbhaqnbTyiO0UaoQNxWte1ciFm/0
	sAk/D1NeeHmLra4nvs7MLSWOASOeABy4kJTCzqYrWALgcR3JBgD/NtXiTPEngC8e1RJMMQVg
	VfZ19ivLnZH+BUsjgGmxl9hMMQJgZoWBNa/CSVdYV6K393Imr/Bhb/NDu92B9IXF5ht2kROp
	hBWxz8A8ZpNr4PQfLTYNl8snvWB32tZ5mk8ug13Zw3Yri9wAy4qsLGYLIZx5VMaZx87k+7C3
	bpBgNMvh6I/t9rUh2ciDvZaL+HxPaJtrmd7NeJ3gk44agsECOJqqJxgJBYtnBQythE/PVAEG
	+8AWc659Mxa5DlbVuzOTlsLkf4YxxsmHBr0jo14DT4z3LUTlAo2JiRwGUzDuccpCUj0AXk5K
	YaUBYc6iI3MWHZmz6Jic/ycXAnY5ENBqbUQIHeyhlriq6K/+e/DgyIhqYP9/6/3rQMX5ObdW
	gHFBK4BclsiZf0vqRzvyFfIj39CayEBNVDitbQUetuSNLMFrwZG2D6zSBUqkXmKpp6en1Osd
	T4loOd8al6dwJEPkOjqMptW05pUP4zoIjmFun2Xi6ceXZTd9m+1XuyTm3A6L/vboibVnFRoq
	TwaV24I+fss3ueH5sErtS5SMFBLGI0E/JMl5qz6VVWUNWc89PDZhNb5pJZdoB4LnBOFJMt/D
	n7gfDD5+cJflaaqlctf9usHhFyX98Ut7cs64yDx+Ucn97qK9ReR3H1lW86nojEOmWdrlaJPB
	2iyOvrR3wBi7qdtniNzwRUKobFtLm3Rm2rh55ZjPZN3q2ysyOqZWnk3ddve2M3XtdMD+J4fU
	wq07DbyIqLi+jYnuP6+Nnzl8lR8U/WHPvqvqlu8DqhMceDX1B/ycXt9pOlQG5koP3DWNCFfV
	9GUV+R1I2XEj4FbXvYg9F0RsrVIuWc/SaOX/AvLTZTQIBQAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH97tv0M5LaeAqy4AmZlgGg4VkZ91C3ObmNTQO3TIT4xwNvSDy
	atqyF24wnRU65BHAyRssVNexOMsjPFZxpRsCA1QqYKQqmSCuPGSoEyYyKtvCf598v9/zPeeP
	w+DifnITk5CiEzQpyiQp5Uk0d0r9Q+SOnUKYxboBai9fpeHi8CkMjs2YaHBctmFw80EWguKx
	2xTUW/sxWG4uwKHK3k+C48EsBUeMZykYWdSTcOuwGYOZiucgd3IMB6uriYbawioSWvQ1BDx0
	ZGFQ9Pg0Bpbfh0hoqHqMIGvpPoJK+wwBg23lFNiX8xA4nWYEv37voODkwHkMfjMep6FiogiH
	mrkmAvTZJhKOWu00dE4dI+FO7kpkoa2SAHPbSl/jVAEJ1wsKEXT9sGfrFv7H+cMUX1mfzlsf
	VhN8a6mT5i3mbIofHfppRe/exXdU1NP8zW+6ML6hNoOvnbKRfN5SGJ/baEZ8Q286/23lAsbP
	W56PZvd6vq4SkhI+FjQvRcZ4HjiaXUmom+hPq2b3ZSIDZUAeDMdGcMOTQ5gBeTJith1xizlN
	/xp+3PC5fHqVvbnvntyhV0MTiBtvdZFug2JDuBaj/umAhL0m4npH33WzmO1DnPUvPzd7sNu4
	U44+3IAYxpuN446c3+OWCXYz9+jeBcIti9hXuYH8SLcsYr247pLbhJtxNpgbvzb+P5tqXPjq
	OQHcwriJXN36JjfY4qRXM77c3V/sdD4Sl66pKl1TVbqmqnTNSDUizGijoNYmxyfHhqvDU4RP
	QrXKZG1aSnxobGqyBT19OVlQC7pR9STUhjAG2RDH4FKJ6FKEQhCLVMrPPhc0qR9p0pIErQ35
	MYTUVxR+skwlZuOVOiFRENSC5j8XYzw2ZWIDZhaPCIzYXLLh+KO6P4or2MLyM2G9dfk5O//s
	7CGmvU7M4cbI+74WU+YHsVe8l9/PiNl6ZkwWrI3pv6pTrO9h9nvzzq7dZRnTurC0CINXo0oe
	XcLKFC0HXQq/gPZLsvTdz+aIInsGjT5fhnfmexz6+ZVt2RuDE+PTtbKD63fJ1/X7S869sKND
	NBI0L+lbfEcdUly3rzVaFvW28IW8VrG9Ofar1+bkiXtV2xPuya+cDrpxq+iuMsF2AUlyoxO3
	tMd1rDNIJ2T+swOOvKjrI2+85YJphTZQ51M4sPRhiE/Fof0v6jsCdqgDAs/GTdJRg898PcqW
	Xyx7Gd6zVM/7pHaL/5YS2gPKcBmu0Sr/AWivBKrhAwAA
X-CMS-MailID: 20231111010914epcas5p47647fd6b128e540aa43c15ced560da65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104429epcas5p35afa44a49900db028d5873b220c7bb6b
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104429epcas5p35afa44a49900db028d5873b220c7bb6b@epcas5p3.samsung.com>
	<20231108104343.24192-9-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
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
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         =7C 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
(...)


