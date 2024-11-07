Return-Path: <linux-i2c+bounces-7869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D81959C0202
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 11:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585EC1F221EF
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 10:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2891E907E;
	Thu,  7 Nov 2024 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PMIS4rej"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD17195F22;
	Thu,  7 Nov 2024 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730974440; cv=none; b=QgiB9hPxEQS9bmHHQ1AhHPvILPAejRgTS6xraXsyeerwtd5OG36hNnL++bb80uhaftxBcxYhUj7IE1vlmNVLbhPsxpxxggbC6bXNwIk//KPq+VxMP9/5StDSmlQiLRvGdxnByRwHpxiIgheAsifegkIZFGx1UZp4DYZ+Kshdv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730974440; c=relaxed/simple;
	bh=qGL+owtZbc1lnLogLE8XlKsc16UpGYGBcPFpDTZdqk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUmOkQw4sZqIZWaETlMx5E9xt7R0lLQWLRYPXNAbCvYgv4USnP0JSnlS5JyiM8yE5oSubAM+W/rSNPokrBwQu1vqcDPPuSD/t5BNERYuSaRYWEUpisdPsXsaTVCjfCbIs02m9psQ6CjNscDzahf4ba8e2Wq6/20ScfNOFwJopk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PMIS4rej; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730974430;
	bh=qGL+owtZbc1lnLogLE8XlKsc16UpGYGBcPFpDTZdqk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMIS4rejvUGx/AV6FPb0rxG6CIyLbGVPSXwSi7+sIZiYQHrjVICYMJVtJXOtTPAdH
	 6u8ODv5ojFaKj2YGjTQM2PyZqe2HxzMi6lv6BHSjkPAGGkqZwWXlpmUq6/T18/6l7u
	 UwcaaBQmEoDd6HDAYJgG2L0teyNoKRleZe44H2lfPHEDqOxAL5Wi7L7QLGYin/Ty9p
	 ueGV0nEaVFr2TKjIHKGo6dEfbqfTNa+iG7Rj9YyTwYNfaQHJeYdFde4zdIOXnWG0lM
	 Gj3286ptUSdpdcucpF/tFxLhAodvljsUWC0U8/ASc8ypnlF3tukG1lTBnT+UR+ZhGR
	 8xB1kl4GiTHAg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF58717E14FB;
	Thu,  7 Nov 2024 11:13:49 +0100 (CET)
Message-ID: <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
Date: Thu, 7 Nov 2024 11:13:49 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
To: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, teddy.chen@mediatek.com
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
 <20241106125212.27362-2-zoie.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106125212.27362-2-zoie.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 13:52, Zoie Lin ha scritto:
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
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++-----
>   1 file changed, 65 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5bd342047d59..4209daec1efa 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c

..snip..

> @@ -1370,6 +1373,40 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
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
> +		if (ret) {
> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret) {
> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
>   	int ret = 0;
> @@ -1472,13 +1509,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");
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
> @@ -1486,19 +1528,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0) {
>   		dev_err(&pdev->dev,
>   			"Request I2C IRQ %d fail\n", irq);
> -		goto err_bulk_unprepare;
> +		goto err_clk_bulk_unprepare;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);

You had comments from me and from Andi on this delay, and you completely ignored
both of us.

We're still waiting for an answer to our question.


> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);

devm_pm_runtime_enable() please.

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
> @@ -1510,6 +1555,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
>   
>   	i2c_del_adapter(&i2c->adap);
>   
> +	pm_runtime_disable(&pdev->dev);
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   }
>   
> @@ -1518,6 +1564,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
>   	struct mtk_i2c *i2c = dev_get_drvdata(dev);
>   
>   	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_suspend(dev);
> +
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return 0;
> @@ -1536,7 +1586,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   
>   	mtk_i2c_init_hw(i2c);
>   
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_suspend(dev);

You want to resume, not to suspend, in a resume handler.

>   
>   	i2c_mark_adapter_resumed(&i2c->adap);
>   
> @@ -1546,6 +1597,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   static const struct dev_pm_ops mtk_i2c_pm = {
>   	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
>   				  mtk_i2c_resume_noirq)
> +	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
> +			   NULL)
>   };
>   
>   static struct platform_driver mtk_i2c_driver = {




