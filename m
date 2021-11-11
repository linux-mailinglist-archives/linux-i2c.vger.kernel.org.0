Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0FB44D3D1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 10:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhKKJOW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 04:14:22 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:50490 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhKKJOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 04:14:20 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211111091130epoutp04567a55aa2a8821fea8bb8b36ea81e541~2cvA6QP7L0466504665epoutp04j
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 09:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211111091130epoutp04567a55aa2a8821fea8bb8b36ea81e541~2cvA6QP7L0466504665epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636621890;
        bh=wMifPPUDE5l4Ady2krgGwkwTweljikU47KuFS/rViAo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=RohlGxJB+RRZenYiDbiOMaJJQWln3/8/95io24J4JcMRGFgX3vtpXaju8dJnTOuFa
         LN7esbMHlbHQcGhaYYNAXf3PwMqoDNHeTn5Uvht3DdzKPJC3aqkjqrdzp6m1LIyQvJ
         7jRPywG10rA9VGBJyCMiKOg5/NPW5LUSsrF0rBqc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211111091130epcas2p23189b8cfa0add7f0d76d5c1133708edc~2cvAmxZyC0749007490epcas2p2w;
        Thu, 11 Nov 2021 09:11:30 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HqbYl1TsBz4x9Qm; Thu, 11 Nov
        2021 09:11:23 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        98.6E.10018.83EDC816; Thu, 11 Nov 2021 18:11:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211111091119epcas2p4edff247801b2b117c47f192de3c4b5fa~2cu2PDioF0277302773epcas2p48;
        Thu, 11 Nov 2021 09:11:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211111091119epsmtrp256766ff109c376c80f1c6aa8451c8bb3~2cu2OMP2S0990209902epsmtrp2P;
        Thu, 11 Nov 2021 09:11:19 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-18-618cde38d152
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.43.29871.73EDC816; Thu, 11 Nov 2021 18:11:19 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211111091119epsmtip12e287b9a346486fab682f1a92adb5b5d~2cu2E6Mkj2469224692epsmtip1A;
        Thu, 11 Nov 2021 09:11:19 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <chanho61.park@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>
In-Reply-To: <3f66a3bd-2253-e887-badc-f51fa9447fe9@canonical.com>
Subject: RE: [PATCH 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Date:   Thu, 11 Nov 2021 18:11:19 +0900
Message-ID: <000101d7d6dc$169f3240$43dd96c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQCkbhN/M7EUb/u5BwPUYp0og6AbQQHxPCDOAPAAwtEA8f0r4q5GQf8g
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmha7FvZ5EgyWXpSwu79e22Pj2B5NF
        x98vjBYzzu9jsmjde4Td4nkfkHV3/1xGB3aPWQ29bB6bVnWyedy5tofNo2/LKkaPz5vkAlij
        sm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgK5QUihL
        zCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRn
        HNsqWnCHteLpK7cGxtMsXYycHBICJhKzzvxh72Lk4hAS2MEo8fzPYmYI5xOjxNql0xghnG+M
        Eg92P2WDaZm8qZcVIrGXUeLA+ZdsEM5zRok/Z86BDWYT0JXYufEV2GARgS5GiUtfdoBVMQtM
        ZpS4f+QBK0gVp4CjxK+PMxhBbGGBcImj186yg9gsAqoSjdPWgNXwClhKvJmwnA3CFpQ4OfMJ
        2AZmAXmJ7W/nMEPcpCDx8+kyVoi4iMTszjawuIiAm8TmljdQNZ0cEu+/ekDYLhKvel5C/SMs
        8er4FnYIW0ri87u9QHEOILte4usNB5CbJQR6GCXWdP1igqixl/g1fQsrSA2zgKbE+l36EOXK
        EkduQV3GJ9Fx+C87RJhXoqNNCKJRTeL+1HNQS2UkJh1ZyTSBUWkWkr9mIflrFpJfZiHsWsDI
        sopRLLWgODc9tdiowAge18n5uZsYwelTy20H45S3H/QOMTJxMB5ilOBgVhLhTbjTkyjEm5JY
        WZValB9fVJqTWnyI0RQY0hOZpUST84EJPK8k3tDE0sDEzMzQ3MjUwFxJnNdSNDtRSCA9sSQ1
        OzW1ILUIpo+Jg1OqgclxcwzrOfF9zyVP2r3mPb/khoxM8a+18sfPWfNuabrySHqKWU3J8upX
        354dX/ab1WzVxbv/NR4/2fj16vnZgfl366ZnpLdJ7d22afe5eVLyYcr/220Tp7Se/OVhfEXm
        /uxnm94s0fKcxjj5l+dcuQ+3DE03xf5ROXbkPs8eJsX2t2lPHn3csd/pDTPvK0Pn7LD3j156
        W1jauaj/bano4f9o7/xnBsem+oTD/zO45gpmv50xd9rznY+7durm7LPScjLcyCRr4RjXm7ZA
        a1ZOc5/ewUN7v1yx2phqEMZd/ETwpknHRR9Zzh63tIkN/O7Pzqjfzv3+bIHOXvsacd0+4+O7
        l8xYVvWvN1Ar/PIPGZNyJZbijERDLeai4kQASe487ygEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTtf8Xk+iwdsPnBaX92tbbHz7g8mi
        4+8XRosZ5/cxWbTuPcJu8bwPyLq7fy6jA7vHrIZeNo9NqzrZPO5c28Pm0bdlFaPH501yAaxR
        XDYpqTmZZalF+nYJXBnHtooW3GGtePrKrYHxNEsXIyeHhICJxORNvaxdjFwcQgK7GSWe3VjH
        BpGQkVj+rA/KFpa433IEqugpo0TXp34mkASbgK7Ezo2v2EFsEYEeRolzPUIgNrPAdEaJlQft
        IRp+MEpMePQarIFTwFHi18cZjCC2sECoxIbv+8DOYBFQlWictoYVxOYVsJR4M2E5G4QtKHFy
        5hMWiKHaEk9vPoWy5SW2v53DDHGdgsTPp8tYIeIiErM725ghDnKT2NzyhnkCo/AsJKNmIRk1
        C8moWUjaFzCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI4lLc0djNtXfdA7xMjE
        wXiIUYKDWUmEN+FOT6IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotg
        skwcnFINTBZVGqcqU/ovZz3Ol4pSVLP/FHj/WVPQ5BAJ80XVBcLMr3SsC/yXbZjns/8iz8z0
        ot2sPZHGwnan7+ufDmPrNbGt+bFEfLc7867SPkfxFwKz68TmTSvsZe2Y6yQl0XTfo2z7jL9z
        5z/5Vlq0/M61CEXGj+YXUvz33F3II31a5Fb79KSJ+r1nN7Kb7maSNjXqS63ysXbdVL1n4lyG
        jAKhBD9tndfdb3i3G70JKD2qtVtE3Ta3iIuNuedKzqt7r6oCLUw1JJeZalrtZGHd0LgvTb3a
        73IH66nik3rWHaxPdXiYJt3PEalu7Jc3Xcz5otF4/XRPtddP2aWXT1NXjZp2YnnhEtNlX54v
        MSg0l1JiKc5INNRiLipOBAD2umIxFAMAAA==
X-CMS-MailID: 20211111091119epcas2p4edff247801b2b117c47f192de3c4b5fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
        <CGME20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5@epcas2p2.samsung.com>
        <20211111084327.106696-2-jaewon02.kim@samsung.com>
        <3f66a3bd-2253-e887-badc-f51fa9447fe9@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof

> On 11/11/2021 09:43, Jaewon Kim wrote:
> > This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> > It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> >
> > Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> 
> You did not Cc the necessary lists (devicetree). Please use scripts/get_maintainers.pl to get list of
> addresses to CC.
> 
> Patch itself looks good, so you can resend with:
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> 
> Best regards,
> Krzysztof

Thanks.
I will add more CC lists in next.

