Return-Path: <linux-i2c+bounces-69-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9187E87F4
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 02:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEADC1C20A8A
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Nov 2023 01:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3D93C24;
	Sat, 11 Nov 2023 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rk/Vnfhw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390222900;
	Sat, 11 Nov 2023 01:45:58 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DC0449A;
	Fri, 10 Nov 2023 17:45:56 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231111014554epoutp01fb86d2c6357c226f27098220f02060d0~WbkWh2cK-2782027820epoutp01j;
	Sat, 11 Nov 2023 01:45:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231111014554epoutp01fb86d2c6357c226f27098220f02060d0~WbkWh2cK-2782027820epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699667154;
	bh=pmPCvpEQALsN2I+z2mdUOLAfesbaw0dmr1s6esTrmwM=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=rk/VnfhwOir17zh6etek14ytr7EuArzKJdnZPSXpap8K2N1CaYJ0yinihj9aqTD28
	 p7iZJYobSFiBBoi4h7qZa4Oiz16cVCe7fGYAOwULdgIhE/pc2lq9QdBbBGIA0KKlRm
	 DKJwy0WggijLlen+KSmEHzxq75+EKGe4FVgX4eIU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231111014554epcas5p493bb28599928ed4789b47172fe7d1467~WbkWR5WD12395723957epcas5p4l;
	Sat, 11 Nov 2023 01:45:54 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SRz6n28PJz4x9Pr; Sat, 11 Nov
	2023 01:45:53 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B6.BE.08567.1DCDE456; Sat, 11 Nov 2023 10:45:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231111014552epcas5p17256164fc9ca6ea2b575207f03919877~WbkUnwO9c2897028970epcas5p1I;
	Sat, 11 Nov 2023 01:45:52 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231111014552epsmtrp1036115db57eb4aaba270dfbeb1040557~WbkUmN2lP3109231092epsmtrp1_;
	Sat, 11 Nov 2023 01:45:52 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-14-654edcd17e98
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.73.18939.0DCDE456; Sat, 11 Nov 2023 10:45:52 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231111014547epsmtip1027d013442d29eabc5f9d04f6fa045be~WbkPd9a2L2014520145epsmtip1F;
	Sat, 11 Nov 2023 01:45:47 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-18-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 17/17] arm64: dts: exynosautov9: add specific
 compatibles to several blocks
Date: Sat, 11 Nov 2023 07:15:46 +0530
Message-ID: <05ad01da1440$cdb40340$691c09c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQGBpPEAAjHDf/Cw3p3ngA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0zTVxTHc3+P/qqu5mfFeYfGsDqzgQHaQbuLAUbk4U/nHM4EzLIFG/oL
	EKB0LUzRJTIN5SUwBIM0tIAQwCrpVh7BMkSwWt1MeYqoMMZgysMxJ68JOFb4oeO/z/me77nn
	nnNz+bhwmnLmxygTWbVSHifirScabrq6uXf2H2LFQzUUqui8T6E7Dy5hKG2ykkI9nW0YGpxJ
	B+jC0AgPXW22Y2ipIQ9HJVY7iXpm/uKhs+UmHuqb15LotzNGDE3qt6Oc0SEcNU/UO47LLyFR
	o7aMQLM96RgqWKzCkHm4l0S1JYsApb+aBshgnSRQt6WYh6xLuQANDBgBun2lh4cutl/H0L3y
	bArpnxTgqOzvegJpMypJlNpspdDNZ2kkeprjsLy0GAhktDjOq3uWR6LHefkA2WrCA1yZH6bO
	8BjD1VNM82wpwVzTDVCM2ZjBY/p7f3Lodw8zLfqrFDOYZcOY2orTTMWzNpLJfSVmcuqMgKn9
	5RRTaHiJMVPmHaH0F7G+0axcwapdWGVkgiJGGeUn+uRIRGCEVCaWuEt80EciF6U8nvUTBR0M
	dQ+JiXMsWOTyjTwuySGFyjUakae/rzohKZF1iU7QJPqJWJUiTuWt8tDI4zVJyigPJZu4RyIW
	fyh1GI/FRleZRkjVz9SJB/qHvBRQzcsE6/iQ9oY3ZkpBJljPF9JNANptVowLXgBoy7SDN4HF
	Mke+LjGabPgyC+lrAM4X7+RMowCaa8uw5QSPdoeN5VrecsKJbhLA7pbfieXEOjoYtkxdXGm+
	mZbD9uE7YJkJehdsaC5a0QW0D3xeZyY53gTvFo2s1OL0blhZNoFzt3CBL/+oXPE40Xthy6/V
	FOfZCsduWSnOU78eZlZ8znEQTKlOX9U3w3Fb3So7w7FcrYP5DmbgpUVnTo6Gf1aZAMcfwxs9
	xcSyBaddocniyXXaCLMXRjCuUgDTtULOvQuenbxPcLwN5mVlra6Ngfey21aX2wVgdmsf/j1w
	0a0ZUrdmSN2aYXT/dy4FhBG8w6o08VFspFQlUbLH37x3ZEK8Gax8P7egRtBX8q9HG8D4oA1A
	Pi5yEnR4H2SFAoU8+SSrTohQJ8WxmjYgdWw+D3feEpng+L/KxAiJt4/YWyaTeft4ySSirYKJ
	VL1CSEfJE9lYllWx6td1GH+dcwqWlFPW5Iqb97z942iHOrD6M6el925tmd5QSCpDzHcN1oD0
	jufhngH/EPteiIZb9wkWQhvOdeiSR5vH9uffblQgVJNZKI3psi6UH02ztx8QvPXVC0PvuCaM
	nN0uau3PzJdVzXVqv00tORmuHoncn/zoVIYBhg6K6wIPP9zUxL67d/5w5XeLlz3C7OrT3bnS
	gglJCuX5WNpInbDprwhQ/MyY//gHipCva8b1T48xBxe2Dwrv9Xp4Wc77nrus22Caef9Lwhic
	HdO64eTOUv+ijK4W+lP7bkXtdfORC4uPwrwsW9yG8p7MKe39O7Y5uctkHof6jup1llrT+bLW
	4JSczfD4RhGhiZZL3HC1Rv4fd75WOwcFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDTdRzH/f6eh437NUi/B+XlujrDBDw8+9KlZw+cvz+6JLrq8o90wU8g
	Gew2SHno8CDHwAJBPXC5DQSWzNVkPEjIWIxNwsnEQBYHSCMeJImwhd08HoLt6vjvdZ/3+/P6
	fP/4MrjIRYYxqemZvDxdkiamgojWbvG2Xf2j7/LRFtNzqO7uPRr95L6MoaJ5PY0G79owNL6o
	AuiCZ5JCRosLQ6ut5TjS2V0kGlz8k0KFtSYK/fJESaJfCwwYmtc8i0ofeHBkedhCo7pzOhK1
	KWsI9HhQhaHzS99iyPzbEImadEsAqZb/BkhrnyfQQPslCtlXywAaGzMAdPPqIIWq7nRi6Hbt
	1zTSTJ/HUc2jFgIpi/UkOm2x06h7rohEM6VrFV+7lkCG9jVf81w5iUbKzwHU891HB17mrnkL
	KE5rzOUsj6sJ7gf1GM2ZDcUUNzrUsTbvfY+zaow0N36mB+Oa6vK5ujkbyZUtR3OlzQbANTlz
	uUqtD+O85m3x7OGg15P4tNTPeXnU/qNBKQXFnUBmo09OfFmDnwLVVAkQMJDdAw2mHrwEBDEi
	9jqA7TcekYEgHLobz9IBDoENKzN0oDQNoONmE1gPKHYXbKtV+k2h7LAQOkcPBUouAGe7m/2B
	gI2DVm+Vn0PYI/DWjXFsnQn2RdhqueifC9lYuNBsJgP8NOy9OEmsM87uhFPDU/+zvuYhHnjR
	89A3pScDh9+E1vtX6EBnK5x12OmzQKTeoFJvUKk3qNQbVqoBYQDP8DKFNFmaKNsdqZBIFVnp
	yZGJGVIz8H+5iIQ2oDctR9oAxgAbgAwuDhX273mHFwmTJNk5vDzjiDwrjVfYQDhDiLcKX0gr
	ThKxyZJM/jjPy3j5fynGCMJOYbkf7uvQdmmmszWfbg79xtm/4wt31HjfkGlTQ0XlVSA2h33S
	EV72z2n7AZeuRHVicsJ2+3p0T19q9Bn3k6hjwbErR1/Ncg6Dsr2a/vQtVxKUbM5KYuHee6Uf
	Gx0Vnre9M/eXJC2CRLVk561FacbCyI98+UFVzsktMfGz33flyQ3H4AlV6/xo8MQDq+791e3G
	eIfzD3fvJoc179IbWfWH/2oM66yvGnFcrkyIrIqITSEm1R+4SuIG7qQUen4ufIXxRLxECroE
	MXGVTwV/FRrjO76wL8874EvdfmHztfpDjXE7dH2CBl2XS0YU5U/nW2SN2ba3QjIXXjtI/P6Z
	umKqY3F/p5hQpEh2R+ByheRf5sU5kOEDAAA=
X-CMS-MailID: 20231111014552epcas5p17256164fc9ca6ea2b575207f03919877
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104502epcas5p335e39d7cc94ca84aa4423ceee1a0a315
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<CGME20231108104502epcas5p335e39d7cc94ca84aa4423ceee1a0a315@epcas5p3.samsung.com>
	<20231108104343.24192-18-krzysztof.kozlowski@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ExynosAutov9 reuses several devices from older designs, thus historically=
 we
> kept the old (block's) compatible only.  This works fine and there is no =
bug
> here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to ExynosAutov9 in front of all old-SoC-like
> compatibles.  This will also help reviews of new code using existing DTS =
as
> template.  No functional impact on Linux drivers behavior.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi =7C 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
(...)


