Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A177A466171
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 11:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356977AbhLBKdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 05:33:40 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:27796 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356968AbhLBKdj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 05:33:39 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211202103015epoutp01f863a8f6134d83227be488148a741f37~86WxReFWy3266732667epoutp017
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 10:30:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211202103015epoutp01f863a8f6134d83227be488148a741f37~86WxReFWy3266732667epoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1638441015;
        bh=8eXxum7S0l0cge2okJ0tZV6fIkWy7PAqtaXy4/mv+yk=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=B8EO/PbFPU9UrgZNlAD71OqXftUHzpryyNpm6Ne105849mRqq1O1qyEg2XjVH/n4X
         ULYyOzUrwY1quEEmtlYzVBMg4x6depnzY+3Z/pjN+WfNAEpVvi5CJqrWX+nIQTm+qg
         UkgrUAfy9hKxOAJgWY33ViN5wD/6eObygch7szzY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211202103015epcas2p1fcaa00c2220f62ca37dc8abe129cb0a7~86Wwsj8uk0368403684epcas2p19;
        Thu,  2 Dec 2021 10:30:15 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4J4XK16WFxz4x9Pq; Thu,  2 Dec
        2021 10:30:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        9E.E0.12141.530A8A16; Thu,  2 Dec 2021 19:30:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211202103012epcas2p25c34dfb8cc9890403e8d131f40aee909~86WuchWFj2597025970epcas2p2w;
        Thu,  2 Dec 2021 10:30:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211202103012epsmtrp188b64721acdff3a180bba7eceadad119~86WuanaTF1095010950epsmtrp1f;
        Thu,  2 Dec 2021 10:30:12 +0000 (GMT)
X-AuditID: b6c32a48-d73ff70000002f6d-89-61a8a0351ed8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        38.3D.29871.330A8A16; Thu,  2 Dec 2021 19:30:11 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211202103012epsmtip1968abd75f39b11d978c2dc2d0588f649~86WuLiK1S1878818788epsmtip1h;
        Thu,  2 Dec 2021 10:30:12 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Jaewon Kim'" <jaewon02.kim@samsung.com>,
        "'David Virag'" <virag.david003@gmail.com>,
        "'Youngmin Nam'" <youngmin.nam@samsung.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Arnd Bergmann'" <arnd@arndb.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20211201190455.31646-6-semen.protsenko@linaro.org>
Subject: RE: [PATCH 5/6] i2c: exynos5: Add bus clock support
Date:   Thu, 2 Dec 2021 19:30:11 +0900
Message-ID: <002f01d7e767$96417940$c2c46bc0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+Fna5aS4J9DFonoTtOdjbcAGMmgHjBJAzAvyntMCqq6ShkA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmqa7pghWJBu/Wslj8nXSM3WL+kXOs
        FjsajrBabHz7g8li0+NrrBYdf78wWlzeNYfNYsb5fUwWrXuPsFs87wOyjr9/zGhxd/9cRovF
        Bz6xO/B6/P41idFjVkMvm8fOWXfZPTat6mTzuHNtD5vH5iX1Hn1bVjF6fN4kF8ARlW2TkZqY
        klqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SykkJZYk4pUCgg
        sbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE748LmXWwF
        +1grZiz/zdjAuJGli5GTQ0LAROLv2uVMXYxcHEICOxgllu26wQySEBL4xCixbUEoROIbo0Tb
        xa3sMB1zDvewQiT2Mkq86HnPBuG8YJTY+WUPG0gVm4C+xMuObWBVIgLTGSWOd65jB3GYBf4x
        SbQ2/gCbxSngILG+9yTYQmEBG4nu03MZQWwWARWJY+tWg13IK2Apcb7lFyOELShxcuYTsDiz
        gLzE9rdzmCFuUpD4+XQZK4gtIuAksf3bc1aIGhGJ2Z1tzCCLJQRucEi8f3gT6m0XiY/LlrFB
        2MISr45vgXpOSuJlfxs7REM3o0Tro/9QidWMEp2NPhC2vcSv6VuANnAAbdCUWL9LH8SUEFCW
        OHIL6jY+iY7Df9khwrwSHW1CEI3qEge2T4e6QFaie85n1gmMSrOQfDYLyWezkHwwC2HXAkaW
        VYxiqQXFuempxUYFJvDoTs7P3cQITs9aHjsYZ7/9oHeIkYmD8RCjBAezkgiv/MxliUK8KYmV
        ValF+fFFpTmpxYcYTYFhPZFZSjQ5H5gh8kriDU0sDUzMzAzNjUwNzJXEeT/4T08UEkhPLEnN
        Tk0tSC2C6WPi4JRqYJqyz27yrxPSHafypLTfGkw0/ugwO2Ztvmutd+DbO5rMn5e8nZ/19cSX
        tcssv+WGzhDblBErdvyliuQ8mY6Pd/i/XCxe4Be+d2PwRGvHJ/d3HS8IYjOzlNlQvUkg7HSz
        sa/0mfNdXGdFpnZUPrddHDtB5WVR2bMwqxs6q+/9npUcf0ywvaLU4rDF0iLryXK95xdv2OXk
        k+V6Y+nv+9LHAtzaF2s3Sh+ymTkx+P+9AC/Onc3NUjdrbp3w//N7vpGD36+TPYsWNu5/OjHi
        yiw9ll5V+RZhx8qdN6+95ZJ7ba2508ectX9Bn+s5nepPb3wCrqW0/9aJ5uzIOpyh6Phd8IWF
        3seI4i0vSqPLHZeI2iuxFGckGmoxFxUnAgADhhjiWAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWy7bCSnK7xghWJBjceWlr8nXSM3WL+kXOs
        FjsajrBabHz7g8li0+NrrBYdf78wWlzeNYfNYsb5fUwWrXuPsFs87wOyjr9/zGhxd/9cRovF
        Bz6xO/B6/P41idFjVkMvm8fOWXfZPTat6mTzuHNtD5vH5iX1Hn1bVjF6fN4kF8ARxWWTkpqT
        WZZapG+XwJVxYfMutoJ9rBUzlv9mbGDcyNLFyMkhIWAiMedwD2sXIxeHkMBuRolz23eyQyRk
        JZ692wFlC0vcbzkCVfSMUaL5XTcjSIJNQF/iZcc2sISIwExGieNf57KBOMwCbcwS3199Zodo
        Ocoo0bDpN9hCTgEHifW9J5lBbGEBG4nu03PBRrEIqEgcW7carIZXwFLifMsvRghbUOLkzCdA
        cQ6gqXoSbRvBwswC8hLb385hhjhPQeLn02WsILaIgJPE9m/PWSFqRCRmd7YxT2AUnoVk0iyE
        SbOQTJqFpGMBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgSNXS3MG4fdUHvUOM
        TByMhxglOJiVRHjlZy5LFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFq
        EUyWiYNTqoHJMUhlvcGtBeGt0XM8TYxTMqYbVOQ7llyVcuiaoqHDtql5Q/Nv26vvgpzvuiUK
        mv5V99ntuu6TcpOv+ZKUT9tntNxTeBKnJjD57ZaWAxMUwxIFWkWmZ73uK0h2nxbM8bW0M3LS
        9AXzVrPrcr5YGLDYuO/xEr73yf3FZyeuFYyVZihwZayeqzp7y84sTfWHNhteK+ncKFBcFqcQ
        /ZhtS1z+e9/gylbxVU+SKzdmK+x2mh917p+U8to3wiumPip4+j/k+hMezZCTvR48/29z/A5d
        sJRlutqC561PNxsvc5z2MfNVwr2/udWud099tH6yIffJivvik2Iryp7cXhP2n0/290u1JULH
        g/1tWmNLY14qsRRnJBpqMRcVJwIA5f39DkMDAAA=
X-CMS-MailID: 20211202103012epcas2p25c34dfb8cc9890403e8d131f40aee909
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211201190525epcas2p3f2915664524b53bf72c69f46e1c13844
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
        <CGME20211201190525epcas2p3f2915664524b53bf72c69f46e1c13844@epcas2p3.samsung.com>
        <20211201190455.31646-6-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a part
> of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
> 
> Both clocks have to be asserted for HSI2C to be functional in that case.
> 
> Add code to obtain and enable/disable PCLK in addition to already handled
> operating clock. Make it optional though, as older Exynos SoC variants
> only have one HSI2C clock.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

Best Regards,
Chanho Park


