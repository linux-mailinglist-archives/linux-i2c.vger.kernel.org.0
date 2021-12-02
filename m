Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5706546607F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 10:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356525AbhLBJgm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 04:36:42 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:24602 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356556AbhLBJgj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 04:36:39 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211202093315epoutp02bed58c654ae34f1a4720c50a882132b5~85lACTG920965309653epoutp02x
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 09:33:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211202093315epoutp02bed58c654ae34f1a4720c50a882132b5~85lACTG920965309653epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1638437595;
        bh=gpRxoJZAoC8y5a9Heh3Hx8M2upBoA5wNGJpAqTMLmg8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=UWebvgaY+UIJk7ssdYMeoWqGX3CN+Tkmnq7VdrwWzHJZvVvwAr/w13oo12XRXmkuf
         Hg/JMzfQ/eZntN4j6NLbhL5t1skBRbTwVMdnvnPwXe1pXr1QRlip12oFKZWuJWavGj
         RvZYu06JmsnpbcQiD8V/ecF3HSm9xeR1GqWTF7XA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211202093315epcas2p35a4223de970d9c0fe6dac20704952af4~85k-kdI3q0217802178epcas2p3e;
        Thu,  2 Dec 2021 09:33:15 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4J4W3D65Sdz4x9QG; Thu,  2 Dec
        2021 09:33:12 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        2D.AC.10018.8D298A16; Thu,  2 Dec 2021 18:33:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211202093312epcas2p337fa78734139e0a8193d8577c13ae054~85k8t5ZgP2206222062epcas2p3Y;
        Thu,  2 Dec 2021 09:33:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211202093312epsmtrp24e4af9a7b837b2a98d495f90735d9925~85k8sOZDu1784217842epsmtrp2L;
        Thu,  2 Dec 2021 09:33:12 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-5b-61a892d8d6f5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.86.29871.7D298A16; Thu,  2 Dec 2021 18:33:12 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211202093311epsmtip1bdf66a7835b2efb60d450866d622c5e4~85k8cuVuM2239822398epsmtip1M;
        Thu,  2 Dec 2021 09:33:11 +0000 (GMT)
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
In-Reply-To: <20211201190455.31646-7-semen.protsenko@linaro.org>
Subject: RE: [PATCH 6/6] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in
 Kconfig
Date:   Thu, 2 Dec 2021 18:33:11 +0900
Message-ID: <002201d7e75f$9fd62580$df827080$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+Fna5aS4J9DFonoTtOdjbcAGMmgLJ1qU6AcoLHguqrfLr8A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmme6NSSsSDf7c0rL4O+kYu8X8I+dY
        LXY0HGG12Pj2B5PFpsfXWC06/n5htLi8aw6bxYzz+5gsWvceYbd43gdkHX//mNHi7v65jBaL
        D3xid+D1+P1rEqPHrIZeNo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAjKtsmIzUx
        JbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hkJYWyxJxSoFBA
        YnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xo8zf5kK
        TjJV7Olaw9zAOIGpi5GDQ0LAROLvSe4uRi4OIYEdjBKrf75jg3A+MUpM2nWLCcL5xiixe8t/
        5i5GTrCOtU9PMEIk9jJKPFk6F6rlBaPEvSXbWEGq2AT0JV52gNhcHCIC0xkljneuYwdxmAX+
        MUm0Nv5gB6niFHCQ6D/cCNYhLBAmcWbRehYQm0VARWLOtn9sIDavgKXE4d6lLBC2oMTJmU/A
        bGYBeYntb+dA3aQg8fPpMrA5IgJOEpcndDNC1IhIzO5sg6q5wSEx5VEAhO0isfD4XUYIW1ji
        1fEt7BC2lMTnd3vB3pEQ6GaUaH30HyqxmlGis9EHwraX+DV9Cyso+JgFNCXW79KHhKSyxJFb
        UKfxSXQc/ssOEeaV6GgTgmhUlziwfToLhC0r0T3nM+sERqVZSB6bheSxWUgemIWwawEjyypG
        sdSC4tz01GKjAiN4bCfn525iBCdnLbcdjFPeftA7xMjEwXiIUYKDWUmEV37mskQh3pTEyqrU
        ovz4otKc1OJDjKbAoJ7ILCWanA/MD3kl8YYmlgYmZmaG5kamBuZK4rwf/KcnCgmkJ5akZqem
        FqQWwfQxcXBKNTDZbX34/ULExfgvvkm79gZln4qpSRDnS/rQbxwb2dv7obr4YrP2sZywpF8B
        934xXk3K/Zao9PODxtlPqd+XeAZ2XFla4aL+pqbDW4X92u9boeVaM0R3L9Vm6Em1vs59p2K/
        KMNThRcv9v84dd/q79myzY7KthYn+Cw+vP7eNyUiTJLfOmzPrXn/F30rPnmufXHf6yYJ5Vnm
        GcqXVRYu+RBuPOHu55tfPujum1ey62yIz6pPl0Kb2JdtPKNr+07BmT/goORk0fnqErUysW+q
        fx8oXN70+JW+sdy9baa+X58E9x7/fW228n3L5Ovv1kgzbM/ZPLnghuOzG3WBpZLzZWYeOuMy
        0ej74qxdgi75YWcClViKMxINtZiLihMBcSGJwlcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWy7bCSnO6NSSsSDe6eZLL4O+kYu8X8I+dY
        LXY0HGG12Pj2B5PFpsfXWC06/n5htLi8aw6bxYzz+5gsWvceYbd43gdkHX//mNHi7v65jBaL
        D3xid+D1+P1rEqPHrIZeNo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAjissmJTUn
        syy1SN8ugSvjx5m/TAUnmSr2dK1hbmCcwNTFyMkhIWAisfbpCcYuRi4OIYHdjBJzZjWyQCRk
        JZ6928EOYQtL3G85wgpR9IxRou35CrAiNgF9iZcd28ASIgIzGSWOf53LBuIwC7QxS3x/9Zkd
        ouUoo8T522fAFnIKOEj0H25kBbGFBUIk9my7BmazCKhIzNn2jw3E5hWwlDjcu5QFwhaUODnz
        CZDNATRVT6JtIyNImFlAXmL72znMEOcpSPx8ugxsjIiAk8TlCd1QNSISszvbmCcwCs9CMmkW
        wqRZSCbNQtKxgJFlFaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcKRqae5g3L7qg94h
        RiYOxkOMEhzMSiK88jOXJQrxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUg
        tQgmy8TBKdXAJHNl/u5mZlVbqQMMubsdgtdlLfiWcnrttb9zpugLx86XfphctGBpyKZ+03fi
        AUzcLisuJrs+jj6rmpm1s2WXpur0OlOduYwuFxRnaxzj/1v2yMfn/9WjH6Njcl689pI7F5zY
        O8n6dez69swTk/Vi9/Lcvf6xsf5YyIUN7XdPfcuYO0s2u+Bi/67/3f/8Lp09YXn8k4aSSY5i
        frhP1cmZV1n0tM9YucSZsU+XaUuwCOy/6vvftdgs4RVfntf7w7tikoV9unqqyuf1aDJLib6+
        r32zRf//69B8wUcTRTulO44u2Vqkczbq779/qwuPnF7FKRBzM/GhZfB5Rckprcn3y6RvJFs2
        t/vWFS/ueftYiaU4I9FQi7moOBEAno5UlUMDAAA=
X-CMS-MailID: 20211202093312epcas2p337fa78734139e0a8193d8577c13ae054
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211201190510epcas2p491796defc810ab67435eee58c34e7bdf
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
        <CGME20211201190510epcas2p491796defc810ab67435eee58c34e7bdf@epcas2p4.samsung.com>
        <20211201190455.31646-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
> Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
> symbol help section.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

Best Regards,
Chanho Park


