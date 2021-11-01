Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7547441AC8
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 12:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhKALol (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 07:44:41 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:43596 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbhKALok (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 07:44:40 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211101114205epoutp046e1137fecbe5100e63100d17f2bf2f2f~zaVou0EbU1798817988epoutp04J
        for <linux-i2c@vger.kernel.org>; Mon,  1 Nov 2021 11:42:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211101114205epoutp046e1137fecbe5100e63100d17f2bf2f2f~zaVou0EbU1798817988epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635766925;
        bh=up1MO0KkPVwe2zBA55fSLzsTBsRC2h2hrtZ0viDd6Go=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I9RC8PHzHR32Pn0HNzdiN8y/XNCGmso5tjtkEFYp7+EpXBYQfLRdpk0U2nEJgttXc
         2Zz1YHazqOxzA3g9O1dlYKV+wxqZJxbKnVDj0MWaKeZX3ySEHfmaDs0ZwkqKZzrikg
         Br30owMXCYClQb7MzXx8rrt7KI0nRyfh3SHjIscY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211101114205epcas2p2b8dd94830a757a67a328b683d4b98ca1~zaVoQ-pE_2816928169epcas2p2O;
        Mon,  1 Nov 2021 11:42:05 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HjWN66GQpz4x9Q5; Mon,  1 Nov
        2021 11:41:58 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.D4.10018.682DF716; Mon,  1 Nov 2021 20:41:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed~zaVh9TBM30536905369epcas2p4e;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101114158epsmtrp1185644d28b8f56f44e29d22b58d872d9~zaVh5ESh21195811958epsmtrp1C;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-f9-617fd2864ba1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B2.A4.29871.682DF716; Mon,  1 Nov 2021 20:41:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211101114158epsmtip27bb411339cbb4c0d03b5abd790daeeca~zaVhvCua23134731347epsmtip2D;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>, linux-i2c@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos-usi-hsi2c
 compatible
Date:   Mon,  1 Nov 2021 20:38:19 +0900
Message-Id: <20211101113819.50651-2-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101113819.50651-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdljTVLftUn2iQc8ZI4vL+7UtdjQcYbXY
        +PYHk0XH3y+MFpd3zWGzmHF+H5NF694j7BZ3989ldODwmNXQy+axaVUnm0ffllWMHp83yQWw
        RGXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gBdoaRQ
        lphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzI
        zvh27jVbwRnuir1nOlkaGLdwdjFycEgImEgsnWTUxcjFISSwg1Fi/+FVzBDOJ0aJG/PesEA4
        3xgltsxeDZThBOvYsXU5VGIvo0Tv3i4mCOcjo8S6JZNYQKrYBLQlvq9fzApiiwjUSbQ9nQHW
        wSywiVHiweQWZpDlwgKBEkd2WoLUsAioSkyZfoIRxOYVsJVYvrQJapu8xMQJ99hBbE4BO4l5
        1zrYIGoEJU7OfAK2ixmopnnrbLC7JQResks8n9QH1ewi8eLfDBYIW1ji1fEt7BC2lMTL/jZ2
        SADUS3y94QDR28MosabrFxNEjb3Er+lbWEFqmAU0Jdbv0ocoV5Y4cgtqLZ9Ex+G/UFN4JTra
        hCAa1STuTz3HBmHLSEw6shJqoIdEb/NnaOhOZJR4Pu8W0wRGhVlIvpmF5JtZCIsXMDKvYhRL
        LSjOTU8tNiowgkdwcn7uJkZwotRy28E45e0HvUOMTByMhxglOJiVRHgjLtQkCvGmJFZWpRbl
        xxeV5qQWH2I0BYb1RGYp0eR8YKrOK4k3NLE0MDEzMzQ3MjUwVxLntRTNThQSSE8sSc1OTS1I
        LYLpY+LglGpgmnomXkSN+/LxAzZ3+srLT35N9b7yaXKU8hPNTDPdbW0GmsGrEq7tUz042/em
        w3433bJl+n6LGBscGA+cXvNSf7pzDMNVxz0J9eUTtz/OXHyF4/BX4zWHGCrcZVVZdlxe8Ixz
        ScW/tDTbxbdO/jHe58EoyKDPl8J4dtryqZOKgrxSmUyOrNa9m7TcYMaL/HVHXCsMP/1frJyT
        viAynuPn82K1yivCCZ+ybDf+Vy+Z4XMl3M+ycll+OO/F5gr5g+ysX83mfppsPfGs1mntILdP
        9q971V4+6P76Zv2rqWVrmjRfaE39Z/fxjPn2Q/nmnP+/eJxaoqtZnnlkj4DEm/g3yd+LZ059
        pCEu971FPuFNhhJLcUaioRZzUXEiAMnqr4YdBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWy7bCSvG7bpfpEgwdLhCwu79e22NFwhNVi
        49sfTBYdf78wWlzeNYfNYsb5fUwWrXuPsFvc3T+X0YHDY1ZDL5vHplWdbB59W1YxenzeJBfA
        EsVlk5Kak1mWWqRvl8CV8e3ca7aCM9wVe890sjQwbuHsYuTkkBAwkdixdTkLiC0ksJtRYs0v
        Voi4jMTyZ31sELawxP2WI0BxLqCa94wSf1fNYwZJsAloS3xfvxisQUSggVFiZ4stSBGzwDZG
        icO3T4FNFRbwl3jz+RJYEYuAqsSU6ScYQWxeAVuJ5UubmCE2yEtMnHCPHcTmFLCTmHetA2gz
        B9A2W4kNU4IgygUlTs58AjaSGai8eets5gmMArOQpGYhSS1gZFrFKJlaUJybnltsWGCYl1qu
        V5yYW1yal66XnJ+7iREc0lqaOxi3r/qgd4iRiYPxEKMEB7OSCG/EhZpEId6UxMqq1KL8+KLS
        nNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGph09rO2Wp6I66+4d2Xm5CRxV0Wn
        SDuD6FyX+bOVt4dYts/ff41n60GpnXHytoevKjbfYFLa4H9VkumbAneJz9VrCpofl/Uedz6+
        a+e/nRpTg12nbD/+OX6q+hZbu4NLbcVuKrUyLNQ92GdwcnJqe3NDnnT69xxJkadvvCZl/+9i
        V4mTWLRyGkOY5DH55PeP+qtu7/qpuj+Jbw5fn+RdrsdGH2+fuH0naMqCat2T3UE1Rb1bGnI+
        z+u7ZvIsVJX76vvf6jcPqpx+YWQp9tPSZ8b6+oXN6/uuv7HK9Xgh4P42aeeMXfd1p9fErvu1
        0kR8bsf/F8sXJXJKhtRoLflrkhieanXMMTlYKO1DuVf/42lKLMUZiYZazEXFiQDHOBnF2AIA
        AA==
X-CMS-MailID: 20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed
References: <20211101113819.50651-1-jaewon02.kim@samsung.com>
        <CGME20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds new "samsung,exynos-usi-hsi2c" compatible.
It is for i2c compatible with HSI2C available on Exynos SoC with USI.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
index 2dbc0b62daa6..ce2373c7a357 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
@@ -14,6 +14,8 @@ Required properties:
 				on Exynos5260 SoCs.
 	-> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
 				on Exynos7 SoCs.
+	-> "samsung,exynos-usi-hsi2c", for i2c compatible with HSI2C available
+				on Exynos SoCs with USI.
 
   - reg: physical base address of the controller and length of memory mapped
     region.
@@ -31,6 +33,8 @@ Optional properties:
        at 100khz.
     -> If specified, the bus operates in high-speed mode only if the
        clock-frequency is >= 1Mhz.
+  - samsung,usi-sysreg : sysreg handle to control USI type.
+    -> sysreg phandle for "samsung,exynos-usi-hsic" compatible.
 
 Example:
 
@@ -46,6 +50,8 @@ hsi2c@12ca0000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	samsung,usi-sysreg = <&usi_sysreg 0x28>;
+
 	s2mps11_pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
-- 
2.33.1

