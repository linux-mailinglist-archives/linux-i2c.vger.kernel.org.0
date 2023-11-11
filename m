Return-Path: <linux-i2c+bounces-63-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C8A7E87A5
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CAA9B20B4B
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54877259B;
	Sat, 11 Nov 2023 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kT+7KJlM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DD1FC1;
	Sat, 11 Nov 2023 01:37:26 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF1CB0;
	Fri, 10 Nov 2023 17:37:24 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231111013722epoutp03c90c9b4bbcd6e2a0252148c281a1ecc9~Wbc5MlTTu2453124531epoutp03_;
	Sat, 11 Nov 2023 01:37:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231111013722epoutp03c90c9b4bbcd6e2a0252148c281a1ecc9~Wbc5MlTTu2453124531epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699666642;
	bh=gbHmcKeJCmy6vX/fRMijapz+vC1LEThWZweLB4eFrWQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=kT+7KJlM5Jln6yaxHx3RheWkKtuOBzRqxSdWziv/cCBaLn3/LMEt6oJ8oATPwnVsJ
	 pw0yIZeP6AqEEsrBLoS5jSwVnVZ2T7qZPgf2rwMLK6BwOEpDjUmJ/Nu59+X5vqAl5b
	 CjeqGQLHP69ALxGC8bABFlg3bHmpvnbgYZ78YH3I=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111013721epcas5p4b61117cea83325bca2ce782ac2bd0c2d~Wbc47PCth2030120301epcas5p4g;
	Sat, 11 Nov 2023 01:37:21 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SRyww23xfz4x9Pq; Sat, 11 Nov
	2023 01:37:20 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	98.5E.08567.0DADE456; Sat, 11 Nov 2023 10:37:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20231111013719epcas5p23433820ac418efb4ae8ed7444c1f469c~Wbc27X4uX1319013190epcas5p2Z;
	Sat, 11 Nov 2023 01:37:19 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231111013719epsmtrp2d274a918e822d1b10747e3e81d8f32ba~Wbc26Csxe2526625266epsmtrp2m;
	Sat, 11 Nov 2023 01:37:19 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-60-654edad03e62
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A4.65.07368.FCADE456; Sat, 11 Nov 2023 10:37:19 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111013714epsmtip2863217e779baf9c208de64d8f87fb409~WbcxwLrM70315803158epsmtip2l;
	Sat, 11 Nov 2023 01:37:14 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Date: Sat, 11 Nov 2023 07:07:13 +0530
Message-ID: <05a701da143f$9bf634f0$d3e29ed0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQGe2eQ6AdHtUH6w4LCY0A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1ATVxjt3exuAmM6a0S5xlZjxhfpEBINcEGpnYq6bdXBdmprpy1GskJK
	SNIk1AfjFEERcRQz0AF5GmHAiTAUMIjBVCdEHgUFJeK7VgqCRaBtlBaLpQmrrf/OPd8593zf
	d+fyOIInXCFPrTUxBq1SIyb98YbmIElw9+1NjOyylUTlV69zUduNkxg6OFrBRe6rTgzdf5oJ
	0HcP+klU5biCoakGMweVuq4QyP10jETpZTUkuvksg0A/p1kxNFr8Bjo69ICDHMM2LirPKSVQ
	Y4YFR+PuTAzlTlZiqO6XXgLVl04ClPn8CUAlrlEc9diLSOSaygbo3j0rQC2n3STK7/oBQ51l
	R7io+GEuB1l+t+Eo41AFgQ44XFzU/PgggQaPeiUT9hIcWe3e+848NhPojjkHoNbqT94Jor/3
	pJF0SVUK7Rg/gdPnCu5x6TrrIZK+23vey7dvpi8UV3Hp+4dbMbq+/Fu6/LGToLOfy+ijZ6yA
	ru9IofNKJjDaUzc/hvoscVUCo1QxBhGjjdOp1Nr4KPEHH8WuiQ0Nk8mD5REoXCzSKpOYKHH0
	hpjgdWqNd8Fi0TdKTbKXilEajeKQt1cZdMkmRpSgM5qixIxepdEr9FKjMsmYrI2XahlTpFwm
	Wx7qFW5LTLhp7yT1+3m7aut/xFNBK5kF/HiQUsDOrhNYFvDnCagmAJ35tzjs4Q8A87IKgU8l
	oMYB7M33e+loa24hWd4BYEf2C8MQgD/lnJ0ukFQwbCzLIH2FAKqJD3su9OG+gh+1FrrtuVwf
	nkXtgM9yU6cTcGoxPORJn+b5VAQcdFZxWDwTth/vn/ZyqLdghWWYw3YhghMDFYQPB1DvQsu+
	IoLVBMJHl1xcXzCkHP6wummEyxqiYdHBLozFs+CvrWde8ELoGXV4O+V5MQ1PTgpZOgGOVNYA
	Fq+GF91FuE/CoYJgjT2EjXodHvm7H2OdfJiZIWDVi2H66HWcxfOg+fBhgsU0HL+aRbK7ugZg
	Yd9+8hgQFbwyZcErUxa8Mk3B/8knAG4Fcxm9MSmeiQvVy7XMzv/eO06XVAemv58kuhHcLP1H
	6gQYDzgB5HHEAfxuxQZGwFcpd+9hDLpYQ7KGMTpBqHf1Zo5wdpzO+3+1pli5IkKmCAsLU0Ss
	CJOLA/nDB4pVAipeaWISGUbPGF76MJ6fMBWT9m3/SjS2qHljh8FWCc+3pGxJfdqsVi/pvra9
	M35JwZyJU9LopvwtwZZa9T5LWq2thdz45pM5E7ue7b2rckqKu8bK7WMz9ss/Xvn5xVXSzQv7
	LqWVpFSur1rScUAU9J7hWMjdiIU7um/X3gnfOz9kmJhKSswjWpcbq5f91r5aFDkYeIGcbb/1
	5byhkxLkCqzpWTESk3jLY9pKpK6bsr2Gf5qx8mHogHHFplN16QuWPnJfLjweYFn/12nY1nB/
	jfDDtvgb2t5sVZTUM7dEs5uxVY9vvXRk2W332X0z+woF4VZHD1i4iBeC/CLVMZ6BGV9v3pYv
	2bM+88+d7y/4omzX0gW9XefMYtyYoJRLOAaj8l9NnEQfBwUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxiH/U7PpXRrcqgmnoEZ0mQbY4DtdO7TGbxEkxMz5wWSZVtwdvas
	GmjpWmDMZshg62UGKsqAFWkp7epWapgFGmRWlrYWCFtZtQhyGRpBmBAIAd24Omizhf+evL/f
	+7zfHx+bxQtiMeyzshxGIRNl8XEO6vLy45K7+99jBCOF8dAa7CFgR28dAjVTNgKGgh4EDj/V
	AvjdwxEcOtwBBD53lbGgyRfAYOjpNA6LLQ047FtQY/BBkR2BUzVbYOn4QxZ0TzQT0HrZhMEW
	tRmFz0JaBJYvXUWg89E9DDaalgDULs8BaPRNofBu6xUc+p7rARwasgPorw/hsKr7FgJ/s5QQ
	sOZxOQuaZ5pRqNbZMPiN20dA76QGg2Olq5X5ViMK7a2rvqbJMgwOlF0GsP3a+/tep3+eLcJp
	o0NFu5/VovQNwxBBO+06nB68d3N13nmcbqtxEPTwhXaEbrSep62THozWLwvo0iY7oBu7VHSl
	cR6hZ50vHyM/5OwRM1ln8xjFttRTnDM/XvsdlS8T+Z1eB1YIbuHfgig2Re6gOrz+VeaweeQv
	gBpqWsQiQSzVe/0iEeGN1E8rY0Sk9BhQF8wlyFqAk8lUi0UdNm0i73OprsGja8wjA4BaKlKu
	cRR5iAq1lodFG0kx9cOcOdxHyVco3WxxeM4ld1FjHgcrwtFU5/cj6BqzyDeo0fuj/7PNPMGK
	PGgrNT9qwyJ3D1Dmr65gkc5m6q/bPuIi4BnWqQzrVIZ1KsO6lVqA2sFLjFwplUhPC+VCGfN5
	ilIkVebKJCmns6VOEP51iQkt4E/TSooHIGzgARSbxd/E/WPHuwyPKxZ9cY5RZH+syM1ilB4Q
	y0b5m7nCqmoxj5SIcphMhpEziv9ShB0VU4i8dYdRSJItr1oebLiaOp0j2p0XHesX1rVXP8FL
	qsfVFbtT/1F8/SZnMSnRrrl0pyAotiaJ/X2BQyp5c7ybbzp47IX+iq5TaZlGlzZwRPVk7+3M
	hPHPDlNf1u0JFv7acDKhyjWdkdFQHt1bcKStrF4nilfEFL84UnwjsMVwwMbfH6fV96Ql+/fO
	ONuCC+ydGQOcXOHJmfr5lYMTNxfjvOe28zKRbT3yeMHht++m5aqmuuZcbZ8MJzjzBSfslR0V
	yv0F/vSdBZ/mDS4AmX7l0d/ZpqPDl+r3aYSN5yur9Zbrfd1JE827pOkS1WvpA3KfbvtHWzcI
	NP1Ebf47MqtD7PyAjyrPiISJLIVS9C80+5lK5AMAAA==
X-CMS-MailID: 20231111013719epcas5p23433820ac418efb4ae8ed7444c1f469c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104441epcas5p37483641314b35da23d838c3679bdd157
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104441epcas5p37483641314b35da23d838c3679bdd157@epcas5p3.samsung.com>
	<20231108104343.24192-12-krzysztof.kozlowski@linaro.org>



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
>  .../mfd/samsung,exynos5433-lpass.yaml         =7C  2 +-
>  .../bindings/sound/samsung-i2s.yaml           =7C 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)
(...)


