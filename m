Return-Path: <linux-i2c+bounces-6678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E05977AFF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E209289FD9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562B81D6DA0;
	Fri, 13 Sep 2024 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PYCP+m8L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E11BD4F2;
	Fri, 13 Sep 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216227; cv=none; b=RSNxHCblKlO25leLr9Dmi04kLHqzkzvUrQELhctMUDFZzYY0vD8X5BTFvT/6xFtYp8P9Ue5Sz/OJs/U6Eo0CnkWI//XY0LpYfqzFHi0OnnN63mn0VFAOe3keDwRPo3XboW4VzkThxcYqwnd38ct7lkNeZpHsaCv5bKNZsD4Nn+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216227; c=relaxed/simple;
	bh=bSJtLY6qDNiYOGQql0SJEcAGPb5hkAcpOnrtqwmpugU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t73h7qnlzP/YdVY7t3AYhzJqKFE8e/IflJGhv+EqagqtVVRPYBSDRTR5QF59UCLnXldORjmSVqlA32yzmoD0+wCJPVz+LOKvfpnpFgqMKx/4YZKiut82C/AgToLzNjiKRe6O3KA4vrSPhR8v9Pry+hm0BqKCeOmyf5cc5ZBDL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PYCP+m8L; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C42B2000D;
	Fri, 13 Sep 2024 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726216221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVpxpR6mVs91qCI2AvrKQB0F4heOO0qpmJA2cAGWXrA=;
	b=PYCP+m8LjkPcCqNhgL4Om3LCQ1RnsUFHza5uEyvT2wHLoBs5p4a1a4meh5sC/7mSo6WQ+Z
	Spd2g9qBpZtCPJXl8mueLXkwqbGXd5J23ZJF7CBj3XnfOvn4OOxyEIYwao68Kc9ot/DOnp
	8mBJSnvm0aSG0eL7eFf3I3A6ar7vfbnrXukHAJaPHfj80N6G4S/zbQo7DAR8D2BKTG+o88
	yreSHj2xpPOSRaY/PHOC/nNvb3Ax1jhaXrt48pUBvU7sgfPYHqwDwFowoGaWEf/7rYXk/r
	GR1xNHHza1DzDjXIwQk+ARrzn/bm4qGFEGJxTyGE3QDtwrefAzQIPSJdz4pnhw==
Message-ID: <618cb281-9fec-471f-9e3d-c7a471f75a7a@bootlin.com>
Date: Fri, 13 Sep 2024 10:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mfd: add Congatec Board Controller mfd driver
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com,
 blake.vermeer@keysight.com
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-1-fec5236270e7@bootlin.com>
 <20240822103858.GH6858@google.com>
 <9f29d904-e7ba-40fb-b5d8-1efeddf6f148@bootlin.com>
 <20240912141309.GC24460@google.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240912141309.GC24460@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 9/12/24 16:13, Lee Jones wrote:
> On Tue, 10 Sep 2024, Thomas Richard wrote:
> 
>> On 8/22/24 12:38, Lee Jones wrote:
>>> On Fri, 09 Aug 2024, Thomas Richard wrote:
>>>
>>>> Add core MFD driver for the Board Controller found on some Congatec SMARC
>>>> module. This Board Controller provides functions like watchdog, GPIO, and
>>>> I2C busses.
>>>>
>>>> This commit add support only for the conga-SA7 module.
>>>>
>>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>>> ---
>>>>  drivers/mfd/Kconfig      |  12 ++
>>>>  drivers/mfd/Makefile     |   1 +
>>>>  drivers/mfd/cgbc-core.c  | 453 +++++++++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/mfd/cgbc.h |  44 +++++
>>>>  4 files changed, 510 insertions(+)
>>>>
>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>> index bc8be2e593b6..3e0530f30267 100644
>>>> --- a/drivers/mfd/Kconfig
>>>> +++ b/drivers/mfd/Kconfig
>>>> @@ -224,6 +224,18 @@ config MFD_AXP20X_RSB
>>>>  	  components like regulators or the PEK (Power Enable Key) under the
>>>>  	  corresponding menus.
>>>>  
>>>> +config MFD_CGBC
>>>> +	tristate "Congatec Board Controller"
>>>> +	select MFD_CORE
>>>> +	depends on X86
>>>> +	help
>>>> +	  This is the core driver of the Board Controller found on some Congatec
>>>> +	  SMARC modules. The Board Controller provides functions like watchdog,
>>>> +	  I2C busses, and GPIO controller.
>>>> +
>>>> +	  To compile this driver as a module, choose M here: the module will be
>>>> +	  called cgbc-core.
>>>> +
>>>>  config MFD_CROS_EC_DEV
>>>>  	tristate "ChromeOS Embedded Controller multifunction device"
>>>>  	select MFD_CORE
>>>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>>>> index 02b651cd7535..d5da3fcd691c 100644
>>>> --- a/drivers/mfd/Makefile
>>>> +++ b/drivers/mfd/Makefile
>>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_SM501)		+= sm501.o
>>>>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
>>>>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
>>>>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
>>>> +obj-$(CONFIG_MFD_CGBC)		+= cgbc-core.o
>>>>  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
>>>>  obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
>>>>  obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
>>>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
>>>> new file mode 100644
>>>> index 000000000000..cca9b1170cc9
>>>> --- /dev/null
>>>> +++ b/drivers/mfd/cgbc-core.c
>>>> @@ -0,0 +1,453 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Congatec Board Controller MFD core driver.
>>>
>>> No such thing as an MFD.
>>
>> What should it be if it's not an MFD ?
> 
> You should be telling me this. :)
> 
> "Board Controller" according to the Kconfig entry.
> 

This Congatec Board Controller is an external micro-controller that is
interfaced with the CPU through a eSPI bus.
This Board Controller provides multiple functions: an I2C controller, a
GPIO controller, a watchdog and other not yet implemented functions
(temp/voltage sensors, backlight).

Therefore, the MFD subsystem is a very good fit, as it allows to have a
core driver that implements the communication with the external
micro-controller, and then individual drivers for each of the functions
offered by this Board Controller.

Thomas

