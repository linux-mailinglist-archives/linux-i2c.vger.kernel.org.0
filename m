Return-Path: <linux-i2c+bounces-6951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A039840AF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 10:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512312859BF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 08:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14FF14EC60;
	Tue, 24 Sep 2024 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ex3wrTgz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1C14D6F7;
	Tue, 24 Sep 2024 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167155; cv=none; b=hGU+JfWnbqRwJPUYMl4uWdHL/YU0hsTaNNzBYHaK7fJiJPVZkxepdqtHM/lbfhL4Qjm5f3LXcZ0l9Z0Hm3ZdOTItixPs+Cr4uYJe2a0WdF0hgN/6oEV6+Bn/GZfn9J+uuSJBqB4A8Yx+a4hbejYby46yx+HFpT9SG74+Up4rzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167155; c=relaxed/simple;
	bh=rF2hSvRoH7iIqmTjIrJJBZHPbGoS+9IepCXUIvhaqDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHN7mCxV+ZOAwDnADhIxEYvp4zgLVsP4WqjD0C6ZFnEkDcKeXkPb7tf21ArSz/IEbhGO92T407iO8IE8E1DJMYsRY+3/Sfe+ygpcWYAFNY6wOQVfUK+KQRgDauXTj2iBdbWrFHLfgb1Qz0MHgQmmeu1JX4jOHTinlvCORRXruT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ex3wrTgz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727167144;
	bh=rF2hSvRoH7iIqmTjIrJJBZHPbGoS+9IepCXUIvhaqDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ex3wrTgzUqRZpy/PtVqb9ldugnriMbN9ON1rq0Pq8yX2ssvtIGOCB1ZHH5AzxAIpr
	 oG2dKkORcA7S/CbRsWQo8OH9u8n13l29EslszFJZeaXyuqZ1bg+1xZCiAHPkwU5ZAg
	 rLsjEE0/sPU6D4osnIZrfCDZ2ze7PBQbSJMuYIU+RUYsBBhmFhGiN24kGoV+uvrToh
	 3YbCO5aG1jRvqP8IkKlHs/A6thpsiN4chBRbOJFx0fDqRCwH8OfuZrhvHYfmyKJrla
	 UfOfquZBvhIHUaWG0DE5gmHI2WTZoC8qqCsT+3lkC7vGKrCxBvHY9UTwDZcbi53AGF
	 LIwW4hjW6A5PA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1154D17E1067;
	Tue, 24 Sep 2024 10:39:04 +0200 (CEST)
Message-ID: <33dc7f60-4364-4d7a-a66b-4bd881b41675@collabora.com>
Date: Tue, 24 Sep 2024 10:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
To: "zoie.lin" <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240920143627.23811-1-zoie.lin@mediatek.com>
 <20240920143627.23811-2-zoie.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920143627.23811-2-zoie.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/09/24 16:36, zoie.lin ha scritto:
> This commit introduces support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in the most platforms, the bus power of i2c are always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: zoie.lin <zoie.lin@mediatek.com>

Hello Zoie,

Your name does not technically have any "." inside, so please fix it
so that it reads `Zoie Lin <zoie.lin@mediatek.com>`.

Moreover, this implementation can be improved. Check below:

You missed pm_runtime_status_suspended() checks in suspend/resume callbacks
and, if the bus wasn't already runtime suspended when reaching suspend(), that
will not get the bus regulators powered off when suspending; analogously, if
the device was runtime suspended, the regulators and clocks will stay on when
resuming from system sleep until first usage.

So add the checks:

static int mtk_i2c_suspend_noirq(struct device *dev)
{
	struct mtk_i2c *i2c = dev_get_drvdata(dev);

	i2c_mark_adapter_suspended(&i2c->adap);

	if (!pm_runtime_status_suspended(dev))
		mtk_i2c_runtime_suspend(dev);

	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
	return 0;
}

static int mtk_i2c_resume_noirq(struct device *dev)
{
	int ret;
	struct mtk_i2c *i2c = dev_get_drvdata(dev);

	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
	if (ret) {
		dev_err(dev, "clock enable failed!\n");
		return ret;
	}

	mtk_i2c_init_hw(i2c);

	if (pm_runtime_status_suspended(dev))
		ret = mtk_i2c_runtime_suspend(dev);

	i2c_mark_adapter_resumed(&i2c->adap);

	return 0;
}

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 72 ++++++++++++++++++++++++++++-----
>   1 file changed, 61 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e0ba653dec2d..aae0189ba210 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -21,6 +21,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/scatterlist.h>
>   #include <linux/sched.h>
>   #include <linux/slab.h>
> @@ -1245,8 +1246,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>   	int left_num = num;
>   	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
>   
> -	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> -	if (ret)
> +	ret = pm_runtime_get_sync(i2c->dev);

ret = pm_runtime_resume_and_get(i2c->dev);

> +	if (ret < 0)
>   		return ret;
>   
>   	i2c->auto_restart = i2c->dev_comp->auto_restart;
> @@ -1299,7 +1300,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>   	ret = num;
>   
>   err_exit:
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	pm_runtime_mark_last_busy(i2c->dev);
> +	pm_runtime_put_autosuspend(i2c->dev);
> +
>   	return ret;
>   }
>   
> @@ -1370,6 +1373,41 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>   	return 0;
>   }
>   
> +static int mtk_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (i2c->adap.bus_regulator)
> +		regulator_disable(i2c->adap.bus_regulator);
> +
> +	return 0;
> +}
> +
> +static int mtk_i2c_runtime_resume(struct device *dev)
> +{
> +	int ret = 0;
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);

struct mtk_i2c *i2c = dev_get_drvdata(dev);
int ret;

> +
> +	if (i2c->adap.bus_regulator) {
> +		ret = regulator_enable(i2c->adap.bus_regulator);
> +		if (ret < 0) {

`ret` can't be > 0. `if (ret) {` is enough.

> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret < 0) {

if (ret) {

> +		dev_err(dev, "clock enable failed!\n");

This print is unnecessary.

> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +		return ret;
> +	}
> +
> +	return ret;

return 0;

> +}
> +
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
>   	int ret = 0;
> @@ -1472,13 +1510,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");
> +		dev_err(&pdev->dev, "clk_bulk_prepare failed\n");

This print is anyway redundant, as clk_bulk_prepare() already prints upon failures,
so you can as well simply remove it instead of changing it.

>   		return ret;
>   	}
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = mtk_i2c_runtime_resume(i2c->dev);
> +	if (ret < 0)
> +		goto err_clk_bulk_unprepare;
>   	mtk_i2c_init_hw(i2c);
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	mtk_i2c_runtime_suspend(i2c->dev);
>   
>   	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
>   			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
> @@ -1486,19 +1530,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0) {
>   		dev_err(&pdev->dev,
>   			"Request I2C IRQ %d fail\n", irq);
> -		goto err_bulk_unprepare;
> +		goto err_clk_bulk_unprepare;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);

One full second as autosuspend delay? Can this be shortened to 500? 250?

How was the one second wait chosen?

How much time does mtk_i2c_runtime_resume() take to resume the bus?

> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
>   
>   	i2c_set_adapdata(&i2c->adap, i2c);
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret)
> -		goto err_bulk_unprepare;
> -
> -	platform_set_drvdata(pdev, i2c);
> +		goto err_pm_runtime_disable;
>   
>   	return 0;
>   
> -err_bulk_unprepare:
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +err_clk_bulk_unprepare:
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return ret;
> @@ -1510,6 +1557,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
>   
>   	i2c_del_adapter(&i2c->adap);
>   
> +	pm_runtime_disable(&pdev->dev);

pm_runtime_set_suspended(&pdev->dev);

>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   }
>   

Regards,
Angelo



