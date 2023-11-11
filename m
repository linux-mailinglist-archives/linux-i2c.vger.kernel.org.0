Return-Path: <linux-i2c+bounces-64-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831037E87B2
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246C21F20F05
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C052228F3;
	Sat, 11 Nov 2023 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LrUx+C6r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22941FDF;
	Sat, 11 Nov 2023 01:38:12 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EDB44B3;
	Fri, 10 Nov 2023 17:38:10 -0800 (PST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231111013808epoutp025ca831f0a980afe1e6c8401c0abd2349~WbdkujkjC2008720087epoutp02E;
	Sat, 11 Nov 2023 01:38:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231111013808epoutp025ca831f0a980afe1e6c8401c0abd2349~WbdkujkjC2008720087epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699666689;
	bh=9UkHPvpy4bwnBhu6gE1xY1AkoPPdBQ1aEWBh7atmP/4=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=LrUx+C6rYfY4ic70WuEK2N6AUrOMrQW4iTJhf6ahPLgGBwRllEO5xHIdlH/txMtIg
	 vFYO8NmNrE56APECtDO8SXzr2010ODXtxBNk2ccbydg0+Yz2A9uI3ctZuEjF/qPf7Y
	 +5MxXieu6vqxM8OZ+jBrV8nvuXv79AyPF8XZbdCw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231111013807epcas5p1c832bc15d5e3fa959a3f6c994d9ad06e~WbdjmKY_Z3211232112epcas5p1t;
	Sat, 11 Nov 2023 01:38:07 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SRyxp0VKcz4x9Pv; Sat, 11 Nov
	2023 01:38:06 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.C2.19369.DFADE456; Sat, 11 Nov 2023 10:38:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231111013804epcas5p1241762ed2ceadf967a08eaf973a80b90~Wbdgzzyt01318313183epcas5p12;
	Sat, 11 Nov 2023 01:38:04 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111013804epsmtrp183150e7517e635cdf6a8ba1704905d4f~WbdgyRZXs2800328003epsmtrp1d;
	Sat, 11 Nov 2023 01:38:04 +0000 (GMT)
X-AuditID: b6c32a50-c99ff70000004ba9-6f-654edafdca4d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.65.07368.CFADE456; Sat, 11 Nov 2023 10:38:04 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111013759epsmtip18600ce3daad7a33192ec20a58f1309b1~WbdbqzwS31160711607epsmtip1H;
	Sat, 11 Nov 2023 01:37:59 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 12/17] dt-bindings: pwm: samsung: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 07:07:58 +0530
Message-ID: <05a801da143f$b6d134f0$24739ed0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQLpLcm3AbtLBlKw1xNAQA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbVATVxTt22R3IzV2Czo+6YeYGX5IJ0BogBdF61TU7dR2cGzHQn/QHbIF
	NYSYkCriFNQhBlAhA1YKEkUyqMEKhWApGKQJgkKHonyEUlOlUETkQyViUZk0ZKn137n3nPvO
	vffNFfB8Z0h/wU5lKqtWMgoR4cO/bF8dJJ4b+JQNfdgqQ6abvSS67jiLoSOTFSTquWnD0J0n
	eoBODA4T6KK1E0PuywYeOt3SiaOeJ1MEOlxeRaD+Zzoc3T1kxtBk6dvo+OggD1kf1JHIVHAa
	R/W6Mj6a6dFjqPDFOQzVDPXhqPb0C4D0cy6AjC2TfNTdcIpALe48gJxOM0CtlT0EKvqtCUO/
	lh8jUelIIQ+VParjI112BY6yrC0kso8fwdG94x7JbIORj8wNnvcs4wYc/WEoAKjthx0bVtPV
	04cI2ngxnbbOnOHTPxc7SbrGnE3Qt/uuePI3ttFXSy+S9J3cNoyuNWXQpnEbTufNhdLHLWZA
	13ak0yeNsxg9XfNuDBW3OyqJZeSsOoBVJqTIdyoT14k+3h6/MT48IlQilshQpChAySSz60TR
	W2PEm3cqPAsWBXzDKLSeVAyj0YhC1kepU7SpbEBSiiZ1nYhVyRUqqSpYwyRrtMrEYCWbukYS
	GhoW7hF+tTvpYEM2T3WX3Dfk+IfIBBYiBywSQEoK+11NeA7wEfhSVwB0DNwiueAxgJfqdAvM
	DID2ku6XJWfPzy0QVgCny/oILhgF8HlWu1dFUGJYX67zEkupRiHsvvoXf55YRG2CU3oO+1EM
	nBoo9WI+FQhvW//0YiElg0dnLpEcfhPe+H7Ym+dR78GKsgc8ro0AOPt3hacNgcfgQ5hfn8FJ
	lsP711q8M0DK6gMt7U4+p4+GrgvVOIf94FibheSwP7yfpyPn34EUDc++8OfSSXDiXBXg8Aew
	uecUf17Co1bDqoYQzmoJPPZ8GOMqhVCv8+XUgfDwZO+C6VvQkJu7YErDVtMYj1vVLQAr3SYi
	HwQUvzJk8StDFr8yTfH/zmcA3wz8WZUmOZFNCFdJxEp278sfT0hJrgHeAwyKqQeV1XPBNoAJ
	gA1AAU+0VNgl3cr6CuVM2n5WnRKv1ipYjQ2Ee1Zv4PkvS0jxXLAyNV4ilYVKIyIipLL3IySi
	5cIHWaVyXyqRSWV3s6yKVf9XhwkW+Wdi1Y3OrPQz0wdcjx1boxMaO7YLHhX8UnvjW3b5oCFE
	nE3Y95TvSh+VsY7BCdfUqqwObeu+ka4ihJ4Ohb329A1sbZP5xOIvrh1eeSKws04Zb3y+OFbD
	9D9tfpy7vzpzRYLwE+ej6B143DN9SZjjUkdp3sMfQ7bIrC0Hliz5PfaOUmrpjTmwJ2jj0Zii
	7WORxujAItBk7Xq9ZM3dvdh3KwvtE1HtcV9Guauuaz/f3L8i389yJHNtmnG8Mqew3+2akH/W
	/PUqZnK81TDpaCd2/YSPgFh7Xca2XvyjvJqhqbT9HZvyr520ldyTdjKR77ilpxT1PednNywj
	rBeEGU36tNrArIPrRXxNEiMJ4qk1zL/se9XDCQUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+z57fozV8nHi8VU4zmZdRYGsuOtrVx15Bz390LBLPaw7m/AE
	BBu7DWFKpyA1flgDQhMHYxvsFs0hOAZNYnnOoRHekBM3SBAVgUhiF+buIH40tur4733v9/vz
	+nz++HA5ggFiMzdLmsfKpeIcIcnDOy8Lo2MXf93Fxi+feBoZB25S6GdvI4ZKZ00UGhxwYmjs
	URlAp+7eJ5HF4cbQSmc1B+lcbgINPvKRqKSplURDCyoC3TluxtCsNgqpf7vLQY4HHRQy1ugI
	ZFcZcOQfLMPQycXvMGQd9xCoXbcIUNnSXwA1uGZxdKOrnkSulUqARkfNAF05O0ii2v6fMHSt
	6WsKaSdPcpDhzw4cqcpNBPrS4aLQ5ZlSAk2pA5X5rgYcmbsCPNtMNYFuVdcAdLVlX+LzTNvD
	4yTTYClkHH49zlzQjFKM1VxOMiOe7oDfu5u5qLVQzNiJqxjTbjzGGGecBFO5FM+obWbAtPcV
	Mqcb5jHmoTU6hd7Pey2dzcnKZ+Xb3viEl1l05wYlG6KUrdoSvAhYyAoQxoV0AmxsXiIqAI8r
	oH8EsH6uhAoFkdB7vupfvQF+vzxFhUqTAOq/UWOrAUnHQnuTKkgKp4f5sG/k/VDJDWBVYwdn
	NQijk6Cv7B6+qjfQB2Cp54sgFaefgSOO20GfT2+HX/nPUSG9HvaeuR/0OfQLcGJ44n9tMjzg
	hC7aAucnTIGzuYHFO2CV/VioEgGne1xUFRBo1pA0a0iaNSTNmhE9wM1gEytTSDIkaSKZSMoW
	xCnEEsUhaUZcWq7ECoJfF/OcHdzWLcc5AcYFTgC5HGE4/3rCe6yAny4+fISV5x6QH8phFU4Q
	ycWFEXxRbV26gM4Q57HZLCtj5f+lGDdscxGmLJ77eM9Q3Wf3VIpX+YLxwce5O/L13iH2nXzl
	p8mpjakJyS+1bA0/2vzYWEli/fqUilKqO57wtC5oY7yyqHOfi+Mqed/OGfnN4f0Jhu6kg6/A
	vFsXifrhs4Vvtal0ok2ZcXs9rj1Pyt0q33TiwZfJHybtHsu7G/ts23krSW2xhMOqbLlSPGbI
	3ZffH/lEcfzW7D98F7Csp7LZsIW/adXeN0/BzqPqj2xTTKr/g1F31LRXm1wumeLv/D3FtLPn
	urDmknvLh2xvc79uXH/pdI/nSC15eKOvx6aukxZUvn1z8hegPBO9e5ufSdufUzwf4dBdqz5f
	1/usoam2q+DFCc/r64S4IlMsiuHIFeJ/APjgqyPkAwAA
X-CMS-MailID: 20231111013804epcas5p1241762ed2ceadf967a08eaf973a80b90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104444epcas5p44fc6b08f7a6722e4efdbb70996d46832
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104444epcas5p44fc6b08f7a6722e4efdbb70996d46832@epcas5p4.samsung.com>
	<20231108104343.24192-13-krzysztof.kozlowski@linaro.org>



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
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml =7C 2 ++
>  1 file changed, 2 insertions(+)
>=20
(...)


