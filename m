Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA4E7DF0E4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 12:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347241AbjKBLIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 07:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347222AbjKBLID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 07:08:03 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BF7130
        for <linux-i2c@vger.kernel.org>; Thu,  2 Nov 2023 04:07:54 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231102110753euoutp02f0b5b75036017ff6f07a6f600016a56a~Tybc40EEA3117231172euoutp02e
        for <linux-i2c@vger.kernel.org>; Thu,  2 Nov 2023 11:07:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231102110753euoutp02f0b5b75036017ff6f07a6f600016a56a~Tybc40EEA3117231172euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698923273;
        bh=6MDxN5SgU4N6F07EcKF5xP7PSsT4T6UGX8g4k89pqn8=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=OrYsf+vV09FXLh4SWKzHlvqUkCgrniwY6Uawvv9eT8pQdX1dXrKlrKva0EYOCV9WX
         tSA6hIO34ETwktyHY5GPx7Cwu1ywo/wwnJ2yFJ9WDyu6dlu4vrtl5yoitVbM31d8qt
         fGVy1xl0BrXgdXN45mrFEb90Re3tRi8T3anABQ5M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231102110752eucas1p260fcd707db221deb3b4cde601ecccf31~Tybb5UFr01315513155eucas1p2X;
        Thu,  2 Nov 2023 11:07:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 59.67.52736.80383456; Thu,  2
        Nov 2023 11:07:52 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231102110751eucas1p2d6360bd156c1f7bf0f8e7455c30ca396~TybbaTkNO1726917269eucas1p2X;
        Thu,  2 Nov 2023 11:07:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231102110751eusmtrp1e6e9025e4cf3bc37dd2b23f563a7c9f4~TybbZw9R21395113951eusmtrp1-;
        Thu,  2 Nov 2023 11:07:51 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000ce00-05-65438308d9a0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4A.E9.10549.70383456; Thu,  2
        Nov 2023 11:07:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231102110751eusmtip24a4924d9647b535718dc72e9749def7f~Tyba7d6Uz0356403564eusmtip2I;
        Thu,  2 Nov 2023 11:07:51 +0000 (GMT)
Message-ID: <a5b05328-4721-4cd2-834d-3cc52796ff1f@samsung.com>
Date:   Thu, 2 Nov 2023 12:07:50 +0100
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
In-Reply-To: <20231102004955.cjp7vfdaqjlwhnyo@zenone.zhora.eu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7oczc6pBs37WSwezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8Xd/XMZHdg8Nq3qZPO4c20Pm0ffllWMHp83yQWwRHHZpKTmZJal
        FunbJXBlNH38yVawV77ix9OrLA2MqyS7GDk5JARMJE693M3YxcjFISSwglFiysYV7BDOF0aJ
        G33zWEGqhAQ+M0ps/mAD0/Fo6zOoouWMEjO6pzBBOB8ZJZ6vmcwCUsUrYCexd/8XJhCbRUBF
        4sunz6wQcUGJkzOfgNWICshL3L81gx3EZhMwlOh628UGYgsL+Eic63sBFhcRUJN4vfgT2Bxm
        gQOMEnv7KiBscYlbT+aDxTmBdv3fdxeqRl5i+9s5zCAHSQhc4JDom7aLDeJsF4nJ67ayQtjC
        Eq+Ob2GHsGUkTk/uYYFoaGeUWPD7PhOEM4FRouH5LUaIKmuJO+d+AU3iAFqhKbF+lz5E2FFi
        3fQtYGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8gVFpFlKwzELy2iwk
        78xC2LuAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYMI5/e/41x2MK1591DvEyMTB
        eIhRgoNZSYT3sKlDqhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5VCGB9MSS1OzU1ILUIpgs
        EwenVAMTa9bGHMfSsFd7HB5UWtTFbFdjPWSlW/K7at2J404RYvbVXvbifBXGf9epTjKr/cJf
        XnNkcv/Eqq67M7gqvgb53LyY3TV7c3aPgJU0C8vmsPbW8xstXV/17mM8tztKPeFg0kSD2r0N
        Uqs1JJfYW659otTRt6Xs8rMZUhx3D+Y+5hPZL9/zI+hDQcyetL6VnNpx/Xc3+rQ536ktDPnW
        tuNPt+XZw0tnlt9zk7EQW6Z5NvbO/o21fQnyiSunt/f+vcuXKW+cKr7wduSJAxznLdMWqLWp
        rzUP+WvqEfbJok9P9cAatkbmpVxFAvo5ckd1v++t7o2om7hngXy/0tT5RvpzTyzpuzjrPu/m
        +ofTM5VYijMSDbWYi4oTAViwHiCnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7rszc6pBpMfKlo8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou7++cyOrB5bFrVyeZx59oeNo++LasYPT5vkgtgidKzKcovLUlV
        yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLaPr4k61gr3zFj6dX
        WRoYV0l2MXJySAiYSDza+oy9i5GLQ0hgKaPEiXOzWSESMhInpzVA2cISf651sUEUvWeUmLD7
        AxtIglfATmLv/i9MIDaLgIrEl0+fWSHighInZz5hAbFFBeQl7t+awQ5iswkYSnS97QLrFRbw
        kTjX9wIsLiKgJvF68ScmkAXMAgcYJfruTWCF2PaISWLixLNgHcwC4hK3nswH28YJtPn/vrtM
        EHEzia6tXYwQtrzE9rdzmCcwCs1CcsgsJO2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWle
        ul5yfu4mRmCUbTv2c/MOxnmvPuodYmTiYDzEKMHBrCTCe9jUIVWINyWxsiq1KD++qDQntfgQ
        oykwNCYyS4km5wPjPK8k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1Oq
        ganV1DZj02uh/kLu6eeXPTDgPNf4ZopjwvoNCR/nvNezNfkvF70jM2ZeUnDZiX06rNGPNh79
        0dRqmBr8r7pqHueTl3WP21b+6vSrEe54Xc+teMPpsWuF4tVQUf6HJd9rfwZ86Op59HSJzcX9
        sXxeQXGMOdGnZ8565XRsc+YGb40tvUtbOJQuWnjFOL0Kspnfe3d+dUNpbaueksodV8V3E86X
        vbD+uJZVvvSM0+u1nZcPO2TGFXo5nKq1P7lyy7evpS46789K/uO6cP9z4skZE0QN7kc+u7it
        eV6xxb5LXIpXl8qE8K7QviqzpNWnndtZl5fR4VvuFwHOyfLPo2Ne7jaQdk9/8v/+tQVPBSJm
        7VRiKc5INNRiLipOBACiGEliOwMAAA==
X-CMS-MailID: 20231102110751eucas1p2d6360bd156c1f7bf0f8e7455c30ca396
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
        <3484d2c1-942b-4145-801f-8b8bda7dd9ec@samsung.com>
        <20231102004955.cjp7vfdaqjlwhnyo@zenone.zhora.eu>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.11.2023 01:49, Andi Shyti wrote:
> On Tue, Oct 31, 2023 at 02:49:04PM +0100, Marek Szyprowski wrote:
>> On 27.10.2023 15:39, Andi Shyti wrote:
>>> On Wed, Oct 25, 2023 at 02:17:23PM +0200, Marek Szyprowski wrote:
>>>> To properly handle read transfers in polling mode, no waiting for the ACK
>>>> state is needed as it will never come. Just wait a bit to ensure start
>>>> state is on the bus and continue processing next bytes.
>>>>
>>>> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
>>>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>>>> ---
>>>>    drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>>>> index 127eb3805fac..f9dcb1112a61 100644
>>>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>>>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>>>> @@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
>>>>    	int tries;
>>>>    
>>>>    	for (tries = 50; tries; --tries) {
>>>> -		if (readl(i2c->regs + S3C2410_IICCON)
>>>> -			& S3C2410_IICCON_IRQPEND) {
>>>> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
>>>> +
>>>> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
>>>> +			usleep_range(100, 200);
>>>> +			return true;
>>> What is the real issue here? Is the value of S3C2410_IICCON_ACKEN
>>> enabling/disabling irq's?
>> It is not about the enabling/disabling interrupts, but controlling the
>> bus state. This bit is named as 'Acknowledge generation / I2C-bus
>> acknowledge enable bit' in Exynos reference manual:
>>
>> In Tx mode, the I2CSDA is idle in the ACK time.
>>
>> In Rx mode, the I2CSDA is low in the ACK time.
>>
>> So it is a part of proper controlling the bus state, not the reported
>> interrupts, although the S3C2410_IICCON_ACKEN name is a bit misleading
>> in this case.
> Yes, correct, but I still don't understand this sequence in the
> message_start:
>
>   - enable ACKEN in IICCON (enable_ack())
>   - read IICCON (iiccon = readl(...))
>   - write what you read in IICCON (writel(iiccon, ...))
>   - if ACKEN is disabled in IICCON (from your patch)
>
> Where is supposed ACKEN to be disabled?

It must be cleared by the hardware when read mode is set. Frankly 
speaking I didn't dig much into the driver internals and respective i2c 
bus states. I just logged all the call paths and driver states from the 
driver operating with interrupts enabled and fixed the polling mode to 
match what I have captured with interrupts enabled. After that changes, 
all my test boards finally booted properly with polling mode enabled 
unconditionally. This ACK related logic is a bit strange, but I don't 
really want to change driver logic and risk other regressions, so my 
changes were limited only to the code reachable during polling mode.

>>> Besides, if we use polling mode, shouldn't we disable the acks
>>> already in probe (even though they are disabled by default),
>>> never enable them before starting the message and avoid checking
>>> here everytime?
>> I assume that this polling mode is a special case, so there is no point
>> in optimizing it much. It is used only by the i2c core for some special
>> transfers to the PMIC during system reboot/shutdown or by the s3c24xx
>> i2c controller embedded in SoC for controlling some PHYs. Till now only
>> the second case was actually used. There were only a few single writes
>> done this way, so noone even noticed that the other types of transfers
>> (multi message or read) were broken... I found all those issues by
>> enabling polling mode unconditionally and fixing it to make all my test
>> systems working again.
> Yeah, I understand your point here.
>
> It would be nice to have a pure polling mode supported though.

Well, it is now with this patchset. It is just a matter of core to 
select it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

