Return-Path: <linux-i2c+bounces-8658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09D9F8F09
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 10:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4152A1897310
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 09:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E441AF0D8;
	Fri, 20 Dec 2024 09:32:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479A1AAA3D
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687127; cv=none; b=lNxQeclH41eXJcHYqgcvUB8WclQULoZWQgFjB0i45/1yOUO6MRPpu5yMC4eeCqRfI36QU+u+sZr23qbaX5lJ7ymW2sUUvIz4uvSYiLT9oQTMaF+jb0I4DzIAk2nxiKveJp1ag2sJ0GDLLWtwepMVqEaDXWdO1lVRrK1BRwB/W38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687127; c=relaxed/simple;
	bh=WqNU/sa3J6EB9si587Rjlr27AdSxLeaAIatY0TSNIeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWYALCPrbntvmz0EvOyP6Af9fzDg1+DM22Jrx1/XN/aVohSJc7SMOan7aK2RTTDtvfpY2LkFYajpL8IuYjJK+uNdEh8m172XLtAnWIaUvGmTzaAXLx7KLHJXCkpw+3JBERHJldGXebT3nav+5HJtIXkKWyI03HNJGk9ODa0omFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZMW-0005JY-9M; Fri, 20 Dec 2024 10:32:00 +0100
Message-ID: <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
Date: Fri, 20 Dec 2024 10:31:59 +0100
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
 <Z2QQI2gJNLjI-fam@pengutronix.de>
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Carlos,

On 20.12.24 10:23, Carlos Song wrote:
>>> Hi, the ret is from i2c_imx_dma_request() and look like that ret has
>>> been converted by PTR_ERR, So the ret error has been human readable
>> version?
>>
>> I am not sure I understand the question. ERR_PTR() makes an error pointer
>> and %pe formats that pointer as error message. So you don't need to change
>> any function return types unless needed, just at the end print it with %pe
>> instead of %d (and after error pointer conversion if needed).
> 
> Sorry, I don't know if I understand it incorrectly.
> I review other driver code, most choose to return error value but not an error pointer.
> Shouldn't error value ​be more readable than error pointers?
> When we see -110 we know TIMEOUT and we see -12 we know NO MEM.

I know -110, but -12 I need to look up :)
Both are cryptic to end users, which is why %pe was added
on top of the existing %p:

If CONFIG_SYMBOLIC_ERRNAME is enabled %pe expands to an error string,
e.g. "ENOMEM" or "ETIMEDOUT". If it's disabled, you get the same
error number that was printed raw before.

Cheers,
Ahmad

> 
> i2c_imx_dma_request is using PTR_ERR to convert pointer to error value[1].
> I don't know why need to use ERR_PTR to reconvert the value to pointer:
> 
> dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));
> 
> Is there some strong reason?
> 
> [1] https://lore.kernel.org/imx/AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com/
>>
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C594497db1b5
>> 44e479a8f08dd20d1e88e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638702808104903131%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
>> %3D%3D%7C0%7C%7C%7C&sdata=EnhsIFlBooqjB%2FSRWF7uAqRHE3yN6rbdD
>> 1yQueTrRus%3D&reserved=0  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
>> |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>> +49-5121-206917-5555 |


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

