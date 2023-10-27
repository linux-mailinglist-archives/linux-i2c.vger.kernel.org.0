Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728B37D95A9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 12:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345688AbjJ0Kyd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 06:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345671AbjJ0Kyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 06:54:32 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DB29C
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 03:54:29 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231027105427epoutp04b9093ee244f89d84aee8d112f9469054~R8YAi4Hnc2955929559epoutp04N
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 10:54:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231027105427epoutp04b9093ee244f89d84aee8d112f9469054~R8YAi4Hnc2955929559epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698404067;
        bh=w7rq+fyFlK3zlCe39Vf5b6K6NUN8LCITYFREKTHUzDo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=fz5ccAck0Ha4ZjKZdt2/W5r+vkIRO0zVermShfHaQFx+rQmP8xWOr3JY3SfU+iFui
         Hww9CUYCvatQNVoI+SgmERo4NUk/opycRRpv924Vrh3i3QbkUqSoJ5AecVv+1BbaGu
         Nj+yn4G9JVaPaPIERk1gQUnMnv9vva3V1HnSrXe0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20231027105426epcas2p4dbfc0add3f3830f8766d7d996c1bc950~R8YAMDyCM2317623176epcas2p4M;
        Fri, 27 Oct 2023 10:54:26 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4SH00f35H7z4x9Pr; Fri, 27 Oct
        2023 10:54:26 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.65.10022.2E69B356; Fri, 27 Oct 2023 19:54:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20231027105426epcas2p2605738c6ca3196b0fcb09e025074ea3a~R8X-m79sK1002610026epcas2p2N;
        Fri, 27 Oct 2023 10:54:26 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231027105426epsmtrp2e57056d3ed68b581635e4f3ee86d0554~R8X-mRa2T0533305333epsmtrp2Y;
        Fri, 27 Oct 2023 10:54:26 +0000 (GMT)
X-AuditID: b6c32a47-9a3ff70000002726-80-653b96e20462
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        9D.5E.07368.1E69B356; Fri, 27 Oct 2023 19:54:26 +0900 (KST)
Received: from KORCO082417 (unknown [75.12.40.192]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231027105425epsmtip2cc83a1e89d735fee3014f81c5a3a6a35~R8X-Z_wV22658326583epsmtip2P;
        Fri, 27 Oct 2023 10:54:25 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Andi Shyti'" <andi.shyti@kernel.org>,
        "'Wolfram Sang'" <wsa@kernel.org>
In-Reply-To: <20231025121725.46028-2-m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Date:   Fri, 27 Oct 2023 19:54:25 +0900
Message-ID: <000601da08c3$f3a4f510$daeedf30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQFAtDqCAoG6rpZP+2s4rZk6TTwtCAISXrr3Aj0QF52xbaO+8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTQvfRNOtUg3vvRS0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlKtsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+gCJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xotd
        yQVPeCvmXjzA1sC4gruLkYNDQsBE4vzD8i5GLg4hgR2MEj+m9rJDOJ8YJW7NXcgC4XxjlGhd
        eYKti5ETrOPUuoesEIm9jBKdnb3MEM4LRokbE5oZQarYBPQlXnZsYwWxRQTKJR4e28MGUsQs
        sI1R4u35BywgCU4BO4mTH5azgRwiLOAj8fqqB0iYRUBV4svGPWC9vAKWEs+fL2GEsAUlTs58
        AtbKLCAvsf3tHGaIixQkfj5dxgoRF5d4efQIO8ReJ4mOazuYQPZKCCzkkOh69IgF4mkXiQkX
        6iF6hSVeHd/CDmFLSXx+t5cNoqRcYseyJIjWFkaJ5rY9ULvsJX7cnMIKUsMsoCmxfpc+RLmy
        xJFbUJfxSXQc/ssOEeaV6GgTgmhUlziwfToLhC0r0T3nM+sERqVZSP6aheSvWUh+mYWwawEj
        yypGsdSC4tz01GKjAmN4TCfn525iBKdMLfcdjDPeftA7xMjEwXiIUYKDWUmEN9LHIlWINyWx
        siq1KD++qDQntfgQoykwpCcyS4km5wOTdl5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp
        2ampBalFMH1MHJxSDUy8ZZPKCvNv3/498+miuadV/3/vVb+1e32EyNQznwMzHn3yaWETDyrc
        JrVl4coXgcapio+ZDN4/O3VHZuKyomcSE2dWxSy8p3K+UOygT9se4Wm+s9mWdx7ZKVnhOb0l
        4FlCuPLZtbUpd/xztzkbnllwKuTcK9ZM3YLQ82zr1G5N3mu+NPDt8vtWjdGfqzI+bfeTen/8
        7A6F2f7/WQKsVxeaCe75PPfq7rsTNr6forSg9O+8W3pTVpUGCPR8faXwMKP5ekH4TqNn/sIF
        S40nWZ9WE93vd8tlp9hWg1TrazHOb5POBYn4sjy5pK/055pY8CKjVJe072s/zLtadXiWZ/p+
        FZc+17XHK58euFIX068SocRSnJFoqMVcVJwIAMFlF+MiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSvO6jadapBq+PMlk8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLFJdN
        SmpOZllqkb5dAlfGi13JBU94K+ZePMDWwLiCu4uRk0NCwETi1LqHrF2MXBxCArsZJZp3tbNB
        JGQlnr3bwQ5hC0vcbzkCVfSMUeJI51cmkASbgL7Ey45tQAkODhGBSonuTRIgNcwCOxglXv6a
        wQjRcJBRYubjc8wgDZwCdhInPyxnA2kQFvCReH3VAyTMIqAq8WXjHlYQm1fAUuL58yWMELag
        xMmZT1hAbGYBbYneh62MELa8xPa3c5ghjlOQ+Pl0GSvM0X+OzmWDqBGXeHn0CNgDIgJOEh3X
        djDBPHP3wUv2CYyis5CsmIVkxSwkK2YhGbWAkWUVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpe
        cn7uJkZwzGlp7GC8N/+f3iFGJg7GQ4wSHMxKIryRPhapQrwpiZVVqUX58UWlOanFhxilOViU
        xHkNZ8xOERJITyxJzU5NLUgtgskycXBKNTAd61Fat6PRQjrszLqi9JfzS4WLHx5vjG7OufO/
        RPcLO8Ol6mLZFi7Dw/5drisnvwpTtmCeWLFDZJ2c5Vzhy1dC40uWtyUqf1A/7zvDX3pXx2zb
        3C7fdkZ32xPzOG53bn1lv12mV+B287x/nvarrrFtzpBxfJbyu1oxpEvv+tlNIRwic5LctBdL
        9U0KZQvKqFq4zcXI6tLKhfqubnZiy99sn/zs38/fGvw3LHX/XuHg+9byd0HPpKiTnrZ78rSU
        Zx1bkSU0xafo/v7Jtf0KUp1M7cwPds7fUep6IeVuUA+b44HWSYF/mJ3Sy71XtYRfqq6M2c9l
        fm9F1xejDM1PMxjqJHmZJ50suOu1Zd22TiWW4oxEQy3mouJEAMSt6YwoAwAA
X-CMS-MailID: 20231027105426epcas2p2605738c6ca3196b0fcb09e025074ea3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
        <20231025121725.46028-2-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> Sent: Wednesday, October 25, 2023 9:17 PM
> To: linux-samsung-soc@vger.kernel.org; linux-i2c@vger.kernel.org
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Andi Shyti <andi.shyti@kernel.org>; Wolfram Sang <wsa@kernel.org>
> Subject: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
> 
> To properly handle read transfers in polling mode, no waiting for the ACK
> state is needed as it will never come. Just wait a bit to ensure start
> state is on the bus and continue processing next bytes.
> 
> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Chanho Park <chanho61.park@samsung.com>

> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
> s3c2410.c
> index 127eb3805fac..f9dcb1112a61 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
>  	int tries;
> 
>  	for (tries = 50; tries; --tries) {
> -		if (readl(i2c->regs + S3C2410_IICCON)
> -			& S3C2410_IICCON_IRQPEND) {
> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
> +
> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
> +			usleep_range(100, 200);
> +			return true;
> +		}
> +		if (tmp & S3C2410_IICCON_IRQPEND) {
>  			if (!(readl(i2c->regs + S3C2410_IICSTAT)
>  				& S3C2410_IICSTAT_LASTBIT))
>  				return true;
> --
> 2.34.1


