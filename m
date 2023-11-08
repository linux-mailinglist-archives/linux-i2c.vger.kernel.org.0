Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693347E5B9E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 17:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjKHQoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 11:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjKHQoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 11:44:08 -0500
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05EA1FD4
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 08:44:05 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231108164404euoutp029c7a8134e89107ba4a763407a6731754~Vs4sQBWXQ0638706387euoutp02U
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231108164404euoutp029c7a8134e89107ba4a763407a6731754~Vs4sQBWXQ0638706387euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699461844;
        bh=gXlGQmzk9i4mRTF0XMAKMYeTkT/2BXpgWocyKHGBjrQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=lx0qBqjXC47wHaf4AHVqKVcfZcMWjUbIG6RRtMCzrSKxCkfS41HkZHBLGmn/hEGx6
         R95DaV6L9FwHukN26iN4Ko2Ul24sUqVWIhzv8GIzje1iYquYL0wUU5mgCt5kXcv+QN
         RVw/tM19GD9fa+RaVtGvLMNaBagwGVp7HcGe5Ysw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231108164403eucas1p1d93ecb9484f75292684525ec17d9fe1e~Vs4sALl-c2061420614eucas1p1B;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E4.D2.42423.3DABB456; Wed,  8
        Nov 2023 16:44:03 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828~Vs4rf_W1V0925609256eucas1p1T;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231108164403eusmtrp2edba905f8ed0c0ce5f45d1cfec5a404b~Vs4rfRAHH2869928699eusmtrp2G;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-1c-654bbad3a6e5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.12.25043.3DABB456; Wed,  8
        Nov 2023 16:44:03 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164402eusmtip21c14d69b4429fc29733d7ece16bd9698~Vs4q6pciZ0430704307eusmtip2z;
        Wed,  8 Nov 2023 16:44:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 0/3] Add atomic transfers to s3c24xx i2c driver
Date:   Wed,  8 Nov 2023 17:43:51 +0100
Message-Id: <20231108164354.712406-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87qXd3mnGjx6YWTxYN42Nov7XzsY
        LS7v17bY+3oru0XH3y+MFjPO72OyWHvkLrvF3f1zGR04PDat6mTzuHNtD5tH35ZVjB6fN8kF
        sERx2aSk5mSWpRbp2yVwZSy7s5S94B1HxZm/R5gbGHvZuxg5OSQETCR237/D3MXIxSEksIJR
        4u7J2SwQzhdGiaez10E5nxklpvw5zAbTcvPYKSYQW0hgOaPEvHemcB0PpvSCFbEJGEp0ve0C
        s0UEHCTmrf0Oto9Z4B+jxPcveiC2sICTxM+LDWA1LAKqEsd/fmAGsXkF7CSmNu1ghFgmL7H/
        4FmouKDEyZlPWCDmyEs0b50NdreEwFwOib23lgMN4gByXCTOHYDqFZZ4dXwL1J8yEv93zmeC
        qG9nlFjw+z6UM4FRouH5LagOa4k7536BDWIW0JRYv0sfIuwocXbWNFaI+XwSN94KQtzAJzFp
        23RmiDCvREebEES1msSs4+vg1h68cIkZwvaQ2PXtNCMk3GIlJhyayTqBUWEWks9mIflsFsIN
        CxiZVzGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgQmmtP/jn/awTj31Ue9Q4xMHIyHGCU4
        mJVEeP/ae6QK8aYkVlalFuXHF5XmpBYfYpTmYFES51VNkU8VEkhPLEnNTk0tSC2CyTJxcEo1
        MAXFzzp7SWXrvQj+JWml93NnH7x9vdPww44Ljv/ue98pdjvlcVtyz69+/YAqjQS9FR6vdpa+
        rlGYcYB1zmWj+nNhLSxHed69zEp7y9JX19q7bvXtG9PSyyvElzHGsFVI7vo4p0C2/uJvs1UP
        kgwSmdz9txxzMWQXipH98/Kj0NMbt4o5X9QcDfvN9FezNog9ebHe5XWLtQom7/qzedn7msXH
        bvzQv1vSfPtIz/T2ujDmxtPrZwpLNagzaN1Sv/5L7Jp2/pHPL8oMT/jLrbkj9mb1lNyQjUvf
        HPOUflIgWFUWHf5DxuLz+4qV9upLjDK0vt56OcVVd6r4y7g9WddminA0Hn33+UnD6m/SLruK
        J59VYinOSDTUYi4qTgQAqyNkiaMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsVy+t/xe7qXd3mnGmy/KmrxYN42Nov7XzsY
        LS7v17bY+3oru0XH3y+MFjPO72OyWHvkLrvF3f1zGR04PDat6mTzuHNtD5tH35ZVjB6fN8kF
        sETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZSy7
        s5S94B1HxZm/R5gbGHvZuxg5OSQETCRuHjvF1MXIxSEksJRRonfnTBaIhIzEyWkNrBC2sMSf
        a11sEEWfGCXW9nxgAkmwCRhKdL0FSXByiAg4SdxeNIsVpIhZoIlJouPEIrAVwkCJnxcbwIpY
        BFQljv/8wAxi8wrYSUxt2sEIsUFeYv/Bs1BxQYmTM5+AXcEMFG/eOpt5AiPfLCSpWUhSCxiZ
        VjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgQG+bZjP7fsYFz56qPeIUYmDsZDjBIczEoivH/t
        PVKFeFMSK6tSi/Lji0pzUosPMZoC3TeRWUo0OR8YZ3kl8YZmBqaGJmaWBqaWZsZK4ryeBR2J
        QgLpiSWp2ampBalFMH1MHJxSDUw7T7u285QeWCp7K3ffXId5S/idYv9O2bWI9X+WWGr2l+Wr
        vSbaf35/RFhMxpxDKN2Lr/59o9aCZTO0Dl/3P7Ux0bEyxF1u8s+S3Oqj8t9v6nqkXz0ie+LE
        D76L332XRzuv2/a2ffbxNcvcViySMe4tjD556su1ar8tpby1Vz6J/zPtC0ht0GJmknvzeMLa
        S6wlEpvu3Lg1/95Oq2/TjnyYydI21/Jx9KW/kZI+P/+5/N0vXNDnU7C3aknlsT01T7Zt/HHn
        VMmUly2T9V/dU5l+/MsJXfM7GVH7/aoa5u1yepZ57dTZDos3nNNKX3OFns/bscTgoh/TRJaz
        jOLqiT8OLtG+yPgtg+lgjerr251+8kosxRmJhlrMRcWJAB3nuvf7AgAA
X-CMS-MailID: 20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828
References: <CGME20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear All,

This patchset adds support for atomic transfers, which has been added to
the i2c core recently by the commit 63b96983a5dd ("i2c: core: introduce
callbacks for atomic transfers") to hide warnings observed during system
reboot and power-off. Almost everything needed for that was already in
the driver as so called polling mode. Unfortunately, that polling mode
has been tested only with single message, write transfers so far and it
turned out that it doesn't work well with read and multi-message
transfers, so first it had to be fixed.

Best regards,
Marek Szyprowski


Changelog:
v4:
- added a comment about the delay value

v3:
- fixed style issue pointed by Andi, extended commit message

v2:
- updated and extended commit messages


Patch summary:

Marek Szyprowski (3):
  i2c: s3c24xx: fix read transfers in polling mode
  i2c: s3c24xx: fix transferring more than one message in polling mode
  i2c: s3c24xx: add support for atomic transfers

 drivers/i2c/busses/i2c-s3c2410.c | 61 +++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 21 deletions(-)

-- 
2.34.1

