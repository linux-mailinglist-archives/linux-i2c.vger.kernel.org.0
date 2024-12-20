Return-Path: <linux-i2c+bounces-8656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A469F8E15
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 09:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F70E16BA87
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 08:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E12A1A9B27;
	Fri, 20 Dec 2024 08:40:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A81A7AE3
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684017; cv=none; b=SzfBXrUUVNkR3/Owa70wEH7l5aVUHbgsrYEK8yl2VCeyK8tLuUOQhG4Y2l+4ZNblGIW9kl2Us0ywRJC7hXHe5Sp9VcIxF/j6WdgzxgpVQNAY0ugiPJeMdNB1kRTzZVaQlOO+bvtf9ISaqmGgFsMGHIvbohZ8NxdNQhoEr5OrehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684017; c=relaxed/simple;
	bh=4aJFptvIeHzniCcmOScVlZAwdge3SpUiUj5ZsCRsiR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APMjnqOBImUx1ciqbvgVbnjp13x7QBTmyxayfgeaBxSy/ZTfzE2XuMzLJQ4o+bJTWsy51+6tUb0LJkX+XRZXGwIsGPyuFJjPHSS9ebrpS0tgqnUb7+JFVu9TPYjuFKBOKzlkdSr3T7L8/4vH7K+8LRISXA905x5/2Pne1bbcqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOYYJ-0003lY-5P; Fri, 20 Dec 2024 09:40:07 +0100
Message-ID: <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
Date: Fri, 20 Dec 2024 09:40:06 +0100
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi,

On 20.12.24 09:06, Carlos Song wrote:
>> -----Original Message-----
>> On Fri, Dec 20, 2024 at 07:38:47AM +0000, Carlos Song wrote:
>>>> -----Original Message-----
>>>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> Sent: Friday, December 20, 2024 3:35 PM
>>>> To: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti
>>>> <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
>>>> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
>>>> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
>>>> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing

>>>>>> I think this is what you want to see, right?
>>>>>
>>>>> This loses the information why the error happens (ret). Using
>>>>> dev_err_probe even if no probe deferral is expected in that branch
>>>>> is perfectly fine and the kernel-doc even points it out:
>>>>>
>>>>>   Using this helper in your probe function is totally fine even if @err
>>>>>   is known to never be -EPROBE_DEFER.
>>>>
>>>> Thank you for the feedback. While I recognize the benefits of
>>>> dev_err_probe() for compact and standardized error handling, using
>>>> it without returning its result raises a red flag.

Agreed, which is what spawned this thread in the first place.

If we want to ignore errors intentionally, I think a comment
like the following would make this clearer:

  /*
   * As we can always fall back to PIO, let's ignore the error setting up
   * DMA and see if we run into errors while setting up PIO mode.
   */


>>>> The function's primary purpose is to combine error logging with
>>>> returning the error code. If the return value is not used, it can
>>>> create confusion and suggests potential oversight or unintended
>>>> behavior. This misuse might mislead readers into thinking that the
>>>> function always returns at that point, which is not the case here.
>>>>
>>>> In this scenario, using dev_err() directly is more explicit and
>>>> avoids any ambiguity about the control flow or error handling
>>>> intent. It keeps the code clear and aligned with its actual behavior.

This is a fair point. I don't mind whether we use dev_err_probe or
dev_err with a return code, it's up to you ultimately. I just wanted
the error code to be included and I think a comment would be a good
idea to avoid confusion (provided we keep behavior as-is).

>>> how about this?
>>>
>>> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>>> +       if (ret) {
>>> +               if (ret == -EPROBE_DEFER)
>>> +                       goto clk_notifier_unregister;
>>> +               else if (ret == -ENODEV)
>>> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
>>> +               else
>>> +                       dev_err(&pdev->dev, "Failed to setup DMA (%d),
>> only use PIO mode\n", ret);
>>> +       }
>>
>> Please use human readable version of error value. In this case it will
>> be:
>>   dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
>> ERR_PTR(ret));

Sounds good to me.

> Hi, the ret is from i2c_imx_dma_request() and look like that ret has been converted by PTR_ERR,
> So the ret error has been human readable version?

I am not sure I understand the question. ERR_PTR() makes an error pointer and %pe
formats that pointer as error message. So you don't need to change any function
return types unless needed, just at the end print it with %pe instead of %d
(and after error pointer conversion if needed).

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

