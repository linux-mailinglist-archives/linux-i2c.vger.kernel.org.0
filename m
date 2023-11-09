Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C827E7123
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344915AbjKISGJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344920AbjKISGI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:06:08 -0500
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362A93AA5;
        Thu,  9 Nov 2023 10:06:06 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231109180604epoutp0203d5183f1c25af849c509750f8f2a288~WBpkvgpMu0327303273epoutp02F;
        Thu,  9 Nov 2023 18:06:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231109180604epoutp0203d5183f1c25af849c509750f8f2a288~WBpkvgpMu0327303273epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699553164;
        bh=+s1GQ6cxkAoMLjQHQuQK7i4/jrzq4jIiFYnAJpIQAEg=;
        h=From:To:In-Reply-To:Subject:Date:References:From;
        b=fZJV8SvM9AfYAMlrJAfY9poiOHXvmFKyFZdqqynP0HbcsJUE0WsGeEHJmrPBoEOyv
         uOxFNNfpAPIaMnLjFlEZEzqtGgOwfkouJWYMZ6t/3eX/dS9Q3bYz/lFUO2FueC3+D9
         Pr5T+j3Roa4XMe6ST/Zt60H6RGOgnO3fH8pZCDpw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20231109180603epcas5p3e7b62e16ea0b7ef816115bef9ceda331~WBpkQ5v2s2548325483epcas5p33;
        Thu,  9 Nov 2023 18:06:03 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4SR8yf2CFmz4x9Pp; Thu,  9 Nov
        2023 18:06:02 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        76.D0.09634.A8F1D456; Fri, 10 Nov 2023 03:06:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20231109180601epcas5p35d2a5cf24cd906dede19c27213ad49df~WBpiOm5-92217322173epcas5p3w;
        Thu,  9 Nov 2023 18:06:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231109180601epsmtrp1783e1075e75b37e27b73c9f8317adad1~WBpiKb3q02657326573epsmtrp1R;
        Thu,  9 Nov 2023 18:06:01 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-47-654d1f8aa957
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
        8F.16.18939.98F1D456; Fri, 10 Nov 2023 03:06:01 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231109180556epsmtip22b32d0e0ae0460b24729fae93c0cf165~WBpdFE6PW2620526205epsmtip2P;
        Thu,  9 Nov 2023 18:05:56 +0000 (GMT)
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
In-Reply-To: <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific
 compatibles for existing SoC
Date:   Thu, 9 Nov 2023 23:35:54 +0530
Message-ID: <02bb01da1337$65caf5e0$3160e1a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWJB6kbFUwx2+cGuz2YrV1SxstmQJIJYa1AlRjzhGw1UCPMA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUZRSf7+59LBR0A8IvKqRNxyB5rAF920CIMnZDZXAifNC0rHBdGGDZ
        2QU0bUaDXBDkFaK08lAhkBXCeA2gZK085DEo8YqEeBYQCAkKrsDQLtfM/37nd37n+51zvjl8
        ntk8ZcUPlUWxCpkkXEAa49W3bbfYJ27cyzpdbCdRQWcPhe70XcFQ/Gwhhbo7tRgaepwAUObI
        OIlK6jswtFadzkN5DR0E6n48R6K4/DIS/fZURaDhWA2GZnPeRCmTIzxUP11FoYKMPALVqC7j
        aLE7AUPnVoowVD7WS6CKvBWAElYfAZTbMIujrrpsEjWspQI0OKgBqOlaN4my7v6Eofb8ZArl
        /HWOhy4/rMKR6kwhgU7XN1Do9kw8gSZS9BJdXS6ONHX69ypn0gl0Pz0DoObS/dttmesLsSST
        W3KCqV+8hDO16kGKKdecIZmB3pt6vmUfcyunhGKGkpoxpqLgJFMwoyWY1FUnJqVSA5iKthPM
        hVwdxiyUW/vSh8LcQlhJMKuwYWVBkcGhMqm7YPen4p1iF1cnob1QhD4Q2MgkEay7wGuPr/2u
        0HD9ggU2MZLwaD3lK1EqBY4fuSkio6NYm5BIZZS7gJUHh8ud5Q5KSYQyWiZ1kLFRHwqdnLa5
        6IWBYSE/XsXl7cJjJcN14BTocUwERnxIO8PspV95BmxG3wAwfvVgIjDW43kA+79vJJ4Ha2PZ
        ehV/vSKxVczxtQA+Sh3BuWASwLa8JsLwFEnbw5p8FWlIWNA3TGDXrVHckDCiveC9+AuYAZvT
        EvhgMXOdx+lN8On12HXehBbB2sVvAIdfhS3fja9rePR7sPDyNI/r2wbq/iwkDB1Z0Dtg59dy
        TrIBTjU2UAZfSNcbwybN1Wd6L5g6EYdz2Bz+3VxJcdgKTqWqKG4yBl5ZseLoEPigqAxw2AP+
        3J2NGyQ82haW1TlyVqYweXkc4ypNYILKjFNvhnGzPc+M3oDpSUkEhxmo7j1PcavqBHBgQUOk
        ARv1C0OqXxhS/cI06v+dLwFcA15n5coIKat0kQtl7NHnvx0UGVEO1o/P7pMaMDj8j4MWYHyg
        BZDPE1iY3HPew5qZBEu+PM4qIsWK6HBWqQUu+s2n86xeC4rUX68sSix0Fjk5u7q6OovedxUK
        NphMn84JNqOlkig2jGXlrOK/OoxvZHUKK7dLCqtZ9txYkexV6dns/0oiyusv3Oph6p9Gfrsj
        AHylzJpW89/W7VNNWor8wo5o/QuWRyytbx/yptzzmzZjbwVu6yhlPvPuO5zsQHi8e2zLWOp2
        44NVk3eWPKMHU45X96uWNvsHaItNi3U7ha0WRTHmoR6i0iwscyumC6fF2JPdUr8vGjzNE3xq
        BlZ0qPDzAd6B0rujAZbv3G9esmybOB84d81vqqk1xLo79KFiO1q07/Gu/qNm7rB0mbLOOCqW
        xv8wvNHYZ28feTjIT7Kp9eLH9mcaW6pvunf5FTcKe+fP9jxxG2UtQn8PSkt46cguxYGY5iG7
        PJHPyV/297wc3JHrK8CVIRKhHU+hlPwL3AsNxgUFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVwCGd+43TbrdVRx3VAoWYgARZHPZcS5qJj/uD5lTpia6BSrcFLYC
        zW1hU2MGVcvHHB9DhpZRZDTFlapQKF+hG5ZqVRwDrTAURJyABoLbgGYorKM0W/j35H2f8+ac
        5FCo6DYeSKVlqDk+Q6aQEgKspVsavKkgOJ7bbLgqgYb+eyS8MfgDAvNmjCR09dsRODqfD2D5
        2BMCmm29CPS0lKKw2tGLQ9f8cwKerL1CwN9eaHH4SGNC4EzVOlj0dAyFtikrCQ1l1Ths09Zg
        0O3KR+DZxToEWn4fwGFT9SKA+UtzAOodMxi82/E9AR2eYgBHRkwAXq93EfDcrz8h8HbtNySs
        mjiLwpo/rRjUFhhxeNrmIGH3dB4OJ4uWlYUOPQZNHct7zdOlOHxQWgag89LBnRFsw6yGYPXm
        46zNfQFj23UjJGsxFRDs8EDncn5zL/tzlZlkR792ImyT4SvWMG3H2eKlzWxRswmwTT3H2Qr9
        AsLOWiQf0YcE76dwirRsjo/ZniRIdTnNpPJM2JePut0gB4wGFQKKYugtTOGtxEIgoER0K2C+
        7bCDQuC3nIuZwcYS0sdrmB//mSR90gRgRlobcW9B0JuYtlot4WV/ekjI9Azv8Um/AMbqOIV6
        Cz86junLq0C8vIZOZKw2D+ZljA5jXjRoVnIhvZVpd58CPn6duXn+yYqD0huZ8aHx/9lYM4X6
        bhTCLIwbce8L/OkPmP5cpU8JYJ5dc5AlQKRbtaRbtaRbtaRbdeQCwExgLadUpcvTk5Wx0SpZ
        uiorQx6dnJluASsfLnJfGzBeWYq2A4QCdsBQqNRf2LdlNycSpsiOHuP4zEQ+S8Gp7EBMYdIA
        YaiiIEVEy2Vq7nOOU3L8fy1C+QXmIAcElYt/bAiJUKvj+LmiXj7s5Xv40fMhor/eUu+4u35o
        f9/a/R++M9DUbHotTS5+80bOrbmu+ofXxCec8Gpv+7bWoIqYNn1NzB6jIbSk585T/4/nB69H
        fvd8QnLATSTNPJ4wiDURe8vkLYFpc+aL998+UnIp1PxGud/LhNKEIa2e8hw5/HdU9cWN8Zcr
        1y/yFsnWispRYb0rPnXXofHs4vCp3V3OT3Z8au16BW0tD351XWdAruLhu8nYg8oWIrdxw0Ld
        44xnJwcC9JrMscSwfbHbEsLR7jue05LAnSd25ZwLj2qIrovabuatks77kwfPJGU5Lld9kW3O
        x2c/Cxo+fC8u65jNI8VUqbLYSJRXyf4FqdWDf98DAAA=
X-CMS-MailID: 20231109180601epcas5p35d2a5cf24cd906dede19c27213ad49df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231108104407epcas5p4c52f140b035727b6110ff7d3c0f81bc0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
        <CGME20231108104407epcas5p4c52f140b035727b6110ff7d3c0f81bc0@epcas5p4.samsung.com>
        <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
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
wski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=2002=
/17=5D=20dt-bindings:=20i2c:=20exynos5:=20add=20specific=20compatibles=20fo=
r=0D=0A>=20existing=20SoC=0D=0A>=20=0D=0A>=20Samsung=20Exynos=20SoC=20reuse=
s=20several=20devices=20from=20older=20designs,=20thus=0D=0A>=20historicall=
y=20we=20kept=20the=20old=20(block's)=20compatible=20only.=20=20This=20work=
s=20fine=20and=0D=0A>=20there=20is=20no=20bug=20here,=20however=20guideline=
s=20expressed=20in=0D=0A>=20Documentation/devicetree/bindings/writing-bindi=
ngs.rst=20state=20that:=0D=0A>=201.=20Compatibles=20should=20be=20specific.=
=0D=0A>=202.=20We=20should=20add=20new=20compatibles=20in=20case=20of=20bug=
s=20or=20features.=0D=0A>=20=0D=0A>=20Add=20compatibles=20specific=20to=20e=
ach=20SoC=20in=20front=20of=20all=20old-SoC-like=20compatibles.=0D=0A>=20=
=0D=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40l=
inaro.org>=0D=0A>=20=0D=0A>=20---=0D=0A>=20=0D=0A>=20I=20propose=20to=20tak=
e=20the=20patch=20through=20Samsung=20SoC=20(me).=20See=20cover=20letter=20=
for=0D=0A>=20explanation.=0D=0A>=20---=0D=0A>=20=20Documentation/devicetree=
/bindings/i2c/i2c-exynos5.yaml=20=7C=2010=20+++++++++-=0D=0A>=20=20.../devi=
cetree/bindings/soc/samsung/exynos-usi.yaml=20=20=20=20=7C=20=202=20+-=0D=
=0A>=20=202=20files=20changed,=2010=20insertions(+),=202=20deletions(-)=0D=
=0A>=20=0D=0A>=20diff=20--git=20a/Documentation/devicetree/bindings/i2c/i2c=
-exynos5.yaml=0D=0A>=20b/Documentation/devicetree/bindings/i2c/i2c-exynos5.=
yaml=0D=0A>=20index=203e52a0db6c41..c1f5d2cb7709=20100644=0D=0A>=20---=20a/=
Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml=0D=0A>=20+++=20b/Doc=
umentation/devicetree/bindings/i2c/i2c-exynos5.yaml=0D=0A>=20=40=40=20-25,7=
=20+25,15=20=40=40=20properties:=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=
-=20samsung,exynos5250-hsi2c=20=20=20=20=23=20Exynos5250=20and=20Exynos5420=
=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20-=20samsung,exynos5260-hsi2c=20=
=20=20=20=23=20Exynos5260=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20-=20sam=
sung,exynos7-hsi2c=20=20=20=20=20=20=20=23=20Exynos7=0D=0A>=20-=20=20=20=20=
=20=20=20=20=20=20-=20samsung,exynosautov9-hsi2c=20=20=23=20ExynosAutoV9=20=
and=20Exynos850=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20samsung,exynosa=
utov9-hsi2c=0D=0A>=20+=20=20=20=20=20=20-=20items:=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20-=20enum:=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20-=20samsung,exynos5433-hsi2c=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20=
-=20const:=20samsung,exynos7-hsi2c=0D=0A>=20+=20=20=20=20=20=20-=20items:=
=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20enum:=0D=0A>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20-=20samsung,exynos850-hsi2c=0D=0ADoes=20this=
=20need=20an=20entry=20in=20allOf:?=20to=20indicate=20exynos850=20also=20ha=
s=202=20clocks?=0D=0A=0D=0A>=20+=20=20=20=20=20=20=20=20=20=20-=20const:=20=
samsung,exynosautov9-hsi2c=0D=0A>=20=20=20=20=20=20=20=20-=20const:=20samsu=
ng,exynos5-hsi2c=20=20=20=20=23=20Exynos5250=20and=20Exynos5420=0D=0A>=20=
=20=20=20=20=20=20=20=20=20deprecated:=20true=0D=0A>=20=0D=0A>=20diff=20--g=
it=20a/Documentation/devicetree/bindings/soc/samsung/exynos-=0D=0A>=20usi.y=
aml=20b/Documentation/devicetree/bindings/soc/samsung/exynos-=0D=0A>=20usi.=
yaml=0D=0A>=20index=20a6836904a4f8..5b7ab69546c4=20100644=0D=0A>=20---=20a/=
Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml=0D=0A>=20+++=
=20b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml=0D=0A>=
=20=40=40=20-155,7=20+155,7=20=40=40=20examples:=0D=0A>=20=20=20=20=20=20=
=20=20=20=20=7D;=0D=0A>=20=0D=0A>=20=20=20=20=20=20=20=20=20=20hsi2c_0:=20i=
2c=4013820000=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20compatibl=
e=20=3D=20=22samsung,exynosautov9-hsi2c=22;=0D=0A>=20+=20=20=20=20=20=20=20=
=20=20=20=20=20compatible=20=3D=20=22samsung,exynos850-hsi2c=22,=0D=0A>=20+=
=20=22samsung,exynosautov9-hsi2c=22;=0D=0A>=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20reg=20=3D=20<0x13820000=200xc0>;=0D=0A>=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20interrupts=20=3D=20<GIC_SPI=20227=20IRQ_TYPE_LEVEL_HIGH>;=
=0D=0A>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=23address-cells=20=3D=20<=
1>;=0D=0A>=20--=0D=0A>=202.34.1=0D=0A=0D=0A=0D=0A
