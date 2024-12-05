Return-Path: <linux-i2c+bounces-8353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F19E5E74
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 19:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2ECC2874FE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 18:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C504A22D4F6;
	Thu,  5 Dec 2024 18:50:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309422D4DC
	for <linux-i2c@vger.kernel.org>; Thu,  5 Dec 2024 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424601; cv=none; b=rmOfURj+gXtU8xRohu8Q7uH1SqDeLYJeKshBsnB5X+BLE1EekKFRW/kStv/P+zF2CxZrjejAI098PDzJOEDPNthrgYmhI4EXl78SK9kqSnBYqcmQggOPw5BaK7q21OGZsJ0USeIpAcBGaKXfPe5e0Zhe9mxqZ0V2Z+VDKRJvUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424601; c=relaxed/simple;
	bh=M/rBbGAx2CuXXqqgw76JMcAKs+dETgh4yUtfeqkmFqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvmzEbCcopSoHO6D8xckQ3HwAcjIlYGZW7b6c6d4vy9sTosVMXmfT5V8srXtdwYH4crMIhrRlsBhnQYJLgzg63mLf2+w800lckPWGIYzjGClNjxLabTpNJ/K+868eKMAnRZE+RmOQC+RBWARdMj4xPEx6PuQBDuDi+cbKWljQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tJGv7-0006PO-8a; Thu, 05 Dec 2024 19:49:49 +0100
Message-ID: <6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de>
Date: Thu, 5 Dec 2024 19:49:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
To: Carlos Song <carlos.song@nxp.com>, "mkl@pengutronix.de"
 <mkl@pengutronix.de>, Frank Li <frank.li@nxp.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
 <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hello Carlos,

On 27.11.24 11:43, Carlos Song wrote:
>> -----Original Message-----
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Wednesday, November 27, 2024 4:38 PM
>> To: Carlos Song <carlos.song@nxp.com>; mkl@pengutronix.de; Frank Li
>> <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
>> andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
>> festevam@gmail.com
>> Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [PATCH v4] i2c: imx: support DMA defer probing

>> Please try to address open questions before sending new versions of the patch
>> set. Otherwise, it's difficult to follow the conversation.
>>
>> Did you see my question[1] on your v2:
>>
> 
> Hi, thank you so much! So sorry about it... I missed it yesterday. I will answer your question[1] in this mail.
> 
> 
>> | Wouldn't this break probe for all i2c-imx users who have
>> | CONFIG_IMX_SDMA disabled?
>> |
> 
> I have tested i2c probe at IMX and LS platform when DMA disabled,

What does DMA disabled mean? Did you leave the dmas property in the device
tree unchanged, but just disabled the config option?

> it won't break i2c-imx probe.
> When require DMA channel in i2c_imx_dma_request, find no devices and return
> -ENODEV, as you see at V4 patch, it will continue to probe and work in PIO mode.
> I2C adapter should keep available whatever DMA mode is or isn't enabled.

If that's the case, then all is good. I thought the situation described
above would return -EPROBE_DEFER instead. I haven't dug into the code
to understand what the difference between when dma_request_chan().

>> | Also I am wondering on what kernel version and what configuration
>> | (CONFIG_I2C_IMX=?, CONFIG_IMX_SDMA=?) you have that made you run into
>> | this situation.
>> |
> 
> I want to correct something, these code about DMA in i2c-imx.c is for eDMA not for SDMA.
> For eDMA mode, I have tested this patch at layerscape-1043 platform. My patch is based on
> cfba9f07a1d6 (tag: next-20241122, origin/master, origin/HEAD).

The driver also handles i.MX variants like i.MX6, i.MX8 and so on, which
have SDMA. So eDMA is not the only DMA driver it is used with.

> 
> Test log is :
> No apply this patch:
> CONFIG_I2C_IMX=y
> CONFIG_FSL_EDMA=y
> root@ls1043ardb:~# dmesg | grep i2c
> [    1.162053] i2c i2c-0: IMX I2C adapter registered
> [    1.166826] i2c i2c-0: using dma0chan16 (tx) and dma0chan17 (rx) for DMA transfers
> [    4.722057] i2c_dev: i2c /dev entries driver
> 
> Not apply the patch:
> CONFIG_I2C_IMX=y
> CONFIG_FSL_EDMA=m
> root@ls1043ardb:~# dmesg | grep i2c
> [    1.166381] i2c i2c-0: IMX I2C adapter registered
> [    4.719226] i2c_dev: i2c /dev entries driver
> (result shows i2c not enabled the eDMA mode)
> root@ls1043ardb:~# i2cdetect -y -l
> i2c-0   i2c             2180000.i2c                             I2C adapter
> root@ls1043ardb:~# i2cdetect -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         08 -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> After apply the patch:
> CONFIG_I2C_IMX=y
> CONFIG_FSL_EDMA=m
> root@ls1043ardb:~#
> root@ls1043ardb:~# dmesg | grep i2c
> [    4.697046] i2c_dev: i2c /dev entries driver
> [    7.304142] imx-i2c 2180000.i2c: using dma0chan16 (tx) and dma0chan17 (rx) for DMA transfers
> [    7.313532] i2c i2c-0: IMX I2C adapter registered
> (result shows i2c probed after eDMA module installed)

My concern is this configuration:

  - A user has eDMA/SDMA module or disabled, but enabled in DT
  - The I2C has a PMIC, which is needed for eMMC VCC
  - System startup is stuck or considerably delayed

> root@ls1043ardb:~#
> root@ls1043ardb:~# i2cdetect -y -l
> i2c-0   i2c             2180000.i2c                             I2C adapter
> root@ls1043ardb:~# i2cdetect -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         08 -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> 
>> | I'd have expected that with fw_devlink enabled, the I2C controller
>> | wouldn't be probed before the DMA provider is available.
>>
> 
> This is a legacy patch, it has been in our local tree for a long time. The related history is relatively vague.
> I reproduced the problem and found this patch is effective, so I referred the community patch and
> legacy patch to rewrite the commit log(I am not sure if this would happened in some cases so I kept this information).
> Now it seems that these descriptions are redundant. I should completely removed this in the commit log:
>     Move i2c_imx_dma_request() before registering I2C adapter to avoid
>     infinite loop of .probe() calls to the same driver, see "e8c220fac415
>     Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
>     and "Documentation/driver-api/driver-model/driver.rst".

Cheers,
Ahmad

> 
> [1]: https://lore.kernel.org/all/19a43db4-db5c-4638-9778-d94fb571a206@pengutronix.de/
> [2]:https://lore.kernel.org/all/153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de/
> 
>>>
>>> Signed-off-by: Carlos Song <carlos.song@nxp.com>
>>> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
>>> ---
>>> Change for V4:
>>> - Output "Only use PIO mode" log in debug level when no DMA configure.
>>> Change for V3:
>>> - According to Marc's comment, remove error print when defer probe.
>>>   Add info log when DMA has not been enabled and add error log when
>>>   DMA error, both won't stuck the i2c adapter register, just for reminding,
>>>   i2c adapter is working only in PIO mode.
>>> Change for V2:
>>> - According to Frank's comments, wrap at 75 char and Simplify fix code
>>>   at i2c_imx_dma_request().
>>> - Use strict patch check, fix alignment warning at
>>> i2c_imx_dma_request()
>>> ---
>>>  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
>>>  1 file changed, 23 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-imx.c
>>> b/drivers/i2c/busses/i2c-imx.c index 5ed4cb61e262..b11d66d56c55 100644
>>> --- a/drivers/i2c/busses/i2c-imx.c
>>> +++ b/drivers/i2c/busses/i2c-imx.c
>>> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct
>>> imx_i2c_struct *i2c_imx)  }
>>>
>>>  /* Functions for DMA support */
>>> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>>> -                                             dma_addr_t
>> phy_addr)
>>> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>>> +dma_addr_t phy_addr)
>>>  {
>>>       struct imx_i2c_dma *dma;
>>>       struct dma_slave_config dma_sconfig;
>>> -     struct device *dev = &i2c_imx->adapter.dev;
>>> +     struct device *dev = i2c_imx->adapter.dev.parent;
>>>       int ret;
>>>
>>>       dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>>>       if (!dma)
>>> -             return;
>>> +             return -ENOMEM;
>>>
>>>       dma->chan_tx = dma_request_chan(dev, "tx");
>>>       if (IS_ERR(dma->chan_tx)) {
>>> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct
>> imx_i2c_struct *i2c_imx,
>>>       dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>>>               dma_chan_name(dma->chan_tx),
>>> dma_chan_name(dma->chan_rx));
>>>
>>> -     return;
>>> +     return 0;
>>>
>>>  fail_rx:
>>>       dma_release_channel(dma->chan_rx);
>>> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct
>> imx_i2c_struct *i2c_imx,
>>>       dma_release_channel(dma->chan_tx);
>>>  fail_al:
>>>       devm_kfree(dev, dma);
>>> +
>>> +     return ret;
>>>  }
>>>
>>>  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
>>> static int i2c_imx_probe(struct platform_device *pdev)
>>>       if (ret == -EPROBE_DEFER)
>>>               goto clk_notifier_unregister;
>>>
>>> +     /*
>>> +      * Init DMA config if supported, -ENODEV means DMA not enabled at
>>> +      * this platform, that is not a real error, so just remind "only
>>> +      * PIO mode is used". If DMA is enabled, but meet error when request
>>> +      * DMA channel, error should be showed in probe error log. PIO mode
>>> +      * should be available regardless of DMA.
>>> +      */
>>> +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>>> +     if (ret) {
>>> +             if (ret == -EPROBE_DEFER)
>>> +                     goto clk_notifier_unregister;
>>> +             else if (ret == -ENODEV)
>>> +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
>>> +             else
>>> +                     dev_err_probe(&pdev->dev, ret, "Failed to setup
>> DMA, only use PIO mode\n");
>>> +     }
>>> +
>>>       /* Add I2C adapter */
>>>       ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
>>>       if (ret < 0)
>>> @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct platform_device
>> *pdev)
>>>               i2c_imx->adapter.name);
>>>       dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
>>>
>>> -     /* Init DMA config if supported */
>>> -     i2c_imx_dma_request(i2c_imx, phy_addr);
>>> -
>>>       return 0;   /* Return OK */
>>>
>>>  clk_notifier_unregister:
>>
>>
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C1acf840d499f
>> 49a7872408dd0ebedc39%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638682935131084746%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
>> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s
>> data=Y9Qn9XEk15yu4CespwsNu6hl3%2FqfNTvEeOn4ZvnGxbo%3D&reserved=0
>> |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
>> |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>> +49-5121-206917-5555 |
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

