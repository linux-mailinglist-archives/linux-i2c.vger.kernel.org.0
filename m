Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371DB7B25E7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 21:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjI1TYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 15:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjI1TYb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 15:24:31 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230FD19F
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 12:24:29 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230928192427euoutp0291dd038a2b7d0c892fc749a6854aaf3c~JJoBImBY40642206422euoutp02g
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230928192427euoutp0291dd038a2b7d0c892fc749a6854aaf3c~JJoBImBY40642206422euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695929067;
        bh=jvtL1VAu+j8Nux3YIh70DiO3Jj6LPp7eha068sZx0eI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Eebf0wcZjxK/k/e5PTXcWNA/i8OP+Mw1mHS6bDOfaHBb8Sxs1hSP3mgZ385sAFvJj
         tHChLp1Jj18wk5erP6rgHlKyd5znHtJ2wCRO4Y+t6SBKUr5LlaJYSQJg9Ef/0xlYg9
         +cCqefzPLVQaI/DhF/QRKfEu5sqBE3ko3XXkwNfU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230928192426eucas1p20569a4214c499fa5fa10008bcbeaefd7~JJoAW0Zhu2294422944eucas1p2I;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 20.9A.37758.AE2D5156; Thu, 28
        Sep 2023 20:24:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192425eucas1p28a9aa6cca0b858dde92213eea1a58b08~JJn-2xlrC2293122931eucas1p2E;
        Thu, 28 Sep 2023 19:24:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230928192425eusmtrp2057f928de75cdfe135ebacdc9b4870bb~JJn-2SLj-2795027950eusmtrp2g;
        Thu, 28 Sep 2023 19:24:25 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-80-6515d2eaa398
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 81.F9.25043.9E2D5156; Thu, 28
        Sep 2023 20:24:25 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192425eusmtip24e3882211f961020d6f6ad96ae781824~JJn-YtM9Q2608726087eusmtip2T;
        Thu, 28 Sep 2023 19:24:25 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 0/3] Add atomic transfers to s3c24xx i2c driver
Date:   Thu, 28 Sep 2023 21:24:11 +0200
Message-Id: <20230928192414.258169-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMcRz2fd/rvfea4+2KPl2hXatNcWnCmSRbOGNza2Yro46+Kq7krpCx
        lbYktEM/dNWFbFLr2lrdpGiduHJSK7tFnTCJs8qPTlTirrfw3/N5Pp9nz/N896VJwUUnIZ2Q
        lIKVSXKFiHLm6B//fLbS2r0IrzI85Elea/WUZMCWjST3P9VzJdm/xpDkWucDQlLdauFKLM2l
        KIwrra08T0n7zU2UNLeuEkm/1S6VcaKcQ2KxIuE4VgaGxjjHa616KnmSOnm2+AuVjjqcchCP
        BiYYPhf0kA4sYCoQtA7YeWc7HkPQ+cFKssM3BHmF45w5Rc9Qz+ziNoJu41MOK7dLSvJ3OjDF
        BEHOcA7lwG5MGGirx7kOAcn0ICgo0ROOhSuzCdp0FvsRTXMYX7BYhA6az4SCeqwXsWbLoLml
        g2R5F2gvejfjRdr5zPrimRDAFNHQ1vCOYgXhcCuzdLabK1iNdVwWe8HvhjKCFZxDcH1yYHZQ
        I0gfejlrtwH6n03MJCKZ5VBzL5ClN8P30XEnBw3MAugddmFDLIAr+kKSpfmQnSVgr/1AY9T9
        tW3p6iZZLIVSk5lg32ofqDNNXDXy1vxXTfNfNc2/DNcRWYnccaoqMQ6rVifhE2KVPFGVmhQn
        Png0sRbZP4xp2mi7iyqsX8QGRNDIgIAmRW78N30CLODHytNOYeXRaGWqAqsMyJPmiNz5ARvb
        DwqYOHkKPoJxMlbObQmaJ0wnmH754Qn/qI1C05r4NKGOvnQp/O1lt8nx4KqQiAjB2tiFh7QZ
        L9u/BhE+cHr66kKcuNemNk3lBelSdGhHW9/oUJ5Csd/z2Po+7yXz40ebAw97a1p9I9ylpo84
        uKbsVcudYVud72cf848t2ynR8c5dsl03tNFDH0cqjhHlHhlmgw9ZNW+k8VGtOxaPXBBfeVzS
        2L8tpmTlU02xVzhv3e5yGdNohAazIYY3+KTjfIPMyI2SKLpMhc9XOAXY3r/P4Ze7NIf13Yz0
        yth0ezp/WfWB3iaejMtJ9myZmh54UeBVlR+5tcwQmTsVa6GrQrN2M+kefiEeaPGewbjBsqwz
        B0QcVbw8yJ9UquR/AHtbckSfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsVy+t/xe7ovL4mmGrQ8VrV4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mea+2sRX8
        Zqtomv2RrYHxLGsXIyeHhICJxOXnl5m7GLk4hASWMkpceDCfESIhI3FyWgNUkbDEn2tdbBBF
        nxglrt77yQySYBMwlOh6C5Lg5BARcJK4vWgWK0gRs8B1RonvB/6BTRIWsJc4se4uUBEHB4uA
        qsTdu1IgYV4BO4kJX25ALZOX2H/wLDNEXFDi5MwnLCA2M1C8eets5gmMfLOQpGYhSS1gZFrF
        KJJaWpybnltspFecmFtcmpeul5yfu4kRGNrbjv3csoNx5auPeocYmTgYDzFKcDArifA+vC2U
        KsSbklhZlVqUH19UmpNafIjRFOi8icxSosn5wOjKK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQS
        SE8sSc1OTS1ILYLpY+LglGpg2nqneE3zYqX583PYW3zjVvIbnDFt7Xx1yVpBOtp/Wuu35vi5
        uix7O/byztOLaA9OqRXgaGj1yDl099DObX9rXk/vcP4vbH3g/uLH+rbOkjLVRy8Edp/eZ6M5
        K6fXk+H8Pln+gOAN5fIPVghKT5pltEd3jdaxYx/3utnN8QrdWuPq/sjX7HEal0f4vmcxDQlT
        p2h+nyp+PPwyo4T6qyTeu37VCtWJPMeY5zFrFvefS/aaOOFOxOSjzUFd995I70qZqrp83Xy1
        vprnCh9E2EocHu+Z6/neaMFr5lapvOzvLiwMPTuubb5+fG3QAYkiU5H9b3g1a08uu204yfmU
        2dpNBp4FLkViTgscvAoKdh5WYinOSDTUYi4qTgQA+Lqi7fYCAAA=
X-CMS-MailID: 20230928192425eucas1p28a9aa6cca0b858dde92213eea1a58b08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928192425eucas1p28a9aa6cca0b858dde92213eea1a58b08
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928192425eucas1p28a9aa6cca0b858dde92213eea1a58b08
References: <CGME20230928192425eucas1p28a9aa6cca0b858dde92213eea1a58b08@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear All,

This patchset adds support for atomic transfers, which has been added to
the i2c core recently by the commit 63b96983a5dd ("i2c: core: introduce
callbacks for atomic transfers"). Almost everything needed for that was
already in the driver as so called polled mode. Unfortunately, that
polled mode has been tested only with single message write transfers so
far and it turned out that it doesn't work well with read and
multi-message transfers, so first it had to be fixed.

Best regards,
Marek Szyprowski



Patch summary:

Marek Szyprowski (3):
  i2c: s3c24xx: fix read transfers in polled mode
  i2c: s3c24xx: fix transferring more than one message in polled mode
  i2c: s3c24xx: add support for atomic transfers

 drivers/i2c/busses/i2c-s3c2410.c | 55 +++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 19 deletions(-)

-- 
2.34.1

