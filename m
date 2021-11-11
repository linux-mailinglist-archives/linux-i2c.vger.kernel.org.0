Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA77244D35D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 09:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhKKIu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 03:50:57 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:19607 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbhKKIuy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 03:50:54 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211111084802epoutp0219bef00a49df50c7ebfbdd97ff90e956~2cahwFSgD0244102441epoutp02m
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:48:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211111084802epoutp0219bef00a49df50c7ebfbdd97ff90e956~2cahwFSgD0244102441epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636620482;
        bh=FqCT9fjFDM/AF6o9Ru1fI8TJs6AByr1qbgo/xVt91yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SV/hat55fHHAnaLI2sm2+S6ZDxg0+fhxL1hYL4fuuSIc6Tiax4IaunLG1pqfSoM26
         F4Q7a/ISFdwB33HYx1SlnfSfm1Ewpg4qdxpF9ptrsqBiIFB9OVSa9d0zLe6orhTW/x
         tDqxolqWOGYIUnom9PN3JCSU5VXi25EyrVPs/VRo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211111084802epcas2p1b1b33e6438da20341fcfcc48626df8e8~2cahQ1fxO1572515725epcas2p1b;
        Thu, 11 Nov 2021 08:48:02 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Hqb2Y4Rvtz4x9QC; Thu, 11 Nov
        2021 08:47:49 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        CF.34.51767.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5~2caVKASJe1278512785epcas2p2S;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211111084749epsmtrp23311afb969b2f8b21ec38324aa69b979~2caVJT4u72737827378epsmtrp2u;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-06-618cd8b5b203
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        52.E0.29871.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epsmtip2bd31a5f334f8492140a5a3d8280a8baa~2caU-m5OA1143211432epsmtip2d;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Date:   Thu, 11 Nov 2021 17:43:26 +0900
Message-Id: <20211111084327.106696-2-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111084327.106696-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplk+LIzCtJLcpLzFFi42LZdljTQnfrjZ5Eg21LlSwu79e22NFwhNVi
        49sfTBYdf78wWsw4v4/JonXvEXaL531A1t39cxkdODxmNfSyeWxa1cnmcefaHjaPvi2rGD0+
        b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB
        OkVJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBk
        ClSYkJ3Rd/wIe8Ef7oqbve/ZGhhvcHYxcnJICJhIfOpdwNrFyMUhJLCDUWL2+cvMEM4nRom+
        b7dZIJxvjBKz1m8FcjjAWq5/04WI72WUeLCjgR3C+cgo8WbbESaQuWwC2hLf1y9mBbFFBOok
        une1MoIUMQtsYpS4+GE2G8gkYYFgial3bUBqWARUJbp2PGQFCfMK2Em8vGoIcZ68xMQJ99hB
        bE4Be4l3E2aD2bwCghInZz5hAbGZgWqat84Gu1pC4CO7xPy9LcwQh7pInP1aADFHWOLV8S3s
        ELaUxOd3e9kgSuolvt5wgGjtYZRY0/WLCaLGXuLX9C1g5zALaEqs36UPUa4sceQW1FY+iY7D
        f9khwrwSHW1CEI1qEvennmODsGUkJh1ZCTXQQ+LfruvQgJrEKLF30hLGCYwKs5A8MwvJM7MQ
        Fi9gZF7FKJZaUJybnlpsVGAIj97k/NxNjOB0qeW6g3Hy2w96hxiZOBgPMUpwMCuJ8H6/1JMo
        xJuSWFmVWpQfX1Sak1p8iNEUGNITmaVEk/OBCTuvJN7QxNLAxMzM0NzI1MBcSZzXUjQ7UUgg
        PbEkNTs1tSC1CKaPiYNTqoHpwnNDK/dn9vPi20u4I9al9nxhOv3ScrPxISY1U943Aps/rG+q
        U43pOXLuuKSpxlyXU/NfnJWZzPa7xvnvl/NPLFi+z/UtvMHEefNgY6/D073sdzQYZ2+bck6g
        3TbOXElZ5kj5PruA0pLEiskGSyPPO01ZoCSz6N2RK+5r5k3V1vfLvbrk1ylpUcNIhb8rFv9d
        l/PARvn29YMv1I+/jOwRVnaMcUp6YdlS5sm1Onlr+DW1fX//3vz/vKDuZfK/mJ0N7densh5Y
        uso0yDIwLeZ/0EoT5XD98I36Cyp2CyRLLRUR29+RbC9077nKqdotDL8mGcf1ePf//VV1deJj
        r5ubfjaWPBZcMSXP4P1P913sSizFGYmGWsxFxYkA8XJrWiAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsWy7bCSvO7WGz2JBofW8ltc3q9tsaPhCKvF
        xrc/mCw6/n5htJhxfh+TReveI+wWz/uArLv75zI6cHjMauhl89i0qpPN4861PWwefVtWMXp8
        3iQXwBrFZZOSmpNZllqkb5fAldF3/Ah7wR/uipu979kaGG9wdjFycEgImEhc/6bbxcjFISSw
        m1Hi5Iv9zF2MnEBxGYnlz/rYIGxhifstR1ghit4zSmx50swKkmAT0Jb4vn4xWEJEoIFR4u23
        RUwgCWaBbYwSTQ3lIBuEBQIlrhzwAwmzCKhKdO14yAoS5hWwk3h51RBivrzExAn32EFsTgF7
        iXcTZoPZQkAlC1c/B7uHV0BQ4uTMJywQ0+UlmrfOZp7AKDALSWoWktQCRqZVjJKpBcW56bnF
        hgWGeanlesWJucWleel6yfm5mxjBoa2luYNx+6oPeocYmTgYDzFKcDArifB+v9STKMSbklhZ
        lVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAOTcoB98ykDB/98i5CC
        /vj6Zu42/icep2ZwrrGJVVr6Icl9geR1o9SaiQvV3mX79WesVPb2WtUzPSfZ+/Dz50evZKlF
        /ti94eiy2qvr7QMnqtSfu1uyZ+9uH8GKkF9S5c+13pzjW66saeUTWb/z46q8lct+zBGTYDvS
        m6kz7Vs7z3+rNdP/sJSJlk+p9y5zippWsmTLzsBs15TFuSnRnq6839bwNAa82GH3zIX/4DoG
        yV0qDldlnAIfc7evEFohre4t93G7vUBzQtGVhsef2l8Udmal3Jhe80La9VynT0Tpke7p5yo+
        LFnJuHy7xfvwpU8ZBaqtC3fq3bp3v/R70iue5fyv3krItT27IS6gLqDEUpyRaKjFXFScCABJ
        ESI/3AIAAA==
X-CMS-MailID: 20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
        <CGME20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds new "samsung,exynosautov9-hsi2c" compatible.
It is for i2c compatible with HSI2C available on Exynos SoC with USI.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
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

