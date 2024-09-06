Return-Path: <linux-i2c+bounces-6319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8396F556
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA5F1F24B06
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12951CE705;
	Fri,  6 Sep 2024 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XPLwuuvL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF51CB147;
	Fri,  6 Sep 2024 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725629370; cv=none; b=P1KGB0WHWlHI8TjPmN9aE0cBXN9/VPhmoqsmCO1VfohFJEnxCyy/jzvNS3NylbvRt4Ul6KuA1sJQLptSFU4UW70KP417lQvnsRmTEMpoAcYBw7bxW1QDuOzybd/Czmg09GJXTpweUILWGNoPcAs3ILKs1MCWIG8SvkvnEQFnKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725629370; c=relaxed/simple;
	bh=2MCZFYMk0R0k+j/Cl4qia65Y795F6XZcd60+O/23gHQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pHfNs/DqK3iJWvXEmWpI6ROx+MaTrJebVPxMEIQZMp+u5RmC2XVDnFVNiT2RtjQ0wvfu7hMqoWbZDUxmRhOJ+b2xAKDDXCl7XsYcHd4hteXp4xH+5c3mUFKVfblLzwx+t9ZOQB4yBb7ab8eynONyBruSfdo1AeZK25Q8/UMcZq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XPLwuuvL; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2ACD4000D;
	Fri,  6 Sep 2024 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725629359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYet+e+pd+7Iu5G+bLcsXPTiPdSnZjD0jCpEBGIfkCs=;
	b=XPLwuuvLyi7grRkAhRnDY2tPGHCiwhtc2XTWdhc0LOHq8Qi+7RbQuPypl1rlSGt2Q9pVRc
	bn5fIqEtivOx86amFuhL59HgYgkSnSVVu/JaxHuqruIFTopZGRdCGsEOYYUz2zGP8ObpTJ
	R0HQaNaohSOCuLWqNLqBw97w4lAlv91KyGGAfep5OaPugTRh2ZOtEaYTrotwMGzHSJEsaX
	3VftJZl3Y3TOfz+qFcM1O1nzGsDqJb7IxCck/mOKGZqYhveh86ZnfRTfdXL5TFOrFK6/rd
	2roorvn2/csaN4uhhR9zyMq3FpwdFQ1q37s6TC/Z1oJKMmHdg+dJzYVl83xb4Q==
Message-ID: <cbbd52bf-8758-42e9-8b35-48750137f2fd@bootlin.com>
Date: Fri, 6 Sep 2024 15:29:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH 3/5] i2c: Congatec Board Controller i2c bus driver
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com,
 blake.vermeer@keysight.com
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-3-fec5236270e7@bootlin.com>
 <tv6v7g3nkoedbu4olu2xi76qtfueebnfz7c2zx7t2wmpthqdt6@wmbo2lwv5qnf>
Content-Language: en-US
In-Reply-To: <tv6v7g3nkoedbu4olu2xi76qtfueebnfz7c2zx7t2wmpthqdt6@wmbo2lwv5qnf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 8/14/24 01:24, Andi Shyti wrote:
> Hi Thomas,

Hi Andi,

Thanks for the review !!

> 
> On Fri, Aug 09, 2024 at 04:52:07PM GMT, Thomas Richard wrote:
>> Add i2c support for the Congatec Board Controller.
>> do you mind adding some more description?

I'll mention that there are 2 busses.

> 
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> ...
> 
>> +config I2C_CGBC
>> +	tristate "Congatec I2C Controller"
>> +	depends on MFD_CGBC
>> +	help
>> +	  This enables the I2C bus interfaces for the Congatec Board
> 
> This what? :-)

Rephrased it for next iteration.

> 
>> +	  Controller.
>> +
>> +	  This driver can also be built as a module. If so, the module will
>> +	  be called i2c-cgbc.ko.
>> +
> 
> ...
> 
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/iopoll.h>
> 
> please sort includes in alphabetical order?

Fixed in the next iteration.

> 
>> +#include <linux/mfd/cgbc.h>
> 
> ...
> 
>> +enum i2c_state {
>> +	STATE_DONE = 0,
>> +	STATE_INIT,
>> +	STATE_START,
>> +	STATE_READ,
>> +	STATE_WRITE,
>> +	STATE_ERROR,
>> +};
> 
> can you please use the cgbc prefix for this enum and all the
> members?

Ok, fixed in the next iteration.

> 
> ...
> 
>> +	if (bus_frequency > CGBC_I2C_FREQ_MAX_HZ ||
>> +	    bus_frequency < CGBC_I2C_FREQ_MIN_HZ) {
>> +		dev_warn(i2c->dev, "invalid frequency %u, using default\n", bus_frequency);
> 
> should this rather be a dev_info()? (supernit: please start with
> capital leter).

The driver i2c-xlp9xx has a similar message [1] and it uses a dev_warn().
So I don't know.
If you think dev_info() is more relevant in this case, I'll change it.
Supernit will be fixed in next iteration.

[1]
https://elixir.bootlin.com/linux/v6.11-rc6/source/drivers/i2c/busses/i2c-xlp9xx.c#L480

> 
>> +		bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
>> +	}
>> +
>> +	cmd[0] = CGBC_I2C_CMD_SPEED | algo_data->bus_id;
>> +	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
>> +
>> +	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> +	if (ret)
>> +		return dev_err_probe(i2c->dev, ret,
>> +				     "Failed to initialize I2C bus %s",
>> +				     adap->name);
>> +
>> +	cmd[1] = 0x00;
>> +
>> +	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> +	if (ret)
>> +		return dev_err_probe(i2c->dev, ret,
>> +				     "Failed to get I2C bus frequency");
>> +
>> +	bus_frequency = cgbc_i2c_reg_to_freq(data);
>> +
>> +	dev_dbg(i2c->dev, "%s is running at %d Hz\n", adap->name, bus_frequency);
>> +
>> +	/*
>> +	 * The read_maxtime_us is the maximum time to wait during a read to get
>> +	 * data. At maximum CGBC_I2C_READ_MAX_LEN can be read by command.
>> +	 * So calculate the max time to size correctly the timeout.
>> +	 */
> 
> this comment is a bit wild, can we rephrase to something like:
> 
> /*
>  * The read_maxtime_us variable represents the maximum time to wait
>  * for data during a read operation. The maximum amount of data that
>  * can be read by a command is CGBC_I2C_READ_MAX_LEN.
>  * Therefore, calculate the max time to properly size the timeout.
>  */
> 
> (it's a suggestion, please choose the words you prefer).

thanks for the rephrasing.

Thomas

