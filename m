Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CF47B4B2A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Oct 2023 07:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjJBFh6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 01:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbjJBFh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 01:37:57 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CAFC9
        for <linux-i2c@vger.kernel.org>; Sun,  1 Oct 2023 22:37:54 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231002053752euoutp02b6b8502aa48889bd52a21f290dbf6e8e~KM7d25Sep2534625346euoutp02D
        for <linux-i2c@vger.kernel.org>; Mon,  2 Oct 2023 05:37:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231002053752euoutp02b6b8502aa48889bd52a21f290dbf6e8e~KM7d25Sep2534625346euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696225072;
        bh=Sp8KzMl6MDxmnhNgPAr8QUMth1AE9a9kdFVvmfHcEms=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=ct+TEmN3YIA+MJ7emAYRKai2Uh3nRh5BCGbH9UT5lpfkryyCvVHPIVBV7/zVF8RFI
         +vt099hriept2lAceu2/+5fWnfnjdgyvjuCsqg6m3fi/qVWYZzsTvaJjdKWvs4Uc4j
         +vPEuLFqimD5YSx6BEzm4lP749C16Ayu8xr/dCYY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231002053752eucas1p169d343db499c3e3fb77302860218b81b~KM7dk8irL2939829398eucas1p1R;
        Mon,  2 Oct 2023 05:37:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 22.1C.11320.0375A156; Mon,  2
        Oct 2023 06:37:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231002053752eucas1p1ac4b2b9997de57a2b975773f51e2a377~KM7dUHY6s2939829398eucas1p1Q;
        Mon,  2 Oct 2023 05:37:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231002053752eusmtrp16707a7a134e557846b88814702216c81~KM7dTjtOt2127321273eusmtrp1N;
        Mon,  2 Oct 2023 05:37:52 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-6c-651a5730cedb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.CC.25043.F275A156; Mon,  2
        Oct 2023 06:37:52 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231002053751eusmtip1b57715def21441fae02cfc58f8d7f1d9~KM7c5Luzf3114131141eusmtip1T;
        Mon,  2 Oct 2023 05:37:51 +0000 (GMT)
Message-ID: <c00144e2-c523-4d91-afd3-d537dcc9e567@samsung.com>
Date:   Mon, 2 Oct 2023 07:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: add support for atomic transfers
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Language: en-US
In-Reply-To: <20230929225728.uuptlphev4tg7jnf@zenone.zhora.eu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7oG4VKpBt8/ilk8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou7++cyOrB5bFrVyeZx59oeNo++LasYPT5vkgtgieKySUnNySxL
        LdK3S+DKuPvgBHvBOe6KH7uesjYwNnB2MXJySAiYSKw4eZUdxBYSWMEo8exJXhcjF5D9hVFi
        9+E/7BDOZyDnVxMTTMeJ3gaoxHJGiXc/rzNBtH9klLgzR6yLkYODV8BOom9pLEiYRUBF4suE
        X2AlvAKCEidnPmEBsUUF5CXu35oBtplNwFCi620XG0irsICzxJ0TdSBhEQE1ideLPzGBrGIW
        OMAo8eLJfGaQBLOAuMStJ/OZQOo5gVaduJMNEZaX2P52DjNIvYTAFQ6J22/2sEPc7CIx/eBa
        KFtY4tXxLVC2jMTpyT0sEA3tjBILft9ngnAmMEo0PL/FCFFlLXHn3C+w65gFNCXW79KHCDtK
        fLy+hgUkLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpVZSD6b
        heSdWQh7FzCyrGIUTy0tzk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMNaf/Hf+yg3H5q496hxiZ
        OBgPMUpwMCuJ8LZdEEsV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzqttezJZSCA9sSQ1OzW1ILUI
        JsvEwSnVwDRBfp3FPOMrATw1hdsniZhULl6u8H5+Sc2ZR4n8c3Vvn1u7NjgvI/rKpTOHqt5l
        F15YuFuad/JqgZalM05+KPlhtKpizb8tt65fqNl+j7fivbNHf7W4Cn//A9ucP49+OzOEqEsJ
        5/z50LjgxotMxYc763oYmtkXNv6aFvmP33Kdguqpy/vW/dib+frUot1WfNUWhkIXrlnKVM59
        cFT860m78N4nD9p6ak7eL4lujLW9eMk8uChn7dMi31QnWUa7jVfPW/GYHPRI2ywfy6up5OEe
        xJvjdUb8+WVuZ8t1SpcfvKuIn6jqJa+oqPit8Nratn1XDm/Nm31QgPeN1S61+zYGAiKRDkJK
        amePtTW1CymxFGckGmoxFxUnAgAFAxzMpAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7oG4VKpBkf/M1o8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou7++cyOrB5bFrVyeZx59oeNo++LasYPT5vkgtgidKzKcovLUlV
        yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLuPvgBHvBOe6KH7ue
        sjYwNnB2MXJySAiYSJzobWDvYuTiEBJYyijx7sF9JoiEjMTJaQ2sELawxJ9rXWwgtpDAe0aJ
        /zdruxg5OHgF7CT6lsaChFkEVCS+TPgF1sorIChxcuYTFhBbVEBe4v6tGewgNpuAoUTXW5Ax
        HBzCAs4Sd07UgYRFBNQkXi/+xARyArPAAUaJjTsfMUHcc5xR4nHvW7ChzALiEreezGcCaeYE
        2nviTjZE2Eyia2sXI4QtL7H97RzmCYxCs5CcMQtJ9ywkLbOQtCxgZFnFKJJaWpybnltspFec
        mFtcmpeul5yfu4kRGF3bjv3csoNx5auPeocYmTgYDzFKcDArifC2XRBLFeJNSaysSi3Kjy8q
        zUktPsRoCgyLicxSosn5wPjOK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLp
        Y+LglGpg6rmdndNx/M6ZQw+tTBbYvuAUq5Ka48KRZduXO7Pznszr/IzNbIvldBZHc9ddj2vb
        0XCGc9F+9o9WbW8thU0+9k7qsV9U78wjXXx2s9fFlsP3tC2nNZ5cdfjDkc1CrtEnXlx+pnU5
        UnCtXZ9qgt9JTs/+zQ3WEx+12ltV/q64XvPunoecTiurdk64IGfINpeGnOx5l/crpQV8ePgw
        eoWiodnerHlnVHm2Khpurffq+2GkJRJw5MXLC1fUTtpM6H56VfDI2wrNvJ8sHk9LpXq/f54S
        s1rUc9dLxpAjzIeYfExZjxs7bf89bTPHRpW+329DDU5bVqQt/VU0jam764IV892MT6cDV+lo
        pcVdXW+txFKckWioxVxUnAgAJhAkuDcDAAA=
X-CMS-MailID: 20231002053752eucas1p1ac4b2b9997de57a2b975773f51e2a377
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230929113851eucas1p28d902fbb6054951d57314ff181985e30
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230929113851eucas1p28d902fbb6054951d57314ff181985e30
References: <CGME20230929113851eucas1p28d902fbb6054951d57314ff181985e30@eucas1p2.samsung.com>
        <20230929113841.1272625-1-m.szyprowski@samsung.com>
        <20230929225728.uuptlphev4tg7jnf@zenone.zhora.eu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30.09.2023 00:57, Andi Shyti wrote:
>> @@ -178,6 +179,7 @@ struct exynos5_i2c {
>>   	unsigned int		msg_ptr;
>>   
>>   	unsigned int		irq;
>> +	unsigned int		polled;
> Is this supposed to be called polling?

Yea, a bit better name.

>>   	void __iomem		*regs;
>>   	struct clk		*clk;		/* operating clock */
>> @@ -711,6 +713,24 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>>   	spin_unlock_irqrestore(&i2c->lock, flags);
>>   }
>>   
>> +static unsigned long exynos5_i2c_polled_irqs_timeout(struct exynos5_i2c *i2c,
>> +						     unsigned long timeout_ms)
>> +{
>> +	ktime_t start, now;
>> +
>> +	start = now = ktime_get();
>> +	while (ktime_ms_delta(now, start) < timeout_ms &&
>> +	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
>> +	         (i2c->state < 0))) {
>> +		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
>> +		       readl(i2c->regs + HSI2C_INT_STATUS))
>> +			exynos5_i2c_irq(i2c->irq, i2c);
>> +		usleep_range(100, 200);
>> +		now = ktime_get();
>> +	}
>> +	return ktime_ms_delta(now, start) < timeout_ms;
> what are you returning here?

Values similar to wait_for_completion_timeout(); 0 means timeout and 
non-zero that the waiting condition has been reached, please check how 
it is used in exynos5_i2c_xfer_msg(). Maybe the function should be named 
a bit different, but I had no good idea so far.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

