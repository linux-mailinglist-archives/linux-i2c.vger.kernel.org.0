Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD117DCF69
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 15:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbjJaOnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 10:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbjJaOnG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 10:43:06 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEBADA
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 07:43:03 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231031144300euoutp01b3b3e8652066f8ac9896a10df93a5c79~TOEtQ1yfB0837908379euoutp01F
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231031144300euoutp01b3b3e8652066f8ac9896a10df93a5c79~TOEtQ1yfB0837908379euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698763380;
        bh=M1VOT/wnYBEVpplIfhFiz/j+COOovxfcbFgBB2hb6Wc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=AmyKs3fJKM6AnecMj5rrEU35bq+GG4jYMirlfbFj/jVGAgNOKnYWvpJLr5WpFh7mP
         aJ7anmsrYsKFead54Eu8BWo4YQRx4SiR+uWXLM954I70+6+oN9sBnfJTNXrn0MyyeJ
         A51iglApGfTVNP1f1a+cqcEM65sh8wgvnb7BtPSw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eucas1p1119502dad12149fa1c5639c6c105c45a~TOEs3h93m2373223732eucas1p1x;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D8.F5.11320.37211456; Tue, 31
        Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231031144259eucas1p181b91aded840d6706c569530488e683e~TOEsSPbXn2373223732eucas1p1w;
        Tue, 31 Oct 2023 14:42:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231031144259eusmtrp2e03a543eaab67bff4a62522315ef042d~TOEsRrk1E2417424174eusmtrp2U;
        Tue, 31 Oct 2023 14:42:59 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-6a-6541127368d6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.7A.10549.37211456; Tue, 31
        Oct 2023 14:42:59 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144258eusmtip205e6b8aa4a451b0ca1f6872336952d9a~TOEruyvqs1965119651eusmtip2J;
        Tue, 31 Oct 2023 14:42:58 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 0/3] Add atomic transfers to s3c24xx i2c driver
Date:   Tue, 31 Oct 2023 15:42:49 +0100
Message-Id: <20231031144252.2112593-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7olQo6pBoc+MVo8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFFcNimpOZllqUX6dglcGVsnL2Us2MNRsfPaU5YGxhdsXYycHBICJhLzLt1l7GLk4hASWMEo
        8XzWDLCEkMAXRomVp+UhEp8ZJf5eeQbXcf3BI6iO5YwSe0+dYYNwgDoezFrKCFLFJmAo0fW2
        C6xDRMBBYt7a7+wgNrPAP0aJ71/0QGxhASeJz/N6mboYOThYBFQlLj4pAwnzCthLbJ75mRFi
        mbzE/oNnmSHighInZz5hgRgjL9G8dTYzyF4JgbkcEi0TbzBBNLhIzF97GsoWlnh1fAs7hC0j
        8X/nfCaIhnZGiQW/70M5ExglGp7fglpnLXHn3C82kIuYBTQl1u/Shwg7Sly7/YYZJCwhwCdx
        460gxBF8EpO2TYcK80p0tAlBVKtJzDq+Dm7twQuXmCFsD4k3E5YxQkI3VmL7oytsExgVZiF5
        bRaS12Yh3LCAkXkVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYKI5/e/4lx2My1991DvE
        yMTBeIhRgoNZSYT3sKlDqhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5VCGB9MSS1OzU1ILU
        IpgsEwenVANT8K9Fk1dcktLLVl4TpxLbrOXOKDrj36fuJVe3eJ9nXLG5na3oSUnGpuTvWdc9
        zrvf7nq9qWTG3d+TV2+P5bU/rXtk8g6FTxXlTOfKd9115pskni14Yrdmg3+ei4daakLamcPr
        2EzUp57Wvhcf+Lw4bM6ZIK6fehdljzLFTziT8Lo4S7zT12TPLY+/3Q5mii0u3z+xrvt6nm/b
        vm2FTtLdbO/fy2xgzjmrwzpDo2TxmlY102sX/cNt5FSstUpnMC3afqvVM9L55gxFs0t+hVsd
        sjRfFc15tGqWzK/G+7Pvzdb2NZ20nDWneEq33OENyz25+CLlGZYeXd8nLHqw6i/3sfsyxs3m
        rM02U9P17Q2UWIozEg21mIuKEwEhiEKdowMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsVy+t/xe7rFQo6pBi++ils8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GVsn
        L2Us2MNRsfPaU5YGxhdsXYycHBICJhLXHzxi7GLk4hASWMoo8fn8QSaIhIzEyWkNrBC2sMSf
        a11sEEWfGCWWn38L1s0mYCjR9bYLzBYRcJK4vWgWK0gRs0ATk0THiUXsIAlhoMTneb1AUzk4
        WARUJS4+KQMJ8wrYS2ye+ZkRYoG8xP6DZ5kh4oISJ2c+YQGxmYHizVtnM09g5JuFJDULSWoB
        I9MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwBDfduzn5h2M81591DvEyMTBeIhRgoNZSYT3
        sKlDqhBvSmJlVWpRfnxRaU5q8SFGU6DzJjJLiSbnA6MsryTe0MzA1NDEzNLA1NLMWEmc17Og
        I1FIID2xJDU7NbUgtQimj4mDU6qBSXyN5dTdE3W+biu8cVR4gwjHof3L5T+2KbvViZzeZCu1
        6NvLnxNTrxtIO/JNt2rcN8G6Pnjn/qtnq57cSP+vlPnJ9t6XH21tZVXCR0zqnWa2hZ247PJ2
        /1PTF7KGOU4dDwy35k4Kv9bxc+Uxy388ayfPu92astFqxi4D2YS5GvPm1PtvDVSIurmR8bxa
        yzPWXypuLGzrCvm0bplOcLs0OdGn+/YXRZvFeyUe1LSyvODmzlmVP1P98ee7GRcUPH2YpA73
        XFmrfnie7gwNIabCdsWjt3ufBzKpx97K8/Y68XaxyLvw8i4z9hN3ahg/ljRtCtDgZjt6zLRz
        WjdzlEDB5fRNM04sZfqw+1GdvN/2I0osxRmJhlrMRcWJAOlcphP6AgAA
X-CMS-MailID: 20231031144259eucas1p181b91aded840d6706c569530488e683e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231031144259eucas1p181b91aded840d6706c569530488e683e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031144259eucas1p181b91aded840d6706c569530488e683e
References: <CGME20231031144259eucas1p181b91aded840d6706c569530488e683e@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
v3:
- fixed style issue pointed by Andi, extended commit message

v2:
- updated and extended commit messages


Patch summary:

Marek Szyprowski (3):
  i2c: s3c24xx: fix read transfers in polled mode
  i2c: s3c24xx: fix transferring more than one message in polled mode
  i2c: s3c24xx: add support for atomic transfers

 drivers/i2c/busses/i2c-s3c2410.c | 57 ++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 21 deletions(-)

-- 
2.34.1

