Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24710458826
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 03:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbhKVCy3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 21:54:29 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:44261 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbhKVCy2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 21:54:28 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211122025121epoutp013e2651bb9421bf8878109cef5de782f6~5vpO4_Lp11101911019epoutp01e
        for <linux-i2c@vger.kernel.org>; Mon, 22 Nov 2021 02:51:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211122025121epoutp013e2651bb9421bf8878109cef5de782f6~5vpO4_Lp11101911019epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637549481;
        bh=Qk26UmtwJaak322v80psbk6gl8ElEzZDNQAeRFXlmwo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=B9IYPGhG7xoj1wKvmrpDMUAllwK0XWJZ4qZ0XQGwXCf8zZ8A4w71EWfPDsZvI5umC
         4rPyoEcxj4g6PWBg6l9AwxVsn5Yw+GMwJU8+5DojLBZQ1iIC7GMNkfOG2EziovHWgQ
         VK5m3SDkMw6yrYxNPe9w9hmCBrPMgwpaboEQU3c0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211122025120epcas2p361f5b94417e109d575490fcc0ba373ba~5vpOZQz191887218872epcas2p3H;
        Mon, 22 Nov 2021 02:51:20 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HyBby0d7zz4x9Pv; Mon, 22 Nov
        2021 02:51:10 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7B.F5.10014.C950B916; Mon, 22 Nov 2021 11:51:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211122025107epcas2p1139c14bb6cc666c3fb2f1bd24c494814~5vpCWaVt-0458004580epcas2p14;
        Mon, 22 Nov 2021 02:51:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211122025107epsmtrp2685bd511dcd76ab21e216d33e3d16dad~5vpCVmuDo1119511195epsmtrp2q;
        Mon, 22 Nov 2021 02:51:07 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-f3-619b059c7671
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        12.61.29871.B950B916; Mon, 22 Nov 2021 11:51:07 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211122025107epsmtip2844b559bac96562441b70603a579ae91~5vpCFIz632084220842epsmtip2e;
        Mon, 22 Nov 2021 02:51:07 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc:     "'Chanho Park'" <chanho61.park@samsung.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4n+JKOQjbLriu6frB+c4nt6efTrURcbw9ZWZB-+a6Ruiw@mail.gmail.com>
Subject: RE: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Mon, 22 Nov 2021 11:51:07 +0900
Message-ID: <000001d7df4b$cc619f10$6524dd30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMJYAnbi/JobnCUuSzxD63N6CCU9gMctf4RAdOLUHUBZYQpIwL+l6SpAj8YdX4CKKYuEQJVPjOPAjwfsG2pGWmGkA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmhe4c1tmJBheP8llc3q9tMf/IOVaL
        jW9/MFlsenyN1aLj7xdGi8u75rBZzDi/j8mide8RdovnfUDW3f1zGR24PGY19LJ5bFrVyeZx
        59oeNo/NS+o9+rasYvT4vEkugC0q2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJc
        SSEvMTfVVsnFJ0DXLTMH6DAlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5x
        Ym5xaV66Xl5qiZWhgYGRKVBhQnbGrh9dLAV/1SperqprYLwp18XIySEhYCKxo/EMYxcjF4eQ
        wA5Gif4N+1ghnE+MEoeOHGOGcL4xSnyZPIcZpuX77JVsEIm9jBIfj7yDannOKPHi51c2kCo2
        AV2JnRtfsYPYIgJGEhOWbwRbwizwnEli/rpdYEWcAoES6yZeAOrm4BAW8JLYM78KJMwioCox
        +d4jJhCbV8BSYtPrs+wQtqDEyZlPWEBsZgF5ie1vYS5SkPj5dBnYGBGBLImOxnKIEhGJ2Z1t
        UCVrOST2NHtD2C4S3S8Ws0DYwhKvjm9hh7ClJD6/28sGMkZCoF7i6w0HkIslBHoYJdZ0/WKC
        qLGX+DV9C9gqZgFNifW79CHKlSWO3II6jE+i4/Bfdogwr0RHmxBEo5rE/ann2CBsGYlJR1Yy
        TWBUmoXkrVlI3pqF5P5ZCLsWMLKsYhRLLSjOTU8tNiowhsd0cn7uJkZwgtVy38E44+0HvUOM
        TByMhxglOJiVRHg5NkxPFOJNSaysSi3Kjy8qzUktPsRoCgzoicxSosn5wBSfVxJvaGJpYGJm
        ZmhuZGpgriTO+8EfqEkgPbEkNTs1tSC1CKaPiYNTqoFJNjD+WIpn3YRDa05uPb55/eW4/KRb
        q+Z6PJn+htmBvfU0j0m06Py8fTFT9moo6nhUWcV2RHl5a2q9auzZ9WzuW6a2xptFe/5HRjPa
        vCg9eXDjepftR2sW5c6yl5kQbrjko7Thum08rTZ6dxi7hPgu6M+c+mZKhXeDVN5yoc9s894+
        +h68o9SKxSv+yuFZf2t0k14G3sxeI6R+uKftfdu/LZLq+xuKL+0KcVs7P6klMcX6xMHA4D0a
        3e0y/Z/bcms1lJKLW0QDlq7fGKie3iA6uVJ3MtuM9Amuexa8jJ2p8lP27d6HRRUbfn+Wffk5
        auvDr4n5Ql/Kpr+bYXQl66VJ+NGIDSvjW9Ywt256p6quxFKckWioxVxUnAgAbFRhhzkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSvO5s1tmJBm92q1lc3q9tMf/IOVaL
        jW9/MFlsenyN1aLj7xdGi8u75rBZzDi/j8mide8RdovnfUDW3f1zGR24PGY19LJ5bFrVyeZx
        59oeNo/NS+o9+rasYvT4vEkugC2KyyYlNSezLLVI3y6BK2PXjy6Wgr9qFS9X1TUw3pTrYuTk
        kBAwkfg+eyVbFyMXh5DAbkaJn/s+sUMkZCSWP+tjg7CFJe63HGGFKHrKKDF36yKwBJuArsTO
        ja/AGkQEjCQmLN/ICFLELPCWSWL95i8sEB2rWCSOH5jJAlLFKRAosW7iBaBRHBzCAl4Se+ZX
        gYRZBFQlJt97xARi8wpYSmx6fZYdwhaUODnzCVgrs4C2xNObT6FseYntb+cwQ1ynIPHz6TKw
        kSICWRIdjeUQJSISszvbmCcwCs9CMmkWkkmzkEyahaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3i
        xNzi0rx0veT83E2M4IjT0tzBuH3VB71DjEwcjIcYJTiYlUR4OTZMTxTiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBaU+fuIKfw2TON3G7vTOCFNvurrZv
        2RP78OjvVcYbfr5Yvnidz1JBn+PO07fbfuX9+d/Ac8Wf6A+np0j6mP7pn3OjfdbkJs7YRNPZ
        VxU6/qVtiYsOTd5w62Rj5ZlmnvyrGsxzzJZOL60QXdyS+VzaK815w5Egx+2ThTfef/jZQ7OV
        c29ZxxrHjVV7i6R8FJ6slwvgNRZRLt57Ko1XYqb8pMs777c7LYkX+P0/4WnBgatndvb5RJRm
        cmRf3MgzM+x/ckHazntHDrYJtie5OUy4ZxX3tEZml02zYI7pF7Un83tqfFc691/n2iqnE6TA
        e3XuNatzL8QZlJbzvp6pzH257qyOveJ0jQK7o0I/unc9U2Ipzkg01GIuKk4EAFGqkbInAwAA
X-CMS-MailID: 20211122025107epcas2p1139c14bb6cc666c3fb2f1bd24c494814
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
        <001401d7da86$f7ebd660$e7c38320$@samsung.com>
        <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
        <CAPLW+4kS-pzROC5oyAjW1aJp5cb1e3XK+40HsKwgPdCziSp1ZQ@mail.gmail.com>
        <773110c9-fc74-6cab-68c0-1c771a3be104@canonical.com>
        <CAPLW+4n+JKOQjbLriu6frB+c4nt6efTrURcbw9ZWZB-+a6Ruiw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Protsenko,

> On Fri, 19 Nov 2021 at 10:54, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >
> > On 18/11/2021 20:59, Sam Protsenko wrote:
> > > On Tue, 16 Nov 2021 at 11:32, Krzysztof Kozlowski
> > > <krzysztof.kozlowski@canonical.com> wrote:
> > >>
> > >> On 16/11/2021 02:12, Chanho Park wrote:
> > >>>> With this patch the Exynos850 HSI2C becomes functional. The only
> > >>>> nit-pick from my side (just a food for thought): do we want to
> > >>>> configure USI related config inside of particular drivers (SPI,
> > >>>> I2C, UART)? Or it would be better design to implement some
> > >>>> platform driver for that, so we can choose USI configuration
> > >>>> (SPI/I2C/UART) in device tree? I think this series is good to be
> > >>>> merged as is, but we should probably consider all upsides and downsides of each option, for the
> future work.
> > >>>
> > >>> I'm also considering how to support this USI configuration gracefully.
> > >>> Current version of USI is v2 which means there is a v1 version as well. It might be a non-
> upstream SoC so we don't need to consider it so far.
> > >>> But, there is a possibility that the USI hw version can be bumped for future SoCs.
> > >>>
> > >>> As you probably know, earlier version of the product kernel has a USI SoC driver[1] and it was
> designed to be configured the USI settings by device tree.
> > >>>
> > >>> Option1) Make a USI driver under soc/samsung/ like [1].
> > >>> Option2) Use more generic driver such as "reset driver"? This might be required to extend the
> reset core driver.
> > >>> Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respectively and expose
> some configurations which can be variable as device tree.
> > >>>
> > >>> [1]:
> > >>> https://protect2.fireeye.com/v1/url?k=b290a67b-ed0b9f6a-b2912d34-0
> > >>> cc47a31cdbc-ceadd8e62313162a&q=1&e=317825c0-3fac-46ad-9b4e-f93de42
> > >>> ad5ba&u=https%3A%2F%2Fgithub.com%2Fianmacd%2Fd2s%2Fblob%2Fmaster%2
> > >>> Fdrivers%2Fsoc%2Fsamsung%2Fusi_v2.c
> > >>
> > >> I don't have user manuals, so all my knowledge here is based on
> > >> Exynos9825 vendor source code, therefore it is quite limited. In
> > >> devicetree the USI devices have their own nodes - but does it mean
> > >> it's separate SFR range dedicated to USI? Looks like that,
> > >> especially that address space is just for one register (4 bytes).
> > >>
> > >> In such case having separate dedicated driver makes sense and you
> > >> would only have to care about driver ordering (e.g. via device links or phandles).
> > >>
> > >> Option 2 looks interesting - reusing reset framework to set proper
> > >> USI mode, however this looks more like a hack. As you said Chanho,
> > >> if there is a USI version 3, this reset framework might not be sufficient.
> > >>
> > >> In option 3 each driver (UART/I2C/SPI) would need to receive second
> > >> IO range and toggle some registers, which could be done via shared
> > >> function. If USI v3 is coming, all such drivers could get more complicated.
> > >>
> > >> I think option 1 is the cleanest and extendable in future. It's
> > >> easy to add usi-v3 or whatever without modifying the UART/I2C/SPI
> > >> drivers. It also nicely encapsulates USI-related stuff in separate
> > >> driver. Probe ordering should not be a problem now.
> > >>
> > >> But as I said, I don't have even the big picture here, so I rely on
> > >> your opinions more.
> > >>
> > >
> > > Hi Krzysztof,
> > >
> > > Can you please let me know if you're going to apply this series as
> > > is, or if you want me to submit USIv2 driver first, and then rework
> > > this patch on top of it? I'm working on some HSI2C related patches
> > > right now, and thus it'd nice to know about your decision on this
> > > series beforehand, as some of my patches (like bindings doc patches)
> > > might depend on it. Basically I'd like to base my patches on the
> > > proper baseline, so we don't have to rebase those later.
> >
> > This set won't go via my tree anyway, but I am against it. David
> > pointed out that his USIv1 is a little bit different and embedding in
> > each of I2C/UART/SPI drivers the logic of controlling USIv1 and USIv2
> > looks too big. The solution with a dedicated driver looks to me more
> > flexible and encapsulated/cleaner.
> >
> > Therefore after the discussions I am against this solution, so a
> > soft-NAK from my side.
> >
> 
> Hi Jaewon,
> 
> I'm going to submit USI driver soon, and also some more HSI2C patches.
> Do you mind if I rework your patches to rely on USI drver (instead of modifying System Register in
> HSI2C driver), and include those in my patch series? Of course, I'll preserve your authorship. Just
> think that would be easier and faster this way.
> 
> Thanks!
> 

I'm glad you're working on a USI driver.
You can use my patchset.

> >
> > Best regards,
> > Krzysztof

Thanks
Jaewon Kim

