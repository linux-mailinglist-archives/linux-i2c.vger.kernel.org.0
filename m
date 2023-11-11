Return-Path: <linux-i2c+bounces-57-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E107E8738
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE318B20D68
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111C41FA7;
	Sat, 11 Nov 2023 01:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="McArXfYp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73469184F;
	Sat, 11 Nov 2023 01:03:26 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBA54229;
	Fri, 10 Nov 2023 17:03:23 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231111010321epoutp03bddba441a4dffc5f8b0d689d522b592e~Wa-MVkajj0058400584epoutp03s;
	Sat, 11 Nov 2023 01:03:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231111010321epoutp03bddba441a4dffc5f8b0d689d522b592e~Wa-MVkajj0058400584epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699664601;
	bh=WGDiG9skFVEIA0Hkr8SVvpgI5u+k3WhT8GJmWvSZH6g=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=McArXfYpZgD23ee3mNFpLhDIiXqZ6Pl2QAExvceo2ymhXmosYRmlNds+8cnbjSTuS
	 6p2uhIjKiyzbdgBk2IpXjNRTUkV6X18afdAd7PQWRsX8fe1jPPYCL0oRFjfxra9xbW
	 5zROZJDaCtTyD1NalGhSf6R6tMBDH0hHH62BCimA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111010320epcas5p488a2908fda7128aed8c0eef936b50113~Wa-Lu0xNv1801318013epcas5p4x;
	Sat, 11 Nov 2023 01:03:20 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SRy9f5mwPz4x9Pp; Sat, 11 Nov
	2023 01:03:18 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.5C.10009.6D2DE456; Sat, 11 Nov 2023 10:03:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231111010318epcas5p3519bf7ec258e6c2987c362fbb1cb6d48~Wa-JmMJhP1969319693epcas5p3F;
	Sat, 11 Nov 2023 01:03:18 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111010318epsmtrp226ebccc53172ea6317ece789d7e2e52e~Wa-JkgVji0358203582epsmtrp24;
	Sat, 11 Nov 2023 01:03:18 +0000 (GMT)
X-AuditID: b6c32a4a-ff1ff70000002719-be-654ed2d6204a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FF.A4.07368.5D2DE456; Sat, 11 Nov 2023 10:03:18 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111010312epsmtip1d3ec3b15647891a8fe5c42641ff0ccd2~Wa-Eb2jvU2181921819epsmtip1m;
	Sat, 11 Nov 2023 01:03:12 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 06:33:11 +0530
Message-ID: <05a101da143a$db247830$916d6890$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQHRWdYnAZ54Hkaw4K1hQA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzm3Ht7W0hY7goLx2KguQ4DbrxfhwHuITE3igxmFhPigpXe8Cpt
	1xaZOqKD8Z7VRg2u4yGCaCoTVqDysKiIIkNwPN3GCCDoEFidQzAMmCtc2fjvO9/3/Z4nPwEu
	fM4XCZLkGlYll8ho0o4w3fZw9xzqi2J9uqe2osreQT669/AChnItVXw00NuGodH5PIDOjk+S
	qNrcg6FXJh2Oytp7eGhg/hmJsipqSPTz3zk8NJZpwJClZDPSTo3jyDzTwEeVp8t4qDGnnEAL
	A3kYOrN8CUPGiSEeqitbBihv5QVApe0WAvU3F5Oo/dVJgEZGDADdvTJAonMPWjF0v+IEH5U8
	OYOj8ucNBMrJr+KhbHM7H92ezeWh37VWy2JzKYEMzdZ89bM6HhrWnQao4/t9H3gwtXOZJFNa
	fZQxL5wnmCb9CJ8xGvJJ5reh61a+M4a5UVLNZ0YLOzCmrvIYUznbxmNOrvgw2noDYOq6jjJF
	pYsYM2d0iaZiU8ISWYmUVYlZebxCmiRPCKd3743bERcY5OPr6RuCgmmxXJLKhtMRkdGeO5Nk
	1gXT4kMSWZqVipao1bT39jCVIk3DihMVak04zSqlMmWA0kstSVWnyRO85KzmPV8fH79Aq/FA
	SuLEUjWm/EHwRa6xABwHL8kCYCuAVACs++oyXgDsBEKqBcCyiXPYqiCk/gLQ3LqbExYAHJt7
	wF+P6GybxTjBDOBATQ/BPaYAvFf2grfqIilP2FiRQ64KjlSLPey/8YhYFWypCFh/tXYtlQPF
	wplCg5UXCAjKDb4sZlZpeyoEnjK1Ag6/CTu/nVwLxal3YFX5DM51IYaLj6vWajlSH8GC/m6c
	8zjBp3faX3faZAdLOjQcjoCjnQsYhx3gdEf9a48IzlnM5GoLkGLghWURRyfCPy7VAA6/D28O
	FK91iVMesKbZm6v0BjyxNIlxkfYwL0fIud1glmWQ4LAz1BUW8taTD9/J4FbbC+CvI4JTQKzf
	MKJ+w4j6DaPo/697HhAGsIlVqlMTWHWg0k/Opv/32fGKVCNYu71tuxrB+NifXm0AE4A2AAU4
	7Wj/U0AkK7SXSg4fYVWKOFWajFW3gUDr2nW46K14hfV45Zo434AQn4CgoKCAEP8gX9rJfia7
	RCqkEiQaNoVllaxqPQ4T2IqOYx+7Ppw9ZrOpOyvbcdq1JfDq6PCHFUOhn6nG0IGwwgIP/+Tl
	4KKyuPDYiIMRosvizPvLlf02+e9udsxMDVZcTMcSosgYO9JLqeV9rdzinPZd9vC88aI+ad8/
	psb9rVkrdLrfJzvFzv7Joaco3S+3tCGlV5SF/qYUo+HTXrwk54n3kXrxkJfQ4e7nLnv6NFuL
	FnWuVcFdTdpr34S6iGOnf4zQ1ipvNdGm64eldhMee/GoGFHCwUj9SqvexUOZm7Il3q15aaTh
	rM0eXNZws+Kxe6WhIQM8Dd4fmtTnNNhVl+eWPEhrYuPHxp2fETsOXXs7w+JukunmDdtN9RVi
	KW/wy0c0oU6U+G7DVWrJv8PiioUEBQAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxbZRiG855vGpscWpIdYWGswzGZMNAlvpBJNkRzSMjQaFLxx7TSM0aA
	trbjw43poNrSonxkXcY6SmElqB0ThFIRVohdhTE22GwFGSAuAyYZohsbrAhUStXw78pz38/1
	Pj9eChUM46FUtuw4p5RJckUED7NfFYXHjPx0mIsrKUFh4+2fSXht9CICtQtNJPTcdiJw6kkZ
	gGfvThOw2TGEQJ+9GoVm1xAOPU/+JKDa0kLAX1Y0OPyt1IrABdN2WPH7XRQ6HnSQsPGMGYed
	mgYMLnnKEGhY/RKBbfdGcNhuXgWwbO0xgHWuBQy6u2oJ6PJVAjg5aQWw75KHgDXDPQi8YfmC
	hKZZAwobHnZgUKNrwuFnDhcJr85rcXi/YqPi7arDoLVrw2ebr8bhePUZAPsviw8+z7YulhJs
	XfNJ1rFUj7HfGydJts2qI9iJkSsb84E32V5TM8lOlfcjbHvjJ2zjvBNnK9fi2AqbFbDtgyfZ
	c3VehF1sC3+Dfpd3QMrlZhdwyn1J7/OOPXUUKqxUUYt+CpwGC4QeBFEMvZ8ZcM4jesCjBHQ3
	YFyVfWQgCGNGv636l4XM1+v3yUBpFjCl5nHcHxB0DNNp0WyaQugxPjM4ke5nAX0TMJ9Pyv0c
	RKcwtm9aN0VCOpMxrOg2dikKo59jlmtZ/5hPJzBV9h4Q4GBm4Pw05meU3svMjM38z00ND9DA
	PRGMd6YJDzybzOjdN9FAZxsz96OLrAIC4xaVcYvKuEVl3LJSDzAreJZTqPKy8jLjFfEyrjBW
	JclT5cuyYjPleW1g889F7+kEv5rXY50AoYATMBQqCuHf2p/GCfhSyUcnOKX8PWV+LqdygjAK
	E23jx9dckAroLMlxLofjFJzyvxShgkJPI4js4tnI8BVVx5j8iu2h1lSfvadF3GU64kuMEOuO
	ugpO5OxI1L/SnRSVUJB8ST4xcEf9XUTqoUfvjEe5Cn+4dzTW+2lxRsi67w/ZocNzoUATVl0W
	PR6lWaXEjg+XS3oPOnbZ+43lMcWvpxheNnSvJVv+PteXH6ceMl1gMyihONL7Fr7Uen17qaao
	VlN86sW95Wu7//KkRg4K56Zv9L1a4fzg8T619JZW8lVPwnKzwuJMk6YFJ/qiPJHpp55RL6cT
	j4xujc1eeDmap9+pvdN97bpt55EafU4/9sLbrxWpZm0rSRmpq/nuFLgYahkdPrDb91Tb2rvD
	rQsW7kI/zvTGvCTCVMck8dGoUiX5B8BGpp/iAwAA
X-CMS-MailID: 20231111010318epcas5p3519bf7ec258e6c2987c362fbb1cb6d48
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104418epcas5p169980c99216540532302373473801584
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104418epcas5p169980c99216540532302373473801584@epcas5p1.samsung.com>
	<20231108104343.24192-6-krzysztof.kozlowski@linaro.org>



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
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>=20
> I propose to take the patch through Samsung SoC (me). See cover letter fo=
r
> explanation.
> ---
>  .../samsung,pinctrl-wakeup-interrupt.yaml     =7C 24 ++++++++++++-------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     =7C  3 ++-
>  2 files changed, 17 insertions(+), 10 deletions(-)
(...)


