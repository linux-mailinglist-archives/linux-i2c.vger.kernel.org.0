Return-Path: <linux-i2c+bounces-2253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E1874E3F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 12:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590262810B4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 11:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373701292CD;
	Thu,  7 Mar 2024 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fT3BTVS3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC688833
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709812160; cv=none; b=PGDfFyzStEltCSk/pBVi4NzMjYVtOn0NsF0Xg08ij+f+yDjEbWqig620v6ewuqPACjNRhNgRPLmdbq8WmtwMJZRjNkYfGwXQINP4FzBO4jBY0SB/3AsUE5XApsU9ozTNT9ZbdaE3l7q2gU3s23sSjtuhdN7JpgZZ07zIF7OB6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709812160; c=relaxed/simple;
	bh=tClZTSyEdvqyZlIqZj5UHmzzjNSZt47PKXfFHZjRqwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=A0PS1mgw8H7kvLcs1noWVPUZWPw0wugimgv8rUFNdnLaK5IDWTR6nABi3yLcd/iZn68PSzK+e5wJDw/RszNTVLGo7QNcvrVpVjshfLlWE6I8qSAZcsnVzAsKYgRsO6sbfoi3GRq9V5KLZmrmECl2jhqW/9uS81z7Wxl26YxsAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fT3BTVS3; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240307114108euoutp02b9bb0908f63b1adf0f756e922bd6c304~6eKc2XwFb0525505255euoutp02_
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 11:41:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240307114108euoutp02b9bb0908f63b1adf0f756e922bd6c304~6eKc2XwFb0525505255euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1709811668;
	bh=ZX7XgwAbXzFGogvGS3yajGzBilU38GeCPw+l5z4vKwQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=fT3BTVS3zHa6QBFF/OtSLceFKCp58U3IYfeY/SVGog1BKJ4dO9gBWV6+XBcA/CXtp
	 W4IPV3GdUy9MkNjV9B1+5ghOAKV0ki9Fo5T0VegZoZ6uyoBYPUGDZXF3sjHAzdHnNg
	 aRznxvFQxjFaMRZovEOva4sAB6Bfb+Evz/CFRc3w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240307114107eucas1p20c922e1fb6f12e62ad8079c4177b199b~6eKco74tO1220312203eucas1p2F;
	Thu,  7 Mar 2024 11:41:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D0.6A.09539.3D7A9E56; Thu,  7
	Mar 2024 11:41:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240307114107eucas1p2d18f8261c44f0978c37100b1188bf8f3~6eKcQ-4RO0073300733eucas1p2y;
	Thu,  7 Mar 2024 11:41:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240307114107eusmtrp17eb6cdf0c6eeb490be742fb52bae0d9c~6eKcQPfdj0724507245eusmtrp1V;
	Thu,  7 Mar 2024 11:41:07 +0000 (GMT)
X-AuditID: cbfec7f2-515ff70000002543-8e-65e9a7d3a0ba
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id DB.CB.10702.3D7A9E56; Thu,  7
	Mar 2024 11:41:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240307114106eusmtip2ce33a3f1f3bc135c0d39263534718f4f~6eKbyA8k80809308093eusmtip2h;
	Thu,  7 Mar 2024 11:41:06 +0000 (GMT)
Message-ID: <949c82da-f0dc-4824-ac57-bc86ae42d871@samsung.com>
Date: Thu, 7 Mar 2024 12:41:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
Content-Language: en-US
To: Jesper Nilsson <jesper.nilsson@axis.com>, Andi Shyti
	<andi.shyti@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87qXl79MNVi8WM/iwbxtbBb3v3Yw
	Wjw/NIvZ4lOLqsXe11vZLTY9vsZq0fH3C6PF5V1z2CxmnN/H5MDpcX1dgMemVZ1sHneu7WHz
	2Lyk3qNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyPlx+ylxwXqZiw+y8BsY+8S5GTg4JAROJ
	XVemsXYxcnEICaxglLg7t5sJwvnCKPHs7n1WkCohgc+MErdf6cF0PD7/khmiaDmjxIl9m6A6
	PjJKzHizCKyDV8BO4tvpNYxdjBwcLAIqEvdmGkKEBSVOznzCAmKLCshL3L81gx3EFhYIk9i0
	Yw8ziM0sIC5x68l8sJkiAhsZJc6/+ArmMAvMBHImnWMCqWITMJToetvFBmJzAi3bd/4rE0S3
	vMT2t3PAzpMQ+MAhMWvfRlaIu10kDv18xgZhC0u8Or6FHcKWkTg9uYcFoqGdUWLB7/tMEM4E
	RomG57cYIaqsJe6c+8UG8g+zgKbE+l36EGFHif0zGsDCEgJ8EjfeCkIcwScxadt0Zogwr0RH
	mxBEtZrErOPr4NYevHCJeQKj0iykgJmFFACzkLwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5
	xaV56XrJ+bmbGIHJ6fS/4592MM599VHvECMTB+MhRgkOZiURXhaLl6lCvCmJlVWpRfnxRaU5
	qcWHGKU5WJTEeVVT5FOFBNITS1KzU1MLUotgskwcnFINTAm+8WdXpm/X7WqQPRb2WcVHo6xf
	hnnD7esZSyTenTOZd75N6nrQQbb+1XrmP1hWtHzfcPpHwJ1r/ksYn648ftRgwa/fVd/8Vsw8
	zv59L/vfr9e7E3menXBRqmadOam34YZVTaPgM8myy2/905pWPfmWHv/x2Edz2fRrrzQz3hz3
	DvoVH8Fv8Dl6+ifTiTX/6gOVO/bLvTB8fuCR1ia3ues/Ti3rOXXJ439iXfFSifmXE8N26+RF
	zJJb8d9CaNcNg1ers9Y/DpltsF9FOFNxw7W/21W0Fin0SB9l03Up25A9YVqJ6aZb26d88S3+
	K8y2q9Ipwna50AdvzqfRIcummy20E46UeH7zTVfTx8ojcxyVWIozEg21mIuKEwHns48tvQMA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xe7qXl79MNTi7UtLiwbxtbBb3v3Yw
	Wjw/NIvZ4lOLqsXe11vZLTY9vsZq0fH3C6PF5V1z2CxmnN/H5MDpcX1dgMemVZ1sHneu7WHz
	2Lyk3qNvyypGj8+b5ALYovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1s
	UlJzMstSi/TtEvQyPlx+ylxwXqZiw+y8BsY+8S5GTg4JAROJx+dfMoPYQgJLGSWWr9GGiMtI
	nJzWwAphC0v8udbF1sXIBVTznlFi4e4FYAleATuJb6fXMHYxcnCwCKhI3JtpCBEWlDg58wkL
	iC0qIC9x/9YMdhBbWCBMYtOOPWC7mAXEJW49mc8EMlNEYDOjxJ7Nv8AWMAvMZJToXLCdHWLb
	REaJtlfnwUaxCRhKdL0FOYOTgxNo877zX5kgRplJdG3tYoSw5SW2v53DPIFRaBaSS2Yh2TgL
	ScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbjtmM/t+xgXPnqo94hRiYOxkOM
	EhzMSiK8LBYvU4V4UxIrq1KL8uOLSnNSiw8xmgJDYyKzlGhyPjAd5JXEG5oZmBqamFkamFqa
	GSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MNnln8suSwuYt2pKTIVUc+ixa2l3ZqVGCshP
	dHdd1/S5ZPtdczPDq04eAiUZJq4BtwUWtpUrM/Wu/8Uhaa0t/jA9LOe/cp7+iic7Z8+NrDuX
	8md7wbJZj4pN9NVmyWz/KR8mvOr+nlol53P2ZjyTJ815VbTu9oueuIdR0y7/vf3t4aHyYwv1
	YrgUXO/GSq8yVbxpJK9v+zM8eLNNutv6ytSMJp3vD8P4BJUsdoXO5mhlfyTxWv2m3In0JXvk
	Ost93i11UAqx+aTq5KAYeiYozHfm7RjBYNtJxXLxPW+4JP5O1367sMVnqoy+7s99dZ8j4hQf
	NukvqfD49Dunov7V+XOJuq0PrS5U1yjL7wtXYinOSDTUYi4qTgQART5uK08DAAA=
X-CMS-MailID: 20240307114107eucas1p2d18f8261c44f0978c37100b1188bf8f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240305105548eucas1p110f1ecf1570ff69a618ca86297eeba89
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240305105548eucas1p110f1ecf1570ff69a618ca86297eeba89
References: <CGME20240305105548eucas1p110f1ecf1570ff69a618ca86297eeba89@eucas1p1.samsung.com>
	<20240305-i2c_exynos5-v3-1-17a749688806@axis.com>

On 05.03.2024 11:50, Jesper Nilsson wrote:
> devm_request_irq() is called before we initialize the "variant"
> member variable from of_device_get_match_data(), so if an interrupt
> is triggered inbetween, we can end up following a NULL pointer
> in the interrupt handler.
>
> This problem was exposed when the I2C controller in question was
> (mis)configured to be used in both secure world and Linux.
>
> That this can happen is also reflected by the existing code that
> clears any pending interrupts from "u-boot or misc causes".
>
> Move the clearing of pending interrupts and the call to
> devm_request_irq() to the end of probe.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Fixes: 218e1496135e ("i2c: exynos5: add support for HSI2C on Exynos5260 SoC")
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> ---
> Changes in v3:
> - Avoid multiple assignment
> - Link to v2: https://lore.kernel.org/r/20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com
>
> Changes in v2:
> - Use dev_err_probe() instead of open coding it
> - Dropped the return failure if we can't find a match in devicetree
> - Link to v1: https://lore.kernel.org/r/20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com
> ---
>   drivers/i2c/busses/i2c-exynos5.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 385ef9d9e4d4..8458e22313a7 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -906,23 +906,9 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>   	i2c->adap.algo_data = i2c;
>   	i2c->adap.dev.parent = &pdev->dev;
>   
> -	/* Clear pending interrupts from u-boot or misc causes */
> -	exynos5_i2c_clr_pend_irq(i2c);
> -
>   	spin_lock_init(&i2c->lock);
>   	init_completion(&i2c->msg_complete);
>   
> -	i2c->irq = ret = platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		goto err_clk;
> -
> -	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> -			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
> -	if (ret != 0) {
> -		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
> -		goto err_clk;
> -	}
> -
>   	i2c->variant = of_device_get_match_data(&pdev->dev);
>   
>   	ret = exynos5_hsi2c_clock_setup(i2c);
> @@ -940,6 +926,21 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>   	clk_disable(i2c->clk);
>   	clk_disable(i2c->pclk);
>   
> +	/* Clear pending interrupts from u-boot or misc causes */
> +	exynos5_i2c_clr_pend_irq(i2c);

Just above this call the clocks have been disabled, so any access to the 
i2c host registers will result in freeze or external abort (depending on 
the soc/cpu).

To make things worse, this patch moved registering the interrupt handler 
after the i2c_add_adapter() call. This means that all i2c devices that 
will be probbed directly from i2c_add_adapter() won't be able to access 
the i2c bus, as the host controller is still not fully functional that 
time yet.

This breaks today's linux-next on all Exynos5+ platforms. Has anyone 
tested this change?

> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto err_clk;
> +	i2c->irq = ret;
> +
> +	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
> +	if (ret != 0) {
> +		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
> +		goto err_clk;
> +	}
> +
>   	return 0;
>   
>    err_clk:
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


