Return-Path: <linux-i2c+bounces-7952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3049C6AF6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 09:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D18528328C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 08:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C01E18870D;
	Wed, 13 Nov 2024 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iQhqx4TB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28039230999;
	Wed, 13 Nov 2024 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731488057; cv=none; b=j8llrY3/KchbAXfc2kH7ZiA+3/yGTir01GiH1iDK0235Q8SQbYKSa9KVhMY7dN6iq8gzcHy+YfbNHZ+8zLsC3DCAjYLxA+r0FL9aFCgVgohe3qx/eewFKx/QZNyqnM3kcBhyQ6hBxMb5TDzBDXtBqIyxznwR6FS0ENJjc89aXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731488057; c=relaxed/simple;
	bh=H7Y1+xgTkIPEtStm71lFE6l4dByLaWE7iB5+9vnDGGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4ZzD4wzJvHtBqCWGcLabWossmysvcucDkpufyzQVm6yf1aPKt0/h86kvz7QlKJLGIv23iGkq5jfuFSWJrYntv0KA5rNwFbm0Cix626uZbTCl1PSzLsQK0zCD2Ru6LIeZP1Hxi5Uxubou2jxnsIODkYtZynTvKZwjv48yF6yDjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iQhqx4TB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731488053;
	bh=H7Y1+xgTkIPEtStm71lFE6l4dByLaWE7iB5+9vnDGGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQhqx4TBleDVuF99NZ8lyPaVvrWj/UzjnPj9HXGubDsaH/yb2EBFBDZmsuCAerrkE
	 UZATpUZPFy/XJzSlnqI/Zw0O8t/UKQMCqCpEdXrVZ8JmjrC/+OYVBLVVrXKn7RY6Q1
	 Z7BOKOntTQsJBEFpY+7tKRQHEd5PDEw/WSUpCal4dO3WCV5DYdXtkjZo3BkkkkzCd+
	 diKkNAGTz52wbN3T+hKLmTdm0Zc/CE2Kej0CfgODqBWENTnY1A/lOTNPdcTacgWJxE
	 uglHlcgvaj/X8zcvREF3Dd+lUakW/K97aMq47V7XmxwKb1Bs8eodv2ZsvZIpnDbljh
	 lfMEU5K3d+YKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CE0017E139E;
	Wed, 13 Nov 2024 09:54:13 +0100 (CET)
Message-ID: <c2d1f933-0bb8-4aee-acd3-af4246f66913@collabora.com>
Date: Wed, 13 Nov 2024 09:54:12 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
To: =?UTF-8?B?Wm9pZSBMaW4gKOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?UWlpIFdhbmcgKOeOi+eQqik=?= <Qii.Wang@mediatek.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
 <20241106125212.27362-2-zoie.lin@mediatek.com>
 <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
 <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/11/24 16:19, Zoie Lin (林禹妡) ha scritto:
> Hi Angelo,
> 
> On Thu, 2024-11-07 at 11:13 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 06/11/24 13:52, Zoie Lin ha scritto:
>>> This commit introduces support for runtime PM operations in
>>> the I2C driver, enabling runtime suspend and resume functionality.
>>>
>>> Although in the most platforms, the bus power of i2c are always
>>> on, some platforms disable the i2c bus power in order to meet
>>> low power request.
>>>
>>> This implementation includes bus regulator control to facilitate
>>> proper handling of the bus power based on platform requirements.
>>>
>>> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
>>> ---
>>>    drivers/i2c/busses/i2c-mt65xx.c | 77
>>> ++++++++++++++++++++++++++++-----
>>>    1 file changed, 65 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-mt65xx.c
>>> b/drivers/i2c/busses/i2c-mt65xx.c
>>> index 5bd342047d59..4209daec1efa 100644
>>> --- a/drivers/i2c/busses/i2c-mt65xx.c
>>> +++ b/drivers/i2c/busses/i2c-mt65xx.c
>>
>> ..snip..
>>
>>> @@ -1370,6 +1373,40 @@ static int mtk_i2c_parse_dt(struct
>>> device_node *np, struct mtk_i2c *i2c)
>>>        return 0;
>>>    }
>>>
>>> +static int mtk_i2c_runtime_suspend(struct device *dev)
>>> +{
>>> +     struct mtk_i2c *i2c = dev_get_drvdata(dev);
>>> +
>>> +     clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>> +     if (i2c->adap.bus_regulator)
>>> +             regulator_disable(i2c->adap.bus_regulator);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int mtk_i2c_runtime_resume(struct device *dev)
>>> +{
>>> +     int ret = 0;
>>> +     struct mtk_i2c *i2c = dev_get_drvdata(dev);
>>
>>          struct mtk_i2c *i2c = dev_get_drvdata(dev);
>>          int ret;
>>
>>> +
>>> +     if (i2c->adap.bus_regulator) {
>>> +             ret = regulator_enable(i2c->adap.bus_regulator);
>>> +             if (ret) {
>>> +                     dev_err(dev, "enable regulator failed!\n");
>>> +                     return ret;
>>> +             }
>>> +     }
>>> +
>>> +     ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>> +     if (ret) {
>>> +             if (i2c->adap.bus_regulator)
>>> +                     regulator_disable(i2c->adap.bus_regulator);
>>> +             return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static int mtk_i2c_probe(struct platform_device *pdev)
>>>    {
>>>        int ret = 0;
>>> @@ -1472,13 +1509,18 @@ static int mtk_i2c_probe(struct
>>> platform_device *pdev)
>>>                }
>>>        }
>>>
>>> -     ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c-
>>>> clocks);
>>> +     ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>>        if (ret) {
>>> -             dev_err(&pdev->dev, "clock enable failed!\n");
>>>                return ret;
>>>        }
>>> +
>>> +     platform_set_drvdata(pdev, i2c);
>>> +
>>> +     ret = mtk_i2c_runtime_resume(i2c->dev);
>>> +     if (ret < 0)
>>> +             goto err_clk_bulk_unprepare;
>>>        mtk_i2c_init_hw(i2c);
>>> -     clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>> +     mtk_i2c_runtime_suspend(i2c->dev);
>>>
>>>        ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
>>>                               IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
>>> @@ -1486,19 +1528,22 @@ static int mtk_i2c_probe(struct
>>> platform_device *pdev)
>>>        if (ret < 0) {
>>>                dev_err(&pdev->dev,
>>>                        "Request I2C IRQ %d fail\n", irq);
>>> -             goto err_bulk_unprepare;
>>> +             goto err_clk_bulk_unprepare;
>>>        }
>>> +     pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>>
>> You had comments from me and from Andi on this delay, and you
>> completely ignored
>> both of us.
>>
>> We're still waiting for an answer to our question.
> 
> I am sorry for any confusion caused by my previous response.
> The response to your question was included in the cover letter, which
> might not have been very noticeable.
>   
> The delay before runtime_put_autosuspend() actually executes
> mtk_i2c_runtime_suspend() depends on the frequency of I2C usage by the
> devices attached to this bus. A 1000ms delay is a balanced value for
> latency and power metrics based on the MTK platform.
>   

Can you please write down "the numbers" into the commit description?

As in, to justify why 1000ms is a balanced value for latency and power, so,
write down a small table containing both values for various delays, like:

Delay(ms)    Latency(us)   Power(uW)
200          999           9999
500          9999          99999
1000         99999         999999

Please also say what is the minimum acceptable latency.

Thanks,
Angelo

>   
> Thank you.
>   
> Best regards,
> Zoie
>>
>>
>>> +     pm_runtime_use_autosuspend(&pdev->dev);
>>> +     pm_runtime_enable(&pdev->dev);
>>
>> devm_pm_runtime_enable() please.
>>
>>>
>>>        i2c_set_adapdata(&i2c->adap, i2c);
>>>        ret = i2c_add_adapter(&i2c->adap);
>>>        if (ret)
>>> -             goto err_bulk_unprepare;
>>> -
>>> -     platform_set_drvdata(pdev, i2c);
>>> +             goto err_pm_runtime_disable;
>>>
>>>        return 0;
>>>
>>> -err_bulk_unprepare:
>>> +err_pm_runtime_disable:
>>> +     pm_runtime_disable(&pdev->dev);
>>> +err_clk_bulk_unprepare:
>>>        clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>>
>>>        return ret;
>>> @@ -1510,6 +1555,7 @@ static void mtk_i2c_remove(struct
>>> platform_device *pdev)
>>>
>>>        i2c_del_adapter(&i2c->adap);
>>>
>>> +     pm_runtime_disable(&pdev->dev);
>>>        clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>>    }
>>>
>>> @@ -1518,6 +1564,10 @@ static int mtk_i2c_suspend_noirq(struct
>>> device *dev)
>>>        struct mtk_i2c *i2c = dev_get_drvdata(dev);
>>>
>>>        i2c_mark_adapter_suspended(&i2c->adap);
>>> +
>>> +     if (!pm_runtime_status_suspended(dev))
>>> +             mtk_i2c_runtime_suspend(dev);
>>> +
>>>        clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>>
>>>        return 0;
>>> @@ -1536,7 +1586,8 @@ static int mtk_i2c_resume_noirq(struct device
>>> *dev)
>>>
>>>        mtk_i2c_init_hw(i2c);
>>>
>>> -     clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
>>> +     if (pm_runtime_status_suspended(dev))
>>> +             mtk_i2c_runtime_suspend(dev);
>>
>> You want to resume, not to suspend, in a resume handler.
>>
>>>
>>>        i2c_mark_adapter_resumed(&i2c->adap);
>>>
>>> @@ -1546,6 +1597,8 @@ static int mtk_i2c_resume_noirq(struct device
>>> *dev)
>>>    static const struct dev_pm_ops mtk_i2c_pm = {
>>>        NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
>>>                                  mtk_i2c_resume_noirq)
>>> +     SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend,
>>> mtk_i2c_runtime_resume,
>>> +                        NULL)
>>>    };
>>>
>>>    static struct platform_driver mtk_i2c_driver = {
>>
>>
>>


