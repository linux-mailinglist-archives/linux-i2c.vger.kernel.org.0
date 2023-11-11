Return-Path: <linux-i2c+bounces-68-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CD7E87E7
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18B081C20B25
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8DD3C0B;
	Sat, 11 Nov 2023 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p5ZdQvw2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362D259B;
	Sat, 11 Nov 2023 01:45:09 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0386744B6;
	Fri, 10 Nov 2023 17:45:08 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231111014506epoutp0285d29a625763b71e5998f0ea08c322ac~WbjpfdGon2312923129epoutp02g;
	Sat, 11 Nov 2023 01:45:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231111014506epoutp0285d29a625763b71e5998f0ea08c322ac~WbjpfdGon2312923129epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699667106;
	bh=k/QIzEUVs632d7e9vKbhVey91b2FJwfTo0v9Xig3aQE=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=p5ZdQvw2Efz5h3+5qE9ucD4zEkSvFvLgSGfXheLLZ+TDsvn9yrl9OgdyT6ToKdW2g
	 6WaQyP9XXXVqY5YqlHaEi6FarzhQOXX/9SLcFUWoCWbV/YonUgoTKI4g5nPUEzWA4j
	 nzxuw5bX8DaOQdIUEu4YKeI+1yXjvhCav2ZfOqo8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111014505epcas5p4f6f60a280d1bcb3c2023dae1249a193f~WbjogXvBN1775317753epcas5p43;
	Sat, 11 Nov 2023 01:45:05 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SRz5r0sW5z4x9Pr; Sat, 11 Nov
	2023 01:45:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D1.9D.09672.F9CDE456; Sat, 11 Nov 2023 10:45:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231111014503epcas5p4b6fcd417b9b00ea976a67e780bf45d35~Wbjmx_92w0588305883epcas5p4T;
	Sat, 11 Nov 2023 01:45:03 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111014503epsmtrp21a68ea7a06abb2c4c2d4596b27a9d932~WbjmvVFWZ2934729347epsmtrp2J;
	Sat, 11 Nov 2023 01:45:03 +0000 (GMT)
X-AuditID: b6c32a4b-39fff700000025c8-64-654edc9f4cd0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.73.18939.F9CDE456; Sat, 11 Nov 2023 10:45:03 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111014457epsmtip12910759dec7bd74ed5fd1f185e724780~WbjhjePfl1789717897epsmtip1Q;
	Sat, 11 Nov 2023 01:44:57 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 16/17] arm64: dts: exynos850: add specific compatibles
 to several blocks
Date: Sat, 11 Nov 2023 07:14:56 +0530
Message-ID: <05ac01da1440$b059f980$110dec80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQGB5OKjAR6316Sw5zQT0A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc99r3ytmuLeK49I57V5iHGxAC6VeNkE3cXsJhtW4ZZlR8Q1e
	gABtbYtD3aaiQvkNEyeiQEECs2JQRERchxQQUSJj/JobBBAYDLBT+ZFUENZS3Pzvc8/5fu+5
	59wcAS6cJkWCKKWO0yjZGJpYwatucN/gaegN4SRX41FJexeJ7vYUYyjJUkqiznYzhvpn9ACd
	HhwmULnpAYYWq7NxVNj4gI86Z/4h0PELFQT6/XkiHw0kGDFkyV+DMsYGcWSauE6iklOFfFST
	WMRDs516DOXMl2Gocqibj64VzgOkfzENUEGjhYc6as8TqHExE6C+PiNAdy51Eii37RcMtV5I
	J1H+Xzk4Knp6nYcSk0v56KSpkUQNk0l8NJphk1hrC3jIWGu7r2oym4/+zD4FUPPlL7e4M1em
	EgimoPwwY5o18JibeX0kU2lMJpje7p9t8ZYdTF1+Ocn0pzZjzLWSI0zJpJnPZL6QMBlVRsBc
	u3+YOVNgxZipyrUKalf0pkiODec0Yk4ZpgqPUkYE0ME7Q7eG+sklUk+pP9pIi5VsLBdAB21X
	eH4SFWObLy0+wMbE2UIKVqulvQM3aVRxOk4cqdLqAmhOHR6jlqm9tGysNk4Z4aXkdB9IJRIf
	P5twX3TkXcMMqV4k4xcfDuFHQQ+RApwEkJJBS/MVfgpYIRBStwAcHurn2RNC6hmA95LcHQkb
	69ue4y8dCWlPlx03AcwZWcAdhzEATaUlfLuKoDxhzYVEwp5woW45w466R0v3OlHbYOrACczO
	q6i9sHviJ2BnHrUezpWdW3qUM+UPS8YqgYPfgC1nh5e8OPUeLC2aWH6GGFpHSpeKuVAfw9sz
	c4RD4wr/bmok7YUhdXUFfDbdTzoMQfCHUusyr4LjzVXLLIJTFpPNLLAxA4vnRY5wJHxcVgEc
	vBne7jzPs0twyh1W1Ho7Sq2E6XPDmMPpDPWJQod6PTxu6eI5+C2YnZrKdzAD9WnHlgf3G4AV
	YwMgC4jzXuky75Uu817pJu//ygbAMwI3Tq2NjeC0fmpfJffNfx8epoqtBEvr5xFcAx4NPPEy
	A0wAzAAKcNrF+VfZdk7oHM4ePMRpVKGauBhOawZ+ttFn46LVYSrb/ip1oVKZv0Qml8tl/r5y
	Ke3qPHEyP1xIRbA6Lprj1JzmpQ8TOImOYmkF91ZOpkyMum2oH8+N/25hMKR49UrZGe/C0bSH
	7SN7e0wb13S3a/DmN7t667XnPly4WOG680D8Db2faC379lXfBB19I8KqAn7VC+nqJ5wQKTYv
	To4FTsqL4Sw57bN7vaL1xPc+O0a9dtdqOwYYg+GLpGra5zQx/nnut6N7FPnrPn3xflb1ay2+
	gZcyoU/H/kOtwe5uAVlTYy0ZTU7m/XM+p/Z19hxskL2+5/5H1QZRZlAT+CwnW8Ft/eNH2+Ls
	qu+jG8pXmcVfPx5Ne3cx+VjsRY82aEx1e3aL9b4TXZwrj2adLiv1R6LWWVqL/KVWj/kefGiL
	xQrP1oV8JUnvz32H5mkjWakHrtGy/wJbOt4ZBwUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTdxTG87+9L6Vb9VpYuEPSzDJHhPBiYMmZW4y6mN1sZkOSCWtMXC13
	6KBQWnUMYuZgQygOJLpsK+sLUmvWdasWi9BRR0onMFhnR1GIEEGFstigREAYVAZttvDtyXme
	53fOh8PnibxEHP9o0TFOVSQrlJACvLVLIk4xjLzLpWt+2QAm3yAFPbcvYHB62kyB3+fG4O5c
	NYKvxx+QYHV5MVhpbeCBweMlwD/3iITKZhsJQ/9UETBWYcFgWhcPdVPjPHA9dFBgOmcgoK2q
	CYd5fzUG55cvYWC/f4uAFsMygurQLAK9ZxqHAef3JHhW6hGMjloQ3PjRT8K3f17HoL/5Kwp0
	k+d50DTjwKGqxkzAly4PBV3B0wQE6lYji049DhbnKu9qsIGAOw3nEHT/lLNrG3v5SQXJ6q3l
	rGveiLPt2lGKtVtqSHbkVsfqvHc/+6vOSrF3a7sxtsX0GWsKugm2PpTO1l21ILalr5z9Rr+I
	sU/s4ixaKngjjys8eoJTpe38UHDE19NFKkNU6fiwhjyFfKQGRfEZOpOpODNDaJCAL6KvIcb7
	+DIeMTYzt6+cpSI6mvnhWYCKhCYRUz8VwtYMkk5h2pqrwqQYeljI9I28Fwl5ETM7dZFYM6Lo
	vUzt2BfhQjR9kPkjYEJrGqe3MkuXGsNlIf0aY5qyo4jexPR+9yB8BY9OZiaGJ/7X5qaHvMhF
	LzGLE2YisngP0zm3REYysczfv3mos0ikXYfSrkNp16G06ypGhFvQC5xSrchXyJXbU9Uyhfp4
	UX6qvFhhR+GXS8puQ2ZbKNWNMD5yI4bPk8QIb2bu40TCPNmnZZyq+JDqeCGndqPNfFwSK0wo
	rMkT0fmyY1wBxyk51X8uxo+KO4WltR38q06br99bHPTMHJAvGBeCadvu9dk/NtpvzvcnuuRj
	jlhdIPd+CpeSIzo8Z3Nmn9y9x/lq1gnfFcOjyjsxYhi6phY38ts7N8p+PpyheXE+vvtlxcbk
	mqHe358WtOJ6QuDoASM2q5E8J+goGEUOwZZNj5eku22D8i1iD+/eO2e00k+0xT3JmZ8nngyQ
	LVb7SHccPWDNuiAtK48aT4ipTS/t1+za+opUWeYnX7c1RmdXvr+D99GGwZJnNp0/caJjaqB6
	cIVot5WoFrS5+RmG9Dfjb9B1sx/szynXSEtKqenn386dDDyVw0ySd58wIWeHZbkg49D1oYqd
	nW8hCa4+ItuexFOpZf8CsUhtquEDAAA=
X-CMS-MailID: 20231111014503epcas5p4b6fcd417b9b00ea976a67e780bf45d35
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104459epcas5p47aa72d33e09f5b33aa01be1e0a034107
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104459epcas5p47aa72d33e09f5b33aa01be1e0a034107@epcas5p4.samsung.com>
	<20231108104343.24192-17-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:14 PM
> Exynos850 reuses several devices from older designs, thus historically we
> kept the old (block's) compatible only.  This works fine and there is no =
bug
> here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to Exynos850 in front of all old-SoC-like compat=
ibles.
> This will also help reviews of new code using existing DTS as template.  =
No
> functional impact on Linux drivers behavior.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi =7C 34 +++++++++++++----------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>=20
(...)


