Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384D27DF112
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 12:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjKBLXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 07:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjKBLXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 07:23:38 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A689132
        for <linux-i2c@vger.kernel.org>; Thu,  2 Nov 2023 04:23:32 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231102112331euoutp02f8579e2d8e6479bd6dc0706dd246b664~TypGe4iNI1484014840euoutp02I
        for <linux-i2c@vger.kernel.org>; Thu,  2 Nov 2023 11:23:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231102112331euoutp02f8579e2d8e6479bd6dc0706dd246b664~TypGe4iNI1484014840euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698924211;
        bh=jZ6iXWpdLjCnmoX6OKQyCdqh1GX2vWuiOjGGuLgLakQ=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=Po3Bb6xBVQtXw3exMkfNV2dG7fXgdvq2RTGK+1Df9OdsfTOaiNrWGvqtcjsNYET7L
         wUxncGizVZ0cld6hDiESCf5JpqdPwtftOjOuc78cJ5iViO5s3+uMQB+pouWBI/KveV
         Xxv1igs1Y0t7GZKXkMWo9NwtLoVS1KksnTmhl5TA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231102112331eucas1p28a1042b20e6e74f433360bd62158e796~TypGRdHvp0728107281eucas1p2v;
        Thu,  2 Nov 2023 11:23:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E1.BA.52736.2B683456; Thu,  2
        Nov 2023 11:23:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231102112330eucas1p1ecc024a8fc33498c3e78a686c1dd6377~TypF6gDT02596625966eucas1p1D;
        Thu,  2 Nov 2023 11:23:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231102112330eusmtrp2e042f93d912c783d411eb9a2254cb01a~TypF5pKsj3170431704eusmtrp27;
        Thu,  2 Nov 2023 11:23:30 +0000 (GMT)
X-AuditID: cbfec7f5-bb7ff7000000ce00-8d-654386b2150f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 36.DC.10549.2B683456; Thu,  2
        Nov 2023 11:23:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231102112330eusmtip126193a28bcdd5b829745862ff370786f~TypFYRWrT1891918919eusmtip1P;
        Thu,  2 Nov 2023 11:23:29 +0000 (GMT)
Message-ID: <0f26d7d4-d9c4-4c54-9882-bab137d0a01a@samsung.com>
Date:   Thu, 2 Nov 2023 12:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
To:     =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Andi Shyti' <andi.shyti@kernel.org>,
        'Wolfram Sang' <wsa@kernel.org>
Content-Language: en-US
In-Reply-To: <07e001da0d2c$5f0360f0$1d0a22d0$@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se2xLURx27r1r7661zjrW3xClWDKPzjKSeg0xDMviH5FgrOxkW+whrZoJ
        U8RUsUzZOp2tCNpMUlJtg80wo1nE5jGvDfWoVxcSs4rNc+312H/f953vd77fd3JYWlIVNpTN
        yd9A1PmqXLmAY9w3elonOkrmkklHjErl8xq3QOkN6JHS6C1jlJc6XUKl/kc3Ula2NlDKp5er
        0WxhiqN2jyDlyYN6QUqpsxalfHaMWMIs52ZkktycjUQdn5TBZbv2O5n1tZGbXhgP0TrkEBtQ
        OAt4Mnyt304ZEMdKsA2Braac5kk3gr0VbUKefEbgbX0n/DtyrbOBCWIJtiJo8AznTZ8Q1Nh2
        hAUPRDgJnF3P6CBm8BjY79ALeT0Smg/7QsNDsAy87ZUhXYATwPDBIAjiKJwKLaXvQsmD8UkE
        viae0NiO4P5HT8hFYym0+yxUEIfjaRAoMYXxugx2uqpCJQC3sWA0Nwn4vZPhgb+e4XEU+D3O
        P32Gw68LFoof2I3g6DfvH1KGQPe2HfGu6fCkpbfvJrYvIg7OXIzn5TlgNzlDMmAxPPoQyS8h
        BqPbRPOyCPQlEt4dC2aP/V/s1dt36TIkN/d7GHO/auZ+dcz/c48iphZJiVaTl0U0ifmkUKFR
        5Wm0+VmKtQV5DtT3f27+9ATOI5v/k6IRUSxqRMDS8sGia1NmE4koU1W0magLVqu1uUTTiIax
        jFwqGpspIxKcpdpA1hGynqj/nlJs+FAddaCk6uu5A/LmYvxmVY5K8dxd6Foz6F5n7MphAcnj
        1+yoX0JuS3IUPTBmi/Nwz+gYrrQyqzxtr2WpOENTfjBJS9JfTnzYdUGffvlKXOKJi3HHYl6k
        5xZlj4ww3JJO6ChoTk2dr6iZNZWTzvUVHTwfzS0r8kWPeVMef6N42it38oTv9+rG22+lnVpg
        sd/pqF5IvU/UjthR3Mb2pvlsSWf3tXUMaio4lxC7QvbF6n+8NOC3dr8SGHvNEbqycMp1unRf
        ccQVvyywsCejZZ4lYlGFQmuN7NZ3zRTnkfao6ybr6Lpdy/E27rjwp25Aw1nTlJWyrRvjv1eP
        rUPyBYsLO5xfonvkjCZblTCOVmtUvwHKM5GlrgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7qb2pxTDa62Klo8mLeNzeL+1w5G
        i0n3J7BY7H29ld2i4+8XRosZ5/cxWdzdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G1t4tLAWr
        BCseTprC3MC4ia+LkZNDQsBE4vDrfSxdjFwcQgJLGSV2/tnEDpGQkTg5rYEVwhaW+HOtiw2i
        6D2jxOnTjWBFvAJ2Els+3WMGsVkEVCR6N3VAxQUlTs58wgJiiwrIS9y/NQMsziZgKNH1FmQQ
        J4ewgI/Eub4X7CBDRUA27/7WAuYwC6xjlJi8dzvUTV8ZJbonN4K1MAuIS9x6Mp8JxOYUsJL4
        2jadFSJuJtG1tYsRwpaXaN46m3kCo9AsJJfMQtI+C0nLLCQtCxhZVjGKpJYW56bnFhvqFSfm
        Fpfmpesl5+duYgRG3LZjPzfvYJz36qPeIUYmDsZDjBIczEoivIdNHVKFeFMSK6tSi/Lji0pz
        UosPMZoCg2Mis5Rocj4w5vNK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqY
        ODilGpgEGCWURGM4n55XqFinfO7F/5V8apu6/E2DJ1blpNWmdvvVxBle8uvd3bzlv8JLxgm5
        DK8Uj9hVafFWbL77mmeVwYxNhxVevXopOvHTVpd9zR/nagd9fNmxTEH11I5dvLlMDL84/+1o
        MQu+yZBQ+m5iptSGS4ffact72x3T893xVfvr02mXWTjEBDcdP/YnMO6dWWihSZnwWkFJufkX
        47x+7T+6odXrSHfC6XliUyoOHn9l3ZRYNu1Qz55ty5l5Fwa/Nzr/+tjy/5tXzluqd2Pr9zWL
        5q2vK1+doKs87Ydb0q9s7ZlKchoSghkdS+17moUEo4pucFqYTMgwLClO/H3U28vL7HX0+i33
        7uc/Nv6gxFKckWioxVxUnAgArQ8hT0EDAAA=
X-CMS-MailID: 20231102112330eucas1p1ecc024a8fc33498c3e78a686c1dd6377
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
        <20231025121725.46028-2-m.szyprowski@samsung.com>
        <07e001da0d2c$5f0360f0$1d0a22d0$@samsung.com>
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

Hi Inki,

On 02.11.2023 02:31, 대인기/Tizen Platform Lab(SR)/삼성전자 wrote:
>
>> -----Original Message-----
>> From: Marek Szyprowski<m.szyprowski@samsung.com>
>> Sent: Wednesday, October 25, 2023 9:17 PM
>> To:linux-samsung-soc@vger.kernel.org;linux-i2c@vger.kernel.org
>> Cc: Marek Szyprowski<m.szyprowski@samsung.com>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org>; Alim Akhtar<alim.akhtar@samsung.com>;
>> Andi Shyti<andi.shyti@kernel.org>; Wolfram Sang<wsa@kernel.org>
>> Subject: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
>>
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
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
>> s3c2410.c
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
> Trivial question, but is there any hardware specification related to sleeping for 100-200 microseconds? If any then it would be nice to use const variable instead and add some description about why sleeping here is needed.


Well, this is a bit magic value I got from my experiments. There is some 
delay needed there to let hardware to clear that bit and the values I 
proposed worked. If You don't like that, I can reuse the delay value 
that is already present in that loop: usleep_range(1000, 2000).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

