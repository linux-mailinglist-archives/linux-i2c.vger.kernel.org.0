Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9317A7C4F72
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 11:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjJKJ5H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 05:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjJKJ5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 05:57:06 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10FD94
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 02:57:04 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231011095702euoutp019852a50590da447ed09d1947f19c3341~NBRUf1mNZ1531815318euoutp01c
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 09:57:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231011095702euoutp019852a50590da447ed09d1947f19c3341~NBRUf1mNZ1531815318euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1697018222;
        bh=zb0dZYf/rhp1Apb/JKJ2R2CtIKSkKDPwQbFwS+fJQ/w=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=mup5MOpWAVL4JQehk/97RkSq1RDdpsZGdN13+XFla3X/A7W9mi22K+b0Xu6AKYN2I
         RiovNGvSkpk3nRrbIiUrEQTm3cdfzJkazvMlonYIesJhzqg9fimxoh92dfdm1WHtUG
         wbrUEoraf2kCFpwEutHBKzmEe/+aKOv67zJOav20=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231011095702eucas1p1fbfa61e7264aea4d67bccd93ec1e08d6~NBRUB3dpv1401914019eucas1p1s;
        Wed, 11 Oct 2023 09:57:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 1A.2B.11320.E6176256; Wed, 11
        Oct 2023 10:57:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231011095701eucas1p1afb457ed499787c127ee798adc87a0fd~NBRTgUQJ41404114041eucas1p14;
        Wed, 11 Oct 2023 09:57:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231011095701eusmtrp1a7c094b037c3638eab3937b77e2717bd~NBRTfZp9f0433404334eusmtrp1Y;
        Wed, 11 Oct 2023 09:57:01 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-ba-6526716e4532
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.74.25043.D6176256; Wed, 11
        Oct 2023 10:57:01 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231011095701eusmtip2b1aa6f9da8170841b9ef2d07cbd2c2ea~NBRS1uSTK1735217352eusmtip2K;
        Wed, 11 Oct 2023 09:57:01 +0000 (GMT)
Message-ID: <c7d8b05a-f5cb-49aa-95c0-48754fab1b7f@samsung.com>
Date:   Wed, 11 Oct 2023 11:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: brcmstb: Add support for atomic transfers
Content-Language: en-US
To:     Florian Fainelli <florian.fainelli@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <bec3b967-f287-4a99-9c79-3b949a31c296@broadcom.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87p5hWqpBm9f81nc/9rBaLG29yiL
        xbpt95gtdm84zGSx6fE1VouOv18YLS7vmsNmcXf/XEYHDo9Z98+yeWxa1cnmsXlJvcfnTXIB
        LFFcNimpOZllqUX6dglcGeseeBbcYqu4u+8vSwPjdtYuRg4OCQETiY6HqV2MXBxCAisYJfY+
        3sUC4XxhlHh5awNTFyMnkPOZUeLIKiEQG6Rh7vGFbBBFyxkl7v24A9XxkVHi3+kL7CBVvAJ2
        EkuezQBbwSKgKnFhpgJEWFDi5MwnLCC2qIC8xP1bM8DKhQWcJT43X2AEsZkFxCVuPZnPBDJT
        RGA6o8T395fYQRxmgb2MEnOurmYFqWITMJToetvFBrKAU8BB4t16D4hmeYntb+cwg9RLCDzg
        kJjce4MR4mwXiUfHzrJD2MISr45vgbJlJE5P7mGBaGhnlFjw+z4ThDOBUaLh+S2obmuJO+d+
        gW1jFtCUWL9LHyLsKPHn/iU2SEDySdx4KwhxBJ/EpG3TmSHCvBIdbdCQU5OYdXwd3NqDFy4x
        T2BUmoUULrOQ/D8LyTuzEPYuYGRZxSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZh+Tv87
        /mUH4/JXH/UOMTJxMB5ilOBgVhLhfZSpkirEm5JYWZValB9fVJqTWnyIUZqDRUmcVzVFPlVI
        ID2xJDU7NbUgtQgmy8TBKdXANPPFRWObQD7WU/0ShWV9zNL+SSHLDct6ZzDklVlWHIiqLCot
        s1Pnfn1Qgm/habFN19Sm5PmmWuzIY29vjnXtuT9RQ/ZC0NOq6QzsUTfOWm6TzCy4b/qmSfx8
        2n63hyy2NgY134vPC/HIfl+pHnbxlbm/oB3zzqBQVrtL67brTrd4uCb/559j8x0+HLvh5hUe
        7lfk/HfNVoYQq1Paq25yLd/Gn/b+8aSOKf+/zVPlXSwQ0tEfkZz48vyLusW+/amMLMKHYqIt
        bxrV7PbgnnLwRYA1Q9uU47/4xZpNJJXmHI3TWdTdJyG0b6K1wwHv8JeRk/e4C1tY9wdyzQ9Q
        Ppht25Ge//3AoxV2t9anr1FiKc5INNRiLipOBAB6guIWrgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7q5hWqpBi+O6Vrc/9rBaLG29yiL
        xbpt95gtdm84zGSx6fE1VouOv18YLS7vmsNmcXf/XEYHDo9Z98+yeWxa1cnmsXlJvcfnTXIB
        LFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gese
        eBbcYqu4u+8vSwPjdtYuRk4OCQETibnHF7J1MXJxCAksZZT4uO0MO0RCRuLktAaoImGJP9e6
        oIreM0o8bOpkAknwCthJLHk2A6iIg4NFQFXiwkwFiLCgxMmZT1hAbFEBeYn7t2aAzRQWcJb4
        3HyBEcRmFhCXuPVkPhPITBGB6YwSTx/vZQFxmAX2M0q8eXyKCWLbSUaJz4degJ3BJmAo0fUW
        5AwODk4BB4l36z0gJplJdG3tgpoqL7H97RzmCYxCs5AcMgvJwllIWmYhaVnAyLKKUSS1tDg3
        PbfYSK84Mbe4NC9dLzk/dxMjMOa2Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuF9lKmSKsSbklhZ
        lVqUH19UmpNafIjRFBgYE5mlRJPzgVGfVxJvaGZgamhiZmlgamlmrCTO61nQkSgkkJ5Ykpqd
        mlqQWgTTx8TBKdXAVKuf/arybPIV+YPF09SvP/GS79BNXhY3l1k5Wloj6Gzkm8m+HRGXt9Zv
        +hTno2U8+4HY4/tb+b+xrLi1WyLQ5VTrg99mqdMqP524keL7VkX87ExpW/t59mXnbp9atPba
        l/TZbyyOxrwP/7bKeeVn39NKD+N+NykcercgZmnWlP2iU5ucZWqZvv7RvfeJt4Vv2YvP08Kn
        7Hw47X/ghbWcUsWt9Uc1nWbssjuS/y1BQcq3Vv77bznfFTGts1mdL1oGb5s46ZsaX3hg8sKc
        Y5N3yHiEXFjbIdH/zeH6NKdrXGpLudgjvDZlz3eZLN/Lfbsy+svLhcfXHhLwPzBVvG5h3dew
        V5+VCpWj7k0TZJwtaabEUpyRaKjFXFScCAAH9hf5QgMAAA==
X-CMS-MailID: 20231011095701eucas1p1afb457ed499787c127ee798adc87a0fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
        <20231006144117.4079796-1-m.szyprowski@samsung.com>
        <bec3b967-f287-4a99-9c79-3b949a31c296@broadcom.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.10.2023 22:41, Florian Fainelli wrote:
> On 10/6/23 07:41, Marek Szyprowski wrote:
>> Add support for atomic transfers using polling mode with interrupts
>> intentionally disabled to get rid of the warning introduced by commit
>> 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
>> during system reboot and power-off.
>
> Is there an existing system that you have access to which needs atomic 
> transfer support, or is this a forward looking change?

Frankly speaking I've observed the mentioned warning during system 
reboot on RaspberryPi4 with linux-next kernel compiled from 
multi_v7_defconfig. It looks that this driver is used by VC4 DRM for 
DDC. This issue doesn't look critical, but the fix seems to be trivial, 
thus my patch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

