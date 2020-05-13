Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873FA1D120F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 13:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731897AbgEML7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 07:59:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53213 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731192AbgEML7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 07:59:41 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200513115939euoutp01065baee2f53b0ed755f8dae9cc6d9b97~OlKqw6V5j0807908079euoutp01T
        for <linux-i2c@vger.kernel.org>; Wed, 13 May 2020 11:59:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200513115939euoutp01065baee2f53b0ed755f8dae9cc6d9b97~OlKqw6V5j0807908079euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589371179;
        bh=IdU1TrJvYO6blvliMNv61kauZcbyiIKmS9RW9kJxmoo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=in/iFyv5pSQ9QNBYgdT6UmDCRpzQlyl+rI4C1gN3xw2yduRh1gs13zXi+wn/uaGvF
         MAy56qlh4Uh2Yhn5po0ilGLQZokUl9VkAtoPZueI34ozIn/eTinbo+D1U7O9oveirM
         QM55ozFDDqryjviAvNXdj0bdcwEfbQK3DDl9Gxag=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200513115939eucas1p29402f5f1d8f7e9a177769532dcf3c23f~OlKqiJF9-1130711307eucas1p2g;
        Wed, 13 May 2020 11:59:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 93.71.60679.A21EBBE5; Wed, 13
        May 2020 12:59:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200513115938eucas1p1266800d16772348d463297848374c9ce~OlKqJuoSe2297322973eucas1p1Y;
        Wed, 13 May 2020 11:59:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200513115938eusmtrp2c066742a3aa2966febea9984798726f9~OlKqJAP451935819358eusmtrp2a;
        Wed, 13 May 2020 11:59:38 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-72-5ebbe12adba7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E5.C8.07950.A21EBBE5; Wed, 13
        May 2020 12:59:38 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200513115937eusmtip1e2ae9d8134e109dab1204c98ee4bfcfb~OlKomfHiy1068710687eusmtip1O;
        Wed, 13 May 2020 11:59:36 +0000 (GMT)
Subject: Re: [PATCH -next 010/491] ARM/SAMSUNG EXYNOS ARM ARCHITECTURES: Use
 fallthrough;
To:     Stephen Boyd <sboyd@kernel.org>, Joe Perches <joe@perches.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1c198736-230f-d0e6-6866-58d2e4e9f412@samsung.com>
Date:   Wed, 13 May 2020 13:59:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158414865091.164562.17682025008359421835@swboyd.mtv.corp.google.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zlnOxtOjtPYm4XBqEAhzVI6qYl2gdGPlAqCSmvlQS1v7Khp
        hEmlqZmX/mhTUbJQJ6ZN09QQHei81CzM28qJqA0TE3WJl6k5zyL/Pc/zXp73+fhITNJLOJOR
        MfGMMkYRJeOL8MauVf0Rt4nW0KPpq770sNlE0EXjkzidOzmL0f39dQJaMzlE0AvZRoLO2DAj
        eqClmE8X9rfx6K+95+jNoXc4rW6xoAA7+fxImkDerBoTyDXqTL68/vVDuVk9hMlzGtRIvqRx
        CRZcFfmFMVGRiYzSw/+mKKLkrYmImyaS2uelqWgdz0JCEigv2Kp6JchCIlJCVSIwf1LbiBlB
        Zk0ljyNLCPJL1EQWIndGhqcvcXoFgo38Wj5HFhCUZRh41r2O1DWor1pFVuxEnYaGP307mzDK
        xIMZUzHfWuBTnvC8M2enSUz5w3D2I8KKceoQLI8N7vTsoUKgr7ze1uMAPS+ncOsVQuoirHQF
        WWWMkoJhqpTH4QPQNFeMWb2AMgpgM60acUHPQnXlex6HHeGXrkHA4f2w1VzK4wYeI8hu/S7g
        SB6CcV2ZbdoXfujX+FZnjHKF2hYP7ikCoXUtgYP2MDLnwN1gDy8aCzBOFkNGuoTbcRDW1QW2
        C5zh2dQWnodkql3BVLvSqHalUf23LUO4GkmZBDY6nGGPxTD33FlFNJsQE+5+OzZag7Z/WN+m
        zvwBtVhuaRFFIpmdmDa0hkoIRSKbHK1FQGIyJ/GF2m1JHKZIvs8oY28oE6IYVov2kbhMKj7+
        aiZEQoUr4pm7DBPHKP9VeaTQORWlpY/EVV3XF8XPeVn2lv9eQS5ND+abG71779ToTunjzxDd
        xs8njZ1+J3xcdR3tT+o9e5IOtwU1OmQoA4JnlxU/vYc+Nlnm9B1XClh3bcpWYdG3Cr/kN67t
        tV8Wk2RxTYbZ8z7rTwm3sY6JUMvAaJ1GmCJyDvS73D3qmJs9GLnoJMPZCIWnG6ZkFX8BkpCT
        N10DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xu7paD3fHGXzfo2px/ctzVovZ9x+z
        WPQ/fs1scf78BnaLTY+vsVp87LnHatHx9wujxeVdc9gsZpzfx2Rx8ZSrxb9rG1ksVu36w+jA
        4/H+Riu7x85Zd9k9Nq3qZPPYvKTe48uqa8wefVtWMXp83iQXwB6lZ1OUX1qSqpCRX1xiqxRt
        aGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5eglzF33XPWgqesFQfeizcw/mbpYuTg
        kBAwkbj+NLiLkZNDSGApo8Sb31wQYSmJ+S1KIGEJAWGJP9e62LoYuYBK3jNKtBy5zwSSEBaI
        lti88icjiC0i4CSx5etpsDizwEsmibl/TCAaZjFJND4+CpZgEzCU6D3aB9bAK2Ancb2niRXE
        ZhFQlfh29yobiC0qECux+lorVI2gxMmZT8Du5BQIkvhxzB9ivrrEn3mXmCFscYlbT+ZD7ZWX
        2P52DvMERqFZSLpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjddux
        n1t2MHa9Cz7EKMDBqMTDa3Frd5wQa2JZcWXuIUYJDmYlEV6/9UAh3pTEyqrUovz4otKc1OJD
        jKZAv01klhJNzgemkrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxS
        DYw8ZwwfXdxp87pAmDFWW+l8h8qt+YqXPb2fLDyf7KTb0pjz/bpeqKnNjpg7tzhK5H1jPD7V
        6B72fq4Ulyb9/N7/CbMVPq+4sP3udg+OP0q3z8iV+XyYsN+165W2x+mo+ulXT3fIOs7qbNc0
        mBgxtzFkbWz0eu3EFeffCUouy4+/dW+1zt72el0lluKMREMt5qLiRAA9cGJR7QIAAA==
X-CMS-MailID: 20200513115938eucas1p1266800d16772348d463297848374c9ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200314011736eucas1p2e71f57e25bfb59f38cd86247efb07943
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200314011736eucas1p2e71f57e25bfb59f38cd86247efb07943
References: <cover.1583896344.git.joe@perches.com>
        <1d569e023b6cb7b8d0da8d1bcccd92e97fe436c8.1583896348.git.joe@perches.com>
        <CGME20200314011736eucas1p2e71f57e25bfb59f38cd86247efb07943@eucas1p2.samsung.com>
        <158414865091.164562.17682025008359421835@swboyd.mtv.corp.google.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14.03.2020 02:17, Stephen Boyd wrote:
> Quoting Joe Perches (2020-03-10 21:51:24)
>> Convert the various uses of fallthrough comments to fallthrough;
>>
>> Done via script
>> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
>>
> 
> This link doesn't work for me. It leads to a redirect for 
> 
> https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
> 
>>  drivers/clk/samsung/clk-s3c2443.c | 2 +-
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

I have changed the link to
https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/

and applied.

-- 
Thanks,
Sylwester
