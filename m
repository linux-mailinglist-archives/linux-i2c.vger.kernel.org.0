Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7319745231C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 02:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243467AbhKPBTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 20:19:50 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:63971 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244092AbhKPBPY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 20:15:24 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211116011226epoutp014170855f55dbd05cdca30e51f05d86e3~34bJtuoj52617326173epoutp01P
        for <linux-i2c@vger.kernel.org>; Tue, 16 Nov 2021 01:12:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211116011226epoutp014170855f55dbd05cdca30e51f05d86e3~34bJtuoj52617326173epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637025146;
        bh=8JRydum/R4RdFUqGlzeiN6SYCDCW1ggDFZyoszTdHJo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=q4G2O32iCBNEutMrZF/eHatdlcCVD807rXvbHwhqtJcZGhG5LibMC2I9848LrD9p4
         bEHY6l+x5bnN7VRghqKOk9cNf1g7mSVninVoC76VZjEGe3EebK5+hYCpM4TxffBs//
         Xn/LhD7j4fE7TrbNTFrMDTVmr8WEQWJlfOqkZsXE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211116011225epcas2p1b5d0e237b941eef4d90e74efaa93fa0a~34bJOmHgW0919509195epcas2p1w;
        Tue, 16 Nov 2021 01:12:25 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HtShV1SHzz4x9QR; Tue, 16 Nov
        2021 01:12:10 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        2B.F7.12141.56503916; Tue, 16 Nov 2021 10:12:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211116011205epcas2p1bb00ede94948a305aba820f418058dbe~34a2TmxYv2468624686epcas2p1R;
        Tue, 16 Nov 2021 01:12:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211116011205epsmtrp25329047fd36504abbf296e6a755c6851~34a2SzF-70535505355epsmtrp2h;
        Tue, 16 Nov 2021 01:12:05 +0000 (GMT)
X-AuditID: b6c32a48-d5dff70000002f6d-fd-6193056510a0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DD.81.29871.56503916; Tue, 16 Nov 2021 10:12:05 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211116011205epsmtip28a67f81e78b0ae0d47bbf1c5d442f74d~34a2InGwx0690906909epsmtip2j;
        Tue, 16 Nov 2021 01:12:05 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Jaewon Kim'" <jaewon02.kim@samsung.com>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
Subject: RE: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Tue, 16 Nov 2021 10:12:04 +0900
Message-ID: <001401d7da86$f7ebd660$e7c38320$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMJYAnbi/JobnCUuSzxD63N6CCU9gMctf4RAdOLUHUBZYQpI6lvl8Tg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmmW4q6+REgw/fVSzmHznHarGj4Qir
        xca3P5gsNj2+xmrR8fcLo8XlXXPYLGac38dk0br3CLvF8z4g6+7+uYwOXB6zGnrZPDat6mTz
        uHNtD5vH5iX1Hn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlh
        rqSQl5ibaqvk4hOg65aZA3SZkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECv
        ODG3uDQvXS8vtcTK0MDAyBSoMCE748zFq0wFS7grGq42sTYwTuTsYuTkkBAwkTi09jhLFyMX
        h5DADkaJe/OXsUI4nxglPsybxQjhfGOUuLFuGjNMy58rW9kgEnsZJT7Oa4Lqf8Eo8evPChaQ
        KjYBfYmXHdtYQWwRgXiJNad3g3UzC+xgkjjbbQ1icwoESixethSonoNDWMBLYs/8KpAwi4Cq
        xIzdDUwgNq+ApcTK/9vYIGxBiZMzn7BAjNGWWLbwNdRBChI/ny6DWuUmse1dHyNEjYjE7M42
        ZpDbJARWckh8vziRCWSXhICLxIl58RC9whKvjm9hh7ClJD6/28sGUd/NKNH66D9UYjWjRGej
        D4RtL/Fr+hZWkDnMApoS63fpQ4xUljhyC+o0PomOw3/ZIcK8Eh1tQhCN6hIHtk9ngbBlJbrn
        fGadwKg0C8ljs5A8NgvJA7MQdi1gZFnFKJZaUJybnlpsVGACj+vk/NxNjOA0q+Wxg3H22w96
        hxiZOBgPMUpwMCuJ8LJET0oU4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnARJ9XEm9oYmlg
        YmZmaG5kamCuJM6bx96XKCSQnliSmp2aWpBaBNPHxMEp1cAUWiCxLDWf41r+8SxZ8b6Opu+J
        unk/Flxdc1Dv+TbRxsDY5Becz1Q1Mxo+W1pf9Z1jwCjEbrzISf2Sr/HGDwIXVmX0nvI+GP5n
        ipC0yKGEFaGee64lpX+cx7A96I2tX6XJv6Rr1j9/rslc0flU/edt+8gX75bWrSvJFmFxfxER
        qD3V6fqTffd2JXDyCcr2i7dG/pPzOSBgJO5+ZKG+ecWdKMv7W7+sYl66b2kd12S+p5bbj7xa
        +lV5gcOXezPuNBu0rq3f9KbmEkvVHEuGJFUT8dfmH3Xm7g98eea75HuljNhtGyN4T8n/rulw
        TotXPfYufG/L1+J1zLW11lPeV3dz18R0p2or8Ho+L5y/lFuJpTgj0VCLuag4EQDW00OZPAQA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvG4q6+REg9tP2CzmHznHarGj4Qir
        xca3P5gsNj2+xmrR8fcLo8XlXXPYLGac38dk0br3CLvF8z4g6+7+uYwOXB6zGnrZPDat6mTz
        uHNtD5vH5iX1Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXx+cI65oJZ3BXvVr5kbWBs5uxi
        5OSQEDCR+HNlK1sXIxeHkMBuRolzHceZIRKyEs/e7WCHsIUl7rccYYUoesYocX/LEbAiNgF9
        iZcd21hBbBGBeIndq96AFTEL7GOSaL58Aaqjg0mi58FCFpAqToFAicXLlgLZHBzCAl4Se+ZX
        gYRZBFQlZuxuYAKxeQUsJVb+38YGYQtKnJz5BKyVWUBbovdhKyOMvWzha6hLFSR+Pl0GdYSb
        xLZ3fVA1IhKzO9uYJzAKz0IyahaSUbOQjJqFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLS
        vHS95PzcTYzguNPS3MG4fdUHvUOMTByMhxglOJiVRHhZoiclCvGmJFZWpRblxxeV5qQWH2KU
        5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cBkcHEho36e1fuuWiN9Lz8Ps9tdwnxy1VER
        uzb1sb/Ur6/n00q8tK266cpnEX9BPbtrFnZLr53ROcifn2gf/DbSMHlfodofZ4uXoh8OP76j
        NXW9TxuDUrvlyR4OE3eevQIJqo0xa7lXnV16ulXJQyvFfJaVa/DGt/mnF1ok37La61/ct++M
        hP5Ut442Te085prQfUuuPTJp5278JX2B0UQs9q5Za2ujmM33/EWfLl+IF1q1ICf3atf6pts3
        z266fvVMbhx76tmlKxiPbbrouli+4MC9Y2EHzD485rvR4fvi+qlJ7n9+7fx6m0lpeZr/4c/O
        T+4e5w8WK227ueTS8qXb2HNEv2lvPHQ/5+n+o6VKLMUZiYZazEXFiQAFKtQWKgMAAA==
X-CMS-MailID: 20211116011205epcas2p1bb00ede94948a305aba820f418058dbe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
        <20211112010137.149174-1-jaewon02.kim@samsung.com>
        <20211112010137.149174-3-jaewon02.kim@samsung.com>
        <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> With this patch the Exynos850 HSI2C becomes functional. The only nit-pick
> from my side (just a food for thought): do we want to configure USI
> related config inside of particular drivers (SPI, I2C, UART)? Or it would
> be better design to implement some platform driver for that, so we can
> choose USI configuration (SPI/I2C/UART) in device tree? I think this
> series is good to be merged as is, but we should probably consider all
> upsides and downsides of each option, for the future work.

I'm also considering how to support this USI configuration gracefully.
Current version of USI is v2 which means there is a v1 version as well. It =
might be a non-upstream SoC so we don't need to consider it so far.
But, there is a possibility that the USI hw version can be bumped for futur=
e SoCs.

As you probably know, earlier version of the product kernel has a USI SoC d=
river=5B1=5D and it was designed to be configured the USI settings by devic=
e tree.

Option1) Make a USI driver under soc/samsung/ like =5B1=5D.
Option2) Use more generic driver such as =22reset driver=22? This might be =
required to extend the reset core driver.
Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respe=
ctively and expose some configurations which can be variable as device tree=
.

=5B1=5D: https://github.com/ianmacd/d2s/blob/master/drivers/soc/samsung/usi=
_v2.c

Best Regards,
Chanho Park

