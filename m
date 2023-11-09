Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A567E70DA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 18:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344885AbjKIRw3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 12:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344878AbjKIRw2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 12:52:28 -0500
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650743A81;
        Thu,  9 Nov 2023 09:52:26 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231109175224epoutp0346aeaa927f8395919c5b0afe62126022~WBdpSexJ53065630656epoutp03p;
        Thu,  9 Nov 2023 17:52:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231109175224epoutp0346aeaa927f8395919c5b0afe62126022~WBdpSexJ53065630656epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699552344;
        bh=Jr4GkdM+Bcpg8gm8bIo+jzqmZO8HZv8wA9+FSyovLkU=;
        h=From:To:In-Reply-To:Subject:Date:References:From;
        b=rNWcCyRvqCsbNNbtJS8hnVFqLX0X+mdOAyIcmVoeUTU3fYTHs8YjgZK2PcXNdyKXF
         jqYNeO2M/J0VLmO2D90WVk7ibI/miK9MBdzDUCjVsI167qKtzC1kZ8QB7vuwYEt+et
         fQcL/enqMIjsZgZFpaR9hSWAM6pWB/KrY+5QRnXg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20231109175223epcas5p289edecb303291727ca24d9369ec4f1df~WBdoJqbIn2986229862epcas5p2K;
        Thu,  9 Nov 2023 17:52:23 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.177]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4SR8fs58yRz4x9Pr; Thu,  9 Nov
        2023 17:52:21 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B7.62.09672.55C1D456; Fri, 10 Nov 2023 02:52:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20231109175220epcas5p418e9ad19525bcc38a27890fb6ff869d1~WBdl4qPQd0671006710epcas5p4u;
        Thu,  9 Nov 2023 17:52:20 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231109175220epsmtrp1ac258fa50bc37d72285b233cfbdc3f02~WBdl1B-eQ1825218252epsmtrp13;
        Thu,  9 Nov 2023 17:52:20 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-16-654d1c553d5c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AA.E8.07368.45C1D456; Fri, 10 Nov 2023 02:52:20 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231109175215epsmtip186a8ffcbe4dc89c370df647558f4d401~WBdgrX6BO0328003280epsmtip1x;
        Thu,  9 Nov 2023 17:52:15 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'David Airlie'" <airlied@gmail.com>,
        "'Daniel Vetter'" <daniel@ffwll.ch>,
        "'Maarten Lankhorst'" <maarten.lankhorst@linux.intel.com>,
        "'Maxime Ripard'" <mripard@kernel.org>,
        "'Thomas Zimmermann'" <tzimmermann@suse.de>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Conor Dooley'" <conor+dt@kernel.org>,
        "'Andi Shyti'" <andi.shyti@kernel.org>,
        "'Jonathan Cameron'" <jic23@kernel.org>,
        "'Lars-Peter Clausen'" <lars@metafoo.de>,
        "'Lee Jones'" <lee@kernel.org>,
        "'Ulf Hansson'" <ulf.hansson@linaro.org>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Linus Walleij'" <linus.walleij@linaro.org>,
        "'Thierry Reding'" <thierry.reding@gmail.com>,
        =?utf-8?Q?'Uwe_Kleine-K=C3=B6nig'?= 
        <u.kleine-koenig@pengutronix.de>,
        "'Alessandro Zummo'" <a.zummo@towertech.it>,
        "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>,
        "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
        "'Jiri Slaby'" <jirislaby@kernel.org>,
        "'Liam Girdwood'" <lgirdwood@gmail.com>,
        "'Mark Brown'" <broonie@kernel.org>,
        "'Jaehoon Chung'" <jh80.chung@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add
 specific compatibles for existing SoC
Date:   Thu, 9 Nov 2023 23:22:14 +0530
Message-ID: <029f01da1335$7c8ed1e0$75ac75a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQMHgSm7AhTeUd+w0T+DcA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc1/fawtZzbOweVeN65rhRIO2UvDi1DnF+aK44Y9l0ZlA076A
        obRNW/wx4yQKBTSCpSLKLCAldak4FFA7tMiQX8KCgAUdrEMRf1QUfyHaSWEtDzf++55zPuec
        e87N4bL4wxwBd7tKT2tVMqWIHYhfvBb6edh3s9bT4rE+ESrt6OKg5lslGMoYsnKQs6MOQ32v
        MwHKuzvARmWONgyNXzSyUFF9G4Gcr5+x0QFLORvd/sdAoDv7bRgaMs9C2Y/uspBj8AIHlZqK
        CGQ3nMLRiDMTQ0dHT2Oo4l43gSqLRgHK9A4DVFg/hKOb1SfZqH48ByCXywZQ4xknGx2/UYOh
        PyyHOcj84CgLnXpxAUeGLCuB0h31HHTtSQaBHmb7EE91IY5s1b56VU+MBOo1mgBqOvv9ilDq
        3Kv9bKqwbA/lGCnGqd8KXByqwpbFpv7qvuLzX99AXTWXcai+Q00YVVm6jyp9UkdQOV4xlV1l
        A1Rl6x4qv9CDUa8qZseSW5OWJtIyBa0V0iq5WrFdlbBMtG5T3Kq4iEixJEwShRaLhCpZMr1M
        FB0TG/b1dqVvwSLhDpkyxeeKlel0ooXLl2rVKXpamKjW6ZeJaI1CqZFqFuhkyboUVcICFa1f
        IhGLF0X4wPikxJq8YVzTPHeXcawNSwXP5hwEAVxISuEJ49/4QRDI5ZOXAeyqcgHGeAmgPdeD
        McYIgI1v2on3KWXeWjYTcACY3VOO+QN88hGAOVaJX7PJMGi3GCagYPIyD9682o/7AwFkNMw9
        18ry6yBSC7vHz05UxcnPYJX5PMeveWQU/H3wDcHo6fD6iYGJXBY5H1pPDbKYVwih5751ggkm
        V8KXA4cJhpkB3Q31HIZxBMKxtkk+Gtpb3ZMTBMHHTVWTjAC6cww+zfVpCpaMChh3Inx6uhww
        +ktY6zyJ+xEWGQrLqxcynabBw+8GMCaTBzMNfIYOgQeGunBGz4TGQ4cmm1Kw7653crkdAPY+
        8BJHgLBgypAFU4YsmDJMwf+diwFuAx/TGl1yAq2L0ISr6J3//bdcnVwBJs5v3jo76L/zfEEd
        wLigDkAuSxTMa5fG0HyeQrb7R1qrjtOmKGldHYjwbd7IEnwoV/vuV6WPk0ijxNLIyEhpVHik
        RDSDN5huVvDJBJmeTqJpDa19n4dxAwSp2Ax5Ki+1KLDBciSWGvIMG9tDT3rOuJIso+mGwbz2
        +Xszcjvb3bdMl+6UevOzA7y7b7jH82Ni+udmbU5etbJn4+pfeqavF7W8fdA6bW93vOmNrGUX
        yp018+GVDSHieyFLcoM2Z17u32Zt/mDHi29KxsLnCLfVao/lr1Bu2RJCyxuIICz2/rmtaxXv
        LJ90fssLnhYV737n/nRH2rGdxGPpD3/uNXdtth5YdEk7Imj4dbWzd5XK9FGUK2uFvHj8QnjA
        4oXHkySvZm9cI/mJLzv/tLJFm9YoWY9/tbtfuu/5F4q05Wx7y9o1JeKQdcWm2zWVi2pqKu6Z
        3yYrOxXdDT8HNio3dfGJDBGuS5RJ5rG0Otm/Uxm8vQcFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7bCSnG6IjG+qwZy7WhZLLl5ltzhxfRGT
        Rfu7ZewWVy4eYrK4/7WD0WLqwydsFmv2nmOy+L9tIrPF/CPnWC2ufH3PZtG8eD2bxY1fbawW
        D5pWMVm8mytj0ffiIbPF3tdb2S2WTJ7ParGjbSGLxbcrHUwWU/4sZ7LY9Pgaq8Xm+X8YLTr+
        fmG0mHfkHYvF5V1z2CyO/O9ntLh7dxWjxbHVV9gsZpzfx2RxZnEvu8XcZ1OYLRZ+3Mpi0da5
        jNWide8RdovDb9pZLZ73AZX83DWPxWLVLqB5W95MZLW4PXEyo8XxteEOmh4bPjexecxbU+2x
        99sCFo+ds+6ye2xa1cnmcefaHqD4yUCP/XPXsHvc7z7O5LF5Sb3HkjeHWD36/xp49G1Zxeix
        +XS1x/R5P5k8Pm+SCxCI4rJJSc3JLEst0rdL4MpY+G0HY0G/XMXTGYINjM2SXYycHBICJhJr
        /h5g62Lk4hAS2M0oMenLCTaIhLTE9Y0T2CFsYYmV/56D2UICzxgl9u8Fs9kEdCV2LG4DqxcR
        uMkrcfqOP8Sgs4wSzS2rWUESnAIuEpM2nGYGsYUFCiQ2LfgP1sAioCKxZe5GsEG8ApYSB19/
        Z4WwBSVOznzCAmIzC2hLPL35FM5etvA1M8RBChI/ny5jhVjsJPHpSS8rRI24xMujR9gnMArN
        QjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GTDAsO81HK94sTc4tK8dL3k/NxNjOBEp6Wxg/He
        /H96hxiZOBgPMUpwMCuJ8F4w8UkV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzms4Y3aKkEB6Yklq
        dmpqQWoRTJaJg1OqgelYhI6zuqa1m9j/6Sr/DqpxseqWhLh90nZ+vTP0mYH4Z7nJ1fHhpY33
        o/Tq0vaX/qx6+O7vG4WSJw6900qmebEdqD3j8KI/+a8rx14JEd3W2Fvy9S1LfjvKvlpSHfP1
        plyaMENM3YIT628zcefxmVYcaStnWrtO2GDiJ7XINiEh74ANnoz2Mb7yPScLd8inlZ+6EHOw
        +sWG/k9FiUbG1fVfOKc5icQo9V++82WTxNWV2c13P6q1CKj3dKziU1kzoTBOZ+XilbH31CSV
        QyycuqWn2DPNbz50M+TK3XmVl01uybJuDl6tttt344v26c5d587G9a2ff//h7sI3Ly7nvvh5
        e/HlXXotz385/1r2TImlOCPRUIu5qDgRAD2dvGXjAwAA
X-CMS-MailID: 20231109175220epcas5p418e9ad19525bcc38a27890fb6ff869d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104402epcas5p433b83d080a784bae895d74091df15a25
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
        <CGME20231108104402epcas5p433b83d080a784bae895d74091df15a25@epcas5p4.samsung.com>
        <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, November 8, 2023 4:13 PM
> To: David Airlie <airlied=40gmail.com>; Daniel Vetter <daniel=40ffwll.ch>=
;
> Maarten Lankhorst <maarten.lankhorst=40linux.intel.com>; Maxime Ripard
> <mripard=40kernel.org>; Thomas Zimmermann <tzimmermann=40suse.de>;
> Rob Herring <robh+dt=40kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt=40linaro.org>; Conor Dooley
> <conor+dt=40kernel.org>; Alim Akhtar <alim.akhtar=40samsung.com>; Andi
> Shyti <andi.shyti=40kernel.org>; Jonathan Cameron <jic23=40kernel.org>; L=
ars-
> Peter Clausen <lars=40metafoo.de>; Lee Jones <lee=40kernel.org>; Ulf
> Hansson <ulf.hansson=40linaro.org>; Tomasz Figa <tomasz.figa=40gmail.com>=
;
> Sylwester Nawrocki <s.nawrocki=40samsung.com>; Linus Walleij
> <linus.walleij=40linaro.org>; Thierry Reding <thierry.reding=40gmail.com>=
; Uwe
> Kleine-K=C3=B6nig=20<u.kleine-koenig=40pengutronix.de>;=20Alessandro=20Zu=
mmo=0D=0A>=20<a.zummo=40towertech.it>;=20Alexandre=20Belloni=0D=0A>=20<alex=
andre.belloni=40bootlin.com>;=20Greg=20Kroah-Hartman=0D=0A>=20<gregkh=40lin=
uxfoundation.org>;=20Jiri=20Slaby=20<jirislaby=40kernel.org>;=20Liam=0D=0A>=
=20Girdwood=20<lgirdwood=40gmail.com>;=20Mark=20Brown=20<broonie=40kernel.o=
rg>;=0D=0A>=20Jaehoon=20Chung=20<jh80.chung=40samsung.com>;=20Sam=20Protsen=
ko=0D=0A>=20<semen.protsenko=40linaro.org>;=20dri-devel=40lists.freedesktop=
.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-kernel=40vger.kernel.o=
rg;=20linux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-samsung-soc=
=40vger.kernel.org;=20linux-=0D=0A>=20i2c=40vger.kernel.org;=20linux-iio=40=
vger.kernel.org;=20linux-mmc=40vger.kernel.org;=0D=0A>=20linux-gpio=40vger.=
kernel.org;=20linux-pwm=40vger.kernel.org;=20linux-=0D=0A>=20rtc=40vger.ker=
nel.org;=20linux-serial=40vger.kernel.org;=20alsa-devel=40alsa-=0D=0A>=20pr=
oject.org;=20linux-sound=40vger.kernel.org=0D=0A>=20Cc:=20Krzysztof=20Kozlo=
wski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=2001=
/17=5D=20dt-bindings:=20hwinfo:=20samsung,exynos-chipid:=20add=0D=0A>=20spe=
cific=20compatibles=20for=20existing=20SoC=0D=0A>=20=0D=0A>=20Samsung=20Exy=
nos=20SoC=20reuses=20several=20devices=20from=20older=20designs,=20thus=0D=
=0A>=20historically=20we=20kept=20the=20old=20(block's)=20compatible=20only=
.=20=20This=20works=20fine=20and=0D=0A>=20there=20is=20no=20bug=20here,=20h=
owever=20guidelines=20expressed=20in=0D=0A>=20Documentation/devicetree/bind=
ings/writing-bindings.rst=20state=20that:=0D=0A>=201.=20Compatibles=20shoul=
d=20be=20specific.=0D=0A>=202.=20We=20should=20add=20new=20compatibles=20in=
=20case=20of=20bugs=20or=20features.=0D=0A>=20=0D=0A>=20Add=20compatibles=
=20specific=20to=20each=20SoC=20in=20front=20of=20all=20old-SoC-like=20comp=
atibles.=0D=0A>=20=0D=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzys=
ztof.kozlowski=40linaro.org>=0D=0A>=20=0D=0AReviewed-by:=20Alim=20Akhtar=20=
<alim.akhtar=40samsung.com>=0D=0A=0D=0A>=20---=0D=0A>=20=0D=0A>=20I=20propo=
se=20to=20take=20the=20patch=20through=20Samsung=20SoC=20(me).=20See=20cove=
r=20letter=20for=0D=0A>=20explanation.=0D=0A>=20---=0D=0A>=20=20.../binding=
s/hwinfo/samsung,exynos-chipid.yaml=20=20=7C=2017=20++++++++++++++---=0D=0A=
>=20=201=20file=20changed,=2014=20insertions(+),=203=20deletions(-)=0D=0A>=
=20=0D=0A>=20diff=20--git=20a/Documentation/devicetree/bindings/hwinfo/sams=
ung,exynos-=0D=0A>=20chipid.yaml=0D=0A>=20b/Documentation/devicetree/bindin=
gs/hwinfo/samsung,exynos-chipid.yaml=0D=0A>=20index=2095cbdcb56efe..45f3d46=
8db7c=20100644=0D=0A>=20---=20a/Documentation/devicetree/bindings/hwinfo/sa=
msung,exynos-=0D=0A>=20chipid.yaml=0D=0A>=20+++=20b/Documentation/devicetre=
e/bindings/hwinfo/samsung,exynos-=0D=0A>=20chipid.yam=0D=0A>=20+++=20l=0D=
=0A>=20=40=40=20-11,9=20+11,20=20=40=40=20maintainers:=0D=0A>=20=0D=0A>=20=
=20properties:=0D=0A>=20=20=20=20compatible:=0D=0A>=20-=20=20=20=20enum:=0D=
=0A>=20-=20=20=20=20=20=20-=20samsung,exynos4210-chipid=0D=0A>=20-=20=20=20=
=20=20=20-=20samsung,exynos850-chipid=0D=0A>=20+=20=20=20=20oneOf:=0D=0A>=
=20+=20=20=20=20=20=20-=20enum:=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=
=20samsung,exynos4210-chipid=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20sa=
msung,exynos850-chipid=0D=0A>=20+=20=20=20=20=20=20-=20items:=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20-=20enum:=0D=0A>=20+=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20-=20samsung,exynos5433-chipid=0D=0A>=20+=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20-=20samsung,exynos7-chipid=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20-=20const:=20samsung,exynos4210-chipid=0D=0A>=20+=20=20=
=20=20=20=20-=20items:=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20enum:=0D=
=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20-=20samsung,exynos7885-ch=
ipid=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20-=20samsung,exynos=
autov9-chipid=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20const:=20samsung,=
exynos850-chipid=0D=0A>=20=0D=0A>=20=20=20=20reg:=0D=0A>=20=20=20=20=20=20m=
axItems:=201=0D=0A>=20--=0D=0A>=202.34.1=0D=0A=0D=0A=0D=0A
