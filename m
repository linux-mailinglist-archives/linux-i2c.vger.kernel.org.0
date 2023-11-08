Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5747E5C3A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 18:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbjKHRRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 12:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjKHRRy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 12:17:54 -0500
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C267E8;
        Wed,  8 Nov 2023 09:17:52 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231108171749epoutp0395e2c96b9ba9d421f0bb196318a088e9~VtWKJceKh2476124761epoutp03c;
        Wed,  8 Nov 2023 17:17:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231108171749epoutp0395e2c96b9ba9d421f0bb196318a088e9~VtWKJceKh2476124761epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699463869;
        bh=UxA3Bc4nT5hqKJPQK7+NIJZ9SGz+LgimIAFBohacLkA=;
        h=From:To:In-Reply-To:Subject:Date:References:From;
        b=NgiX37P0Qeq/dUk3srqRXt7StxKiWzHWWuFhBTLl0jNS0+NJMgwMpnJSduXvpL0j5
         gjLmXYiI9a0Z1MCXbO4TdckMAMNY2EZivpgOx12aKkkd98jskAPdMcfeRASTQFDGrP
         NDo63BWy0b7LEXm7X1LqWOeu8p4LK+doRQoSsXWo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20231108171748epcas5p27a3cfcfcc24752d809ba0997f273792d~VtWJbNFQR0949009490epcas5p2i;
        Wed,  8 Nov 2023 17:17:48 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.181]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4SQWxQ5pVcz4x9Pt; Wed,  8 Nov
        2023 17:17:46 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.82.08567.AB2CB456; Thu,  9 Nov 2023 02:17:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20231108171746epcas5p3f86ee6df11d09c904f100a2fbc7eb9e1~VtWHSMKa80140301403epcas5p3X;
        Wed,  8 Nov 2023 17:17:46 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231108171746epsmtrp16a7f0e7221f90bcf3f30973475021abf~VtWHQxlrn0715407154epsmtrp1Z;
        Wed,  8 Nov 2023 17:17:46 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-ff-654bc2bac9c7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.4B.08817.9B2CB456; Thu,  9 Nov 2023 02:17:45 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231108171740epsmtip20118d631435117a0f77cfabbe2d6285b~VtWCI76tO2033320333epsmtip2T;
        Wed,  8 Nov 2023 17:17:40 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 00/17] dt-bindings: samsung: add specific compatibles
 for existing SoC
Date:   Wed, 8 Nov 2023 22:47:39 +0530
Message-ID: <000001da1267$7d8412f0$788c38d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFO35rCCtTG0BenYd8MTzjBP23zIAGWJB6ksXpd9DA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUVRz23Lt77+K0eEPK02q23akcJB6bLB4YAZMd5xr+QWMzTowEG3sD
        Yl/uLj6wJsNh5b1uKgQDLG+mVaIWRFpYcBbELNMc0TQhEEEQNih5JAXYsreH/33n+33f+f2+
        35kjwH1mSZEgVW1gdWq5kiZW81q7/fwC7M4YNji/YhOqvX6TRN/+VI2h41P1JOq77sTQ4Fw2
        QKfvjRDorOMqhp60mnFk6bnKR31z0wQ6VtNEoNt/GvloKNOKoanyDahw/B6OHJPnSFR70sJH
        bcYqHprvy8bQqcUGDNnu3+KjZssiQNlLswBV9Ezx0A17GYF6npgAGhiwAtR7po9An1/rxNCV
        mgISlT84haOq38/xkDGnno+yHD0k6nYd56OxQrdkwV7BQ1a7+74Wl5mP7ppPAnSpce92P+ar
        mUyCqTh7hHHMV/KYb0oHSMZmzSGY/lsdbv7y20xX+VmSGcy7hDHNtZ8wtS4nnzEtBTOFLVbA
        NH9/hCmuWMCYGdvGWCoubVsKK1ewOjGrTtIoUtXJEXTMnoToBGlosCRAEoa20mK1XMVG0LLd
        sQE7U5XuBdPiA3JlupuKlev1dFDkNp0m3cCKUzR6QwTNahVKbYg2UC9X6dPVyYFq1hAuCQ5+
        Q+oWJqalDA9l49oz0YcmarqIo2Buey7wEkAqBFp+WeCvYB+qHcBjJem5YLUbPwLwh7EmjDvM
        A9hdVcjLBQKPo2tIyPEOAB2PXIA7jLvdA1m8lasIKgC21RiJlYIv1S6EN7qGPQUvSgbzm8fB
        Cl5L7YPGE6exFcyjXoGZXUUejZAKg7mNzTiHn4WXS0Y8PE75w/qqSZybWwwXRus9c/tS4bDI
        cQPnNOvgw4s95EpjSDlWQ/OYlc8ZZLDZVEBweC2cuNRCclgEH5qMJBeNgdWLIo5Ogb82NAEO
        R8ELfWWe9DjlB5vsQVwrb1jw1wjGOYUw2+jDqV+Fx6Zu8ji8Hprz8v4ZgIHD506R3K6KAWxb
        mMNOAHHpUylLn0pZ+lSa0v87VwKeFbzAavWqZDZJqpWo2YP/vXeSRmUDnu+3WdYGbluWA50A
        EwAngAKc9hUuRTGsj1AhP5zB6jQJunQlq3cCqXv1Zlz0XJLG/X/VhgRJSFhwSGhoaEjYllAJ
        vU44mVWu8KGS5QY2jWW1rO5fHybwEh3FqO4NBP8DQnznWktH8nuWA4OCwOIxgzov8uuLq75z
        kXXv/Px8YfTslyZJpHS6ekmq27EgjttfNk2bJnb/WBQ3U9Rfdsi0+2jJnSd3xdYM2ZquB/G2
        x3qb46UCiyIySLInsTM+wH9i59bXDoa0rw+/6jq/9EXqhTczlItRszSz2EDqp+qMlWtkxBbv
        k40b6cy6fShq16aYzQN3+z47X5Jvffd4U05JaIfvcrFqV92Zx4dr7lv6nXbX3md6Y/4g36o2
        5mSpjK2Jvwk+ZVfZ4sxpEmGQ1/ujo94WHwLfETG///WPtN7x6+j8jCv8yqbq1g/LphJ8d37c
        mVMr6n3RP1K9XPzyJpqnT5FLNuM6vfxv99nGKQcFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTdxTG93+vhaTzpZLxAk62suyCEcEs2ZFo3YctebORaLOJC5Jtdbwg
        G2BpQQGzDTFAKVJlXISO6+i6WcBuVEkpVkbtVpGtDVJAwkURQTYIchESFGRAs4VvvzzPc55z
        PhwBLuomAwQJyam8IlmWKKa8iZab4qDdrbYP+bCuy/tA191Lw63+HzDIm9HT4O62YXBvUYWg
        dPQhBY1WJwZrLUU41NidJLgXH1Nwrt5Iwd2nuSTczzZgMFO1AzSTozhYp67RoCuuIcGcW0fA
        kluFQcnKTxg0j/WRYKpZQaBafYKg2j5DQI+lkgL72gUEw8MGBH80uCkod93A4M/6QhqqJkpw
        qJu7RkBuvp6EHKudhpvTeSQ80qxHli3VBBgs631Xp4tIGCwqRuBoOvruW9wvC9kUV914hrMu
        1RJcq3aY5poN+RQ31Hd9Xe+Ucu1VjTR3r8CBcSbdt5xu2kZyF1bDOM1VA+JMXWe4S9XLGLfQ
        vPMwE+29P5ZPTDjFK/ZIPvc+0VlhpOUV4enquZ/xLOR6U40EApZ5m22/L1Qjb4GIaUNsWf8E
        pkZe63og2//rRdrD29nLzx/RntAEYisf3N40KGY3a67PpTbYlxkQsl1DhzyhUsTmzz4jNwwv
        5j32vGkSbfB2Jpp9cOfHzQ0E8xqb3V5GbLCQ2ceqm0y4h33YzoqHmzrO7GLHB8b/Z33dFO65
        6BV2eVxPehZHsGXWHtyT8WP//t1OX0Qi7ZYq7ZYq7ZYq7ZaRWkQYkD8vVybFJynD5XuT+dOh
        SlmSMi05PvSLk0nNaPPrQkLM6LphNtSGMAGyIVaAi32Fqwc5XiSMlWVk8oqTnynSEnmlDQUK
        CLGfcGmqMFbExMtS+a94Xs4r/nMxgVdAFvb+PzZJ1YGm9IWZqNQrH6k/Dl2cn9NGCjJRrWbv
        iLEpQdppKpeIX4hztT01F0dTOp+KlKV2i7rsDf3BwQZjSdY7JVmZabMN353tO2fpuNN3IGaP
        M0McFSkeytw2+Ko6rjfqpSNgLseCihZHxyTng6Mlk3EL4idf5gy/HqYbcH79YjpXsO0Dlytg
        ZXVHztGceL2rVLqWYr40UvCyo9UpueVw7y991vH8r1PZv9kjyqXi7xlD66eattOfTEt7gye6
        dkVcOXs3UNMRdWzegcdU+hXGhGLCQynz/j3KGzySBGe0BPjcPp4ZtlNlVIYgyZG8+vAgr2Mq
        e+Q3Y1Mj/nLf44/FhPKELDwEVyhl/wIPVhdw5AMAAA==
X-CMS-MailID: 20231108171746epcas5p3f86ee6df11d09c904f100a2fbc7eb9e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104359epcas5p3ebee7b4b489f1e1434436909e4251b81
References: <CGME20231108104359epcas5p3ebee7b4b489f1e1434436909e4251b81@epcas5p3.samsung.com>
        <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof

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
wski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=2000=
/17=5D=20dt-bindings:=20samsung:=20add=20specific=20compatibles=20for=0D=0A=
>=20existing=20SoC=0D=0A>=20=0D=0A>=20Hi,=0D=0A>=20=0D=0A>=20Merging=0D=0A>=
=20=3D=3D=3D=3D=3D=3D=3D=0D=0A>=20I=20propose=20to=20take=20entire=20patchs=
et=20through=20my=20tree=20(Samsung=20SoC),=20because:=0D=0A>=201.=20Next=
=20cycle=20two=20new=20SoCs=20will=20be=20coming=20(Google=20GS101=20and=0D=
=0A>=20ExynosAutov920),=20so=0D=0A>=20=20=20=20they=20will=20touch=20the=20=
same=20lines=20in=20some=20of=20the=20DT=20bindings=20(not=20all,=20though)=
.=0D=0A>=20=20=20=20It=20is=20reasonable=20for=20me=20to=20take=20the=20bin=
dings=20for=20the=20new=20SoCs,=20to=20have=20clean=0D=0A>=20=20=20=20=60ma=
ke=20dtbs_check=60=20on=20the=20new=20DTS.=0D=0A>=202.=20Having=20it=20toge=
ther=20helps=20me=20to=20have=20clean=20=60make=20dtbs_check=60=20within=20=
my=0D=0A>=20tree=0D=0A>=20=20=20=20on=20the=20existing=20DTS.=0D=0A>=203.=
=20No=20drivers=20are=20affected=20by=20this=20change.=0D=0A>=204.=20I=20pl=
an=20to=20do=20the=20same=20for=20Tesla=20FSD=20and=20Exynos=20ARM32=20SoCs=
,=20thus=20expect=0D=0A>=20=20=20=20follow=20up=20patchsets.=0D=0A>=20=0D=
=0ASure,=20make=20sense.=20=0D=0A=0D=0A>=20If=20folks=20agree,=20please=20k=
indly=20Ack=20the=20patches.=0D=0A>=20=0D=0A>=20Description=0D=0A>=20=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D=0A>=20Samsung=20Exynos=20SoCs=20reuse=20seve=
ral=20devices=20from=20older=20designs,=20thus=0D=0A>=20historically=20we=
=20kept=20the=20old=20(block's)=20compatible=20only.=20=20This=20works=20fi=
ne=20and=0D=0A>=20there=20is=20no=20bug=20here,=20however=20guidelines=20ex=
pressed=20in=0D=0A>=20Documentation/devicetree/bindings/writing-bindings.rs=
t=20state=20that:=0D=0A>=201.=20Compatibles=20should=20be=20specific.=0D=0A=
>=202.=20We=20should=20add=20new=20compatibles=20in=20case=20of=20bugs=20or=
=20features.=0D=0A>=20=0D=0A>=20Add=20compatibles=20specific=20to=20each=20=
SoC=20in=20front=20of=20all=20old-SoC-like=20compatibles.=0D=0A>=20This=20w=
ill=20also=20help=20reviews=20of=20new=20code=20using=20existing=20DTS=20as=
=20template.=20=20No=0D=0A>=20functional=20impact=20on=20Linux=20drivers=20=
behavior.=0D=0A>=20=0D=0A>=20Future=0D=0A>=20=3D=3D=3D=3D=3D=3D=0D=0A>=20If=
=20reasonable,=20I=20will=20do=20similar=20work=20for=20Tesla=20FSD=20and=
=20ARMv7/ARM32=20Exynos=0D=0A>=20bindings=20and=20DTS.=0D=0A>=20=0D=0A>=20B=
est=20regards,=0D=0A>=20Krzysztof=0D=0A>=20=0D=0A>=20Krzysztof=20Kozlowski=
=20(17):=0D=0A>=20=20=20dt-bindings:=20hwinfo:=20samsung,exynos-chipid:=20a=
dd=20specific=20compatibles=0D=0A>=20=20=20=20=20for=20existing=20SoC=0D=0A=
>=20=20=20dt-bindings:=20i2c:=20exynos5:=20add=20specific=20compatibles=20f=
or=20existing=20SoC=0D=0A>=20=20=20dt-bindings:=20i2c:=20samsung,s3c2410-i2=
c:=20add=20specific=20compatibles=20for=0D=0A>=20=20=20=20=20existing=20SoC=
=0D=0A>=20=20=20dt-bindings:=20mmc:=20samsung,exynos-dw-mshc:=20add=20speci=
fic=20compatibles=20for=0D=0A>=20=20=20=20=20existing=20SoC=0D=0A>=20=20=20=
dt-bindings:=20pinctrl:=20samsung:=20add=20specific=20compatibles=20for=20e=
xisting=0D=0A>=20=20=20=20=20SoC=0D=0A>=20=20=20dt-bindings:=20rtc:=20s3c-r=
tc:=20add=20specific=20compatibles=20for=20existing=20SoC=0D=0A>=20=20=20dt=
-bindings:=20serial:=20samsung:=20add=20specific=20compatibles=20for=20exis=
ting=0D=0A>=20=20=20=20=20SoC=0D=0A>=20=20=20dt-bindings:=20samsung:=20exyn=
os-pmu:=20add=20specific=20compatibles=20for=0D=0A>=20=20=20=20=20existing=
=20SoC=0D=0A>=20=20=20dt-bindings:=20gpu:=20arm,mali-midgard:=20add=20speci=
fic=20compatibles=20for=0D=0A>=20=20=20=20=20existing=20Exynos=20SoC=0D=0A>=
=20=20=20dt-bindings:=20iio:=20samsung,exynos-adc:=20add=20specific=20compa=
tibles=20for=0D=0A>=20=20=20=20=20existing=20SoC=0D=0A>=20=20=20ASoC:=20dt-=
bindings:=20samsung-i2s:=20add=20specific=20compatibles=20for=20existing=0D=
=0A>=20=20=20=20=20SoC=0D=0A>=20=20=20dt-bindings:=20pwm:=20samsung:=20add=
=20specific=20compatibles=20for=20existing=20SoC=0D=0A>=20=20=20arm64:=20dt=
s:=20exynos5433:=20add=20specific=20compatibles=20to=20several=20blocks=0D=
=0A>=20=20=20arm64:=20dts:=20exynos7:=20add=20specific=20compatibles=20to=
=20several=20blocks=0D=0A>=20=20=20arm64:=20dts:=20exynos7885:=20add=20spec=
ific=20compatibles=20to=20several=20blocks=0D=0A>=20=20=20arm64:=20dts:=20e=
xynos850:=20add=20specific=20compatibles=20to=20several=20blocks=0D=0A>=20=
=20=20arm64:=20dts:=20exynosautov9:=20add=20specific=20compatibles=20to=20s=
everal=20blocks=0D=0A>=20=0D=0A>=20=20.../bindings/gpu/arm,mali-midgard.yam=
l=20=20=20=20=20=20=20=20=7C=20=205=20++=0D=0A>=20=20.../hwinfo/samsung,exy=
nos-chipid.yaml=20=20=20=20=20=20=20=20=20=7C=2017=20+++++-=0D=0A>=20=20...=
/devicetree/bindings/i2c/i2c-exynos5.yaml=20=20=7C=2010=20+++-=0D=0A>=20=20=
.../bindings/i2c/samsung,s3c2410-i2c.yaml=20=20=20=20=20=7C=2022=20++++---=
=0D=0A>=20=20.../bindings/iio/adc/samsung,exynos-adc.yaml=20=20=7C=2029=20+=
++++----=0D=0A>=20=20.../mfd/samsung,exynos5433-lpass.yaml=20=20=20=20=20=
=20=20=20=20=7C=20=202=20+-=0D=0A>=20=20.../bindings/mmc/samsung,exynos-dw-=
mshc.yaml=20=20=7C=2025=20+++++---=0D=0A>=20=20.../samsung,pinctrl-wakeup-i=
nterrupt.yaml=20=20=20=20=20=7C=2024=20+++++---=0D=0A>=20=20.../bindings/pi=
nctrl/samsung,pinctrl.yaml=20=20=20=20=20=7C=20=203=20+-=0D=0A>=20=20.../de=
vicetree/bindings/pwm/pwm-samsung.yaml=20=20=7C=20=202=20+=0D=0A>=20=20.../=
devicetree/bindings/rtc/s3c-rtc.yaml=20=20=20=20=20=20=7C=20=205=20++=0D=0A=
>=20=20.../bindings/serial/samsung_uart.yaml=20=20=20=20=20=20=20=20=20=7C=
=2014=20++++-=0D=0A>=20=20.../bindings/soc/samsung/exynos-pmu.yaml=20=20=20=
=20=20=20=7C=20=206=20++=0D=0A>=20=20.../bindings/soc/samsung/exynos-usi.ya=
ml=20=20=20=20=20=20=7C=20=202=20+-=0D=0A>=20=20.../bindings/sound/samsung-=
i2s.yaml=20=20=20=20=20=20=20=20=20=20=20=7C=2019=20+++---=0D=0A>=20=20arch=
/arm64/boot/dts/exynos/exynos5433.dtsi=20=20=20=20=7C=2060=20++++++++++++--=
-----=0D=0A>=20=20arch/arm64/boot/dts/exynos/exynos7.dtsi=20=20=20=20=20=20=
=20=7C=2018=20+++---=0D=0A>=20=20arch/arm64/boot/dts/exynos/exynos7885.dtsi=
=20=20=20=20=7C=2045=20+++++++++-----=0D=0A>=20=20arch/arm64/boot/dts/exyno=
s/exynos850.dtsi=20=20=20=20=20=7C=2034=20++++++-----=0D=0A>=20=20arch/arm6=
4/boot/dts/exynos/exynosautov9.dtsi=20=20=7C=20=206=20+-=0D=0A>=20=2020=20f=
iles=20changed,=20233=20insertions(+),=20115=20deletions(-)=0D=0A>=20=0D=0A=
>=20--=0D=0A>=202.34.1=0D=0A=0D=0A=0D=0A
