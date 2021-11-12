Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9084044DF91
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 02:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbhKLBJF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 20:09:05 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:64128 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbhKLBJF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 20:09:05 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211112010613epoutp02145f3a9310a3fe0ca8700da1947962b5~2pwly9WkC0504505045epoutp02D
        for <linux-i2c@vger.kernel.org>; Fri, 12 Nov 2021 01:06:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211112010613epoutp02145f3a9310a3fe0ca8700da1947962b5~2pwly9WkC0504505045epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636679173;
        bh=dKeBiRvU5OdA4A+Gv8Y0NQfXa57ytQb7cj57ANQ3Yms=;
        h=From:To:Cc:Subject:Date:References:From;
        b=M5FBZdvvL3SuxS2IvaMXPQ6bhgzVdMS8PLC42lTrK/nuztKXKBuetVSUynt35eHQ2
         fEK/ZMUN1CXzSNp2VOwpR9tvKtBBIeMcvwj2DcbJLrKmOmjbvQWvDdHbCyrJ+QeHwN
         5VxsN4rs+aIEaERFy/Qhwy/AtmpAeKFtQ8shSt0k=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211112010613epcas2p4296345d6a08ff7bb320870df79d1fdd5~2pwlPgxbr2822828228epcas2p4h;
        Fri, 12 Nov 2021 01:06:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Hr0lN3R4Hz4x9Qg; Fri, 12 Nov
        2021 01:06:08 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        59.60.10018.BFDBD816; Fri, 12 Nov 2021 10:06:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211112010603epcas2p331fe717eabfd9fc0280792921b25c535~2pwcCQ57K3148131481epcas2p3_;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211112010603epsmtrp2e0557ed89c8504a22330dec0d1be85a0~2pwcBefSm2332823328epsmtrp2U;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-33-618dbdfb5c1b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        2E.6C.29871.BFDBD816; Fri, 12 Nov 2021 10:06:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211112010602epsmtip2856e61c365cddc19b3276994e2382ac2~2pwb0h5i71804718047epsmtip2a;
        Fri, 12 Nov 2021 01:06:02 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v3 0/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Fri, 12 Nov 2021 10:01:35 +0900
Message-Id: <20211112010137.149174-1-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmhe7vvb2JBm8maFpc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
        XUNLC3MlhbzE3FRbJRefAF23zByg65QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
        BeYFesWJucWleel6eaklVoYGBkamQIUJ2RlPXs5hLLjDXvHk7gbmBsZpbF2MnBwSAiYSX1cu
        ZQWxhQR2MErsXGvUxcgFZH9ilLjwfR4LhPONUWLvpFusMB0t7y4yQST2MkpM3veSEcL5yCjx
        58wXRpAqNgFtie/rF4N1iAjUSXTvagUrYhaYxiRxc9IRdpCEsICbxNFlt8FsFgFViQtt/8CO
        4hWwk7j4eCI7xDp5iYkT7rFDxAUlTs58wgJiMwPFm7fOZgYZKiHwlV3i3fleRogGF4n3XRdZ
        IGxhiVfHt0ANkpL4/G4v0AIOILte4usNB4jeHkaJNV2/mCBq7CV+Td/CClLDLKApsX6XPkS5
        ssSRW1Br+SQ6Dv9lhwjzSnS0CUE0qkncn3oOGqQyEpOOrGSCKPGQWNhvBQndWIn5u2+xTGCU
        n4Xkl1lIfpmFsHYBI/MqRrHUguLc9NRiowIjeJwm5+duYgSnTy23HYxT3n7QO8TIxMF4iFGC
        g1lJhPf8wt5EId6UxMqq1KL8+KLSnNTiQ4ymwNCdyCwlmpwPTOB5JfGGJpYGJmZmhuZGpgbm
        SuK8lqLZiUIC6YklqdmpqQWpRTB9TBycUg1MocetPISWaxj4HP4u2h9w69SqK6s/npUzenvR
        pevbG81JqSYS9gn/I9Z8L9B0uB8xZXPfo+OlhhaxM7oTFwrqb7k5c/fxtAkaH17+CEzitWC0
        LFq96sLeRzIBX/7eT/18PCWtdeLPgKtrF97fduq0TKmXQMn+B21arzdW+yZEZMwpaU/7Fux7
        JvWo34PjkvsD0ox1V3VyBMROOucg9VXlytK5q8N+xMmmqfzd4n763t5nfOmzRc40vjwUZe8v
        3vnT75zPXe6wQuNy5vSFbQdvZPgHrRT1fZc8f2udzcaV9V51t+Jtpv1cf+vgxZx1ezn/hKQ7
        GJ3fx+HZpGP3+tqEWmV9x00zln1+1Nk9UfL7KSWW4oxEQy3mouJEAF106XMoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSvO7vvb2JBpOXslhc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujCcv5zAW3GGveHJ3A3MD
        4zS2LkZODgkBE4mWdxeZuhi5OIQEdjNKHP33ghkiISOx/FkfVJGwxP2WI6wQRe8ZJS40NDGB
        JNgEtCW+r18MlhARaGCUePttEdgoZoE5TBIL/r8DqxIWcJM4uuw2O4jNIqAqcaHtH9hYXgE7
        iYuPJ7JDrJCXmDjhHjtEXFDi5MwnLCA2M1C8eets5gmMfLOQpGYhSS1gZFrFKJlaUJybnlts
        WGCYl1quV5yYW1yal66XnJ+7iREc2FqaOxi3r/qgd4iRiYPxEKMEB7OSCO/5hb2JQrwpiZVV
        qUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTDZPy25zWT3v+n0/omN
        ma+jt6ttdGf8FMxqLR4cq9ozc/snph0NPZYz15+JfivtPSd12aaHxksv5TyzOqvgNOfC86vH
        Ylcd2lB/73TzbsMpDB88FguLKUz64r1Xg+dh2J+yb/l3dE3vvo76svyabPv0f3sWXhLZn73q
        UeNp3thX4hwzdpvklu769+7+xEd2cn82zXr4PyZswZRnTtv/LtK5fSP/4vOG2sOcLDtKvbpF
        pr5r5zlef/HUZ4PzN/bls3kamG7dwce6kP/+tu4/t+/5qe+TiKs4u3L119fSFR9O/3jzv+6p
        Alt4Q6JoQd5FlTkl6dlfjN/2vLfLmh9cqsb4cs67o0udedsrKyyUHWaa5yqxFGckGmoxFxUn
        AgCxe/8X2wIAAA==
X-CMS-MailID: 20211112010603epcas2p331fe717eabfd9fc0280792921b25c535
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211112010603epcas2p331fe717eabfd9fc0280792921b25c535
References: <CGME20211112010603epcas2p331fe717eabfd9fc0280792921b25c535@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
called USI(Universal Serial Interface).

As it is integrated into USI, there are additinal HW changes.
Registers to control USI and sysreg to set serial IPs have been added.
Also, some timing registres have been changed.

Changes in v3:
 - Changes has_usi variable type
 - Changes comment style

Changes in v2:
 - Changes compatible name to "samsung,exynosautov9-hsi2c"
 - Changes I2C type name to "I2C_TYPE_EXYNOSAUTOV9" from "I2C_TYPE_USI"
 - Changes to clear after reset instread of clearing reset
 - Add description about system register for USI
 - fix typo in description

Jaewon Kim (2):
  dt-bindings: i2c: exynos5: add exynosautov9-hsi2c compatible
  i2c: exynos5: add support for ExynosAutov9 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.txt   |   7 +
 drivers/i2c/busses/i2c-exynos5.c              | 135 ++++++++++++++++--
 2 files changed, 132 insertions(+), 10 deletions(-)

-- 
2.33.1

