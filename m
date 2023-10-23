Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44C37D3000
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 12:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjJWKe3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 06:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjJWKe2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 06:34:28 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D8DD65
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 03:34:25 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231023103421euoutp011f04ffea027d3791c0fd0cf089a4b096~QthVCHvKE1230012300euoutp01W
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 10:34:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231023103421euoutp011f04ffea027d3791c0fd0cf089a4b096~QthVCHvKE1230012300euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698057261;
        bh=+4MmQRCPRm1zC57C8sermfjVMdXQDabRKp9YfYkNBNk=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=pI5W63AMmTs2/IcJQeN3Ht2DxH1w/YandJvNBbqFQ2aDriwPZrqqk86LTIdBh3WGe
         TKASY2wTh2Cxk0J1MQBwYJxYySQrRF2VJvIMPHdxKg6RN0/zn473PuBNNEAIVWLxjF
         P68j36ch+9eaqw0TNMoIpfTw80GEwyas9dwYB8mo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231023103421eucas1p20cfc4bc17f36b18063aff1aa2970bcb8~QthU1bdxM0499004990eucas1p2E;
        Mon, 23 Oct 2023 10:34:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CA.3C.11320.D2C46356; Mon, 23
        Oct 2023 11:34:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978~QthUXfml21979119791eucas1p2b;
        Mon, 23 Oct 2023 10:34:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231023103421eusmtrp28be71d7e5f38d4dcc15cd54aacba43b8~QthUWwFFr0425004250eusmtrp2L;
        Mon, 23 Oct 2023 10:34:21 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-ca-65364c2dc562
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7A.C7.25043.D2C46356; Mon, 23
        Oct 2023 11:34:21 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231023103420eusmtip21cb536a4edfc919ec8b7ab907f5830bc~QthTtwqQ42361923619eusmtip2B;
        Mon, 23 Oct 2023 10:34:20 +0000 (GMT)
Message-ID: <55812f75-3053-4970-bbbe-8ca563f33721@samsung.com>
Date:   Mon, 23 Oct 2023 12:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: exynos5: Calculate t_scl_l, t_scl_h according to
 i2c spec
Content-Language: en-US
To:     Camel Guo <camel.guo@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220912085943.1098651-1-camel.guo@axis.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djP87q6PmapBlPnqFo8mLeNzeL76wdM
        Fp9aVC32vt7KbrHp8TVWi46/XxgtLu+aw2Yx4/w+JgcOj+vrAjzuXNvD5rF5Sb1H35ZVjB6f
        N8kFsEZx2aSk5mSWpRbp2yVwZSxZvJG14LVsxYJNnA2Mn8W6GDk5JARMJC5/f8jSxcjFISSw
        glFi28RnUM4XRolTTxayQzifGSWuNvSzw7Rc/X6MEcQWEljOKNE5UxTC/ghkL80HsXkF7CQ6
        7k5kA7FZBFQlDp7awAgRF5Q4OfMJC4gtKiAvcf/WDLCZwgKhErNPnGMCsZkFxCVuPZkPZosI
        REkcmj0J7AhmgQOMEu+fNIM1sAkYSnS97QJawMHBKWAlcXi3D0SvvMT2t3OYQeolBB5wSPz8
        sI8R4mgXiaMLV7BA2MISr45vgXpGRuL/TpBlIA3tjBILft+HciYwSjQ8vwXVbS1x59wvsG3M
        ApoS63fpQ4QdJW7duAkWlhDgk7jxVhDiCD6JSdumM0OEeSU62oQgqtUkZh1fB7f24IVLzBMY
        lWYhBcssJO/PQvLOLIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmodP/jn/Z
        wbj81Ue9Q4xMHIyHGCU4mJVEeGeHm6QK8aYkVlalFuXHF5XmpBYfYpTmYFES51VNkU8VEkhP
        LEnNTk0tSC2CyTJxcEo1MG29ePjrQavJLbr3ntV8OiVmsnSFfjeH/tR5c3QXCTWUbNpxILLu
        TR1DiUD0ygq3kG3hoYfPFDlYtM2oXrdQTTbrfNPqnwreTyadrY23XG5dJP32/Nm6e7wdj6Nj
        /pUeVVmYomjdfjwwyP31gWy5E8rqnZMeL1KrO9m5PGTC/LTeDxOzSst0J7t5amuXSS+LF374
        fBO76qT+y7unTGlVWtIZbFdc9Xyz2/PzHHNOKZ0/xCQn6u9tsyeDY839v4dUpDYHLuV5WzmN
        8aet+Z9HCdc3PLoR5fPK86Dc9TUOgT3zqqQ+/+Da61iiePR6WR+HtMSeY09uPttn8efjtFRJ
        hicy+j9iHd34E+rsD2SFpyuxFGckGmoxFxUnAgBTABbBsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7q6PmapBje+clg8mLeNzeL76wdM
        Fp9aVC32vt7KbrHp8TVWi46/XxgtLu+aw2Yx4/w+JgcOj+vrAjzuXNvD5rF5Sb1H35ZVjB6f
        N8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
        ZSxZvJG14LVsxYJNnA2Mn8W6GDk5JARMJK5+P8bYxcjFISSwlFHi0etTbBAJGYmT0xpYIWxh
        iT/Xutggit4zSnxqusgMkuAVsJPouDsRrIFFQFXi4KkNjBBxQYmTM5+wgNiiAvIS92/NYAex
        hQVCJe4unwHWyywgLnHryXwmEFtEIEri/uZXLCALmAUOMEqcXnEOrEFIwFLi7beDYIPYBAwl
        ut6CXMHBwSlgJXF4tw/EHDOJrq1djBC2vMT2t3OYJzAKzUJyxiwk62YhaZmFpGUBI8sqRpHU
        0uLc9NxiI73ixNzi0rx0veT83E2MwLjbduznlh2MK1991DvEyMTBeIhRgoNZSYR3drhJqhBv
        SmJlVWpRfnxRaU5q8SFGU2BYTGSWEk3OB0Z+Xkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpi
        SWp2ampBahFMHxMHp1QDk2Ql/8Mvqzp23JExn/qXwVBRqag810gkjTugwT5Z4Py8j9cCD0w6
        FJztMcGwSGLN+U0OvcE6Pw7c4libu1WFn+EfS5/mBPfG7tpz16cYTJT6p7Tm4I9Dmxf7Xj+6
        Xbl5vkH8eSXdBMuHltpz1nzOd77JvvFnTU5pHZvl3OK29T32y3jCrmrYyXRsm8huMf2CwZEz
        4onJxQtmdbeq3kiKs+yU9O8NDA6TuRxt37h6nt+Pc0n9gtqvrc6JzHh+J1JL6nrWyvIFU7Ue
        SX8MlprzdN3FL093bTF/fuRi93mJCnORF+vWCZ3rLWNn+nnqCn8hy9cJS4p7J7v8+xBdMeNS
        wdYtT1ju/r46N/WQ06UEcyWW4oxEQy3mouJEAMYOsqFEAwAA
X-CMS-MailID: 20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978
References: <20220912085943.1098651-1-camel.guo@axis.com>
        <CGME20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978@eucas1p2.samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12.09.2022 10:59, Camel Guo wrote:
> Previously the duty cycle was divided equally into h_scl_l, t_scl_h.
> This makes the low period of the SCL clock in Fast Mode is only 1.25us
> which is way lower than the minimal value (1.3) specified in i2c
> specification. In order to make sure t_scl_l, t_scl_h always fullfill
> i2c specification, this commit calculates t_scl_l using this formula:
>
> t_scl_l = clk_cycle *
>      ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
>
> where:
> t_low_min is the minimal value of low period of the SCL clock in us;
> t_high_min is the minimal value of high period of the SCL clock in us;
> scl_clock is converted from SCL clock frequency into us.
>
> Signed-off-by: Camel Guo <camel.guo@axis.com>


This sounds reasonable and works fine on all Exynos-based test board I 
have. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>   drivers/i2c/busses/i2c-exynos5.c | 34 +++++++++++++++++++++++++++++---
>   1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 4a6260d04db2..72bc8adea8d5 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -267,7 +267,7 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
>    * exynos5_i2c_set_timing: updates the registers with appropriate
>    * timing values calculated
>    *
> - * Timing values for operation are calculated against either 100kHz
> + * Timing values for operation are calculated against 100kHz, 400kHz
>    * or 1MHz controller operating frequency.
>    *
>    * Returns 0 on success, -EINVAL if the cycle length cannot
> @@ -330,6 +330,23 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>   	 *
>   	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
>   	 *
> +	 * To split SCL clock into low, high periods appropriately, one
> +	 * proportion factor for each I2C mode is used, which is calculated
> +	 * using this formula.
> +	 * ```
> +	 * ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
> +	 * ```
> +	 * where:
> +	 * t_low_min is the minimal value of low period of the SCL clock in us;
> +	 * t_high_min is the minimal value of high period of the SCL clock in us;
> +	 * scl_clock is converted from SCL clock frequency into us.
> +	 *
> +	 * Below are the proportion factors for these I2C modes:
> +	 *                t_low_min, t_high_min, scl_clock, proportion
> +	 * Standard Mode:     4.7us,      4.0us,      10us,      0.535
> +	 * Fast Mode:         1.3us,      0.6us,     2.5us,       0.64
> +	 * Fast-Plus Mode:    0.5us,     0.26us,       1us,       0.62
> +	 *
>   	 */
>   	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
>   	temp = clkin / op_clk - 8 - t_ftl_cycle;
> @@ -343,8 +360,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>   		return -EINVAL;
>   	}
>   
> -	t_scl_l = clk_cycle / 2;
> -	t_scl_h = clk_cycle / 2;
> +	/*
> +	 * Scale clk_cycle to get t_scl_l using the proption factors for individual I2C modes.
> +	 */
> +	if (op_clk <= I2C_MAX_STANDARD_MODE_FREQ)
> +		t_scl_l = clk_cycle * 535 / 1000;
> +	else if (op_clk <= I2C_MAX_FAST_MODE_FREQ)
> +		t_scl_l = clk_cycle * 64 / 100;
> +	else
> +		t_scl_l = clk_cycle * 62 / 100;
> +
> +	if (t_scl_l > 0xFF)
> +		t_scl_l = 0xFF;
> +	t_scl_h = clk_cycle - t_scl_l;
>   	t_start_su = t_scl_l;
>   	t_start_hd = t_scl_l;
>   	t_stop_su = t_scl_l;
>
> base-commit: ce888220d5c7a805e0e155302a318d5d23e62950

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

