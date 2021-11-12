Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D74C44DF92
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 02:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhKLBJG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 20:09:06 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:19566 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbhKLBJF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 20:09:05 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211112010614epoutp0412f33f29d60393be598f4d5c9b82f257~2pwmrqYWM2229522295epoutp04B
        for <linux-i2c@vger.kernel.org>; Fri, 12 Nov 2021 01:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211112010614epoutp0412f33f29d60393be598f4d5c9b82f257~2pwmrqYWM2229522295epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636679174;
        bh=XT2BWSfKLYm4CaWRl3rGzWKNabqvzFUhjh/DD9Zdxi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kl8pdQoyp7Qxm/tAt/rqD9JONXpy/F1GrBvH3uORRiP8uGL5Fnif7Oja1/364O9s4
         xBzJaJklukrOSidWZs9sZyCvJEnx11HMVRgUNO2lCIYueP8sFCfBIcCW/sguqvrttv
         cBC99HMjNxZboe2JriHVmO1yKvKlTHlGceUwzmr4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211112010613epcas2p120700b4e3247f0408566bb086943e11e~2pwmFhkLG3211832118epcas2p1L;
        Fri, 12 Nov 2021 01:06:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Hr0lN3QnKz4x9QP; Fri, 12 Nov
        2021 01:06:08 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3A.60.10018.CFDBD816; Fri, 12 Nov 2021 10:06:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60~2pwcF68N-1493714937epcas2p2Y;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211112010603epsmtrp2ece94b73b968b9885dc84d5b324701a7~2pwcE4m9U2332823328epsmtrp2V;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-35-618dbdfc816e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3E.6C.29871.BFDBD816; Fri, 12 Nov 2021 10:06:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211112010603epsmtip2cf13b158e99a86f1d57c5f7043e27bb1~2pwb65RWg1607816078epsmtip2J;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Date:   Fri, 12 Nov 2021 10:01:36 +0900
Message-Id: <20211112010137.149174-2-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112010137.149174-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmme6fvb2JBkc2i1hc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
        XUNLC3MlhbzE3FRbJRefAF23zByg65QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
        BeYFesWJucWleel6eaklVoYGBkamQIUJ2RmNLQ0sBYd4KrYd3MPewDiTq4uRk0NCwERi0t5u
        9i5GLg4hgR2MEkufrIJyPjFKbFvylw3C+cYo8fHob2aYlqM/N7JCJPYySjSd/sYM4XxklPi8
        6jgjSBWbgLbE9/WLWUFsEYE6ie5drYwgRcwC05gkbk46wg6SEBYIkzi4aRYbiM0ioCoxZ+JS
        FhCbV8BOov/CDjaIdfISEyfcA6vnFLCX2Nq8hQmiRlDi5MwnYPXMQDXNW2eDXSEh0MohcWvJ
        MRaIZheJtctboe4Wlnh1fAs7hC0l8fndXqAFHEB2vcTXGw4QvT2MEmu6fjFB1NhL/Jq+hRWk
        hllAU2L9Ln2IcmWJI7eg1vJJdBz+yw4R5pXoaBOCaFSTuD/1HNT1MhKTjqyEGugh8WvpKSZI
        WE1ilJjwYTnTBEaFWUi+mYXkm1kIixcwMq9iFEstKM5NTy02KjCCR3Fyfu4mRnBy1XLbwTjl
        7Qe9Q4xMHIyHGCU4mJVEeM8v7E0U4k1JrKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnA9J5XEm9o
        YmlgYmZmaG5kamCuJM5rKZqdKCSQnliSmp2aWpBaBNPHxMEp1cC0WFSgsUprtbIQd072Bo+J
        1bZF5gphtXVZX2pZ4oMm10Z277Q3bLs3a+Gtx2eYtSJOVGoXyB39c+q19c9HVW9vam5gMFW4
        NmOJ8Y1Ky8ToxszwfxdOb/7k513b+1Y9c/2jJb/vOoT8+d+cV3ZpbwyTafvki4XZD3uNYl4G
        XT1v+9Qgx5onaHHOyuDpe54x/T8m4j3V6YB58O7p07mSdoYu/FybFqT0X6O9Uet+9rxXC5yO
        nSt8l/o38IlywARbcwulZ/Zdxzfu8G1hWxj19n2TqoHdG9tvyzKMZWd1B2w0/MZa+mJm95S9
        mspP//le61q3M3VC45+CjovpN67yrd/h8et7q2z3wTni7X7drDVKLMUZiYZazEXFiQBPjoJ6
        NwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvO7vvb2JBm9mcFhc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujMaWBpaCQzwV2w7uYW9g
        nMnVxcjJISFgInH050bWLkYuDiGB3YwS7+cuYYNIyEgsf9YHZQtL3G85AlX0nlFiye4XjCAJ
        NgFtie/rF4MlRAQaGCXeflvEBOIwC8xhkljw/x0TSJWwQIjE3BkLWEBsFgFViTkTl4LZvAJ2
        Ev0XdkCtkJeYOOEeO4jNKWAvsbV5C1ivEFDNr+1fmCHqBSVOznwC1ssMVN+8dTbzBEaBWUhS
        s5CkFjAyrWKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI4ELc0djNtXfdA7xMjEwXiI
        UYKDWUmE9/zC3kQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4
        OKUamKzfv9TvOWhlbX/xTswdTbYDkwTOW3F81k3NCQgy05n7qie4w4jXcm2nqpnFv1Km9FDh
        MPuohU38T1cflLD+cl5axix+z/7Jnn6621+JshvGpX3MSL65OVO2gv3nlaJTFuneFhm3Fd2Y
        0jmmMQRwcFntmbGRY9axEiW3muzFbTWvc6SNny1iPKXye9lBT/uW0poTM5ja5hseashzeV2p
        +f3X9tC5ricuB6zJsdq7Ni3+qsMtKwlBjvxp9rI8uvGPb3jKPnnlc/Fw+yPzLdl35x3+N4eb
        7+R/jzfFK95ZKqcHz7yaPFMrX8RnvoTYx9ln/wZOFH3Po3qtUXPLvGM6BzQU3nTVRV14f03R
        2MdKiaU4I9FQi7moOBEAo8sbOfMCAAA=
X-CMS-MailID: 20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60
References: <20211112010137.149174-1-jaewon02.kim@samsung.com>
        <CGME20211112010603epcas2p26c076e65e0cb286cb53f06053165ef60@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds new "samsung,exynosautov9-hsi2c" compatible.
It is for i2c compatible with HSI2C available on Exynos SoC with USI.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
index 2dbc0b62daa6..39f4067d9d1f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
@@ -14,6 +14,8 @@ Required properties:
 				on Exynos5260 SoCs.
 	-> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
 				on Exynos7 SoCs.
+	-> "samsung,exynosautov9-hsi2c", for i2c compatible with HSI2C available
+				on ExynosAutov9 SoCs.
 
   - reg: physical base address of the controller and length of memory mapped
     region.
@@ -31,6 +33,11 @@ Optional properties:
        at 100khz.
     -> If specified, the bus operates in high-speed mode only if the
        clock-frequency is >= 1Mhz.
+  - samsung,sysreg : system registers controller phandle to control USI.
+    -> If I2C integrated to USI(Universal Serial Interface), this property
+       is required. When using Exynos USI block, it needs to select which type
+       of Serial IPs(UART, SPI, I2C) to use with system register. So, it
+       requires samsung,sysreg phandle and offset value of system register.
 
 Example:
 
-- 
2.33.1

