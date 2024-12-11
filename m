Return-Path: <linux-i2c+bounces-8442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B061A9EC554
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 08:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBDA4167DB8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 07:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1AD1C5CA1;
	Wed, 11 Dec 2024 07:07:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B41BEF8C
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733900823; cv=none; b=rutNkJN1Sma3Rsje6k7MZ52v8ySAUt8OfyG92IyNi9AGrK/9QeyXkWQLKL1iJrl65nOOe1vJ0qpKqHySSwDDnSm8XNDu9a40g2rDzRlihMDt1RLtqVxZnk9tpOiAKINszCM4lEFhs4epocMVxb1SOIeZ6pTJpurSLBM8BZgLJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733900823; c=relaxed/simple;
	bh=+SIsTlZG3Gbv/qQEbZDvjJ5SDdh32HKWC7OEu6M0n0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky4kJoGnIc82NSeSrkSwFETY8VfeHaqa8brSzxPYGG/lfA6yHpKJHZ7qgDhvaricgldF17PBMsbyX6VunM9pwKWLFK6s6NLXoAgftUAN5aPfIJlPtBX99f0rHb9ZFXgB5HYK3E2r8/GMyQ6GWjG7eLxW7vI54j3yH/4D5mNeoOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tLGo6-0008Lz-67; Wed, 11 Dec 2024 08:06:50 +0100
Message-ID: <ff7b4769-245c-4c3b-9b15-b8f2c032d3c1@pengutronix.de>
Date: Wed, 11 Dec 2024 08:06:48 +0100
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
 <6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de>
 <AM0PR0402MB39378417A496F13B201A1907E8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB39378417A496F13B201A1907E8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi,

On 06.12.24 10:07, Carlos Song wrote:
>> -----Original Message-----
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Friday, December 6, 2024 2:50 AM
> Refer previous history:
> https://lore.kernel.org/linux-arm-kernel/6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de/


> Before replying to your question, I think we should synchronize SDMA and eDMA firstly.

[snip]

> SDMA initialization in i2c-imx driver:
> 
> +       dma->chan_tx = dma_request_chan(dev, "rx-tx");
> +       if (IS_ERR(dma->chan_tx)) {
> +               ret = PTR_ERR(dma->chan_tx);
> +               goto fail_dma;
> +       }
> +
> +       dma->chan_rx = dma->chan_tx;
> +       i2c_imx->dma = dma;
> 
> eDMA initialization in i2c-imx driver:
> 
> ...
> +       dma->chan_tx = dma_request_chan(dev, "tx");
> ....
> +       dma->chan_rx = dma_request_chan(dev, "rx");
> ....
>         i2c_imx->dma = dma;

Thanks for the clarification, I missed that.

> So if need to enable SDMA, should define a separate dma_request function and should not reuse the current i2c_imx_dma_request function.
> Also according to different platforms i2c-imx driver need to choose to use eDMA or SDMA.

Understood.

> So now we start to discuss about your confusion:
> 
>> My concern is this configuration:
>>
>>   - A user has eDMA/SDMA module or disabled, but enabled in DT
> [Carlos]:
> I delete edma channel at dts to disable eDMA before. It works in PIO mode.
> I also test your case : when enable dma channel in DT but disable eDMA module. It will meet error:
> 
> +++ b/arch/arm64/configs/defconfig
> ....
> -CONFIG_FSL_EDMA=y
> ....
> 
> root@ls1043ardb:~# dmesg | grep i2c
> [    4.697392] i2c_dev: i2c /dev entries driver
> [   18.357685] platform 2180000.i2c: deferred probe pending: (reason unknown)
> root@ls1043ardb:~# i2cdetect -y -l
> 
> The case you mentioned is completely inconsistent with the actual usage. Since you have defined the dma channel in dts, it means that you need to
> use DMA mode in i2c, but you disabled the eDMA module when building the Image. This makes no sense at all. I think this is a usage error.
> And the deferred probe pending error is predictable. Since there is no DMA driver loaded, I2C will keep defer probe and be hanged.

I (or rather the user) didn't knowingly define anything though. They just
used the upstream DT, which always enables the DMA nodes and it worked
fine without DMA support enabled in the config for years.
Now they update the kernel after your patches are merged and then the
I2C driver is no longer being probed.

> 
>>   - The I2C has a PMIC, which is needed for eMMC VCC
> [Carlos]:
> PMIC is critical for the whole board, so PMIC will finish all critical system power-on configuration(include eMMC VCC) in the uboot not at kernel.
> So pmic driver probe in kernel won't and shouldn't effect system boot.
> 
>>   - System startup is stuck or considerably delayed
>>
> The purpose of defer probe is to solve the problem of interdependence of module loading, and to try to load again after a while is to ensure that the required functions
> will not be unavailable because the resources are not ready. This delay is unavoidable. If a defer probe occurs, the first consideration should be to reasonably adjust the
> loading order of each module, rather than directly giving up the functions that should be enabled.

If I2C is a critical dependency, the system becomes unbootable instead of the
user just having to wait a little longer. To me that is a regression.

You clarified though that this is only for Layerscape, so the breakage is
more limited, because e.g. on LS1046A-RDB only EEPROM/sensors/RTC won't be
available and system should still be able to boot.

So while I am not yet convinced an equivalent of this change to be a good
idea for i.MX, which tends to have critical peripherals like PMIC on the
I2C, I don't object to it being done for Layerscape. You may add my:

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

