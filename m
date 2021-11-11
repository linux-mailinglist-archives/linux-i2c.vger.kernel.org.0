Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1B444D35F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 09:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbhKKIu6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 03:50:58 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:19613 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbhKKIuy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 03:50:54 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211111084803epoutp0227c3c00ee4593ffc1ffe6f47715a620c~2cah57wsh0244102441epoutp02n
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:48:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211111084803epoutp0227c3c00ee4593ffc1ffe6f47715a620c~2cah57wsh0244102441epoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636620483;
        bh=kuHscA9dGAXV0iGJRJxz1QoWJ7pHx7l378kunnn98Gs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Brxx7lbqRB/KrNDY51I5/ZzTyGSfhfRfFb8li//M3XxGzWjGDS1U306GPK1ggcox/
         4a1TQ4UyaAz5ODVGBZtJayJF/C+YKFiR1++Wns+4HWgZW8zHeBVJMer+OV6ZAIrnfl
         8mMNV91a+322Y2pfRmbBo97f7mEzksMLVb1RBZBA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211111084802epcas2p41354d9a870b3ff33f0990e325c8223ef~2cahWYhbj0326503265epcas2p4I;
        Thu, 11 Nov 2021 08:48:02 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Hqb2k4YSxz4x9Qc; Thu, 11 Nov
        2021 08:47:58 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.15.10014.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epcas2p37aca50307180bb44a8939b7ee33b28d0~2caVJXm5J2079220792epcas2p3s;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211111084749epsmtrp11b5395a8d364aff2d7d952416fc29a8a~2caVIrX6s2184421844epsmtrp1L;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-72-618cd8b5302d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        29.C8.08738.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epsmtip27b4a8ad29fc11449e26661e75ca209fe~2caU6ThXM1450214502epsmtip2i;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v2 0/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Thu, 11 Nov 2021 17:43:25 +0900
Message-Id: <20211111084327.106696-1-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTQnfrjZ5Eg1nzlCwu79e22NFwhNVi
        49sfTBYdf78wWsw4v4/JonXvEXaL531A1t39cxkdODxmNfSyeWxa1cnmcefaHjaPvi2rGD0+
        b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB
        OkVJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBk
        ClSYkJ2xqG8mY8Entor215fYGxiPsXYxcnJICJhILPo8iamLkYtDSGAHo8TdmTvYIZxPjBLP
        z61lg3A+M0rcbrnD2MXIAday6rcSRHwXo8TFIzuYIZyPjBJ/5vwGm8smoC3xff1iMFtEoE6i
        e1crI0gRs8AmoI4Ps9lAEsICbhInlr4Es1kEVCVW/tnFBGLzCthJdKxrhTpQXmLihHvsEHFB
        iZMzn7CA2MxA8eats5khai6xSzxekwthu0hMXzSPBcIWlnh1fAs7hC0l8bK/jR3ig3qJrzcc
        QO6REOhhlFjT9YsJosZe4tf0LawgNcwCmhLrd+lDlCtLHLkFtZVPouPwX6gpvBIdbUIQjWoS
        96eeY4OwZSQmHVkJNdBD4ueif2BxIYFYiZ7Nh1knMMrPQvLLLCS/zELYu4CReRWjWGpBcW56
        arFRgTE8TpPzczcxghOjlvsOxhlvP+gdYmTiYDzEKMHBrCTC+/1ST6IQb0piZVVqUX58UWlO
        avEhRlNg6E5klhJNzgem5rySeEMTSwMTMzNDcyNTA3MlcV5L0exEIYH0xJLU7NTUgtQimD4m
        Dk6pBqYtH6a1JG4zt5+7xEOed++5P0sPT+nde+zNxx3aRanx9zbO+H/gYVxn0O5Ald8zD5u/
        /lFeWWP6o7Ov/mFi/Q7hfbKh7V9Wihduz1v/f9tEq2WODnsbo5d2Lf6xa96Ce4+Cln2b+MD8
        GrvgpS2vooNqjposzLvKuap3f2SMc6JUg/rH6K2+9fMm5citl3MKWe85Py6NY+Hf1G9yWnNT
        +w+Z/0m0NKturEt59+Cp857/1Ww3BBmWh9llZCg8UrZ3lTgbounp4u/ifsmS62n/65J5TyUD
        zjY+dJnHbvakLLCMzzP49udNK37cXNVeuHHDRsts1+msk/uNg3kTr5REiMeFXbbkce2cuenS
        vqVbzn1TYinOSDTUYi4qTgQAYdMijhUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsWy7bCSvO7WGz2JBnc+cVtc3q9tsaPhCKvF
        xrc/mCw6/n5htJhxfh+TReveI+wWz/uArLv75zI6cHjMauhl89i0qpPN4861PWwefVtWMXp8
        3iQXwBrFZZOSmpNZllqkb5fAlbGobyZjwSe2ivbXl9gbGI+xdjFycEgImEis+q3UxcjFISSw
        g1Fixo8Gti5GTqC4jMTyZ31QtrDE/ZYjrBBF7xkl3h74yQ6SYBPQlvi+fjFYQkSgASjxbRET
        SIJZYBujRFNDOYgtLOAmcWLpS7BJLAKqEiv/7AKr4RWwk+hY18oKsUFeYuKEe+wQcUGJkzOf
        sEDMkZdo3jqbeQIj3ywkqVlIUgsYmVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgSH
        q5bWDsY9qz7oHWJk4mA8xCjBwawkwvv9Uk+iEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfj
        hQTSE0tSs1NTC1KLYLJMHJxSDUwRi/YJvAo+ZPTqkpdhzIkzhpuNnuSq+LZK1nvs/CXJt4x5
        gdHWuGVC85a5fIlgLK2seuH0kMnpmmYKy5JTRvs9z+aFbgpaE8ilXyq6cbLTHJZr/BFcJT+O
        JLydcdkqjLvPVPu9mtSG1qObT7PyLLiVOXlV1zmu2OaKRcvMj+wr93ui4PHoV+XiKRwnZdZ8
        sZ1YtGjFkYgLS0K+H9vAfcdu3vmNK08dMWs+v2964Wavjydd/n2o7f74UvjQse6X9yctadA5
        /8GsrdcoYloDg9fC2HkdM98aaHR3dScaTXzhuY6prMd3oqguz/9gp4Q5Uut0Yh6+uVFsbOTe
        MF/DVzXgw4E0/5VznH43sIl//vhViaU4I9FQi7moOBEAqG2f68YCAAA=
X-CMS-MailID: 20211111084749epcas2p37aca50307180bb44a8939b7ee33b28d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211111084749epcas2p37aca50307180bb44a8939b7ee33b28d0
References: <CGME20211111084749epcas2p37aca50307180bb44a8939b7ee33b28d0@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
called USI(Universal Serial Interface).

As it is integrated into USI, there are additinal HW changes.
Registers to control USI and sysreg to set serial IPs have been added.
Also, some timing registres have been changed.

Changes in v2:
 - Changes compatible name to "samsung,exynosautov9-hsi2c"
 - Changes I2C type name to "I2C_TYPE_EXYNOSAUTOV9" from "I2C_TYPE_USI"
 - Changes to clear after reset instread of clearing reset
 - Add description about system register for USI

Jaewon Kim (2):
  dt-bindings: i2c: exynos5: add exynosautov9-hsi2c compatible
  i2c: exynos5: add support for ExynosAutov9 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.txt   |   7 +
 drivers/i2c/busses/i2c-exynos5.c              | 133 ++++++++++++++++--
 2 files changed, 130 insertions(+), 10 deletions(-)

-- 
2.33.1

