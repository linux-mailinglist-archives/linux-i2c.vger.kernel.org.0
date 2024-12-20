Return-Path: <linux-i2c+bounces-8661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163A9F90B9
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 11:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE3C189659E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 10:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B801A83F4;
	Fri, 20 Dec 2024 10:51:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1ED18C31
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691898; cv=none; b=CulwZBwlFg5OHfepJCKypbR9+JboTW016oq1TXhzEOJC4eTW06SP0FSi5JGlcBjRk8fZxBT31OwglY/4ihN9PSvhZcUVSyrD+b/8S2uIO7jjxBC5jZdqhI9SKHwZ3On71ougzhoOqZ3Wr3s2IdkR8K0dvjta7jeOp/Mekk+oOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691898; c=relaxed/simple;
	bh=sYjbPinpdn6t9amhVGW7Ixe8xZEPMz6GyNUUquo6HvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcRoJIx5QgwfwHVuaRVhuupwdr9YalWZKYVuHdchTeHXf8Vc8CqWpU/EjX+pVXmx5z58CVqM2Fcy8KwtmNiY2X5zPjt4BlwtLCaFkjCaBXfqup+r67dLAVyDrg7Qg4JCbwcp13t02leTdTqyZp41qp48cyqGzm+IBvVR+wZHsVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOabQ-0002KC-Lb; Fri, 20 Dec 2024 11:51:28 +0100
Message-ID: <f2690b83-b907-4ade-bb9d-daa0636c6786@pengutronix.de>
Date: Fri, 20 Dec 2024 11:51:27 +0100
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
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
 <AM0PR0402MB3937E87BBDC5CEA1C51E4E3AE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB3937E87BBDC5CEA1C51E4E3AE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Carlos,

On 20.12.24 11:46, Carlos Song wrote:
> 
> 
>> -----Original Message-----
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Friday, December 20, 2024 5:32 PM
>> To: Carlos Song <carlos.song@nxp.com>; Oleksij Rempel

>> I know -110, but -12 I need to look up :) Both are cryptic to end users, which is
>> why %pe was added on top of the existing %p:
>>
>> If CONFIG_SYMBOLIC_ERRNAME is enabled %pe expands to an error string, e.g.
>> "ENOMEM" or "ETIMEDOUT". If it's disabled, you get the same error number
>> that was printed raw before.
>>
>> Cheers,
>> Ahmad
>>
> 
> Wow! Looks so cool.
> Thank you very much for your patient explanation! I agree it.
> 
> Also I will change the comment from your suggestion[1]:
> 
> "
>   /*
>    * As we can always fall back to PIO, let's ignore the error setting up
>    * DMA and see if we run into errors while setting up PIO mode.
>    */
> "
> In fact, other errors are also from DMA setting not from setting PIO mode.
> So can I comment simply like this?
> 
>         /* As we can always fall back to PIO, let's ignore the error setting up DMA. */
>         ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>         if (ret) {
>                 if (ret == -EPROBE_DEFER)
>                         goto clk_notifier_unregister;
>                 else if (ret == -ENODEV)
>                         dev_dbg(&pdev->dev, "Only use PIO mode\n");
>                 else
>                         dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));
>         }
> 
> [1]https://lore.kernel.org/imx/89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de/

Sure, looks good to me. @Oleksij?

Cheers,
Ahmad

> 
> BR
> Carlos
>>>
>>> i2c_imx_dma_request is using PTR_ERR to convert pointer to error value[1].
>>> I don't know why need to use ERR_PTR to reconvert the value to pointer:
>>>
>>> dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
>>> ERR_PTR(ret));
>>>
>>> Is there some strong reason?
>>>
>>> [1]
>>> https://lore/
>>> .kernel.org%2Fimx%2FAM0PR0402MB3937419BBB58B75FB8F8DE2DE8072%
>> 40AM0PR04
>>>
>> 02MB3937.eurprd04.prod.outlook.com%2F&data=05%7C02%7Ccarlos.song%4
>> 0nxp
>>> .com%7C13a8e6532dd7435c302008dd20d92819%7C686ea1d3bc2b4c6fa92c
>> d99c5c30
>>>
>> 1635%7C0%7C0%7C638702839227618754%7CUnknown%7CTWFpbGZsb3d8eyJ
>> FbXB0eU1h
>>>
>> cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
>>>
>> oyfQ%3D%3D%7C0%7C%7C%7C&sdata=2A6qPlFEuW1SmlvOZ7OhtfO7VwqysM
>> cGhFL2G%2F
>>> ECNek%3D&reserved=0
>>>>
>>>> --
>>>> Pengutronix e.K.                           |
>>>> |
>>>> Steuerwalder Str. 21                       |
>>>> http://www/.
>>>>
>> pen%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C13a8e6532dd7435c30
>> 2008d
>>>>
>> d20d92819%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63870283
>> 922763
>>>>
>> 8077%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
>> uMDAw
>>>>
>> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s
>> da
>>>>
>> ta=LasLtpe7GjsG5qVUKG%2FOmVro2JueGLfwUPALw7%2FB2fg%3D&reserved=
>> 0
>>>>
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C594497db1b5
>>>>
>> 44e479a8f08dd20d1e88e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>>>> %7C638702808104903131%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hc
>> Gki
>>>>
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyf
>>>>
>> Q %3D%3D%7C0%7C%7C%7C&sdata=EnhsIFlBooqjB%2FSRWF7uAqRHE3yN6rbd
>> D
>>>> 1yQueTrRus%3D&reserved=0  |
>>>> 31137 Hildesheim, Germany                  | Phone:
>> +49-5121-206917-0
>>>> |
>>>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>>>> +49-5121-206917-5555 |
>>
>>
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C13a8e6532dd
>> 7435c302008dd20d92819%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638702839227652725%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
>> %3D%3D%7C0%7C%7C%7C&sdata=Hm60QL5dJ2h3OCesOXK871ASnK7s0L4SPiY
>> bK0jtSOo%3D&reserved=0  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
>> |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>> +49-5121-206917-5555 |


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

