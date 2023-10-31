Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1F27DCE8D
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 15:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344745AbjJaOAT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 10:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344733AbjJaOAS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 10:00:18 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E7FDE
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 07:00:15 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231031140014euoutp020403bfd5acf5c999410902b26ccd09cb~TNfW-DgGu0849908499euoutp027
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 14:00:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231031140014euoutp020403bfd5acf5c999410902b26ccd09cb~TNfW-DgGu0849908499euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698760814;
        bh=AAGnF91w3687szcun8VcMO7SfudWTWRrC6YeX+6Ha24=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=PFRR3VesLjnHRTw2nMNKgZfYkvefMcFBsEBVjkoUVix6agk3ZWiRrBsBXqfZySET7
         /JLJb1VJCzFf36PP6aoBUpMgiRPwjKC3MfZgViftAbUOnnVXDFZK03QZHNMT7HcfKH
         iK3OmpKvnlsSuHP/FP9rlP+oKrQpgvmaEOwZU8bw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231031140013eucas1p1d1a1b5b2bd45c48ae96d48618438edac~TNfWv-4ao3035230352eucas1p13;
        Tue, 31 Oct 2023 14:00:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 82.A8.42423.D6801456; Tue, 31
        Oct 2023 14:00:13 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231031140013eucas1p1854dc1cd3659600ab2018207f748aa23~TNfWYnBj70174601746eucas1p1b;
        Tue, 31 Oct 2023 14:00:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231031140013eusmtrp24e6a23dba09cd94b63e5f1f539f16b5f~TNfWYCJRb0155001550eusmtrp24;
        Tue, 31 Oct 2023 14:00:13 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-66-6541086d8206
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1A.42.10549.D6801456; Tue, 31
        Oct 2023 14:00:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231031140012eusmtip10f8b43ad2f850150bf478e89eabf9f8c~TNfV5gVa_2555925559eusmtip1M;
        Tue, 31 Oct 2023 14:00:12 +0000 (GMT)
Message-ID: <8a943c72-6387-43c7-9d3f-f99bb00738c5@samsung.com>
Date:   Tue, 31 Oct 2023 15:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Language: en-US
In-Reply-To: <20231027133950.kntkq6ddgifaor76@zenone.zhora.eu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87q5HI6pBsfP6lg8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou7++cyOrB5bFrVyeZx59oeNo++LasYPT5vkgtgieKySUnNySxL
        LdK3S+DKWHV/GVPBFLGK7qMTWRoYLwt2MXJySAiYSBw42MLYxcjFISSwglHizI4XrBDOF0aJ
        1jln2SCcz4wSx9c9YYVpadm/H6plOaNE17sGqKqPjBLtf/+zgFTxCthJvDm7hwnEZhFQlfj9
        6gorRFxQ4uTMJ2A1ogLyEvdvzWAHsdkEDCW63naxgdjCAj4S5/pegMVFBNQkXi/+BDaHWeAA
        o8TevgoIW1zi1pP5YHFOoF2zPnZB1chLbH87hxnkIAmBMxwSq9+1M0Kc7SJx8OIiFghbWOLV
        8S3sELaMxP+dIINAGtoZJRb8vg/lTGCUaHh+C6rbWuLOuV9A53EArdCUWL9LHyLsKLFu+haw
        sIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYp7AqDQLKVhmIXltFpJ3ZiHs
        XcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMw5Zz+d/zTDsa5rz7qHWJk4mA8xCjB
        wawkwnvY1CFViDclsbIqtSg/vqg0J7X4EKM0B4uSOK9qinyqkEB6YklqdmpqQWoRTJaJg1Oq
        gSnBqdrF7yWv18GjGepB6/tf+MzRkhDO+xY+7+Lj8sQLtYc8Qq3dGP7snDxtQUn33N0T+kPU
        o/6mSv81u26kfonR8vbLfxVF+Qmyb+M0Ol66WlboVWed5r39MC6DqSnx5MqgmOVaCu9f2u/f
        4SepVt04eZe5WujRdsWuX7VtS9Z7FGlY25y7y7Iubm7LRsn3AqLH+7xC3V5If5z89HB98PHl
        G/XcLZ7Me1KxanWWVOZO3cyjBwuPBuuls+2RK3Pi6J7z7NekrOeB3/nr33fGlSd8O+28LyBJ
        bCWnxS6bf68dHquv8X+Soye7u9jx4wWHypZ00WmsU9dP9m+74665jFvg7JyjOvwqTgUFL544
        K7EUZyQaajEXFScCAOjQvwyoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7q5HI6pBv+bhC0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8Xd/XMZHdg8Nq3qZPO4c20Pm0ffllWMHp83yQWwROnZFOWXlqQq
        ZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlrLq/jKlgilhF99GJ
        LA2MlwW7GDk5JARMJFr272fsYuTiEBJYyigxbc8HZoiEjMTJaQ2sELawxJ9rXWwQRe8ZJY4e
        PMUOkuAVsJN4c3YPE4jNIqAq8fvVFVaIuKDEyZlPWEBsUQF5ifu3ZoDVswkYSnS9BRnEySEs
        4CNxru8FWFxEQE3i9eJPTCALmAUOMEr03ZvACrHtJ6PEu/OLwDYwC4hL3HoyH8zmBNo862MX
        VNxMomtrFyOELS+x/e0c5gmMQrOQHDILSfssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqX
        rpecn7uJERhl24793LyDcd6rj3qHGJk4GA8xSnAwK4nwHjZ1SBXiTUmsrEotyo8vKs1JLT7E
        aAoMjYnMUqLJ+cA4zyuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRq
        YMpl5knYfazTvyA+xKwn7nSJpr1rnpNOk13w5wQ9I8Unef4TbF4UTWx1t2as7X8snSQ+tzhm
        /64jUbo7NypLzJpwb33otTXPV7ArzPhacL0sp/Bt5vTC2NWv79T8cc1azal1uP1eztqQnNt8
        S4XnLZh+U+DW2xmezyYUWHRaf1ukq298LaVXa9kz09jfLwRUBbgVZp8uiGML1RYP6FtzQKUl
        t6H3V2ao0WVzI5duu+vO8zw9PdsXtMvs6EuUXJRnJPm1qvXHW/aKtD7j027v/2evevsmcJXz
        Q9f950K/npux7+Wa7upMG+YdepG50hrL4+cfXsbOWhKac9h5qZukY8e3/TqrFnpPP+505FCK
        EktxRqKhFnNRcSIARNJkKDsDAAA=
X-CMS-MailID: 20231031140013eucas1p1854dc1cd3659600ab2018207f748aa23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
        <20231025121725.46028-2-m.szyprowski@samsung.com>
        <20231027133950.kntkq6ddgifaor76@zenone.zhora.eu>
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

Hi Andi,

On 27.10.2023 15:39, Andi Shyti wrote:
> On Wed, Oct 25, 2023 at 02:17:23PM +0200, Marek Szyprowski wrote:
>> To properly handle read transfers in polling mode, no waiting for the ACK
>> state is needed as it will never come. Just wait a bit to ensure start
>> state is on the bus and continue processing next bytes.
>>
>> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>> ---
>>   drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index 127eb3805fac..f9dcb1112a61 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
>>   	int tries;
>>   
>>   	for (tries = 50; tries; --tries) {
>> -		if (readl(i2c->regs + S3C2410_IICCON)
>> -			& S3C2410_IICCON_IRQPEND) {
>> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
>> +
>> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
>> +			usleep_range(100, 200);
>> +			return true;
> What is the real issue here? Is the value of S3C2410_IICCON_ACKEN
> enabling/disabling irq's?

It is not about the enabling/disabling interrupts, but controlling the 
bus state. This bit is named as 'Acknowledge generation / I2C-bus 
acknowledge enable bit' in Exynos reference manual:

In Tx mode, the I2CSDA is idle in the ACK time.

In Rx mode, the I2CSDA is low in the ACK time.

So it is a part of proper controlling the bus state, not the reported 
interrupts, although the S3C2410_IICCON_ACKEN name is a bit misleading 
in this case.


> Besides, if we use polling mode, shouldn't we disable the acks
> already in probe (even though they are disabled by default),
> never enable them before starting the message and avoid checking
> here everytime?


I assume that this polling mode is a special case, so there is no point 
in optimizing it much. It is used only by the i2c core for some special 
transfers to the PMIC during system reboot/shutdown or by the s3c24xx 
i2c controller embedded in SoC for controlling some PHYs. Till now only 
the second case was actually used. There were only a few single writes 
done this way, so noone even noticed that the other types of transfers 
(multi message or read) were broken... I found all those issues by 
enabling polling mode unconditionally and fixing it to make all my test 
systems working again.


>> +		}
>> +		if (tmp & S3C2410_IICCON_IRQPEND) {
>>   			if (!(readl(i2c->regs + S3C2410_IICSTAT)
>>   				& S3C2410_IICSTAT_LASTBIT))
>>   				return true;
>> -- 
>> 2.34.1
>>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

