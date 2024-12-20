Return-Path: <linux-i2c+bounces-8651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1E9F8D0C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 08:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EAFF7A34EB
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4764018B464;
	Fri, 20 Dec 2024 07:06:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C0143895
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678395; cv=none; b=gKYLwfo5EL4h75XN71R6HcFQyO2Zr1fyfdW67TMkuMFqS4haZDDcf0+f0G8mfy2IwJ+RI2PT0oUnezGM3xl5OhjPShUqCRl/nFZxg1uL4KaGOXhu9+9BGBTXF4sQGKAbih2s79SEw5tZ0uWSnJOFoQwW4AjDvBBQmBBPNMxrsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678395; c=relaxed/simple;
	bh=uZxZ8yrpv8mASNVGCE7qWubGm/h1Bkn1cqTlgFZtBVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ez+zx2JOuHSpNIbSRBmsJV8PWqxGuzkVJ7m621VAuv7cR3dno1aWSE/qvp1BfDxKqNqFcvlKHiGlu/FfEMIXHhc2rjPIb+bViNzI7fdQUrGWeK5YODW5wtA6i/vJ+NI8gmfTxQ70cF7uBbw78mKr/wD/5XWevsxhAZMzVsL/W7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOX5e-0007sl-Dz; Fri, 20 Dec 2024 08:06:26 +0100
Message-ID: <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
Date: Fri, 20 Dec 2024 08:06:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
To: Carlos Song <carlos.song@nxp.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hello Carlos,

On 20.12.24 07:58, Carlos Song wrote:
> 
> 
>> -----Original Message-----
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>> Sent: Friday, December 20, 2024 2:13 PM
>> To: Carlos Song <carlos.song@nxp.com>
>> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
>> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
>> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark Wang
>> <xiaoning.wang@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report this
>> email' button
>>
>>
>> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
>>>>> So we make this logic. Anyway we let the I2C controller registered
>>>>> whether
>>>> DMA is available or not(except defer probe).
>>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
>>>>> happened if
>>>> DMA is defer probed or not enabled(This is an expected).
>>>>> However we still need i2c DMA status is known when meet an
>>>>> unexpected
>>>> error, so we use dev_err_probe() to print error.
>>>>
>>>> Why dev_err_probe() instead of dev_err()?
>>>>
>>> Hi,
>>> In patch V2 discussion, Marc suggested just return dev_err_probe(),
>>> but I don't accept it so I choose to use dev_err_probe() to print error in V3.[1]
>> In this case, the two APIs have the same function, do you mean dev_err() is more
>> suitable?
>>
>> Yes, dev_err_probe() should be used in combination with return. For
>> example:
>>   return dev_err_probe(...);
>>
>> It will pass the return value on exit of the function and optionally print of the
>> error message if it is not EPROBE_DEFER. Practically it replace commonly used
>> coding pattern:
>>   if (ret == -EPROBE_DEFER) {
>>     return ret;
>>   } else if (ret) {
>>     dev_err(..);
>>     return ret;
>>   }
>>
> Hi,
> 
> Get your good point. I will change my code in V6:
> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +       if (ret) {
> +               if (ret == -EPROBE_DEFER)
> +                       goto clk_notifier_unregister;
> +               else if (ret == -ENODEV)
> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +               else
> +                       dev_err(&pdev->dev, "Failed to setup DMA, only use PIO mode\n");
> +       }
> 
> I think this is what you want to see, right?

This loses the information why the error happens (ret). Using dev_err_probe
even if no probe deferral is expected in that branch is perfectly fine
and the kernel-doc even points it out:

  Using this helper in your probe function is totally fine even if @err
  is known to never be -EPROBE_DEFER.

Cheers,
Ahmad

> 
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C2950266755a
>> 241c00a9208dd20bd5cf2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638702719862691439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
>> %3D%3D%7C0%7C%7C%7C&sdata=aIuzJP0v5C6HzOCGnCHobK9Llml3thHclTwu
>> CjD13IM%3D&reserved=0  |
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

