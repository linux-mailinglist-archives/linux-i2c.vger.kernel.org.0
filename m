Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2C126F9C9
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 12:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIRKB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 06:01:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51878 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgIRKB6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 06:01:58 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C8F42C6C54B982B532C2;
        Fri, 18 Sep 2020 18:01:55 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 18:01:46 +0800
Subject: Re: [PATCH -next] i2c: efm32: Use
 devm_platform_get_and_ioremap_resource()
To:     Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
CC:     <cj.chengjian@huawei.com>, <huawei.libin@huawei.com>,
        <wsa@kernel.org>, <u.kleine-koenig@pengutronix.de>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <961c1feb-f818-f98c-f618-57c643bac04c@hisilicon.com>
Date:   Fri, 18 Sep 2020 18:01:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020/9/18 16:25, Wang ShaoBo wrote:
> Make use of devm_platform_get_and_ioremap_resource() provided by
> driver core platform instead of duplicated analogue. dev_err() is
> removed because it has been done in devm_ioremap_resource().
>
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
>  drivers/i2c/busses/i2c-efm32.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
> index 838ce0947191..f6e13ceeb2b3 100644
> --- a/drivers/i2c/busses/i2c-efm32.c
> +++ b/drivers/i2c/busses/i2c-efm32.c
> @@ -332,21 +332,15 @@ static int efm32_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "failed to determine base address\n");
> -		return -ENODEV;
> -	}
> +	ddata->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(ddata->base))
> +		return PTR_ERR(ddata->base);
>  
>  	if (resource_size(res) < 0x42) {

res is not assigned. should it be removed?


>  		dev_err(&pdev->dev, "memory resource too small\n");
>  		return -EINVAL;
>  	}
>  
> -	ddata->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(ddata->base))
> -		return PTR_ERR(ddata->base);
> -
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret <= 0) {
>  		if (!ret)

